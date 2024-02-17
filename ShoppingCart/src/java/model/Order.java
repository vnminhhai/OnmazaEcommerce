/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Order {
    private int id;
    private int customer_id;
    private Date order_date;
    private Date required_date;
    private String ship_address;

    public Order() {
    }

    public Order(int id, int customer_id, Date order_date, Date required_date, String ship_address) {
        this.id = id;
        this.customer_id = customer_id;
        this.order_date = order_date;
        this.required_date = required_date;
        this.ship_address = ship_address;
    }
    
}
