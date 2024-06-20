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
<title>Customer Details</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
<link rel="stylesheet" type="text/css" href="styles/AdminSelect.css">

<style type="text/css">
.table-cus table {
    width: 1300px; /* Set the table width to 100% of its container */
    height: 300px;
    font-size: 18px; /* Set the table height to 400 pixels */
}
</style>
</head>
<body>

	 <%@ include file="AdminHeader.jsp" %>
	 <form action="CusDetailsServlet" method="post">
	 <div class="table-cus">
      
		<h3>Customer Details</h3>
        <table border="1">
            <tr>
            	<th>Customer Email</th>
                <th>Customer First Name</th>
                <th>Customer Last Name</th>
                <th>Customer Mobile Number</th>
                <th>Customer Birthday</th>
                <th>Customer password</th>
                <th>Update Details</th>
                <th>Delete Customer</th>
                
            </tr>
            <%
                Connection conD = DatabaseConn.getConnection();
                String sqlD = "SELECT first_name, last_name, mobile, email, birthday, customer_type, password FROM user";
                PreparedStatement pstD = conD.prepareStatement(sqlD);
                ResultSet rstD = pstD.executeQuery();

                while (rstD.next()) {
                    String first_name = rstD.getString("first_name");
                    String last_name = rstD.getString("last_name");
                    String mobile = rstD.getString("mobile");
                    String email = rstD.getString("email");
                    String birthday = rstD.getString("birthday");
                    String password = rstD.getString("password");
            %>
            <tr>
             	<td><%= email %></td>
                <td><%= first_name %></td>
                <td><%= last_name %></td>
                <td><%= mobile %></td>
                <td><%= birthday %></td>
                <td><%= password %></td>
                <td><button type="submit" value="<%= email %>" name="updateCus" style="background-color: green; color: white;"> Update </button></td>
                <td><button type="submit" value="<%= email %>" name="deleteCus" style="background-color: red; color: white;"> Delete </button></td>
            </tr>
            <%
                }
                rstD.close();
                pstD.close();
                conD.close();
            %>
        </table>
     </div>
     </form>

</body>
</html>