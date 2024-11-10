package view;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.HibernateUtil;
import model.User;
import model.Role;
public class MainApp {
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        
        try {
            // Example: Save a new User
            User user = new User();
            user.setUserName("johndoe");
            user.setPassword("securepassword");
       user.setRole(User.Role);
            
            session.save(user);
            transaction.commit();
            
            System.out.println("User saved successfully!");
        } catch (Exception e) {
            transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
            HibernateUtil.shutdown();
        }
    }
}



