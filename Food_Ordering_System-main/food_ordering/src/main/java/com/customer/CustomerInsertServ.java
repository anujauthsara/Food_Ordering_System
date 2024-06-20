package com.customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@SuppressWarnings("unused")
public class CustomerInsertServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Retrieve form data from the request
        String House_No = request.getParameter("houseNo");
        String Lane = request.getParameter("lane");
        String Sub_city = request.getParameter("subCity");
        String City = request.getParameter("city");
        String District = request.getParameter("district");
        
        HttpSession session = request.getSession();
        String UserEmail = (String) session.getAttribute("UserEmail");
        
        boolean istrue;
        
       istrue =  CustomerDBUtil.insertcustomer(UserEmail, House_No, Lane, Sub_city, City, District);
       
       if(istrue==true) {
    	   
    	   RequestDispatcher dis =request.getRequestDispatcher("success.jsp");
    	   dis.forward(request,response);
       }
       else {
    	   
    	   RequestDispatcher dis2 =request.getRequestDispatcher("unsuccess.jsp");
    	   dis2.forward(request,response);
       }
        
        
	}

}
