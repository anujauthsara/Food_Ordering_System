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
<title>Select Order</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
<link rel="stylesheet" type="text/css" href="styles/AdminSelect.css">
</head>
<body>
    <%@ include file="AdminHeader.jsp" %>
<center><h1>Select Driver </h1></center>
<form action="AdminServlet" method="post">
    <div class="table-container1">
    	<h3>Order Details</h3>
        <table border="1">
            <tr>
                <th>Order Id</th>
                <th>Email</th>
                <th>Restaurant Id</th>
                <th>Food Id</th>
                <th>conn</th>
           
            </tr>
            <%
                Connection conO = DatabaseConn.getConnection();
                String sqlO = "SELECT Order_Id, Email, Restaurent_Id, Food_Id FROM order_details WHERE Confirmation != 'yes'";
                PreparedStatement pstO = conO.prepareStatement(sqlO);
                ResultSet rstO = pstO.executeQuery();

                while (rstO.next()) {
                    String Order_Id = rstO.getString("Order_Id");
                    String Email = rstO.getString("Email");
                    String Restaurent_Id = rstO.getString("Restaurent_Id");
                    String Food_Id = rstO.getString("Food_Id");
            %>
            <tr>
                <td><%= Order_Id %></td>
                <td><%= Email %></td>
                <td><%= Restaurent_Id %></td>
                <td><%= Food_Id %></td>
                <td><input type="radio" name="OrderId" value="<%= Order_Id %>" class="radiobtn" required>
            </tr>
            <%
                }
                rstO.close();
                pstO.close();
                conO.close();
            %>
        </table>
    </div>
    <div class="table-container2">
      
		<h3>Driver Details</h3>
        <table border="1">
            <tr>
            	<th>conn</th>
                <th>Driver Email</th>
                <th>Vehicle Number</th>
                <th>Vehicle Type</th>
                
            </tr>
            <%
                Connection conD = DatabaseConn.getConnection();
                String sqlD = "SELECT email, Vehicle_num, Vehicle_type FROM driver";
                PreparedStatement pstD = conD.prepareStatement(sqlD);
                ResultSet rstD = pstD.executeQuery();

                while (rstD.next()) {
                    String DriverEmail = rstD.getString("email");
                    String VehicleNumber = rstD.getString("Vehicle_num");
                    String VehicleType = rstD.getString("Vehicle_type");
            %>
            <tr>
            	<td><input type="radio" name="DriverEmail" value="<%= DriverEmail %>" class="radiobtn" required>
                <td><%= DriverEmail %></td>
                <td><%= VehicleNumber %></td>
                <td><%= VehicleType %></td>
            </tr>
            <%
                }
                rstD.close();
                pstD.close();
                conD.close();
            %>
        </table>
     </div>
        
    <input type="submit" class="submitbtn" value="Select">
</form>


</body>
</html>
