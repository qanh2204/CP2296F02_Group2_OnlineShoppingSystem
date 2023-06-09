/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.OrderProduct;
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
public class OrderProductFacade extends AbstractFacade<OrderProduct> implements OrderProductFacadeLocal {

    @PersistenceContext(unitName = "CP2296F02_Group2_OnlineShoppingSystemPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderProductFacade() {
        super(OrderProduct.class);
    }

    @Override
    public List<Object[]> getOrderProductByOrderId(int orderId) {
        Query query = em.createNativeQuery("select  p.image_product,p.product_name,od.product_price,od.quantity,od.product_id,o.user_id,o.status,o.order_id,od.status_review from Order_Product od inner join Orders o \n"
                + "on od.order_id = o.order_id\n"
                + "inner join Product p on p.product_id = od.product_id where o.order_id ="+orderId+"");
        return query.getResultList();
    }
    
    @Override
    public void updateOrderProduct(int pId, int oId) {
        Query query = em.createNativeQuery("update Order_Product set status_review =1 where product_id="+pId+" and order_id="+oId+"");
        query.executeUpdate();
    }
    @Override
    public List<OrderProduct> getOrderProductByOid(int oId) {
        Query query = em.createQuery("select o from OrderProduct o where o.orderId=:orderId");
        query.setParameter("orderId", oId);
        try {
            return query.getResultList();
        } catch (Exception e) {
            return null;
        }
    }
    
}
