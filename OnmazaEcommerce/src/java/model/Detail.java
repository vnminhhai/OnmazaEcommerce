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
public class Detail {
    List<Item> item_list;

    public Detail() {
    }

    public Detail(List<Item> item_list) {
        this.item_list = item_list;
    }

    public List<Item> getItem_list() {
        return item_list;
    }

    public void setItem_list(List<Item> item_list) {
        this.item_list = item_list;
    }
    
}
