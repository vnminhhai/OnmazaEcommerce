/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Variant;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class VariantDAO extends DBContext{
    public List<Variant> getItemVariantList(int iid) {
        List<Variant> l = new ArrayList<>();
        String sql = "select * from Variants where Item_ID="+iid;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                l.add(new Variant(rs.getString("Name"),
                        rs.getBytes("Image"),
                        rs.getInt("Stock_Amount")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return l;
    }
    public Variant getRecordByName(int id, String name) {
        String sql = "select * from Variants where Item_ID="+id+"and Name='"+name+"'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return (new Variant(rs.getString("Name"),
                        rs.getBytes("Image"),
                        rs.getInt("Stock_Amount")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public void updateAmount(int id, String name, int update_number) {
        String sql = "update Variants set Stock_Amount="+update_number+" where Item_ID="+id+"and Name='"+name+"'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate(); 
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void updateImage(int id, String name, byte[] img) {
        String sql = "update Variants set Image=? where Item_ID="+id+"and Name='"+name+"'";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBytes(1, img);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void addVariant(Variant v, int iid) {
        String sql = "insert into Variants (Item_ID, Name, Image, Stock_Amount) values (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, iid);
            ps.setString(2, v.getName());
            ps.setBytes(3, v.getImage());
            ps.setInt(4, v.getStock_amount());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
