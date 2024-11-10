package service;

import model.HibernateUtil;
import model.User;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class userServise {

    public void saveUser(User user) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(user);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
        }
    }

    public User authenticate(String username, String password) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("FROM User WHERE username = :username AND password = :password", User.class)
                    .setParameter("username", username)
                    .setParameter("password", password) // In real applications, hash the password
                    .uniqueResult();
        }
    }
}
