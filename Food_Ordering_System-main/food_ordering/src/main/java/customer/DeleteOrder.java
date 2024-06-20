package customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletResponse;

public class DeleteOrder {

    public static void DeleteO(String DeleteValue, HttpServletResponse response) {
       
        
        try {
        	
        	Connection delCon = DatabaseConn.getConnection();
            String delsql = "DELETE FROM plase_order WHERE Order_Id=?";
            PreparedStatement delpst = delCon.prepareStatement(delsql);
            delpst.setString(1, DeleteValue);
        
            int rowsDeleted = delpst.executeUpdate();
        
            Connection DupdateCon = DatabaseConn.getConnection();
            String Dupsql = "UPDATE order_details SET Confirmation=? WHERE Order_Id=?";
            PreparedStatement Duppst = DupdateCon.prepareStatement(Dupsql);
            Duppst.setString(1, "");
            Duppst.setString(2, DeleteValue);
            int OrowsUpdated = Duppst.executeUpdate();
            
            
            if (rowsDeleted > 0) {
            	try {
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();

                    out.println("<script type=\"text/javascript\">");
                    out.println("var confirmation = confirm('Order Deleted Successful');");
                    out.println("if (confirmation) {");
                    out.println("  window.location.href = 'ConfirmHistory.jsp';");
                    out.println("}");
                    out.println("</script>");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
          
            delpst.close();
            delCon.close();
        } catch (SQLException e) {
            e.printStackTrace();
           
        } 
    }
}
