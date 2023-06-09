/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.OrderProduct;
import com.cp2296f02_group2onlineshoppingsystem.entities.Product;
import com.cp2296f02_group2onlineshoppingsystem.entities.Review;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author minhthuy
 */
@Local
public interface OrderProductFacadeLocal {

    void create(OrderProduct orderProduct);

    void edit(OrderProduct orderProduct);

    void remove(OrderProduct orderProduct);

    OrderProduct find(Object id);

    List<OrderProduct> findAll();

    List<OrderProduct> findRange(int[] range);

    public List<Object[]> getOrderProductByOrderId(int orderId);

    public void updateOrderProduct(int pId, int oId);

    public List<OrderProduct> getOrderProductByOid(int oId);

    int count();

}
