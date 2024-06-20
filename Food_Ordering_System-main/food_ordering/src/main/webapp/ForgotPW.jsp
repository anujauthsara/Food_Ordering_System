<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
	<link rel="stylesheet" type="text/css" href="styles/passwordFG.css">
	<link rel="stylesheet" type="text/css" href="styles/SignUp.css">
	<script defer src="Scipt/signUp.js"></script>
</head>
<body>

	<%@ include file="MainHeader.jsp" %>

	<form class="modal-content animate" method="POST" action="ForgotPWServlet" style="width: 600px;">
			<section id="section1">
				

					<div class="signcontainer">

						<center><h1>Forgotten Password</h1></center>
						<center><img class="img1" src="images/forgot-password.jpg"></center>
						<hr>

						
						<label for="email"><b>Please enter your Email</b></label><br>
						<input type="email" placeholder="Enter Email" id="email" name="Femail" required><br><br>

						
						<div class="clearfix">
							<button type="button" class="signupbtn" onclick="window.location.href='#section2';">Next</button>
						</div>

					</div>


			</section>

			<br><br><br>

			<section id="section2">

					<div class="signcontainer">

						<center><h1>Verify Your Account</h1></center>
						<center><img class="img1" src="images/authentication.jpg"></center>
						<hr>

						
						<label for="mobile"><b>Enter Mobile Number</b></label>
						<input type="text" placeholder="Enter Mobile Number" id="mobile" name="Fmobile" required>

						
						
						<div class="clearfix">
							<button type="button" onclick="window.location.href='#section1';" class="cancelbtn">Back</button>
							<button type="button" class="signupbtn" onclick="window.location.href='#section3';">Next</button>
						</div>

					</div>


			</section>

			<br><br><br>


			<section id="section3">

					<div class="signcontainer">

						<center><h1>Reset Password</h1></center>
						<center><img class="img2" src="images/reset.jpg"></center>
						<hr>

						
						<label for="psw"><b>Password</b></label> 
						<input type="password" placeholder="Enter Password" id="password" name="Fpassword" required onkeyup="checkPassword(this.value)">
						<span id="toggleBtn"></span><br>
				        

						<label for="psw-repeat"><b>Repeat Password</b></label>
						<input type="password" placeholder="Enter Repeat Password" id="rpass" name="Frpass" required>

										
						
						<div class="clearfix">
							<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
							<button type="submit" name="pass_creat" class="signupbtn" value="login">Continue</button>
						</div>

					</div>
				

			</section>
			</form>
	<%@ include file="Footer.jsp" %>
</body>
</html>