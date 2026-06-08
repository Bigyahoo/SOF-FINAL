package dao;

import entity.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import util.JpaUtil;

public class UserDAO {

    public User login(String email, String password) {

        EntityManager em =
                JpaUtil.getFactory().createEntityManager();

        String jpql =
            "SELECT u FROM User u " +
            "WHERE u.email = :email " +
            "AND u.passwordHash = :password";

        TypedQuery<User> query =
                em.createQuery(jpql, User.class);

        query.setParameter("email", email);
        query.setParameter("password", password);

        User user = null;

        try {
            user = query.getSingleResult();
        } catch(Exception e) {
        }

        em.close();

        return user;
    }
}