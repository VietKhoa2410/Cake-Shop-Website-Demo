package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {

    public Connection getConnection() {
        Connection connect = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=W5_cafe;", "sa",
                    "123456");

            System.out.println("Connection: Connected");
        } catch (Exception e) {
            System.out.println("Connection: Connect fail");
        }
        return connect;

    }
}
