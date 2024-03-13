/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */

public class Image {
    private int id;
    private String type;

    public final static Image DEFAULT_USER = new Image(0, "user");
    public final static Image DEFAULT_PRODUCT = new Image(0, "product");
    public final static Image DEFAULT_VARIANT = new Image(0, "variant");
    
    public Image() {
    }

    public Image(int id, String type) {
        this.id = id;
        this.type=type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
}
