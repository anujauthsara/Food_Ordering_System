package com.driver;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/food_ordering";
    private static String dbUser = "root";
    private static String dbPassword = "";
    private static Connection conn;

    public static Connection getConnection() {
        try {
        	 Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        } catch (Exception e) {
            System.out.print("Database connection is not successful!!");
        }
        return conn;
    }
}
