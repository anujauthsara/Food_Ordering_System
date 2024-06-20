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
<title>Order status</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
<link rel="stylesheet" type="text/css" href="styles/Order.css">

</head>
<body>
    <%@ include file="AdminHeader.jsp" %>
    <center><h1>Order Status..</h1></center>
    <div class = "OrderId">
    <h1>Order Id is : <%= (String)session.getAttribute("OrderId") %></h1> </div>
    
    <table border="1">
            <tr>
                <th>Status</th>
                <th>Value</th>
           
            </tr>
    
    <%
    	String OID = (String)session.getAttribute("OrderId");
    	
        Connection con = DatabaseConn.getConnection();
        String sql = "SELECT U.first_name, U.last_name, U.email, U.mobile, A.House_No, A.Lane, A.Sub_city, A.City, A.District, R.Restaurent_Name, R.Location, F.Food_Name, F.Price FROM user U, cus_address A, restaurent R, food_items F, order_details O WHERE U.email = A.email AND U.email = O.Email AND O.Restaurent_Id = R.Restaurent_Id AND O.Food_Id = F.Food_Id AND O.Order_Id = ? AND O.Confirmation != 'yes'";
        
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, OID);
        ResultSet rst = pst.executeQuery();

        while (rst.next()) {
            String first_name = rst.getString("first_name");
            String last_name = rst.getString("last_name");
            String email = rst.getString("email");
            String mobile = rst.getString("mobile");
            String House_No = rst.getString("House_No");
            String Lane = rst.getString("Lane");
            String Sub_city = rst.getString("Sub_city");
            String City = rst.getString("City");
            String District = rst.getString("District");
            String Restaurent_Name = rst.getString("Restaurent_Name");
            String Location = rst.getString("Location");
            String Food_Name = rst.getString("Food_Name");
            String Price = rst.getString("Price");
    %>
    
    <tr>
    	<td> Customer First Name : </td>
    	<td> <%= first_name %> </td>
    </tr>
    
    <tr>
    	<td> Customer Last Name : </td>
    	<td> <%= last_name %> </td>
    </tr>
    
    <tr>
    	<td> Customer Email Address : </td>
    	<td> <%= email %> </td>
    </tr>
    
    <tr>
    	<td> Customer Mobile Number : </td>
    	<td> <%= mobile %> </td>
    </tr>
    
     <tr>
    	<td> Customer House Number : </td>
    	<td> <%= House_No %> </td>
    </tr>
    
    <tr>
    	<td> Customer Lane : </td>
    	<td> <%= Lane %> </td>
    </tr>
    
    <tr>
    	<td> Customer Sub_city : </td>
    	<td> <%= Sub_city %> </td>
    </tr>
    
    <tr>
    	<td> Customer City : </td>
    	<td> <%= City %> </td>
    </tr>
    
         <tr>
    	<td> Customer District : </td>
    	<td> <%= District %> </td>
    </tr>
    
    <tr>
    	<td> Customer Selected Restaurant Name : </td>
    	<td> <%= Restaurent_Name %> </td>
    </tr>
    
    <tr>
    	<td> Customer Selected Restaurant Location : </td>
    	<td> <%= Location %> </td>
    </tr>
    
    <tr>
    	<td> Customer Selected Food Name : </td>
    	<td> <%= Food_Name %> </td>
    </tr>
    
    <tr>
    	<td> Customer Selected Food Price : </td>
    	<td> <%= Price %> </td>
    </tr>

    
    <%
        }
        rst.close();
        pst.close();
        con.close();
    %>
    
    
    
    
    
    
    
        <%
        String Demail= (String)session.getAttribute("DriverEmail");
    	
        Connection Dcon = DatabaseConn.getConnection();
        String Dsql = "SELECT U.first_name, U.last_name, U.email, U.mobile, D.Vehicle_num, D.Vehicle_type FROM user U, driver D WHERE U.email = D.email AND U.email = ? ";
        
        PreparedStatement Dpst = Dcon.prepareStatement(Dsql);
        Dpst.setString(1, Demail);
        ResultSet Drst = Dpst.executeQuery();

        while (Drst.next()) {
            String first_name = Drst.getString("first_name");
            String last_name = Drst.getString("last_name");
            String email = Drst.getString("email");
            String mobile = Drst.getString("mobile");
            String Vehicle_num = Drst.getString("Vehicle_num");
            String Vehicle_type = Drst.getString("Vehicle_type");
    %>
    
    <tr>
    	<td> Driver First name : </td>
    	<td> <%= first_name %> </td>
    </tr>
    
    <tr>
    	<td> Driver Last name : </td>
    	<td> <%= last_name %> </td>
    </tr>
    
    <tr>
    	<td> Driver Email Address : </td>
    	<td> <%= email %> </td>
    </tr>
    
    <tr>
    	<td> Driver moile phone Number : </td>
    	<td> <%= mobile %> </td>
    </tr>
    
    <tr>
    	<td> Driver Vehicle Number : </td>
    	<td> <%= Vehicle_num %> </td>
    </tr>
    
    <tr>
    	<td> Driver Vehicle Type : </td>
    	<td> <%= Vehicle_type %> </td>
    </tr>
    
    <%
        }
        Drst.close();
        Dpst.close();
        Dcon.close();
    %>
    
    </table>
     <div class="button-container">
    <form action="placeOrderServlet" method="post">
    	<a href="AdminMain.jsp"> <input type="button" name="back" value="Back" > </a>
    	
        <input type="submit" name="sub">
        <br><br><br><br><br><br>
    </form>
    
    
    </div>
     <br><br><br><br><br><br>
    	<%@ include file="Footer.jsp" %>
</body>
</html>
