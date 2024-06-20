package customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LogServlet")
public class LogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("uname");
        String psw = request.getParameter("psw");

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rst = null;

        try {
            con = DatabaseConn.getConnection();
            String sql = "SELECT email, password, customer_type FROM user WHERE email=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, user);
            rst = pst.executeQuery();

            boolean passwordCorrect = false;
            String u_type = "";

            while (rst.next()) {
                String pw = rst.getString("password");
                String type = rst.getString("customer_type");

                if (pw.equals(psw)) {
                    passwordCorrect = true;
                    u_type = type;
                    break;
                }
            }

            if (passwordCorrect) {
            	
            	 HttpSession session = request.getSession();
                 session.setAttribute("UserEmail", user);
            	
                AbstractUser userObject = createUser(u_type);

                userObject.doUserStuff();

                userObject.customUserAction(request, response);
            } else {
            	
            	try {
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();

                    out.println("<script type=\"text/javascript\">");
                    out.println("var confirmation = confirm('Email or password does not match..! Please re-login');");
                    out.println("if (confirmation) {");
                    out.println("  window.location.href = 'Login.jsp';");
                    out.println("}");
                    out.println("</script>");
                    
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception or log it as needed
        } finally {
            // Close resources in a finally block
            if (rst != null) {
                try {
                    rst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pst != null) {
                try {
                    pst.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private AbstractUser createUser(String userType) {
        switch (userType) {
            case "Customer":
                return new Customer();
            case "Driver":
                return new Driver();
            case "Admin":
                return new Admin();
            default:
                throw new IllegalArgumentException("Invalid user type.");
        }
    }
}
