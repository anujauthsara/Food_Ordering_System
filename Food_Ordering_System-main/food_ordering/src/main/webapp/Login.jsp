<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Account</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
	<link rel="stylesheet" type="text/css" href="styles/SignUp.css">
	<link rel="stylesheet" type="text/css" href="styles/Login.css">
</head>
<body>

	<%@ include file="MainHeader.jsp" %>

	<form class="modal-content animate" action="LogServlet" method="POST">

		    <div class="imgcontainer">
	
		      <img src="images/human.png" alt="Avatar" class="avatar">
		    </div>

		    <div class="logincontainer">

		      <label for="uname"><b>Email</b></label>
		      <input type="email" placeholder="Enter Email" id="uname" name="uname" required>

		      <label for="psw"><b>Password</b></label>
		      <input type="password" placeholder="Enter Password" id="psw" name="psw" required>

		      <span id="toggleBtn"></span>
		        
		      <button type="submit" name="login_n" value="login_v"> Log in </button>

		      <label>
		        <input type="checkbox" checked="checked" name="remember"> Remember me
		      </label>
		    </div>

		    <div class="logincontainer" style="background-color:#f1f1f1">
		      <button type="button"class="cancelbtn">Cancel</button>
		      <span class="psw">Forgot <a href="ForgotPW.jsp">password?</a></span><br>
		      
		      <center><span>If you Admin Login <a href="admin_login.php"> here..?</a></span></center>
		    </div>
		</form>



<%@ include file="Footer.jsp" %>


</body>
</html>


</body>
</html>