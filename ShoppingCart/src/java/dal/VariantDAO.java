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
}
