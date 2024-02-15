/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String user = "sa";
            String pass= "123";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=PRJ_ASS_2024";
            connection = DriverManager.getConnection(url, user, pass);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void main(String[] args) {
        DBContext dBContext = new DBContext();
        if (dBContext.connection != null) {
            System.out.println("DB connected");
        } else {
            System.out.println("DB connection failed");
        }
    }

}
