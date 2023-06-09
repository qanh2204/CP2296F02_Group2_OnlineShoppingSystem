/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Sales;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author minhthuy
 */
@Local
public interface SalesFacadeLocal {

    void create(Sales sales);

    void edit(Sales sales);

    void remove(Sales sales);

    Sales find(Object id);

    List<Sales> findAll();

    List<Sales> findRange(int[] range);

    int count();
    
}
