package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.http.HttpServletResponse;

public class SignUp {

    public static boolean insertUser(String fname, String lname, String mobile, String email, String birth, String password, String vNum, String vType, HttpServletResponse response) {
        boolean success = false;

        try (Connection connection = DatabaseConn.getConnection()) {
            String sql = "INSERT INTO user (first_name, last_name, mobile, email, birthday, password, customer_type) VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, fname);
            preparedStatement.setString(2, lname);
            preparedStatement.setString(3, mobile);
            preparedStatement.setString(4, email);
            preparedStatement.setString(5, birth);
            preparedStatement.setString(6, password);

            if (vNum == null || vNum.isEmpty()) {
                preparedStatement.setString(7, "Customer");
            } else {
                preparedStatement.setString(7, "Driver");

                String dsql = "INSERT INTO driver (email, Vehicle_num, Vehicle_type) VALUES (?, ?, ?)";
                PreparedStatement preparedStatementD = connection.prepareStatement(dsql);

                preparedStatementD.setString(1, email);
                preparedStatementD.setString(2, vNum);
                preparedStatementD.setString(3, vType);

                int rowsInsertedD = preparedStatementD.executeUpdate();

                if (rowsInsertedD > 0) {
                    success = true;
                }
            }

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                success = true;
            }else {
            	success = false;
            }

            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (success) {
            try {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("var confirmation = confirm('Data inserted successfully. Login now');");
                out.println("if (confirmation) {");
                out.println("  window.location.href = 'Login.jsp';");
                out.println("}");
                out.println("</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else{
            try {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                out.println("<script type=\"text/javascript\">");
                out.println("var confirmation = confirm('Data inserted Unsuccessfully. Do you want to re-SignUp?');");
                out.println("if (confirmation) {");
                out.println("  window.location.href = 'SignUp.jsp';");
                out.println("}");
                out.println("</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return success;
    }
}
