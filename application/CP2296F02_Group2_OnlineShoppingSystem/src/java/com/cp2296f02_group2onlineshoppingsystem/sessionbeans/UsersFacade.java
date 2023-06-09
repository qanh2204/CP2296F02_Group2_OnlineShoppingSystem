/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Users;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author minhthuy
 */
@Stateless
public class UsersFacade extends AbstractFacade<Users> implements UsersFacadeLocal {

    @PersistenceContext(unitName = "CP2296F02_Group2_OnlineShoppingSystemPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsersFacade() {
        super(Users.class);
    }

    @Override
    public List<Users> getAllUserEnable() {
        Query query = em.createQuery("select u from Users u where u.status=0");
        return query.getResultList();
    }

    @Override
    public Users getUserByUsername(String username) {
        Query query = em.createQuery("select u from Users u where u.username=:uName");
        query.setParameter("uName", username);
        try {
            return (Users) query.getSingleResult();

        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Users getUserByEmail(String email) {
        Query query = em.createQuery("select u from Users u where u.email=:email ");
        query.setParameter("email", email);
        try {
            return (Users) query.getSingleResult();

        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void updateCodeByEmail(String token, String email) {
        Query query = em.createQuery("update Users u set u.code=:token where u.email=:email ");
        query.setParameter("token", token);
        query.setParameter("email", email);
        query.executeUpdate();
    }

    @Override
    public Users getUserByToken(String token, String email) {
        Query query = em.createQuery("select u from Users u where u.code=:token and u.email=:email ");
        query.setParameter("token", token);
        query.setParameter("email", email);

        return (Users) query.getSingleResult();
    }

    @Override
    public void updatePassword(String password, String email, String token) {
        Query query = em.createQuery("update Users u set u.password=:password where u.email=:email and u.code=:token ");
        query.setParameter("password", password);
        query.setParameter("token", token);
        query.setParameter("email", email);
        query.executeUpdate();
    }

    @Override
    public Long statisticUserAmount() {
        Query query = em.createQuery("select count(u) from Users u where u.status=0 and u.userType=0");
        return (Long) query.getSingleResult();
    }

    @Override
    public Integer findIdByUsername(String username) {
        Query query = em.createQuery("select u.id from Users u where u.username=:uName");
        query.setParameter("uName", username);
        return (Integer) query.getSingleResult();
    }

    @Override
    public Users findUsernameById(int userId) {
        Query query = em.createQuery("select u from Users u where u.id=:id");
        query.setParameter("id", userId);
        return (Users) query.getSingleResult();
    }

    @Override
    public Users checkDuplicateEmail(String email, String username) {
        Query query = em.createQuery("select u from Users u where u.email=:email and u.username<>:username");
        query.setParameter("email", email);
        query.setParameter("username", username);
        try {
            return (Users) query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
}
