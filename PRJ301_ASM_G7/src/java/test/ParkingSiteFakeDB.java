package test; 

import java.util.ArrayList;
import java.util.List;
import model.ParkingSite;
import model.Employee; 

public class ParkingSiteFakeDB {
    
    private static ParkingSiteFakeDB instance;
    private List<ParkingSite> parkingSites = new ArrayList<>();
    
    public static ParkingSiteFakeDB getInstance() {
        if (instance == null) {
            instance = new ParkingSiteFakeDB();
        }
        return instance;
    }
    
    private ParkingSiteFakeDB() {
        
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
                ParkingSite.Status.MAINTERNANCE,
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

    public List<ParkingSite> getAll() {
        return parkingSites;
    }

    public ParkingSite getById(String id) {
        for (ParkingSite site : parkingSites) {
            if (site.getSiteId().equals(id)) {
                return site;
            }
        }
        return null;
    }

    public void add(ParkingSite site) {
        parkingSites.add(site);
    }

    public void update(ParkingSite newSiteData) {
        for (int i = 0; i < parkingSites.size(); i++) {
            ParkingSite currentSite = parkingSites.get(i);
            if (currentSite.getSiteId().equals(newSiteData.getSiteId())) {
                parkingSites.set(i, newSiteData);
                return;
            }
        }
    }

    public void delete(String id) {
        parkingSites.removeIf(site -> site.getSiteId().equals(id));
    }

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
