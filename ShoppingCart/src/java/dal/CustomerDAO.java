/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class CustomerDAO extends DBContext{
    public void save(Customer c) {
        String sql = "insert into Customers values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            PreparedStatement ps  = connection.prepareStatement(sql);
            ps.setInt(1, 0);
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
