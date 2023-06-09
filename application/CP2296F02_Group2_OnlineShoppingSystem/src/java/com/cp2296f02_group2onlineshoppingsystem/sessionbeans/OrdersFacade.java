/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Orders;
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
public class OrdersFacade extends AbstractFacade<Orders> implements OrdersFacadeLocal {

    @PersistenceContext(unitName = "CP2296F02_Group2_OnlineShoppingSystemPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrdersFacade() {
        super(Orders.class);
    }

    @Override
    public List<Object[]> statisticTotalMoneyByMonth(String startDate, String endDate) {
        Query query = em.createNativeQuery("select month(o.order_date),sum(o.total_price) from Orders o \n"
                + "where o.order_date between ?1 AND ?2 and o.status=2  group by  month(o.order_date)");
        query.setParameter(1, startDate);
        query.setParameter(2, endDate);
        return query.getResultList();
    }

    @Override
    public List<Object[]> statisticTotalMoneyByYear(String startDate, String endDate) {
        Query query = em.createNativeQuery("select   year(o.order_date),sum(o.total_price) from Orders o\n"
                + "where status=2 and o.order_date between ?1 AND ?2  group by  year(o.order_date)");
        query.setParameter(1, startDate);
        query.setParameter(2, endDate);
        return query.getResultList();
    }

    @Override
    public List<Object[]> statisticTotalMoneyByMonth() {
        Query query = em.createNativeQuery("select  month(o.order_date),sum(o.total_price) from Orders o  \n"
                + "where status=2 and year(o.order_date) =year(GETDATE())  group by  month(o.order_date)");
        return query.getResultList();
    }

    @Override
    public List<Object[]> statisticTotalMoneyByYear() {
        Query query = em.createNativeQuery("select   year(o.order_date),sum(o.total_price) from Orders o\n"
                + "where status=2 group by  year(o.order_date)");
        return query.getResultList();
    }

    @Override
    public Long statisticMoneyEarned() {
        Query query = em.createQuery("select sum(o.totalPrice) from Orders o where o.status=2");
        return (Long) query.getSingleResult();
    }

    @Override
    public Long statisticTotalOrder() {
        Query query = em.createQuery("select count(o.orderId) from Orders o where o.status=2");
        return (Long) query.getSingleResult();
    }

    @Override
    public Long statisticTotalCancelledOrder() {
        Query query = em.createQuery("select count(o.orderId) from Orders o where o.status=3");
        return (Long) query.getSingleResult();
    }

    @Override
    public List<Object[]> generateReport() {
        Query query = em.createNativeQuery("select   month(o.order_date) ,count(o.order_id) ,sum(o.total_price)  from Orders o\n"
                + "where status=2 and year(o.order_date) =year(GETDATE())  group by  month(o.order_date) ");
        return query.getResultList();
    }

    @Override
    public List<Orders> getAllOrderByUserId(int userId) {
        Query query = em.createQuery("select o from Orders o where o.userId=:userId and o.status=0 or o.status=1");
        query.setParameter("userId", userId);
        return query.getResultList();
    }

    @Override
    public List<Orders> getAllOrderHistoryByUserId(int userId) {
        Query query = em.createQuery("select o from Orders o where o.userId=:userId and (o.status=2 or o.status=3) order by o.orderId desc");
        query.setParameter("userId", userId);
        return query.getResultList();
    }

    @Override
    public List<Orders> getAllOrderFinished() {
        Query query = em.createQuery("select o from Orders o where  o.status=2 order by o.orderId desc");
        return query.getResultList();
    }

    @Override
    public List<Orders> getAllOrderUnfinished() {
        Query query = em.createQuery("select o from Orders o where  o.status=0 or o.status=1 order by o.orderId desc");
        return query.getResultList();
    }

    @Override
    public List<Orders> getAllOrderCancelled() {
        Query query = em.createQuery("select o from Orders o where  o.status=3 order by o.orderId desc");
        return query.getResultList();
    }

    @Override
    public List<Object[]> getOrderListByStarDateEndDate(String starDate, String endDate, int uId) {
        Query query = em.createNativeQuery("select o.order_id, o.order_date,o.delivery_date,o.address_receive,o.status,o.phone,o.total_price from Orders o where o.user_id="+uId+" and (o.status =2 and o.order_date between ?1 and ?2 or o.status =3 and o.order_date between ?3 and ?4)");
        query.setParameter(1, starDate);
        query.setParameter(2, endDate);
        query.setParameter(3, starDate);
        query.setParameter(4, endDate);
        try {
            return query.getResultList();
        } catch (Exception e) {
            return null;
        }
    }
}
