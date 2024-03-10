/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import java.time.LocalDate;

/**
 *
 * @author ADMIN
 */
public class Order {
    private int id;
    private int customer_id;
    private LocalDate order_date;
    private LocalDate required_date;
    private String ship_address;
    private Detail detail;
    private String status;

    public Order() {
    }

    public Order(int id, int customer_id, LocalDate order_date, LocalDate required_date, String ship_address, Detail detail, String status) {
        this.id = id;
        this.customer_id = customer_id;
        this.order_date = order_date;
        this.required_date = required_date;
        this.ship_address = ship_address;
        this.detail = detail;
        this.status= status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public LocalDate getOrder_date() {
        return order_date;
    }

    public void setOrder_date(LocalDate order_date) {
        this.order_date = order_date;
    }

    public LocalDate getRequired_date() {
        return required_date;
    }

    public void setRequired_date(LocalDate required_date) {
        this.required_date = required_date;
    }

    public String getShip_address() {
        return ship_address;
    }

    public void setShip_address(String ship_address) {
        this.ship_address = ship_address;
    }

    public Detail getDetail() {
        return detail;
    }

    public void setDetail(Detail detail) {
        this.detail = detail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
