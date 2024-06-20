package customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public abstract class AbstractUser implements User {
    protected String userType;

    public AbstractUser(String userType) {
        this.userType = userType;
    }

    @Override
    public void doUserStuff() {
        System.out.println("Welcome, " + userType + "!");
    }

    public abstract void customUserAction(HttpServletRequest request, HttpServletResponse response);
}
