package dao;

import model.User;
import org.hibernate.Session;
import org.mindrot.jbcrypt.BCrypt;
import util.HibernateUtil;

public class LoginDao {

    public User validateUser(String userName, String password) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
           
            User user = (User) session.createQuery("FROM User u WHERE u.userName = :userName")
                    .setParameter("userName", userName)
                    .uniqueResult();

            // Validate password with the stored hash
            if (user != null && BCrypt.checkpw(password, user.getPassword())) {
                return user;
            }
            return null;
        }
    }
}

