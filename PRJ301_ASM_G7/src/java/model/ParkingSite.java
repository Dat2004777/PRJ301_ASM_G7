/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class ParkingSite {

    private String siteId;
    private String siteName;
    private String address;
    private Region region;
    private Status siteStatus;
    private Employee managerId;

    public ParkingSite(String siteId, String siteName, String address, Region region, Status siteStatus, Employee managerId) {
        this.siteId = siteId;
        this.siteName = siteName;
        this.address = address;
        this.region = region;
        this.siteStatus = siteStatus;
        this.managerId = managerId;
    }

    public String getSiteId() {
        return siteId;
    }

    public void setSiteId(String siteId) {
        this.siteId = siteId;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    public Status getSiteStatus() {
        return siteStatus;
    }

    public void setSiteStatus(Status siteStatus) {
        this.siteStatus = siteStatus;
    }

    public Employee getManagerId() {
        return managerId;
    }

    public void setManagerId(Employee managerId) {
        this.managerId = managerId;
    }

    public enum Region {
        NORTH("Miền Bắc"),
        MIDDLE("Miền Trung"),
        SOUTH("Miền Nam");

        private String label;

        Region(String label) {
            this.label = label;
        }

        public String getLabel() {
            return label;
        }

    }

    public enum Status {
        ACTIVE("Đang hoạt động"),
        MAINTERNANCE("Bảo trì"),
        CLOSED("Đóng cửa");

        private String label;

        private Status(String label) {
            this.label = label;
        }

        public String getLabel() {
            return label;
        }

    }

}
