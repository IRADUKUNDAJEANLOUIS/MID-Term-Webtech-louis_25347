package view;

import model.User;
import model.Role;
import org.mindrot.jbcrypt.BCrypt;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registerUser")
public class UserAccountServlet extends HttpServlet {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("auca_library_db");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        // Hash the password
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            
            User user = new User();
            user.setUserName(username);
            user.setPassword(hashedPassword);
            user.setRole(Role.valueOf(role.toUpperCase()));

            em.persist(user);
            em.getTransaction().commit();

            response.sendRedirect("login.jsp");
        } finally {
            em.close();
        }
    }
}
