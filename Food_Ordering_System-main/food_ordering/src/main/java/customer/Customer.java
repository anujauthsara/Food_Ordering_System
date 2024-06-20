package customer;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Customer extends AbstractUser {
    public Customer() {
        super("Customer");
    }

    public void customUserAction(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            out.println("<script type=\"text/javascript\">");
            out.println("var confirmation = confirm('Welcome, Customer! Click OK to continue.');");
            out.println("if (confirmation) {");
            out.println("  window.location.href = 'CustomerMain.jsp';");
            out.println("}");
            out.println("</script>");
            
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
