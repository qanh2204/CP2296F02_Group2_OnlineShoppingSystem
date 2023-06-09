/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * @author minhthuy
 */
public class UserDetail implements UserDetails {

    Users user;

    public UserDetail() {
    }

    

	public UserDetail(Users user) {
        super();
        this.user = user;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();
        
        int userType = user.getUserType();
        System.out.println("USER TYPE: " + userType);
        System.out.println("USER NAME: " + user.getUsername());
        if (userType == 1) {
            authorities.add(new SimpleGrantedAuthority("Admin"));
            System.out.println("Equal 1");
            System.out.println(authorities.get(0));
        } else {
            authorities.add(new SimpleGrantedAuthority("User"));
        }
        return authorities;
    }

//	@Override
//	public String getPassword() {
//		// TODO Auto-generated method stub
//		return user.getPassword();
//	}
    @Override
    public String getPassword() {
        // TODO Auto-generated method stub
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        // TODO Auto-generated method stub
        return user.getUsername();
    }

    @Override
    public boolean isAccountNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // TODO Auto-generated method stub
        return true;
    }

    @Override
    public boolean isEnabled() {
        // TODO Auto-generated method stub
        return true;
    }

}
