/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Item;
import model.Variant;

/**
 *
 * @author ADMIN
 */
public class CartDAO extends DBContext{
    public Cart getCartByID(int id) {
        List<Item> l = new ArrayList();
        String sql= "select distinct Customer_ID, c.Item_ID, Variant_Name, Quantity from Cart c join Variants v\n" +
"on c.Item_ID = v.Item_ID where Customer_ID = ? order by Item_ID";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int iid = rs.getInt("Item_ID");
                Item i = new ItemDAO().getRecordById(iid);
                for (Variant v : i.getVariants()) {
                    String name=v.getName();
                    if (name.equals(rs.getString("Variant_Name"))) {
                        v.setStock_amount(rs.getInt("Quantity"));
                    }
                    else {
                        v.setStock_amount(0);
                    }
                }
                l.add(i);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new Cart(l);
    }
}
