/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.controllers;

import com.cp2296f02_group2onlineshoppingsystem.entities.Category;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.CategoryFacadeLocal;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author minhthuy
 */
@Controller
public class CategoryController {

    CategoryFacadeLocal categoryFacade = lookupCategoryFacadeLocal();

    //show category page
    @RequestMapping(value = "/admin/categoryPage", method = RequestMethod.GET)
    public String showCategoryPage(Model model) {
        List<Category> categories = categoryFacade.findAll();
        System.out.println(categories.size());
        model.addAttribute("categoriesList", categories);
        return "admin/categorylist";
    }

    //show add new category page 
    @RequestMapping(value = "/admin/addcategory", method = RequestMethod.GET)
    public String showAddCategoryPage() {
        return "admin/addcategory";
    }

    //create modelattribute for add form
    @ModelAttribute("AddCategoryForm")
    public Category showFormAddCategory() {
        return new Category();
    }

    //process add new category
    @RequestMapping(value = "/admin/processaddcategory", method = RequestMethod.POST)
    public String processAddCategory(@ModelAttribute("AddCategoryForm") Category category, Model model) {
        if (categoryFacade.getAllCategoryByCategoryName(category.getCategoryName()) == null) {
            categoryFacade.create(category);
            return "redirect:/admin/categoryPage";
        } else {
            model.addAttribute("err", "Category name was used.");
            return "admin/addcategory";
        }

    }

    //show update category page 
    @RequestMapping(value = "/admin/updatecategory", method = RequestMethod.GET)
    public String showUpdateCategoryPage(@RequestParam("cid") int cid, Model model) {
        String checkStatus = "";
        Category category = categoryFacade.find(cid);
        model.addAttribute("cId", cid);
        model.addAttribute("categoryN", category.getCategoryName());
        if (category.getStatus() == 0) {
            checkStatus = "Active";
        } else {
            checkStatus = "Inactive";
        }
        model.addAttribute("categoryStatus", checkStatus);
        return "admin/updatecategory";
    }

    //create modelattribute for update form
    @ModelAttribute("UpdateCategoryForm")
    public Category showFormEditCategory() {
        return new Category();
    }
    //process update category

    @RequestMapping(value = "/admin/processupdatecategory", method = RequestMethod.POST)
    public String processUpdateCategory(@ModelAttribute("UpdateCategoryForm") Category category, @RequestParam("cid") int cid,Model model) {
        if (categoryFacade.getAllCategoryByCategoryName2(category.getCategoryName(), cid) == null) {
            Category c = categoryFacade.find(cid);
            c.setCategoryName(category.getCategoryName());
            c.setStatus(category.getStatus());
            categoryFacade.edit(c);
            return "redirect:/admin/categoryPage";
        }
        else{
            model.addAttribute("err", "Category Name was used!");
            return "admin/updatecategory";
        }

    }
    //delete category(change status =1)

    @RequestMapping(value = "/admin/deleteProcess", method = RequestMethod.GET)
    public String deleteCategory(@RequestParam("cid") int cid, Model model) {
        Category category = categoryFacade.find(cid);
        category.setStatus(1);
        categoryFacade.edit(category);
        return "redirect:/admin/categoryPage";
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
