/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Category;
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
public class CategoryFacade extends AbstractFacade<Category> implements CategoryFacadeLocal {

    @PersistenceContext(unitName = "CP2296F02_Group2_OnlineShoppingSystemPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategoryFacade() {
        super(Category.class);
    }

    @Override
    public List<Category> getAllCategoryEnable() {
        Query query = em.createQuery("select c from Category c where c.status=0");
        return query.getResultList();
    }

    @Override
    public Category getAllCategoryByCategoryName(String categoryName) {
        Query query = em.createQuery("select c from Category c where c.categoryName=:categoryName");
        query.setParameter("categoryName", categoryName);
        try {
            return (Category) query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public Category getAllCategoryByCategoryName2(String categoryName, int categoryId) {
        Query query = em.createQuery("select c from Category c where c.categoryName=:categoryName and c.categoryId<>:categoryId");
        query.setParameter("categoryName", categoryName);
        query.setParameter("categoryId", categoryId);

        try {
            return (Category) query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

}
