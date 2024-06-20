package customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import customer.Forgot_P;

@WebServlet("/ForgotPWServlet")
public class ForgotPWServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Femail = request.getParameter("Femail");
        String Fmobile = request.getParameter("Fmobile");
        String Fpassword = request.getParameter("Fpassword");
        String Frpass = request.getParameter("Frpass");
        
        if(Fpassword.equals(Frpass)) {
        	Forgot_P.Forgot_pass(Femail,Fmobile,Fpassword,response);
        }
        else {
        	try {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("var confirmation = confirm('Password and repeat password do not match..!, Please re-Forgot password.');");
                out.println("if (confirmation) {");
                out.println("  window.location.href = 'ForgotPW.jsp';");
                out.println("}");
                out.println("</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        
	}

}
