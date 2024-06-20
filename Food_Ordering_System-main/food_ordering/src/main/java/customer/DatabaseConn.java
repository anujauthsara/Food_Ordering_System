package customer;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConn {

	 private static final String DB_URL = "jdbc:mysql://localhost:3306/food_ordering";
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = "";

	    public static Connection getConnection() {
	        Connection conn = null;

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            
	            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return conn;
	    }
}
