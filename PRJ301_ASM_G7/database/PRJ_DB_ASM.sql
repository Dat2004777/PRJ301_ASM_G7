/*
 * SCRIPT KHỞI TẠO DATABASE QUẢN LÝ BÃI ĐỖ XE (UPDATED)
 * Platform: SQL Server
 * Update: Renamed table Customer -> Customers
 */

USE master;
GO

-- 1. KHỞI TẠO DATABASE (Nếu đã tồn tại thì xóa đi tạo lại để sạch data)
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'ParkingManagementDB')
BEGIN
    ALTER DATABASE ParkingManagementDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ParkingManagementDB;
END
GO

CREATE DATABASE ParkingManagementDB;
GO

USE ParkingManagementDB;
GO

-- =============================================
-- 1. CỤM NGƯỜI DÙNG (USERS) & HẠ TẦNG CƠ BẢN
-- =============================================

-- Table: Accounts
CREATE TABLE Accounts (
    account_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, -- Thực tế nên hash
    role VARCHAR(20) NOT NULL CHECK (role IN ('admin', 'staff', 'customer')),
    created_at DATETIME DEFAULT GETDATE()
);
GO

-- Table: VehicleTypes (Tạo trước để tham chiếu)
CREATE TABLE VehicleTypes (
    vehicle_type_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(20) NOT NULL CHECK (name IN ('car', 'motorbike'))
);
GO

-- Table: ParkingSites (Tạo trước, chưa add FK manager_id để tránh lỗi vòng lặp)
CREATE TABLE ParkingSites (
    site_id INT IDENTITY(1,1) PRIMARY KEY,
    site_name NVARCHAR(100) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    region VARCHAR(10) NOT NULL CHECK (region IN ('north', 'middle', 'south')),
    manager_id INT, -- Sẽ trỏ tới Employee
    status VARCHAR(20) DEFAULT 'active' CHECK (status IN ('maintainance', 'active', 'closed'))
);
GO

-- Table: Employees
CREATE TABLE Employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    account_id INT NOT NULL,
    firstname NVARCHAR(50) NOT NULL,
    lastname NVARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    site_id INT, -- Null nếu là Admin
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE,
    FOREIGN KEY (site_id) REFERENCES ParkingSites(site_id)
);
GO

-- Cập nhật ràng buộc: ParkingSites trỏ về Manager (Employees)
ALTER TABLE ParkingSites
ADD CONSTRAINT FK_ParkingSites_Manager
FOREIGN KEY (manager_id) REFERENCES Employees(employee_id);
GO

-- Table: Customers (ĐÃ ĐỔI TÊN TỪ Customer -> Customers)
CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    wallet_amount BIGINT DEFAULT 0,
    account_id INT NOT NULL UNIQUE, -- 1 Account chỉ map 1 Customer
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE
);
GO

-- =============================================
-- 2. NHÓM HẠ TẦNG CHI TIẾT & VẬT LÝ
-- =============================================

-- Table: ParkingAreas
CREATE TABLE ParkingAreas (
    area_id INT IDENTITY(1,1) PRIMARY KEY,
    site_id INT NOT NULL,
    area_name NVARCHAR(50) NOT NULL,
    vehicle_type_id INT NOT NULL,
    totalSlots INT DEFAULT 0,
    FOREIGN KEY (site_id) REFERENCES ParkingSites(site_id) ON DELETE CASCADE,
    FOREIGN KEY (vehicle_type_id) REFERENCES VehicleTypes(vehicle_type_id)
);
GO

-- Table: ParkingCards
CREATE TABLE ParkingCards (
    card_id VARCHAR(50) PRIMARY KEY, -- ID thẻ cứng, VD: RFID tag
    site_id INT NOT NULL,
    status VARCHAR(20) DEFAULT 'available' CHECK (status IN ('available', 'using')),
    FOREIGN KEY (site_id) REFERENCES ParkingSites(site_id) ON DELETE CASCADE
);
GO

-- =============================================
-- 3. NHÓM NGHIỆP VỤ (CORE BUSINESS)
-- =============================================

