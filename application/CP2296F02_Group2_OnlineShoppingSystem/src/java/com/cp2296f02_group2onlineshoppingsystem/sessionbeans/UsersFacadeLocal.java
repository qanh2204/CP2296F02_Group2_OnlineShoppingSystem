/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Users;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author minhthuy
 */
@Local
public interface UsersFacadeLocal {

    void create(Users users);

    void edit(Users users);

    void remove(Users users);

    Users find(Object id);

    List<Users> findAll();

    List<Users> findRange(int[] range);

    public List<Users> getAllUserEnable();

    public Users getUserByUsername(String username);

    public Users getUserByEmail(String email);

    public Users getUserByToken(String token, String email);

    public void updateCodeByEmail(String token, String email);

    public void updatePassword(String password, String email, String token);

    public Long statisticUserAmount();

    public Integer findIdByUsername(String username);

    public Users checkDuplicateEmail(String email, String username);

    public Users findUsernameById(int userId);

    int count();

}
