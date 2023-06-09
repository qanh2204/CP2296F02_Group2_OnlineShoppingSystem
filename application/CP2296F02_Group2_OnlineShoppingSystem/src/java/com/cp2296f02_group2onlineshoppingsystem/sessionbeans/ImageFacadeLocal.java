/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Image;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author minhthuy
 */
@Local
public interface ImageFacadeLocal {

    void create(Image image);

    void edit(Image image);

    void remove(Image image);

    Image find(Object id);

    List<Image> findAll();

    List<Image> findRange(int[] range);

    int count();
    
}
