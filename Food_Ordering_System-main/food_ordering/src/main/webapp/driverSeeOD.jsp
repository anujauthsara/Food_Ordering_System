<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Order Details</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
  <link rel="stylesheet" type="text/css" href="styles/driverHome.css"> 
</head>
<body>
  
    <%@ include file="DriverHeader.jsp"  %>
    
    <div class="container">
    <form action="driverODServlet" method="post">
      <h2>See Order Details</h2>
      <input type="submit" name="sub" value="Details">
    </form>
    </div>
    <%@ include file="Footer.jsp"  %>
  
</body>
</html>
