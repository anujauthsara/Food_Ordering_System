package com.driver;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;



public class driverDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String submit = request.getParameter("submit");

        
        
        try {
          DriverDBUtil.readDetails(submit);
         
         
        }
        catch ( Exception e) {
            e.printStackTrace();
        }
        
      RequestDispatcher dis =request.getRequestDispatcher("driverMain.jsp");
 	   dis.forward(request,response);
        
	}

}
