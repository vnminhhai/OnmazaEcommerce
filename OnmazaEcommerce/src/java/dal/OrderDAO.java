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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Item;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext{

    public OrderDAO() {
    }
    
    public void updateStatus(int oid, int setTo) {
        String sql = "update Orders set Status_ID ="+setTo+" where ID="+oid;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.executeUpdate();
            }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void save(Order o, int cid) {
        String sql = "INSERT INTO Orders (Customer_ID, Order_Date, Required_Date, Ship_Address)\n" +
        "VALUES (?, ?, ?, ?)";
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
    
    public List<Order> getAllOrdersByStatus(int s) {
        List<Order> l = new ArrayList<>();
        String sql = "select * from Orders where Status_ID ="+s;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs= ps.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("ID");
                List<Item> item_list = new ArrayList<>();
                String fetch_detail = "select * from Detail where Order_ID ="+order_id;
                ResultSet r = connection.prepareStatement(fetch_detail).executeQuery();
                while (r.next()) {
                    item_list.add(new ItemDAO().getRecordById(r.getInt("Order_ID")));
                }
                Detail detail = new Detail(item_list);
                l.add(new Order(rs.getInt("ID"), rs.getInt("Customer_ID"), LocalDate.parse(rs.getString("Order_Date")),
                        LocalDate.parse(rs.getString("Required_Date")), rs.getString("Ship_Address"), detail, trans(s)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return l;
    }
    
    public List<Order> getAllOrdersByUserId(int iid) {
        List<Order> l = new ArrayList<>();
        String sql = "select * from Orders where Customer_ID ="+iid;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs= ps.executeQuery();
            while (rs.next()) {
                int order_id = rs.getInt("ID");
                List<Item> item_list = new ArrayList<>();
                String fetch_detail = "select * from Detail where Order_ID ="+order_id;
                ResultSet r = connection.prepareStatement(fetch_detail).executeQuery();
                while (r.next()) {
                    item_list.add(new ItemDAO().getRecordById(r.getInt("Order_ID")));
                }
                Detail detail = new Detail(item_list);
                int s = rs.getInt("Status_ID");
                l.add(new Order(rs.getInt("ID"), rs.getInt("Customer_ID"), LocalDate.parse(rs.getString("Order_Date")),
                        LocalDate.parse(rs.getString("Required_Date")), rs.getString("Ship_Address"), detail, trans(s)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return l;
    }
    
    public Order getOrderByID(int oid) {
        String sql = "select * from Orders where ID ="+oid;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs= ps.executeQuery();
            while (rs.next()) {
                List<Item> item_list = new ArrayList<>();
                String fetch_detail = "select * from Detail where Order_ID ="+oid;
                ResultSet r = connection.prepareStatement(fetch_detail).executeQuery();
                while (r.next()) {
                    item_list.add(new ItemDAO().getRecordById(r.getInt("Item_ID")));
                }
                int s = rs.getInt("Status_ID");
                Detail detail = new Detail(item_list);
                return new Order(oid, rs.getInt("Customer_ID"), LocalDate.parse(rs.getString("Order_Date")),
                        LocalDate.parse(rs.getString("Required_Date")), rs.getString("Ship_Address"), detail, trans(s));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    private String trans(int i) {
        switch (i) {
            case 0: return "Pending";
            case 1: return "Transporting";
            case 2: return "Done";
            default: return "Cancelled";
        }
    }
}
