/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.User;
import model.ConnectDB;

/**
 *
 * @author ASUS
 */
public class UserDAO {

    public ArrayList<User> getAll() {
        ArrayList<User> al = new ArrayList<User>();
        ConnectDB cDB = new ConnectDB();
        Connection conn = cDB.getConnection();
        try {
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery("Select * from account");
            while (rs.next()) {
                String name = rs.getString("name");
                String pass = rs.getString("pass");
                String brand = rs.getString("brand");
                String address = rs.getString("address");
                String image = rs.getString("image");
                String content = rs.getString("content");
                al.add(new User(name, pass, brand, address, image, content));
            }
            return al;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public User getUser(String name, String pass) {
        ConnectDB cDB = new ConnectDB();
        Connection conn = cDB.getConnection();
        try {
            PreparedStatement stt = conn.prepareStatement("select * from account where name=? and pass=?");
            stt.setString(1, name);
            stt.setString(2, pass);
            ResultSet rs = stt.executeQuery();
            while (rs.next()) {
                String brand = rs.getString("brand");
                String address = rs.getString("address");
                String image = rs.getString("image");
                String content = rs.getString("content");
                return new User(name, pass, brand, address, image, content);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return null;
    }
}
