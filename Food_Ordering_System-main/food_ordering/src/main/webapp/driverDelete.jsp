<!DOCTYPE html>
<html>
<head>
    <title>Delete Driver Account</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
    <style>
        /* Apply styles to the "deleteacc" div */
        #deleteacc {
            text-align: center;
            margin: 20px;
        }

        /* Apply styles to the form labels */
        #deleteacc label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
        }

        /* Apply styles to the text and password inputs */
        #deleteacc input[type="text"],
        #deleteacc input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Apply styles to the submit button */
        #deleteacc input[type="submit"] {
            background-color: #FF5733;
            color: #fff;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        #deleteacc input[type="submit"]:hover {
            background-color: #FF6B6B;
        }
    </style>
</head>
<body>
<%@ include file="DriverHeader.jsp"  %>
    <h1>Delete Driver Account</h1>
    <div id="deleteacc">
    <form action="driverDeleteServlet" method="post">
        <label>Email:</label>
        <input type="text" name="email"><br>

        <label>Password:</label>
        <input type="password" name="password"><br>

        <input type="submit" value="Delete Account">
        
    </form>
    </div>
     <%@ include file="Footer.jsp"  %>
     
</body>
</html>

