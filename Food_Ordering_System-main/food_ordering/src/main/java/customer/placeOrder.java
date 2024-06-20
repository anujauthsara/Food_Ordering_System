package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.http.HttpServletResponse;

public class placeOrder {
    public static void place(String OrderId, String DriverEmail, HttpServletResponse response) {
        Connection updateCon = null;
        PreparedStatement uppst = null;

        try {
            updateCon = DatabaseConn.getConnection();
            String upsql = "INSERT INTO plase_order(Driver_email, Order_Id) VALUES (?, ?)";

            uppst = updateCon.prepareStatement(upsql);
            uppst.setString(1, DriverEmail);
            uppst.setString(2, OrderId);

            int rowsUpdated = uppst.executeUpdate();
            
            Connection OupdateCon = DatabaseConn.getConnection();
            String Oupsql = "UPDATE order_details SET Confirmation=? WHERE Order_Id=?";
            PreparedStatement Ouppst = OupdateCon.prepareStatement(Oupsql);
            Ouppst.setString(1, "yes");
            Ouppst.setString(2, OrderId);
            int OrowsUpdated = Ouppst.executeUpdate();

            try {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("var confirmation = confirm('Order Confirm Successful');");
                out.println("if (confirmation) {");
                out.println("  window.location.href = 'ConfirmHistory.jsp';");
                out.println("}");
                out.println("</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (uppst != null) {
                    uppst.close();
                }
                if (updateCon != null) {
                    updateCon.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
