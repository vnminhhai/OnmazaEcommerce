/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class Variant {
    private String name;
    private String image_url;
    private int stock_amount;

    public Variant(String name, String image, int stock_amount) {
        this.name = name;
        this.image_url = image;
        this.stock_amount = stock_amount;
    }

    public Variant() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage_URL() {
        return image_url;
    }

    public void setImage(String image) {
        this.image_url = image;
    }

    public int getStock_amount() {
        return stock_amount;
    }

    public void setStock_amount(int stock_amount) {
        this.stock_amount = stock_amount;
    }
    
//    public File getRenderedImage() {
//        File f = new File("output.jpg");
//        try {
//            ByteArrayInputStream bis = new ByteArrayInputStream(image);
//            BufferedImage bImage2 = ImageIO.read(bis);
//            ImageIO.write(bImage2, "jpg", f);
//        } catch (IOException ex) {
//            Logger.getLogger(Variant.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return f;
//    }
    
//    public String getEncodedImage() {
//        return Base64.getEncoder().encode(image).toString();
//    }
@Override
    public String toString() {
        return "Variant [name=" + name + ", image=" + image_url + "]";
    }
}
