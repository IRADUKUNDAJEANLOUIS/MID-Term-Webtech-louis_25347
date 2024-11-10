package view;


import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.UUID;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Borrower;
import model.Membership;

@SuppressWarnings("serial")
@WebServlet("/returnBook")
public class FineCalculationServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("serial")
	private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("auca_library_db");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String borrowId = request.getParameter("borrowId");

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            Borrower borrow = em.find(Borrower.class, UUID.fromString(borrowId));
            if (borrow == null || borrow.getReturnDate() != null) {
                response.sendRedirect("error.jsp?message=Invalid borrow record");
                return;
            }

            Membership membership = borrow.MembberShip();
            long overdueDays = ChronoUnit.DAYS.between(borrow.getDueDate(), LocalDate.now());
            long fine = overdueDays > 0 ? overdueDays * membership.getDailyCharge() : 0;

            borrow.setFine(fine);
            borrow.setReturnDate(LocalDate.now());

            em.getTransaction().commit();

            response.sendRedirect("dashboard.jsp?message=Book returned with a fine of " + fine + " Rwf");
        } finally {
            em.close();
        }
    }
}
