/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Product;
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
public class ProductFacade extends AbstractFacade<Product> implements ProductFacadeLocal {

    @PersistenceContext(unitName = "CP2296F02_Group2_OnlineShoppingSystemPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductFacade() {
        super(Product.class);
    }

    @Override
    public List<Product> getAllProduct() {
        Query query = em.createQuery("select p from Product p where p.status =0");
        return query.getResultList();
    }

    @Override
    public List<String> getAllProductName() {
        Query query = em.createQuery("select p.productName from Product p where p.status =0");
        return query.getResultList();
    }

    @Override
    public List<Product> getAllProductByKeyword(String keyword) {
        Query query = em.createQuery("SELECT p FROM Product p where p.productName like :keyword");
        query.setParameter("keyword", "%" + keyword + "%");
        return query.getResultList();
    }

    @Override
    public List<Product> getAProductByKeyword(String keyword) {
        Query query = em.createQuery("select p from Product p where p.productName =:keyword");
        query.setParameter("keyword", keyword);
        return query.getResultList();
    }

    @Override
    public Integer findCategoryIdByProductId(int productId) {
        Query query = em.createQuery("select p.categoryId from Product p where p.productId=:productId");
        query.setParameter("productId", productId);
        try {
            return (Integer) query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Product> getAllProductByCategory(int categoryId) {
        Query query = em.createQuery("select p from Product p where p.categoryId=:categoryId");
        query.setParameter("categoryId", categoryId);
        try {
            return (List<Product>) query.getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Product> getAllProductByCategoryId(int categoryId) {
        Query query = em.createQuery("select p from Product p where p.categoryId=:categoryId and p.status=0");
        query.setParameter("categoryId", categoryId);
        try {
            return (List<Product>) query.getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Product> getNewProduct() {
        Query query = em.createQuery("select p  from Product p where p.status=0 order by p.updateDate desc").setMaxResults(10);
        try {
            return (List<Product>) query.getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Product> getRecentProduct(int cId) {
        Query query = em.createQuery("select p  from Product p where p.status=0 and p.categoryId=:cId order by p.updateDate desc").setMaxResults(5);
        query.setParameter("cId", cId);
        try {
            return (List<Product>) query.getResultList();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Product> showPagination(double pageid, double total, int cid) {
        Query query = em.createQuery("select p from Product p where p.categoryId=:categoryId and p.status=0 ORDER BY p.updateDate desc");
        query.setParameter("categoryId", cid);
        query.setFirstResult((int) pageid);
        query.setMaxResults((int) total);
        return query.getResultList();
    }

    @Override
    public List<Product> showPaginationSearchProduct(double pageid, double total, String keyword) {
        Query query = em.createQuery("SELECT p FROM Product p where p.productName like :keyword and p.status=0");
        query.setParameter("keyword", "%" + keyword + "%");

        query.setFirstResult((int) pageid);
        query.setMaxResults((int) total);
        return query.getResultList();
    }

    @Override
    public List<Product> showAllProductCid(String keyword) {
        Query query = em.createQuery("SELECT p FROM Product p where p.productName like :keyword and p.status=0");
        query.setParameter("keyword", "%" + keyword + "%");

        return query.getResultList();
    }

    @Override
    public List<Product> getRelatedProduct(int cId) {
        Query query = em.createQuery("select p  from Product p where p.status=0 and p.categoryId=:cId order by p.updateDate desc");
        query.setParameter("cId", cId);
        return query.getResultList();
    }
    
      @Override
    public Integer getCidByPid(int pId) {
        Query query = em.createQuery("select p.categoryId  from Product p where p.productId=:productId");
        query.setParameter("productId", pId);
        return (Integer) query.getSingleResult();
    }
    public Product checkProductName(String productName){
        Query query = em.createQuery("select p  from Product p where p.productName=:productName");
        query.setParameter("productName", productName);
        try {
            return (Product) query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
    
    @Override
    public List<Product> getAllProductPagination(double pageid, double total) {
        Query query = em.createQuery("SELECT p FROM Product p where p.status=0");

        query.setFirstResult((int) pageid);
        query.setMaxResults((int) total);
        return query.getResultList();
    }
    
      @Override
    public Product getProductByProductName(String productName, int pId) {
        Query query = em.createQuery("SELECT p FROM Product p where p.productName=:pName and p.productId<>:pId");
        query.setParameter("pName", productName);
        query.setParameter("pId", pId);
          try {
              return (Product) query.getSingleResult();
          } catch (Exception e) {
              return null;
          }
    }
   
}
