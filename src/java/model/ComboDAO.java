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
public class ComboDAO {

    public ArrayList<Combo> getAll() {
        ArrayList<Combo> al = new ArrayList<>();
        ConnectDB cDB = new ConnectDB();
        Connection conn = cDB.getConnection();
        try {
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery("Select * from combo");

            while (rs.next()) {
                String id = rs.getString("id");
                String image = rs.getString("image");
                String name = rs.getString("name");
                String description = rs.getString("description");
                int price = rs.getInt("price");
                al.add(new Combo(id, image, name, description, price));
            }
            conn.close();
            return al;
        } catch (SQLException e) {
            return null;
        }
    }

    public Combo getCombo(String id) {
        ConnectDB cDB = new ConnectDB();
        Connection conn = cDB.getConnection();
        try {
            PreparedStatement stt = conn.prepareStatement("select * from combo where id=?");
            stt.setString(1, id);
            ResultSet rs = stt.executeQuery();
            while (rs.next()) {
                String image = rs.getString("image");
                String description = rs.getString("description");
                int price = rs.getInt("price");
                String name = rs.getString("name");
                conn.close();
                return new Combo(id, image, name, description, price);
            }
        } catch (SQLException e) {
            return null;
        }
        return null;
    }

    public ArrayList<Product> getProduct(String combo) {
        ArrayList<Product> al = new ArrayList<>();
        ConnectDB cDB = new ConnectDB();
        Connection conn = cDB.getConnection();
        try {
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery("Select products.id,products.image,products.description,products.price,products.name from pro_com join products on pro_com.id_pro=products.id \n"
                    + "where pro_com.id_com='" + combo + "'");

            while (rs.next()) {
                String id = rs.getString("id");
                String image = rs.getString("image");
                String name = rs.getString("name");
                String description = rs.getString("description");
                int price = rs.getInt("price");
                al.add(new Product(id, image, description, name, price));
            }
            conn.close();
            return al;
        } catch (SQLException e) {
            return null;
        }
    }

    public ArrayList<Combo> getComboList(String product) {
        ArrayList<Combo> al = new ArrayList<>();
        ConnectDB cDB = new ConnectDB();
        Connection conn = cDB.getConnection();
        try {
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery("select combo.id, combo.image, combo.name, combo.description, combo.price from pro_com join combo on pro_com.id_com=combo.id  \n"
                    + "where pro_com.id_pro='" + product + "'");

            while (rs.next()) {
                String id = rs.getString("id");
                String image = rs.getString("image");
                String name = rs.getString("name");
                String description = rs.getString("description");
                int price = rs.getInt("price");
                al.add(new Combo(id, image, name, description, price));
            }
            conn.close();
            return al;
        } catch (SQLException e) {
            return null;
        }
    }

    public int getTotalProductPrice(String combo) {
        ConnectDB cDB = new ConnectDB();
        Connection conn = cDB.getConnection();
        try {
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery("select sum(products.price) as 'total' from pro_com join products on pro_com.id_pro=products.id \n"
                    + "where pro_com.id_com='" + combo + "'");

            while (rs.next()) {
                int total = rs.getInt("total");
                return total;
            }
            conn.close();
            return 0;
        } catch (SQLException e) {
            return 0;
        }
    }
}
