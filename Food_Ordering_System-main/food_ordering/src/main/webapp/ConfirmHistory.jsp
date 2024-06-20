<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="customer.DatabaseConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm History</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
<link rel="stylesheet" type="text/css" href="styles/AdminSelect.css">
</head>
<body>
	<%@ include file="AdminHeader.jsp" %>
	
	<form action="DeleteServlet" method="post">
	 <div class="table-container1">
    	<h3>Order Details</h3>
        <table border="1">
            <tr>
                <th>Customer First name</th>
                <th>Customer Last name</th>
                <th>Customer Email</th>
                <th>Customer Number</th>
                <th>Restaurant Name</th>
                <th>Food Name</th>
                <th>Price</th>
                <th>Driver Email</th>
                <th>Vehicle Number</th>
                <th>Vehicle type</th>
                <th>Delete Order</th>
           
            </tr>
            
	    <%
    	
        Connection con = DatabaseConn.getConnection();
        String sql = "SELECT U.first_name, U.last_name, U.email, U.mobile, R.Restaurent_Name, F.Food_Name, F.Price, D.email, D.Vehicle_num, D.Vehicle_type, O.Order_Id FROM user U, restaurent R, food_items F, order_details O, driver D, plase_order P WHERE U.email = O.Email AND O.Restaurent_Id = R.Restaurent_Id AND O.Food_Id = F.Food_Id AND D.email = P.Driver_email AND O.Order_Id = P.Order_Id AND O.Confirmation = 'yes'";
        
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rst = pst.executeQuery();

        while (rst.next()) {
            String first_name = rst.getString("first_name");
            String last_name = rst.getString("last_name");
            String email = rst.getString("email");
            String mobile = rst.getString("mobile");
            String Restaurent_Name = rst.getString("Restaurent_Name");
            String Food_Name = rst.getString("Food_Name");
            String Price = rst.getString("Price");
            String D_email = rst.getString("D.email");
            String Vehicle_num = rst.getString("Vehicle_num");
            String Vehicle_type = rst.getString("Vehicle_type");
            String Order_Id = rst.getString("Order_Id");
    %>
  <tr>  
    <td><%= first_name %></td>
    <td><%= last_name %></td>
    <td><%= email %></td>
    <td><%= mobile %></td>
    <td><%= Restaurent_Name %></td>
    <td><%= Food_Name %></td>
    <td><%= Price %></td>
    <td><%= D_email %></td>
    <td><%= Vehicle_num %></td>
    <td><%= Vehicle_type %></td>
    <td><button type="submit" value="<%= Order_Id %>" name="DeleteValue" style="background-color: red; color: white;"> Delete </button></td>
  </tr>  
    <%
        }
        rst.close();
        pst.close();
        con.close();
    %>
    
    </table>
   </div>
	</form>
	

</body>

</html>