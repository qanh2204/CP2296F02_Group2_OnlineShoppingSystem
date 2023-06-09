/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.controllers;

import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ProductFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ReviewFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.UsersFacadeLocal;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author ASUS
 */
@Controller
public class ReviewController {

    UsersFacadeLocal usersFacade = lookupUsersFacadeLocal();

    ProductFacadeLocal productFacade = lookupProductFacadeLocal();

    ReviewFacadeLocal reviewFacade = lookupReviewFacadeLocal();

    @RequestMapping(value = "admin/reviewlist", method = RequestMethod.GET)
    public String showReviewList(Model model) {
        model.addAttribute("reviewList", reviewFacade.findAll());
        model.addAttribute("productList", productFacade.findAll());
        model.addAttribute("userList", usersFacade.findAll());
        return "admin/reviewlist";
    }

    private ReviewFacadeLocal lookupReviewFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (ReviewFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/ReviewFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ReviewFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ProductFacadeLocal lookupProductFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (ProductFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/ProductFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ProductFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private UsersFacadeLocal lookupUsersFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (UsersFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/UsersFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.UsersFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
