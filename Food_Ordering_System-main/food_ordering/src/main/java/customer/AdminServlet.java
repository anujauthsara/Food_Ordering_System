package customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String OrderId = request.getParameter("OrderId");
        String DriverEmail = request.getParameter("DriverEmail");
        
        HttpSession session = request.getSession();
        session.setAttribute("OrderId", OrderId);
        session.setAttribute("DriverEmail", DriverEmail);
        
        response.sendRedirect("DriverConfig.jsp");
	}

}