-- Table: PriceConfigs
CREATE TABLE PriceConfigs (
    config_id INT IDENTITY(1,1) PRIMARY KEY,
    site_id INT NOT NULL,
    vehicle_type_id INT NOT NULL,
    type VARCHAR(20) NOT NULL CHECK (type IN ('hourly', 'monthly', 'yearly')),
    base_price BIGINT NOT NULL,
    unit VARCHAR(20) NOT NULL, -- VD: '1 hour', '1 month'
    FOREIGN KEY (site_id) REFERENCES ParkingSites(site_id),
    FOREIGN KEY (vehicle_type_id) REFERENCES VehicleTypes(vehicle_type_id)
);
GO

-- Table: Subscriptions (Vé tháng/năm)
CREATE TABLE Subscriptions (
    subscription_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    card_id VARCHAR(50) NOT NULL,
    license_plate VARCHAR(20) NOT NULL,
    vehicle_type_id INT NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status VARCHAR(20) CHECK (status IN ('active', 'expired')),
    config_id INT NOT NULL,
    -- ĐÃ CẬP NHẬT FK TRỎ VỀ Customers
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (card_id) REFERENCES ParkingCards(card_id),
    FOREIGN KEY (vehicle_type_id) REFERENCES VehicleTypes(vehicle_type_id),
    FOREIGN KEY (config_id) REFERENCES PriceConfigs(config_id)
);
GO

-- =============================================
-- 4. NHÓM VẬN HÀNH & THANH TOÁN
-- =============================================

-- Table: ParkingSessions (Lượt ra vào)
CREATE TABLE ParkingSessions (
    session_id INT IDENTITY(1,1) PRIMARY KEY,
    card_id VARCHAR(50) NOT NULL,
    vehicle_type_id INT NOT NULL,
    license_plate VARCHAR(20),
    entry_time DATETIME DEFAULT GETDATE(),
    exit_time DATETIME,
    session_type VARCHAR(20) CHECK (session_type IN ('nonCasual', 'casual')), -- casual: khách vãng lai
    fee_amount BIGINT DEFAULT 0,
    status VARCHAR(20) CHECK (status IN ('parked', 'completed')),
    FOREIGN KEY (card_id) REFERENCES ParkingCards(card_id),
    FOREIGN KEY (vehicle_type_id) REFERENCES VehicleTypes(vehicle_type_id)
);
GO

-- Table: Bookings (Đặt chỗ online)
CREATE TABLE Bookings (
    booking_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    card_id VARCHAR(50), -- Có thể null lúc mới đặt
    vehicle_type_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    status VARCHAR(20) CHECK (status IN ('accepted', 'completed', 'cancelled')),
    booking_amount BIGINT DEFAULT 0,
    -- ĐÃ CẬP NHẬT FK TRỎ VỀ Customers
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (card_id) REFERENCES ParkingCards(card_id),
    FOREIGN KEY (vehicle_type_id) REFERENCES VehicleTypes(vehicle_type_id)
);
GO

-- Table: PaymentTransactions
CREATE TABLE PaymentTransactions (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    booking_id INT,
    subscription_id INT,
    session_id INT,
    total_amount BIGINT NOT NULL,
    payment_date DATETIME DEFAULT GETDATE(),
    payment_status VARCHAR(20) CHECK (payment_status IN ('accepted', 'completed', 'failed')),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id),
    FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id),
    FOREIGN KEY (session_id) REFERENCES ParkingSessions(session_id)
);
GO

-- =============================================
-- 5. DATA SEEDING (DỮ LIỆU MẪU)
-- =============================================

-- 1. Loại xe
INSERT INTO VehicleTypes (name) VALUES ('car'), ('motorbike');

-- 2. Parking Sites (Tạo bãi trước)
INSERT INTO ParkingSites (site_name, address, region, status) VALUES 
(N'FPT Cầu Giấy', N'Số 10 Phạm Văn Bạch, Hà Nội', 'north', 'active'),
(N'FPT Quận 9', N'Khu Công Nghệ Cao, TP.HCM', 'south', 'active');

-- 3. Accounts (1 Admin, 2 Staff, 2 Customers)
INSERT INTO Accounts (username, password, role) VALUES 
('admin_main', 'pass_hash_1', 'admin'),
('staff_hn', 'pass_hash_2', 'staff'),
('staff_hcm', 'pass_hash_3', 'staff'),
('customer_a', 'pass_hash_4', 'customer'),
('customer_b', 'pass_hash_5', 'customer');

