/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ParkingSite;


/**
 *
 * @author Admin
 */
public class SiteDAO extends DBContext {
    
    private PreparedStatement ps;
    private ResultSet rs;
    
    public SiteDAO() {
        
    }
    
    public void create() {
        
    }
    
    public List<ParkingSite> getAll () {
        List<ParkingSite> resultList = new ArrayList<>();
        
        
        return resultList;
    } 
    
    public void update() {
        
    }
    
    public void delete() {
        
    }
    
    public ParkingSite getById() {
        ParkingSite result = null;
        
        
        return result;
    }
    
    
}
