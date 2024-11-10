package view;

import model.Membership;
import model.User;
import model.MembershipType;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/registerMembership")
public class MembershipServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = -4197171947748382072L;
	private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("auca_library_db");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String membershipTypeStr = request.getParameter("membershipType");
        
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            User user = em.find(User.class, UUID.fromString(userId));
            if (user == null) {
                response.sendRedirect("error.jsp?message=User not found");
                return;
            }
              
            MembershipType membershipType = MembershipType.valueOf(membershipTypeStr.toUpperCase());
            Membership membership = new Membership();
            membership.setMembershipType(membershipType);
            
            em.persist(membership);
            em.getTransaction().commit();

            response.sendRedirect("dashboard.jsp?message=Membership registered successfully");
        } finally {
            em.close();
        }
    }
}
