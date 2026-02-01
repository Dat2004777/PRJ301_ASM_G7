package test;

import java.util.ArrayList;
import java.util.List;
import model.Employee;

public class EmployeeFakeDB {

    // 1. Biến static để giữ instance duy nhất của lớp này
    private static EmployeeFakeDB instance;

    // List lưu dữ liệu (Thay thế cho Table trong DB)
    private List<Employee> employees;

    // 2. Constructor là PRIVATE để ngăn chặn việc 'new' từ bên ngoài
    private EmployeeFakeDB() {
        employees = new ArrayList<>();
        
        // Seeding Data (Dữ liệu mẫu)
        // Mẫu 1: Super Admin (Không thuộc bãi xe nào -> siteId = null)
        employees.add(new Employee(
            "EMP001", "ACC001", "Trưởng", "Nguyễn Quản Lý", "0901234567", null
        ));

        // Mẫu 2: Staff (Bảo vệ làm việc tại SITE001)
        employees.add(new Employee(
            "EMP002", "ACC002", "Văn A", "Trần", "0912345678", "SITE001"
        ));

        // Mẫu 3: Staff (Bảo vệ làm việc tại SITE002)
        employees.add(new Employee(
            "EMP003", "ACC003", "Thị B", "Lê", "0987654321", "SITE002"
        ));
    }

    // 3. Method public static để lấy instance duy nhất
    // Có synchronized để an toàn khi chạy đa luồng (Thread-safe)
    public static synchronized EmployeeFakeDB getInstance() {
        if (instance == null) {
            instance = new EmployeeFakeDB();
        }
        return instance;
    }

    // --- CÁC HÀM CRUD CƠ BẢN ---

    // Lấy tất cả
    public List<Employee> getAll() {
        return this.employees;
    }

    // Lấy theo ID
    public Employee getById(String id) {
        for (Employee e : employees) {
            if (e.getEmployeeId().equals(id)) {
                return e;
            }
        }
        return null;
    }

    // Thêm mới
    public void add(Employee e) {
        this.employees.add(e);
    }

    // Cập nhật
    public void update(Employee newInfo) {
        for (int i = 0; i < employees.size(); i++) {
            if (employees.get(i).getEmployeeId().equals(newInfo.getEmployeeId())) {
                employees.set(i, newInfo);
                return;
            }
        }
    }

    // Xóa
    public void delete(String id) {
        employees.removeIf(e -> e.getEmployeeId().equals(id));
    }
    
    // Tìm nhân viên theo Site ID (Ví dụ: Lấy danh sách nhân viên của bãi SITE001)
    public List<Employee> getBySiteId(String siteId) {
        List<Employee> result = new ArrayList<>();
        for (Employee e : employees) {
            // Cẩn thận null pointer vì Admin có siteId là null
            if (e.getSiteId() != null && e.getSiteId().equals(siteId)) {
                result.add(e);
            }
        }
        return result;
    }
}