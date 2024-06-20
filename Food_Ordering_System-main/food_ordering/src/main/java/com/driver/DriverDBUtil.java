package com.driver;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.ArrayList;

@SuppressWarnings("unused")
public class DriverDBUtil {
	
	private static boolean isSuccess;
    private static Connection conn = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;

public static  void readDetails(String submit){}

public static void seeorder(String sub) {}


public static boolean deleteDriver(String email,String password) {
	

//	System.out.println(email + password);
	
	
	try {
		conn = DBConnection.getConnection();
		stmt = conn.createStatement();
		String sql = "DELETE FROM user WHERE email='"+email+"' and password='"+password+"'";
		int rs = stmt.executeUpdate(sql);
		
		if (rs > 0) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	
	try {
		conn = DBConnection.getConnection();
		stmt = conn.createStatement();
		String sql = "DELETE FROM driver WHERE email='"+email+"'";
		int rs = stmt.executeUpdate(sql);
		
		if (rs > 0) {
			isSuccess = true;
		}
		else {
			isSuccess = false;
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
	
}



}