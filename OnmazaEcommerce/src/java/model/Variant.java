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
    private Image image;
    private int stock_amount;

    public Variant(String name, Image image, int stock_amount) {
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

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
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
        return "Variant [name=" + name + ", image=" + image + "]";
    }
}
