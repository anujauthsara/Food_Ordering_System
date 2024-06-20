package customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;

public class Admin extends AbstractUser {
    public Admin() {
        super("Admin");
    }

    public void customUserAction(HttpServletRequest request, HttpServletResponse response) {

        try {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            out.println("<script type=\"text/javascript\">");
            out.println("var confirmation = confirm('Welcome, Admin! Click OK to continue.');");
            out.println("if (confirmation) {");
            out.println("  window.location.href = 'AdminMain.jsp';");
            out.println("}");
            out.println("</script>");
            
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
