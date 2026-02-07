/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.*;

/**
 *
 * @author dat20
 */
public class PaymentTransaction {

    private int transactionID;
    private Integer bookingID;
    private Integer subscriptionID;
    private Integer sessionID;
    private long totalAmount;
    private Timestamp paymentDate;
    private String paymentStatus;

    public PaymentTransaction() {
    }

    public PaymentTransaction(int transactionID, Integer bookingID, Integer subscriptionID, Integer sessionID, long totalAmount, Timestamp paymentDate, String paymentStatus) {
        this.transactionID = transactionID;
        this.bookingID = bookingID;
        this.subscriptionID = subscriptionID;
        this.sessionID = sessionID;
        this.totalAmount = totalAmount;
        this.paymentDate = paymentDate;
        this.paymentStatus = paymentStatus;
    }

    public int getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(int transactionID) {
        this.transactionID = transactionID;
    }

    public Integer getBookingID() {
        return bookingID;
    }

    public void setBookingID(Integer bookingID) {
        this.bookingID = bookingID;
    }

    public Integer getSubscriptionID() {
        return subscriptionID;
    }

    public void setSubscriptionID(Integer subscriptionID) {
        this.subscriptionID = subscriptionID;
    }

    public Integer getSessionID() {
        return sessionID;
    }

    public void setSessionID(Integer sessionID) {
        this.sessionID = sessionID;
    }

    public long getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(long totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Timestamp getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Timestamp paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

}
