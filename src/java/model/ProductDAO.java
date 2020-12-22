/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class ProductDAO {

    public ArrayList<Product> getAll() {
        ArrayList<Product> al = new ArrayList<>();
        ConnectDB cDB = new ConnectDB();
        Connection conn = cDB.getConnection();
        try {
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery("Select * from products");

            while (rs.next()) {
                String id = rs.getString("id");
                String image = rs.getString("image");
                String description = rs.getString("description");
                int price = rs.getInt("price");
                String name = rs.getString("name");
                al.add(new Product(id, image, description, name, price));
            }
            return al;
        } catch (SQLException e) {
            return null;
        }
    }

    public Product getProduct(String id) {
        ConnectDB cDB = new ConnectDB();
        Connection conn = cDB.getConnection();
        try {
            PreparedStatement stt = conn.prepareStatement("select * from products where id=?");
            stt.setString(1, id);
            ResultSet rs = stt.executeQuery();
            while (rs.next()) {
                String image = rs.getString("image");
                String description = rs.getString("description");
                int price = rs.getInt("price");
                String name = rs.getString("name");
                return new Product(id, image, description, name, price);
            }
        } catch (SQLException e) {
            return null;
        }
        return null;
    }
}
