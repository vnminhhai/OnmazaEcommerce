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

/**
 *
 * @author ADMIN
 */
public class CategoryDAO extends DBContext{
    public ArrayList<Category> getCategoryList(){
        String sql = "select * from Category";
        ResultSet rs;
        ArrayList<Category> l = new ArrayList<>();
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                int id= rs.getInt("ID");
                String label = rs.getString("Label");
                String des = rs.getString("Description");
                l.add( new Category(id, label, des));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }
    public void save(Category c) {
        String sql = "insert into Category (ID, Label, Description)"+
                " values(?, ?, ?)";
        int id = c.getId();
        String name = c.getName();
        String des = c.getDescription();
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, des);
            ps.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Category getRecordById(int id) {
        String sql = "select * from Category where ID="+id;
        ResultSet rs;
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("Label");
                String des = rs.getString("Description");
                return new Category(id, name, des);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void DeleteById(int id) {
        String sql = "delete from Category where ID="+id;
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
