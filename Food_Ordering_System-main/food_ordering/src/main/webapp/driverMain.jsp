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
<title>Driver Details</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
<link rel="stylesheet" type="text/css" href="styles/driverMain.css">
<style>
        /* Apply styles to the "delete" div */
        #delete {
            text-align: center;
            margin: 20px;
        }

        /* Apply styles to the submit button */
        #delete input[type="submit"] {
            background-color: #FF5733;
            color: #fff;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        #delete input[type="submit"]:hover {
            background-color: #FF6B6B;
        }
    </style>
</head>
<body>
    <%@ include file="DriverHeader.jsp" %>
    
<h1> Driver Details </h1>

<form action="driverDetailsServlet" method="post">

    <div class="table-container1">
    	<h3>Driver Details</h3>
        <table border="1">
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Birthday</th>
                <th>Password</th>
           
            </tr>
            <%
               Connection conn = DBConnection.getConnection();
            	String UserEmail = (String) session.getAttribute("UserEmail");
    	       String sql = "SELECT first_name, last_name,mobile, email, birthday, password FROM user WHERE email ='"+UserEmail+"' ";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                	String fn =rs.getString("first_name");
         	       String ln =rs.getString("last_name");
         	       String m =rs.getString("mobile");
         	       String em =rs.getString("email");
         	       String b =rs.getString("birthday");
         	       String p =rs.getString("password");
            %>
            <tr>
                <td><%= fn %></td>
                <td><%= ln %></td>
                <td><%= m %></td>
                <td><%= em %></td>
                 <td><%= b %></td>
                <td><%= p %></td>
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
        <div id="delete">
        <form action="driverDelete.jsp" method="post">
        <input type="submit" value="Delete Account">
        </form>
        </div>
         <br><br>
        
        <%@ include file="Footer.jsp"  %>
</body>
</html>