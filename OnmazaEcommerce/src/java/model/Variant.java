/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public int getStock_amount() {
        return stock_amount;
    }

    public void setStock_amount(int stock_amount) {
        this.stock_amount = stock_amount;
    }
    
    public File getRenderedImage() {
        File f = new File("output.jpg");
        try {
            ByteArrayInputStream bis = new ByteArrayInputStream(image);
            BufferedImage bImage2 = ImageIO.read(bis);
            ImageIO.write(bImage2, "jpg", f);
        } catch (IOException ex) {
            Logger.getLogger(Variant.class.getName()).log(Level.SEVERE, null, ex);
        }
        return f;
    }
@Override
    public String toString() {
        return "Variant [name=" + name + ", image=" + image + "]";
    }
}
