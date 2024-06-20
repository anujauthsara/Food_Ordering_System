<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="customer.DatabaseConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Customer</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
    <style>
        /* Style the form container */
        form {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;	
        }

        /* Style the form labels */
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        /* Style the form input fields */
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        /* Style the submit button */
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        /* Add some spacing between elements */
        div.form-element {
            margin-bottom: 15px;
        }

        /* Style the form header */
        h1 {
            text-align: center;
            font-size: 24px;
            color: #333;
            
        }

        /* Style the form container's background */
        body {
            background-color: #f2f2f2;
        }

        /* Style the OrderId container */
        .OrderId {
            background-color: #fff;
            padding: 10px;
            border: 1px solid #ccc;
            margin-top: 20px;
            border-radius: 4px;
            text-align: center;
        }
    </style>
</head>
<body>

 	<%@ include file="AdminHeader.jsp" %>
    <%
    String updateCus = (String) session.getAttribute("updateCus");
    %>
    <center><h1>Update Customer</h1></center>
    <div class="OrderId">
        <h1>Email is: <%= updateCus %></h1>
    </div>
    <form action="UpdateServlet" method="post">
        <%
        Connection conD = DatabaseConn.getConnection();
        String sqlD = "SELECT first_name, last_name, mobile, birthday, password FROM user WHERE email=?";
        PreparedStatement pstD = conD.prepareStatement(sqlD);
        pstD.setString(1, updateCus);
        ResultSet rstD = pstD.executeQuery();
        while (rstD.next()) {
            String first_name = rstD.getString("first_name");
            String last_name = rstD.getString("last_name");
            String mobile = rstD.getString("mobile");
            String birthday = rstD.getString("birthday");
            String password = rstD.getString("password");
        %>
        <div class="form-element">
            <label for="fname">First Name:</label>
            <input type="text" id="fname" name="fname" value="<%= first_name %>">
        </div>
        <div class="form-element">
            <label for="lname">Last Name:</label>
            <input type="text" id="lname" name="lname" value="<%= last_name %>">
        </div>
        <div class="form-element">
            <label for="mobile">Mobile:</label>
            <input type="text" id="mobile" name="mobile" value="<%= mobile %>">
        </div>
        <div class="form-element">
            <label for="birthday">Birthday:</label>
            <input type="date" id="birthday" name="birthday" value="<%= birthday %>">
        </div>
        <div class="form-element">
            <label for="password">Password:</label>
            <input type="text" id="password" name="password" value="<%= password %>">
        </div>
        <input type="submit" value="Update">
        <% 
        }
        %>
    </form>
    
    
    <br><br><br><br><br>
    	<%@ include file="Footer.jsp" %>
</body>
</html>
