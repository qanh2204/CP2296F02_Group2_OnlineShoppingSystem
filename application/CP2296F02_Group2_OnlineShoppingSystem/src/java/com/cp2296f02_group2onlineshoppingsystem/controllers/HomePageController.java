/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.controllers;

import com.cp2296f02_group2onlineshoppingsystem.entities.Category;
import com.cp2296f02_group2onlineshoppingsystem.entities.Orders;
import com.cp2296f02_group2onlineshoppingsystem.entities.Product;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.CategoryFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.OrdersFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ProductFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.UsersFacadeLocal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author minhthuy
 */
@Controller
public class HomePageController {

    CategoryFacadeLocal categoryFacade = lookupCategoryFacadeLocal();

    ProductFacadeLocal productFacade = lookupProductFacadeLocal();

    UsersFacadeLocal usersFacade = lookupUsersFacadeLocal();

    OrdersFacadeLocal ordersFacade = lookupOrdersFacadeLocal();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showHomePage(HttpServletRequest request, Model model) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);

        List<Product> newProductList = productFacade.getNewProduct();
        model.addAttribute("newProductList", newProductList);

        List<Product> productList = productFacade.getAllProduct();
        model.addAttribute("productList", productList);
        Cookie[] cookie = request.getCookies();
        if (cookie != null) {
        for (Cookie c : cookie) {
            if (c.getName().equals("product")) {
                model.addAttribute("suggestProductList", getCookie(request));
            }
        }
        }
//        System.out.println(getCookie(request).size());
        return "user/homepage";
    }

    @RequestMapping(value = "user/forbidden", method = RequestMethod.GET)
    public String showForbiddenPage() {
        return "user/forbidden";
    }

    @RequestMapping(value = "user/getallproduct", method = RequestMethod.GET)
    public @ResponseBody
    List<Product> getAllProduct() {
        List<Product> productList = productFacade.getAllProduct();
        return productList;
    }

    @RequestMapping(value = "user/contact", method = RequestMethod.GET)
    public String showContactPage(Model model) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);

        return "user/contact";
    }

    @RequestMapping(value = "user/policy", method = RequestMethod.GET)
    public String showPolicyPage(Model model) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);

        return "user/policy";
    }

    @RequestMapping(value = "user/introduce", method = RequestMethod.GET)
    public String showIntroducePage(Model model) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);

        return "user/introduce";
    }

    @RequestMapping(value = "user/getproductlist", method = RequestMethod.GET)
    public @ResponseBody
    List<Product> getProductByCategoryId(@RequestParam("categoryId") int categoryId) {
        List<Product> productList = productFacade.getAllProductByCategoryId(categoryId);
        return productList;
    }

    public List<Product> getCookie(HttpServletRequest request) {
        List<Product> suggesPList = new ArrayList<Product>();
        Cookie[] cookie = request.getCookies();
        Set<Integer> categoryIdList = new HashSet();
        List<Integer> cList = new ArrayList<Integer>();
        String str = "";
        for (Cookie c : cookie) {
            if (c.getName().equals("product")) {
                str = c.getValue().toString();
            }
        }
        for (int i = 0; i < str.length(); i++) {
            categoryIdList.add(Integer.parseInt(String.valueOf(str.charAt(i))));
        }
        for (int i = 0; i < categoryIdList.size(); i++) {
            System.out.println("categoryIdList:" + categoryIdList);
        }
        cList.addAll(categoryIdList);
        for (int i = 0; i < cList.size(); i++) {
            System.out.println("cList:" + cList.get(i));
        }
        for (int i = 0; i < cList.size(); i++) {
            System.out.println("cList:" + cList.get(i));
            suggesPList = productFacade.getAllProductByCategoryId(cList.get(i));
            //System.out.println(productFacade.getAllProductByCategory(cList.get(i)));
        }
        System.out.println("suggestList: " + suggesPList.size());
        return suggesPList;

    }

    @RequestMapping(value = "admin/homepageadmin", method = RequestMethod.GET)
    public String showHomePageAdmin(Model model
    ) {
        Long userAmount = usersFacade.statisticUserAmount();
        model.addAttribute("amount", userAmount);
        Long totalMoneyEarned = ordersFacade.statisticMoneyEarned();
        model.addAttribute("money", totalMoneyEarned);
        Long countOrders = ordersFacade.statisticTotalOrder();
        model.addAttribute("countOrder", countOrders);
        Long countCancelledOrders = ordersFacade.statisticTotalCancelledOrder();
        model.addAttribute("cancelledOrder", countCancelledOrders);

        return "admin/homepage";
    }

    private OrdersFacadeLocal lookupOrdersFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (OrdersFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/OrdersFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.OrdersFacadeLocal");
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

    private ProductFacadeLocal lookupProductFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (ProductFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/ProductFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ProductFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private CategoryFacadeLocal lookupCategoryFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (CategoryFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/CategoryFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.CategoryFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
