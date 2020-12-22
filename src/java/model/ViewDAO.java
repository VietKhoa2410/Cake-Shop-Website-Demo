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

/**
 *
 * @author ASUS
 */
public class ViewDAO {

    public int getViewCount() {
        ConnectDB cDB = new ConnectDB();
        Connection conn = cDB.getConnection();
        try {
            PreparedStatement stt = conn.prepareStatement("select viewCount from viewLog");
            ResultSet rs = stt.executeQuery();
            while (rs.next()) {
                int view = rs.getInt("viewCount");
                conn.close();
                return view;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        return 0;
    }

    public void updateViewCount() {
        ConnectDB cDB = new ConnectDB();
        Connection conn = cDB.getConnection();
        try {
            String sql = "update viewLog set viewCount =((select viewCount from viewLog) +1)";
            PreparedStatement stt = conn.prepareStatement(sql);
            stt.execute();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
