package com.customer;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class CustomerDBUtil {
	
	private static boolean isSuccess;
	private static Connection conn=null;
	private static  Statement stmt=null;
	@SuppressWarnings("unused")
	private static ResultSet rs=null;
	
	public static boolean insertcustomer(String UserEmail ,String House_No,String Lane,String Sub_city,String City,String District) {
		boolean issuccess=false;
		

	     try {
	           
	           conn=DBconnect.getConnection();
	           stmt=conn.createStatement();
	           String sql="INSERT INTO cus_address values('"+UserEmail+"','"+House_No+"','"+Lane+"','"+Sub_city+"','"+City+"','"+District+"')";
	           int rs=stmt.executeUpdate(sql);
	           
	           if(rs>0){
	        	   
	        	   issuccess =true;
	        	   
	           }
	           else {
	        	   
	        	   issuccess =false;
	           }
	   
	        } catch ( Exception e) {
	            e.printStackTrace();
	        }
	     
		return issuccess;
		
	}
	
	 public static boolean  CustomerUpdateServlet(String UserEmail, String House_No,String Lane,String Sub_city,String City,String District) {
	    	
	    	try {
	    		
		           conn=DBconnect.getConnection();
		           stmt=conn.createStatement();
	    		String sql = "update cus_address set House_No='"+House_No+"',Lane='"+Lane+"',Sub_city='"+Sub_city+"',District='"+District+"'"
	    				+ "where email='"+UserEmail+"'";
	    		int rs = stmt.executeUpdate(sql);
	    		
	    		if(rs > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	    }

}
