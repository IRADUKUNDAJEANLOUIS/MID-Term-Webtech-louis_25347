package util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import model.Book;
import model.Book_status;
import model.Borrower;
import model.GENDER;
import model.Location;
import model.Location_type;
import model.Membership;
import model.User;
import model.Person;
import model.Role;
import model.Room;
import model.membership_type;
import model.shelf;
import model.status;

public class HibernateUtil {
    private static SessionFactory sessionFactory;

    static {
        try {
            // Create a Configuration instance
            Configuration configuration = new Configuration();

            // Set Hibernate properties programmatically
            configuration.setProperty("hibernate.connection.driver_class", "org.postgresql.Driver");
            configuration.setProperty("hibernate.connection.url", "jdbc:postgresql://localhost:5432/auca_library_db");
            configuration.setProperty("hibernate.connection.username", "postgres");
            configuration.setProperty("hibernate.connection.password", "25347");

            // Connection pool settings (using c3p0)
            configuration.setProperty("hibernate.c3p0.min_size", "5");
            configuration.setProperty("hibernate.c3p0.max_size", "20");
            configuration.setProperty("hibernate.c3p0.timeout", "300");
            configuration.setProperty("hibernate.c3p0.max_statements", "50");
            configuration.setProperty("hibernate.c3p0.idle_test_period", "3000");

            // Hibernate settings
            configuration.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
            configuration.setProperty("hibernate.show_sql", "true");
            configuration.setProperty("hibernate.format_sql", "true");
            configuration.setProperty("hibernate.hbm2ddl.auto", "update");

            // Register annotated classes
            configuration.addAnnotatedClass(Location.class);
            configuration.addAnnotatedClass(User.class);
            configuration.addAnnotatedClass(Person.class);
            configuration.addAnnotatedClass(Borrower.class);
            configuration.addAnnotatedClass(Book_status.class);
            configuration.addAnnotatedClass(Book.class);
            configuration.addAnnotatedClass(GENDER.class);
            configuration.addAnnotatedClass(Location_type.class);
            configuration.addAnnotatedClass(membership_type.class);
            configuration.addAnnotatedClass(Membership.class);
            configuration.addAnnotatedClass(Role.class);
            configuration.addAnnotatedClass(Room.class);
            configuration.addAnnotatedClass(shelf.class);
            configuration.addAnnotatedClass(status.class);
            
            // Add other model classes as needed

            // Build the ServiceRegistry and SessionFactory
            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);

        } catch (Throwable ex) {
            // Log the exception and throw an error if initialization fails
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        // Close caches and connection pools
        getSessionFactory().close();
    }
}
