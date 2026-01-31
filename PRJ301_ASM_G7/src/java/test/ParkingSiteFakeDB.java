package test; // Hoặc package fakedb tùy bạn

import java.util.ArrayList;
import java.util.List;
import model.ParkingSite;
import model.Employee; // Giả sử bạn đã có class User

public class ParkingSiteFakeDB {

    // List static đóng vai trò là bảng Database
    private List<ParkingSite> parkingSites = new ArrayList<>();

    // Khối static để khởi tạo dữ liệu mẫu (Seeding data)
    public ParkingSiteFakeDB() {
        // Lưu ý: ManagerID tôi để null vì chưa có class User cụ thể, bạn có thể new User() nếu muốn
        parkingSites.add(new ParkingSite(
                "SITE001",
                "Bãi xe FPT Cầu Giấy",
                "Số 10 Phạm Văn Bạch, Hà Nội",
                ParkingSite.Region.NORTH,
                ParkingSite.Status.ACTIVE,
                new Employee("1", "Minh", "123")
        ));

        parkingSites.add(new ParkingSite(
                "SITE002",
                "Bãi xe FPT Đà Nẵng",
                "Khu đô thị FPT City, Đà Nẵng",
                ParkingSite.Region.MIDDLE,
                ParkingSite.Status.MAINTERNANCE, // Typo theo code gốc của bạn
                new Employee("1", "Minh", "123")
        ));

        parkingSites.add(new ParkingSite(
                "SITE003",
                "Bãi xe FPT Quận 9",
                "Khu công nghệ cao, TP.HCM",
                ParkingSite.Region.SOUTH,
                ParkingSite.Status.ACTIVE,
                new Employee("1", "Minh", "123")
        ));

    }

    // --- CÁC HÀM CRUD (Create, Read, Update, Delete) ---
    // 1. Lấy tất cả (Select All)
    public List<ParkingSite> getAll() {
        return parkingSites;
    }

    // 2. Lấy theo ID (Select by ID)
    public ParkingSite getById(String id) {
        for (ParkingSite site : parkingSites) {
            if (site.getSiteId().equals(id)) {
                return site;
            }
        }
        return null;
    }

    // 3. Thêm mới (Insert)
    public void add(ParkingSite site) {
        parkingSites.add(site);
    }

    // 4. Cập nhật (Update)
    public void update(ParkingSite newSiteData) {
        for (int i = 0; i < parkingSites.size(); i++) {
            ParkingSite currentSite = parkingSites.get(i);
            if (currentSite.getSiteId().equals(newSiteData.getSiteId())) {
                // Thay thế phần tử tại vị trí i bằng dữ liệu mới
                parkingSites.set(i, newSiteData);
                return;
            }
        }
    }

    // 5. Xóa (Delete)
    public void delete(String id) {
        parkingSites.removeIf(site -> site.getSiteId().equals(id));
    }

    // 6. Tìm kiếm (Search by name) - Optional
    public List<ParkingSite> searchByName(String keyword) {
        List<ParkingSite> result = new ArrayList<>();
        for (ParkingSite site : parkingSites) {
            if (site.getSiteName().toLowerCase().contains(keyword.toLowerCase())) {
                result.add(site);
            }
        }
        return result;
    }
}
