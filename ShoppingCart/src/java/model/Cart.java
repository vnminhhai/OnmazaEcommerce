/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Cart {
    List<Item> item_list;

    public Cart() {
    }

    public Cart(List<Item> item_list) {
        this.item_list = item_list;
    }

    public List<Item> getItem_list() {
        return item_list;
    }

    public void setItem_list(List<Item> item_list) {
        this.item_list = item_list;
    }
    
    public float getTotal() {
        float f=0;
        for (Item item : item_list) {
            f+=item.getPrice()*item.getQuantity();
        }
        return f;
    }
    
}
