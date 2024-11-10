package dao;

import model.User;
import model.Location;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;
import util.HibernateUtil;

public class CreateAccountDao {

    public boolean registerUser(User newUser, Location location) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            // Hash the password
            String hashedPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
            newUser.setPassword(hashedPassword);

            // Save the Location hierarchy if needed
            session.save(location);

            // Save the user with the selected role and hashed password
            newUser.setLocation(location);
            session.save(newUser);

            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
        return false;
    }
}



