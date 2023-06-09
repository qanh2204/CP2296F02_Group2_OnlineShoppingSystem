/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Review;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author ASUS
 */
@Local
public interface ReviewFacadeLocal {

    void create(Review review);

    void edit(Review review);

    void remove(Review review);

    Review find(Object id);

    List<Review> findAll();

    List<Review> findRange(int[] range);

    public List<Review> getReviewByProductId(int productId);

    public Double getTotalStarByProductId(int pId);
        public Integer getCountTotalRate(int pId);
    int count();

}
