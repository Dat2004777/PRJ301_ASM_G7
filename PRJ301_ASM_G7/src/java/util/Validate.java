/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author ADMIN
 */
public class Validate {
    public static boolean checkPhone(String phone){
        try{
            if(phone.length() == 10){
                int number = Integer.parseInt(phone);
                return true;
            }
            return false;
        }catch(Exception e){
            return false;
        }
    }
    
    public static boolean checkEmail(String email){
        if(email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$")){
            return true;
        }
        return false;
    }
}
