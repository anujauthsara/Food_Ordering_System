 <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter Your Address</title>
	<link rel="icon" type="image/png" href="images/icon_img.png">
    <link rel="stylesheet" type="text/css" href="styles/customer.css">
</head>
<body>

	<%@ include file="CustomerHeader.jsp"  %>

     <div class="container">
        <h1>Enter Your Address</h1>
        <form id="address-form" action="insert" method="post">
            <div class="form-group">
                <label for="houseNo">House No:</label>
                <input type="text" name="houseNo" placeholder="Enter your house number" required>
            </div>
            
            <div class="form-group">
                <label for="lane">Lane/Street:</label>
                <input type="text" name="lane" placeholder="Enter your lane or street" required>
            </div>
            
            <div class="form-group">
                <label for="subCity">Sub-City:</label>
                <input type="text" name="subCity" placeholder="Enter your sub-city" required>
            </div>
            
            <div class="form-group">
                <label for="city">City/Town:</label>
                <input type="text" name="city" placeholder="Enter your city or town" required>
            </div>
            
            <div class="form-group">
                <label for="district">District:</label>
                <input type="text" name="district" placeholder="Enter your district" required>
            </div>
            
            <button type="submit" value="create customer">Submit</button>
        </form>
    </div>
    

 <%@ include file="Footer.jsp"  %>

</body>
</html>
