/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Review;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author ASUS
 */
@Stateless
public class ReviewFacade extends AbstractFacade<Review> implements ReviewFacadeLocal {

    @PersistenceContext(unitName = "CP2296F02_Group2_OnlineShoppingSystemPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReviewFacade() {
        super(Review.class);
    }

    @Override
    public List<Review> getReviewByProductId(int productId) {
        Query query = em.createQuery("select r from Review r where r.productId=:pId");
        query.setParameter("pId", productId);
        try {
            return query.getResultList();

        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Double getTotalStarByProductId(int pId) {
        Query query = em.createNativeQuery("select CAST(sum(star) AS float)/CAST(count(star) AS float) from Review where product_id=" + pId + "");
        try {
            return (Double) query.getSingleResult();

        } catch (Exception e) {
            return null;
        }

    }

    @Override
    public Integer getCountTotalRate(int pId) {
        Query query = em.createNativeQuery("select count(*) from Review where product_id = " + pId + "");
        try {
            return (Integer) query.getSingleResult();

        } catch (Exception e) {
            return null;
        }

    }

}
