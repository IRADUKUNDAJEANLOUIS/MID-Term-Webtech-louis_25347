package view;


import model.Borrower;
import model.Book;
import model.Membership;
import model.User;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.UUID;

@WebServlet("/borrowBook")
public class BookBorrowServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("auca_library_db");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String bookId = request.getParameter("bookId");

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            User user = em.find(User.class, UUID.fromString(userId));
            Book book = em.find(Book.class, UUID.fromString(bookId));

            if (user == null || book == null) {
                response.sendRedirect("error.jsp?message=User or book not found");
                return;
            }

            Membership membership = user.getMembership();
            long borrowedBooksCount = em.createQuery("SELECT COUNT(b) FROM Borrow b WHERE b.user.id = :userId", Long.class)
                    .setParameter("userId", user.getUserId())
                    .getSingleResult();

            if (borrowedBooksCount >= membership) {
                response.sendRedirect("error.jsp?message=Borrowing limit reached");
                return;
            }

            Borrower borrow = new Borrower();
            borrow.setUser(user);
            borrow.setBook(book);
            borrow.setBorrowDate(LocalDate.now());
            borrow.setReturnDate(null);
            borrow.setFine(0);

            em.persist(borrow);
            em.getTransaction().commit();

            response.sendRedirect("dashboard.jsp?message=Book borrowed successfully");
        } finally {
            em.close();
        }
    }
}
