<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="styles/SignUp.css">
<title>Sign Up</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
</head>
<body>

	<%@ include file="MainHeader.jsp" %>

		<form class="modal-content animate" action="SignUpServlet" method="post">

			<div class="signcontainer">

				<center><h1>Sign Up</h1></center>

				<p>Please fill in this form to create an account.</p>

				<hr>

				<label for="fn"><b>First Name</b></label> <br>
				<input type="text" placeholder="Enter First Name" id="fname" name="fname" required><br>

				<label for="ln"><b>Last Name</b></label><br>
				<input type="text" placeholder="Enter First Name" id="lname" name="lname" required><br>

				<label for="mobile"><b>Mobile Number</b></label><br>
				<input type="text" placeholder="Enter Mobile Number" id="mobile" name="mobile" required><br>

				<label for="email"><b>Email</b></label><br>
				<input type="email" placeholder="Enter Email" id="email" name="email" required><br><br>

				<label for="date"><b>Date of Birth</b></label><br>
				<input type="date" placeholder="Enter Date of Birth" id="birth" name="birth" required> <br><br>
				
				<button id="toggleButton">Are you Driver?</button> <br><br><br>
			    <div id="textAreaContainer">
			       	<label for="vNum"><b>Vehicle Number</b></label><br>
					<input type="text" placeholder="Enter Vehicle Number" id="insertTextArea" name="vNum"><br>
					
					<label for="vType"><b>Vehicle Type</b></label><br>
					<input type="text" placeholder="Enter Vehicle Type" id="insertTextArea" name="vType"><br>

			    </div>
			    <script src="Script/SignUp.js"></script>

				<br><label for="psw"><b>Password</b></label> <br>
				<input type="password" placeholder="Enter Password" id="password" name="password" required><br>
				<span id="toggleBtn"></span>
		        
				<label for="psw-repeat"><b>Repeat Password</b></label><br>
				<input type="password" placeholder="Enter Repeat Password" id="rpass" name="rpass" required><br>

				<button type="button" class="cancelbtn">Cancel</button>
				<button type="submit" class="signupbtn" value="Login">Sign Up</button>
			</div>

		</form>
		
		<%@ include file="Footer.jsp" %>
		
</body>
</html>