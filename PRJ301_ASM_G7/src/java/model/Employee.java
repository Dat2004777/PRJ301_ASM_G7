package model;

public class Employee {
    private String employeeId; 
    private String accountId;  
    private String firstName;
    private String lastName;
    private String phone;
    private String siteId;    

    public Employee() {
    }

    public Employee(String employeeId, String accountId, String firstName, String lastName, String phone, String siteId) {
        this.employeeId = employeeId;
        this.accountId = accountId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.siteId = siteId;
    }

    public String getFullName() {
        return lastName + " " + firstName;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSiteId() {
        return siteId;
    }

    public void setSiteId(String siteId) {
        this.siteId = siteId;
    }

    
}