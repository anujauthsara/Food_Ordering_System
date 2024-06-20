package customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface User {
    void doUserStuff();
    void customUserAction(HttpServletRequest request, HttpServletResponse response);
}
