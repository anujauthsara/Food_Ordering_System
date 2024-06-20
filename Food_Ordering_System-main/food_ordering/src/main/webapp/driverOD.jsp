<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.driver.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
<link rel="stylesheet" type="text/css" href="styles/driverMain.css">
</head>
<body>
    <%@ include file="DriverHeader.jsp" %>
    
<h1> Order Details </h1>

<form action="" method="post">

    <div class="table-container1">
    	<h3>Order Details</h3>
        <table border="1">
            <tr>
                <th>Customer Name</th>
                <th>Customer Email</th>
                <th>Customer Phone No</th>
                <th>Restaurant Name</th>
                <th>Food Name</th>
                <th>Food Price</th>
               
                
           
            </tr>
            <%
            	String UserEmail = (String) session.getAttribute("UserEmail");
               Connection conn = DBConnection.getConnection();
             
    	       String sql = "SELECT U.first_name, U.email, U.mobile, R.Restaurent_Name, F.Food_Name, F.Price FROM user U, restaurent R, food_items F, order_details O, driver D, plase_order P WHERE U.email = O.Email AND O.Restaurent_Id = R.Restaurent_Id AND O.Food_Id = F.Food_Id AND D.email = P.Driver_email AND O.Order_Id = P.Order_Id AND D.email = '"+UserEmail+"' AND O.Confirmation = 'yes'";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                	String first_name =rs.getString("U.first_name");
         	       	String email =rs.getString("U.email");
         	       	String mobile =rs.getString("U.mobile");
        	       	String Restaurent_Name =rs.getString("R.Restaurent_Name");
        	       	String Food_Name =rs.getString("F.Food_Name");
         	       	String Price =rs.getString("F.Price");

            %>
            <tr>
                <td><%= first_name %></td>
                <td><%= email %></td>
                <td><%= mobile %></td>
                <td><%= Restaurent_Name %></td>
                <td><%= Food_Name %></td>
                <td><%= Price %></td>
             
                
            </tr>
            <%
                }
                rs.close();
                stmt.close();
                conn.close();
            %>
        </table>
        </div>
        </form>
        <br><br>
        <%@ include file="Footer.jsp"  %>
</body>
</html>