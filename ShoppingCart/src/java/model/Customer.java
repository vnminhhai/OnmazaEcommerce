/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Customer {
    private int id;
    private String first_name;
    private String last_name;
    private String email;
    private String mobile_phone;
    private String address;
    private String country;

    public Customer() {
    }

    public Customer(int id, String first_name, String last_name, String email, String mobile_phone, String address, String country) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.mobile_phone = mobile_phone;
        this.address = address;
        this.country = country;
    }
    
}
