package com.driver;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@SuppressWarnings("unused")
public class driverODServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String sub = request.getParameter("submit");
		
		 try {
	          DriverDBUtil.seeorder(sub);
	         
	         
	        }
	        catch ( Exception e) {
	            e.printStackTrace();
	        }
	        
		 RequestDispatcher dis =request.getRequestDispatcher("driverOD.jsp");
	 	   dis.forward(request,response);
		
	}

}
