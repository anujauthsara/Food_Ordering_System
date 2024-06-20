<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Driver HOME</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
  <link rel="stylesheet" type="text/css" href="styles/driverHome.css"> 
</head>
<body>
 
    <%@ include file="DriverHeader.jsp"  %>
    
    
    <h1>Welcome to CASH Food Delivery</h1><br><br>
    
        <section id="about">
        
        <p>
            CASH Food Delivery is your ultimate destination for convenient and delicious meals delivered right to your doorstep. We understand the value of your time, and that's why we're here to make your life easier. Whether it's a busy workday, a cozy family dinner, or a weekend treat, we've got you covered with a diverse range of culinary delights.
        </p>
    </section>
    
    <br><br>
    <center>
    <div id="welpara">
    <p id="site-description">
        Welcome to the CASH online food delivery web site! At CASH, we're passionate about bringing you the best dining experience. With a wide selection of restaurants and cuisines, you can explore a world of flavors from the comfort of your home. Whether you're craving your favorite comfort food or looking to try something new, our platform is your gateway to a world of culinary delights. Order now and enjoy a delicious meal delivered to your door in no time.
    </p>
    </div>
    </center>
 <br><br>
    
    <div class="container">
    <form action="driverDetailsServlet" method="post">
      <h2>See Details</h2>
      <input type="submit" name="submit" value="Details">
    </form>
    </div><br><br>
    
 
    
    <section id="about">
        <h2>About Us</h2>
        <p>
            CASH Food Delivery is a leading food delivery service committed to providing delicious meals to our customers.
            Our dedicated team of drivers ensures that your food arrives hot and fresh, right at your doorstep.
        </p>
    </section><br><br>
    <%@ include file="Footer.jsp"  %>
  
</body>
</html>
