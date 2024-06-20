package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.http.HttpServletResponse;

public class Forgot_P {
    public static void Forgot_pass(String Femail, String Fmobile, String Fpassword, HttpServletResponse response) {
        try {
            Connection updateCon = DatabaseConn.getConnection();
            String upsql = "UPDATE user SET password=? WHERE email=? AND mobile=?";
            PreparedStatement uppst = updateCon.prepareStatement(upsql);
            uppst.setString(1, Fpassword);
            uppst.setString(2, Femail);
            uppst.setString(3, Fmobile);
            int rowsUpdated = uppst.executeUpdate();
            
            if (rowsUpdated > 0) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("var confirmation = confirm('Password reset successful! Click OK to continue and login');");
                out.println("if (confirmation) {");
                out.println("  window.location.href = 'Login.jsp';");
                out.println("}");
                out.println("</script>");
            }else {
            	response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("var confirmation = confirm('Password reset Unsuccessful! Your information is wrong..!.');");
                out.println("if (confirmation) {");
                out.println("  window.location.href = 'ForgotPW.jsp';");
                out.println("}");
                out.println("</script>");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
			e.printStackTrace();
		}
    }
}
