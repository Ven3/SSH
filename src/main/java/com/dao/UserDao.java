package com.dao;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.entity.User;

@Repository
public class UserDao extends GenericDao<User> {

    //	登录
    public User find(String username, String password) {
        String jpql = "FROM User u WHERE u.username=:username AND u.password=:password";
        Query query = getCurrentSession().createQuery(jpql);
        query.setParameter("username", username);
        query.setParameter("password", password);
        User user = null;
        try {
            user = (User) query.getSingleResult();
        } catch (NoResultException e) {
            // TODO: handle exception
        }
        return user;
    }

    public boolean getUserName(String username) {
        String hql="From User u where u.username=:username";
        Query query=getCurrentSession().createQuery(hql);
        query.setParameter("username",username);
        if(query.getResultList().size()!=0){
            return true;
        }else {
            return false;
        }

    }
}
