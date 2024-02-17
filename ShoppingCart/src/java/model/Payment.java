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
public class Payment {
    private int id;
    private float amount;
    private Date date;
    private int order_id;

    public Payment() {
    }

    public Payment(int id, float amount, Date date, int order_id) {
        this.id = id;
        this.amount = amount;
        this.date = date;
        this.order_id = order_id;
    }
    
}
