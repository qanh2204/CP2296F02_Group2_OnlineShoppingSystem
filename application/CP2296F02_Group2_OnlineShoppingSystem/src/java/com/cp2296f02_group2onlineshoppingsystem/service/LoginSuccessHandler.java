/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.service;

import com.cp2296f02_group2onlineshoppingsystem.entities.UserDetail;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
/**
 *
 * @author minhthuy
 */
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        UserDetail userDetail = (UserDetail) authentication.getPrincipal();
        Object[] arrRole = (Object[]) userDetail.getAuthorities().toArray();
        String redirectURL = request.getContextPath();
        System.out.println("Admin role: " + arrRole[0]);
        if (arrRole[0].toString()=="Admin") {            
            redirectURL += "/admin/homepageadmin";
            System.out.println("url:" + redirectURL + "  role  " + arrRole[0]);
        } else {
            redirectURL += "/";
        }
        response.sendRedirect(redirectURL);
    }
}
