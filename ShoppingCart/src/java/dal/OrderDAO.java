/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.sql.ResultSet;
import model.Order;
import model.Detail;
import java.sql.Date;
import java.sql.PreparedStatement;
import model.Item;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext{

    public OrderDAO() {
    }
    
    public void save(Order o, int cid) {
        String sql = "INSERT INTO Orders (Customer_ID, Order_Date, Required_Date, Ship_Address)\n" +
        "VALUES\n" +
        "    (?, ?, ?, ?)";
        int generatedId = -1;
        ResultSet rs =null;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cid);
            ps.setDate(2, Date.valueOf(o.getOrder_date()));
            ps.setDate(3, Date.valueOf(o.getRequired_date()));
            ps.setString(4, o.getShip_address());
            int affectedRows = ps.executeUpdate();
            if (affectedRows>0)
                try {
                    sql = "select max(ID) from Orders";
                    ps = connection.prepareStatement(sql);
                    rs = ps.executeQuery();
                    if (rs.next()) {
                        generatedId = rs.getInt(1); // Retrieve the generated ID
                        System.out.println(generatedId);
                    }
                    if (generatedId==-1) {
                        throw new SQLException("No newly generated ID fetched.");
                    }
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            else throw new SQLException("No new order fetched.");
            sql = "INSERT INTO Detail (Order_ID, Item_ID, Unit_Prices, Quantity)"+
        "VALUES (?, ?, ?, ?)";
            ps = connection.prepareStatement(sql);
            for (Item i : o.getDetail().getItem_list()) {
                ps.setInt(1, generatedId);
                System.out.println(generatedId);
                ps.setInt(2, i.getId());
                System.out.println(i.getId());
                ps.setFloat(3, i.getPrice());
                ps.setInt(4, i.getQuantity());
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    
}
