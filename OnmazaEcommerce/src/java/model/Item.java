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
public class Item {
    private int id;
    private String name;
    private String description;
    private float price;
    private Category category;
    private List<Variant> variants;
    private Image image;

    public Item() {
    }

    public Item(int id, String name, String description, float price, Category category, List<Variant> variants) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.category = category;
        this.variants = variants;
        this.image=Image.DEFAULT_PRODUCT;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Variant> getVariants() {
        return variants;
    }

    public void setVariants(List<Variant> variants) {
        this.variants = variants;
    }
    
    public int getQuantity() {
        int q =0;
        for (Variant v : getVariants()) {
            q+=v.getStock_amount();
        }
        return q;
    }
    
    public String getVariant() {
        for (Variant v : getVariants()) {
            if (v.getStock_amount()!=0) return v.getName();
        }
        return null;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    public Image getImage() {
        return image;
    }
    
}
