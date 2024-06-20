package customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String mobile = request.getParameter("mobile");
        String birth = request.getParameter("birthday");
        String password = request.getParameter("password");
        
        HttpSession session = request.getSession();
        String updateCus = (String) session.getAttribute("updateCus");
        
        UpdateCustomer.UpdateUser(fname,lname,mobile,updateCus,birth,password, response);
	}

}
