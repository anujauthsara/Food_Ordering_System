<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Your Address</title>
    <link rel="stylesheet" type="text/css" href="styles/customeru.css">
</head>
<body>

	<%@ include file="CustomerHeader.jsp"  %>
	
    <div class="container">
        <h1>Update Your Address</h1>
        <form id="address-form" action="update" method="post">
            <div class="form-group" >
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
            
            <button type="submit">Update Address</button>
        </form>
    </div>
    

	 <%@ include file="Footer.jsp"  %>
	 
</body>
</html>
