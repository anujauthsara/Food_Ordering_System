package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteCustomer {

    public static void editcus(String updateCus, String deleteCus, HttpServletRequest request, HttpServletResponse response) {

        if (updateCus == null) {

            try {
                Connection delCon = DatabaseConn.getConnection();
                String delsql = "DELETE FROM user WHERE email=?";
                PreparedStatement delpst = delCon.prepareStatement(delsql);
                delpst.setString(1, deleteCus);

                int rowsDeleted = delpst.executeUpdate();

                try {
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();

                    out.println("<script type=\"text/javascript\">");
                    out.println("var confirmation = confirm('User Deleted Successful');");
                    out.println("if (confirmation) {");
                    out.println("  window.location.href = 'CustomerDetails.jsp';");
                    out.println("}");
                    out.println("</script>");
                } catch (IOException e) {
                    e.printStackTrace();
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else {

            HttpSession session = request.getSession();
            session.setAttribute("updateCus", updateCus);

            try {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("var confirmation = confirm('You want to Update Customer Details..!');");
                out.println("if (confirmation) {");
                out.println("window.location.href = 'UpdateCustomer.jsp';");
                out.println("}");
                out.println("</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.println("This is update" + updateCus);
        }

    }
}
