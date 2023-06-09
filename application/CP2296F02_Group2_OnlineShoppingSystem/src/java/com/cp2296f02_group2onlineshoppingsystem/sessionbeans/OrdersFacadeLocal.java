/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Orders;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author minhthuy
 */
@Local
public interface OrdersFacadeLocal {

    void create(Orders orders);

    void edit(Orders orders);

    void remove(Orders orders);

    Orders find(Object id);

    List<Orders> findAll();

    List<Orders> findRange(int[] range);

    public List<Object[]> statisticTotalMoneyByMonth(String startDate, String endDate);

    public Long statisticMoneyEarned();

    public Long statisticTotalOrder();

    public Long statisticTotalCancelledOrder();

    public List<Object[]> statisticTotalMoneyByYear(String startDate, String endDate);

    public List<Object[]> generateReport();

    public List<Object[]> statisticTotalMoneyByMonth();

    public List<Object[]> statisticTotalMoneyByYear();

    public List<Orders> getAllOrderByUserId(int userId);

    public List<Orders> getAllOrderHistoryByUserId(int userId);

    public List<Orders> getAllOrderFinished();

    public List<Orders> getAllOrderCancelled();

    public List<Orders> getAllOrderUnfinished();

    public List<Object[]> getOrderListByStarDateEndDate(String starDate, String endDate, int uId);

    int count();

}
