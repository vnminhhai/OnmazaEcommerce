/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Item;

/**
 *
 * @author ADMIN
 */
public class ItemDAO extends DBContext{
    public ArrayList<Item> getItemList(){
        String sql = "select * from Items";
        ResultSet rs;
        ArrayList<Item> l = new ArrayList<>();
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("Category_ID");
                int id= rs.getInt("ID");
                Category cat = new CategoryDAO().getRecordById(cid);
                String name = rs.getString("Name");
                String des = rs.getString("Description");
                float price = rs.getFloat("Price");
                l.add( new Item(id, name, des, price, cat));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }
    public void save(Item c) {
        String sql = "insert into Items(ID, Name, Description, Price, Category_ID)"
                + "values(?,?,?,?,?)";
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            ps.setInt(1, c.getId());
            ps.setString(2, c.getName());
            ps.setString(3, c.getDescription());
            ps.setFloat(4, c.getPrice());
            ps.setInt(5, c.getCategory().getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Item getRecordById(int id) {
        String sql = "select * from Items where ID="+id;
        ResultSet rs;
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                int cid = rs.getInt("Category_ID");
                Category cat = new CategoryDAO().getRecordById(cid);
                String name = rs.getString("Name");
                String des = rs.getString("Description");
                float price = rs.getFloat("Price");
                return new Item(id, name, des, price, cat);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void DeleteById(int id) {
        String sql = "delete from Items where ID="+id;
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void update(int id, Item c) {
        String sql = "update Items set User_Name=?, Password=?, First_Name=?,"+
                " Last_Name=?, Email=?, Mobile_Phone=?, Address=?, Country=?)"+
                " where ID="+id;
        String un = c.getUser_name();
        String pass = c.getPassword();
        String first = c.getFirst_name();
        String last = c.getLast_name();
        String email = c.getEmail();
        String add = c.getAddress();
        String country = c.getCountry();
        String phone = c.getMobile_phone();
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            ps.setInt(9, id);
            ps.setString(1, un);
            ps.setString(2, pass);
            ps.setString(3, first);
            ps.setString(4, last);
            ps.setString(5, email);
            ps.setString(6, phone);
            ps.setString(7, add);
            ps.setString(8, country);
            ps.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
