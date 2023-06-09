/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Category;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author minhthuy
 */
@Local
public interface CategoryFacadeLocal {

    void create(Category category);

    void edit(Category category);

    void remove(Category category);

    Category find(Object id);

    List<Category> findAll();

    List<Category> findRange(int[] range);

    public List<Category> getAllCategoryEnable();

    public Category getAllCategoryByCategoryName(String categoryName);

    public Category getAllCategoryByCategoryName2(String categoryName, int categoryId);

    int count();

}
