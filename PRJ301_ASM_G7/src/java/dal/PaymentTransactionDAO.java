/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.time.LocalDateTime;
import utils.HttpUtils;

/**
 *
 * @author dat20
 */
public class PaymentTransactionDAO extends DBContext {

    public long getAllTotalAmounts(LocalDateTime fromDate, LocalDateTime toDate) {
        long total = 0;
        String sql = """
                    SELECT SUM(total_amount) FROM PaymentTransactions
                     WHERE payment_status = 'completed' AND (payment_date BETWEEN ? AND ?)
                     """;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setObject(1, fromDate);
            ps.setObject(2, toDate);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                total = rs.getLong(1);
            }
        } catch (Exception e) {
            System.out.println("Error getAllTotalAmount: " + e.getMessage());
        }

        return total;
    }

    public int countAllVehicleTrips(LocalDateTime fromDate, LocalDateTime toDate) {
        int count = 0;
        String sql = """
                     SELECT COUNT(*)
                     FROM PaymentTransactions pt 
                     WHERE pt.session_id IS NOT NULL
                     	AND pt.payment_status = 'completed'
                	AND (pt.payment_date BETWEEN ? AND ?)
                     """;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setObject(1, fromDate);
            ps.setObject(2, toDate);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error countVehicleTrips: " + e.getMessage());
        }

        return count;
    }

    public int countNewSubscriptions(LocalDateTime fromDate, LocalDateTime toDate) {
        int count = 0;
        String sql = """
                     SELECT COUNT(*)
                     FROM PaymentTransactions pt 
                     WHERE pt.subscription_id IS NOT NULL
                     	AND pt.payment_status = 'completed'
                	AND (pt.payment_date BETWEEN ? AND ?)
                     """;

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setObject(1, fromDate);
            ps.setObject(2, toDate);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error countNewSubscriptions: " + e.getMessage());
        }

        return count;
    }

    public static void main(String[] args) {
        System.out.println("Hello");
    }

}
