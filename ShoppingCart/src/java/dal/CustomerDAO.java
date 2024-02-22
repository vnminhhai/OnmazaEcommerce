/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Customer;
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
public class CustomerDAO extends DBContext{
    public ArrayList<Customer> getCustomerList(){
        String sql = "select * from Customers";
        ResultSet rs;
        ArrayList<Customer> l = new ArrayList<>();
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                int id= rs.getInt("ID");
                String un = rs.getString("User_Name");
                String pass = rs.getString("Password");
                String first = rs.getString("First_Name");
                String last = rs.getString("Last_Name");
                String email = rs.getString("Email");
                String add = rs.getString("Address");
                String phone = rs.getString("Mobile_Phone");
                String country = rs.getString("Country");
                l.add( new Customer(id, first, last, email, phone, add, country, un, pass));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }
    public void save(Customer c) {
        String sql = "insert into Customers (User_Name, Password, First_Name,"+
                " Last_Name, Email, Mobile_Phone, Address, Country)"+
                " values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public Customer getRecordById(int id) {
        String sql = "select * from Customers where ID="+id;
        ResultSet rs;
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                String un = rs.getString("User_Name");
                String pass = rs.getString("Password");
                String first = rs.getString("First_Name");
                String last = rs.getString("Last_Name");
                String email = rs.getString("Email");
                String add = rs.getString("Address");
                String phone = rs.getString("Mobile_Phone");
                String country = rs.getString("Country");
                return new Customer(id, first, last, email, phone, add, country, un, pass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public Customer getRecordByName(String un) {
        String sql = "select * from Customers where User_Name='"+un+"'";
        ResultSet rs;
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String pass = rs.getString("Password");
                String first = rs.getString("First_Name");
                String last = rs.getString("Last_Name");
                String email = rs.getString("Email");
                String add = rs.getString("Address");
                String phone = rs.getString("Mobile_Phone");
                String country = rs.getString("Country");
                return new Customer(id, first, last, email, phone, add, country, un, pass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void DeleteById(int id) {
        String sql = "delete from Customers where ID="+id;
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void update(int id, Customer c) {
        String sql = "update Customers set User_Name=?, Password=?, First_Name=?,"+
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
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void update(String un, Customer c) {
        String sql = "update Customers set Password=?, First_Name=?,"+
                " Last_Name=?, Email=?, Mobile_Phone=?, Address=?, Country=?)"+
                " where User_Name='"+un+"'";
        String pass = c.getPassword();
        String first = c.getFirst_name();
        String last = c.getLast_name();
        String email = c.getEmail();
        String add = c.getAddress();
        String country = c.getCountry();
        String phone = c.getMobile_phone();
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            ps.setString(8, un);
            ps.setString(1, pass);
            ps.setString(2, first);
            ps.setString(3, last);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, add);
            ps.setString(7, country);
            ps.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
