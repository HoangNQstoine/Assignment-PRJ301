/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shopping.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author HoangNQ
 */
public class OrderDTO {

    private int orderID;
    private String userID;
    private LocalDate date;
    private double total;

    public OrderDTO() {
    }

    public OrderDTO(int orderID, String userID, LocalDate date, double total) {
        this.orderID = orderID;
        this.userID = userID;
        this.date = date;
        this.total = total;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public static void main(String[] args) {
        double randomDouble = Math.random(); // Tạo số thực ngẫu nhiên từ 0 đến 1
        int randomNumber = (int) (randomDouble * 1000);
        System.out.println(randomNumber);
    }
}
