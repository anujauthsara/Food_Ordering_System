package customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import customer.SignUp;

public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");
        String vNum = request.getParameter("vNum");
        String vType = request.getParameter("vType");
        String password = request.getParameter("password");
        String rpass = request.getParameter("rpass");
        
        HttpSession session = request.getSession();
        session.setAttribute("updateCus", email);
        
        if(password.equals(rpass)) {
        	SignUp.insertUser(fname,lname,mobile,email,birth,password,vNum,vType,response);
        }else {
        	try {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("var confirmation = confirm('Password and repeat password do not match..!, Please re-SignUp');");
                out.println("if (confirmation) {");
                out.println("  window.location.href = 'SignUp.jsp';");
                out.println("}");
                out.println("</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        
        
       //response.sendRedirect("confirmation.jsp");
	}

}
