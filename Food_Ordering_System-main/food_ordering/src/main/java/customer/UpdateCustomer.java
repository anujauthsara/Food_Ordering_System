package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.http.HttpServletResponse;

public class UpdateCustomer {

	public static void UpdateUser(String fname, String lname, String mobile, String updateCus, String birth, String password, HttpServletResponse response) {
		
		try {
            Connection updateCon = DatabaseConn.getConnection();
            String upsql = "UPDATE user SET first_name=?, last_name=?, mobile=?, birthday=?, password=? WHERE email=?";
            PreparedStatement uppst = updateCon.prepareStatement(upsql);
            uppst.setString(1, fname);
            uppst.setString(2, lname);
            uppst.setString(3, mobile);
            uppst.setString(4, birth);
            uppst.setString(5, password);
            uppst.setString(6, updateCus);
            
            int rowsUpdated = uppst.executeUpdate();
            
            if (rowsUpdated > 0) {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("var confirmation = confirm('Customer Details Successfully Updated');");
                out.println("if (confirmation) {");
                out.println("  window.location.href = 'CustomerDetails.jsp';");
                out.println("}");
                out.println("</script>");
            }else {
            	response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("var confirmation = confirm('Customer Details Update Unsuccessful..!.');");
                out.println("if (confirmation) {");
                out.println("  window.location.href = 'UpdateCustomer.jsp';");
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
