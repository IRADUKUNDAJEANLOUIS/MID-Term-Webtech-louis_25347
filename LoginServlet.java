package controller;

import dao.LoginDao;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private LoginDao loginDao = new LoginDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate user credentials
        User users = loginDao.validateUser(userName, password);

        if (users != null) {
            // User is valid, create a session
            HttpSession session = request.getSession();
            session.setAttribute("users", users);
            response.sendRedirect("dashboard.html");
        } else {
            // Invalid credentials, redirect back to login with error
            response.sendRedirect("login.html?error=true");
        }
    }
}


