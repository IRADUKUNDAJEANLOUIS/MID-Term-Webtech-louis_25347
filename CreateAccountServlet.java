package controller;

import dao.CreateAccountDao;
import model.User;
import model.Location;
import model.Role;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

//@WebServlet("/createAccount")
public class CreateAccountServlet extends HttpServlet {
    private CreateAccountDao createAccountDao = new CreateAccountDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        // Read the selected role from the form
        String roleParam = request.getParameter("role");
        Role role = Role.valueOf(roleParam);

        // Set up the Location hierarchy (simplified for example)
        Location location = new Location();
        // populate location fields as needed

        // Create the new user
        User newUser = new User();
        newUser.setUserName(userName);
        newUser.setPassword(password);  // password hashing should be done in DAO
        newUser.setRole(role);           // Set the selected role
        newUser.setLocation(location);   // Assuming a Location field exists in user

        // Register user
        boolean isRegistered = createAccountDao.registerUser(newUser, location);

        if (isRegistered) {
            response.sendRedirect("login.html");
        } else {
            response.sendRedirect("register.html?error=true");
        }
    }
}