-- 4. Employees
-- Admin (Không cần site)
INSERT INTO Employees (account_id, firstname, lastname, phone, site_id) 
VALUES (1, N'Quản', N'Nguyễn', '0901111111', NULL);
-- Staff HN (Site 1)
INSERT INTO Employees (account_id, firstname, lastname, phone, site_id) 
VALUES (2, N'Bảo', N'Lê', '0902222222', 1);
-- Staff HCM (Site 2)
INSERT INTO Employees (account_id, firstname, lastname, phone, site_id) 
VALUES (3, N'Vy', N'Trần', '0903333333', 2);

-- Update lại Manager cho Site
UPDATE ParkingSites SET manager_id = 1 WHERE site_id = 1; -- Admin quản lý site 1
UPDATE ParkingSites SET manager_id = 3 WHERE site_id = 2; -- Staff Vy quản lý site 2

-- 5. Customers (ĐÃ CẬP NHẬT TÊN BẢNG TRONG INSERT)
INSERT INTO Customers (first_name, last_name, phone, email, wallet_amount, account_id) VALUES 
(N'An', N'Phạm', '0988888888', 'an@gmail.com', 500000, 4),
(N'Bình', N'Đỗ', '0977777777', 'binh@gmail.com', 100000, 5);

-- 6. Parking Areas
INSERT INTO ParkingAreas (site_id, area_name, vehicle_type_id, totalSlots) VALUES 
(1, N'Khu A - Hầm Ô tô', 1, 50),
(1, N'Khu B - Sân xe máy', 2, 200),
(2, N'Khu C - Ngoài trời', 1, 100);

-- 7. Parking Cards
INSERT INTO ParkingCards (card_id, site_id, status) VALUES 
('CARD-HN-001', 1, 'using'), -- Đang dùng cho vé tháng
('CARD-HN-002', 1, 'using'), -- Đang dùng vãng lai
('CARD-HN-003', 1, 'available'),
('CARD-HCM-001', 2, 'available');

-- 8. Price Configs
INSERT INTO PriceConfigs (site_id, vehicle_type_id, type, base_price, unit) VALUES 
(1, 1, 'hourly', 20000, '1 hour'), -- Ô tô HN: 20k/h
(1, 1, 'monthly', 1500000, '1 month'), -- Ô tô HN: 1.5tr/tháng
(1, 2, 'hourly', 5000, '4 hour'); -- Xe máy HN: 5k/4h

-- 9. Subscriptions (Vé tháng) - Customer An mua vé tháng Ô tô
INSERT INTO Subscriptions (customer_id, card_id, license_plate, vehicle_type_id, start_date, end_date, status, config_id)
VALUES (1, 'CARD-HN-001', '30A-12345', 1, GETDATE(), DATEADD(day, 30, GETDATE()), 'active', 2);

-- 10. Operations (Sessions)
-- Case 1: Xe vé tháng vào bãi (Không tốn tiền lượt)
INSERT INTO ParkingSessions (card_id, vehicle_type_id, license_plate, entry_time, session_type, fee_amount, status)
VALUES ('CARD-HN-001', 1, '30A-12345', DATEADD(hour, -2, GETDATE()), 'nonCasual', 0, 'parked');

-- Case 2: Xe vãng lai vào và đã ra (Tốn tiền)
INSERT INTO ParkingSessions (card_id, vehicle_type_id, license_plate, entry_time, exit_time, session_type, fee_amount, status)
VALUES ('CARD-HN-002', 1, '29C-99999', DATEADD(hour, -5, GETDATE()), DATEADD(hour, -4, GETDATE()), 'casual', 20000, 'completed');

-- 11. Bookings (Đặt chỗ online)
INSERT INTO Bookings (customer_id, card_id, vehicle_type_id, start_time, end_time, status, booking_amount)
VALUES (2, NULL, 1, DATEADD(day, 1, GETDATE()), DATEADD(day, 1, DATEADD(hour, 2, GETDATE())), 'accepted', 50000);

-- 12. Transactions (Lịch sử thanh toán)
-- Thanh toán vé tháng của An
INSERT INTO PaymentTransactions (subscription_id, total_amount, payment_status)
VALUES (1, 1500000, 'completed');

-- Thanh toán vé lượt của xe vãng lai (Session Case 2)
INSERT INTO PaymentTransactions (session_id, total_amount, payment_status)
VALUES (2, 20000, 'completed');

PRINT N'Khởi tạo Database thành công!';