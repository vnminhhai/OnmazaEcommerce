/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Variant {
    private String name;
    private byte[] image;
    private int stock_amount;

    public Variant(String name, byte[] image, int stock_amount) {
        this.name = name;
        this.image = image;
        this.stock_amount = stock_amount;
    }

    public Variant() {
    }

}
