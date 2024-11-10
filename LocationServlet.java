package view;


import model.Location;
import model.LocationType;
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

@WebServlet("/createLocation")
public class LocationServlet extends HttpServlet {
    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("auca_library_db");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String locationCode = request.getParameter("locationCode");
        String locationName = request.getParameter("locationName");
        String locationType = request.getParameter("locationType");
        String parentId = request.getParameter("parentId");

        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            
            Location location = new Location();
            location.setLocationCode(locationCode);
            location.setLocationName(locationName);
            location.setLocationType(LocationType.valueOf(locationType.toUpperCase()));

            if (parentId != null && !parentId.isEmpty()) {
                location.setParentId(UUID.fromString(parentId));
            }

            em.persist(location);
            em.getTransaction().commit();
            
            response.sendRedirect("locations.jsp?success=Location created successfully");
        } finally {
            em.close();
        }
    }
}
