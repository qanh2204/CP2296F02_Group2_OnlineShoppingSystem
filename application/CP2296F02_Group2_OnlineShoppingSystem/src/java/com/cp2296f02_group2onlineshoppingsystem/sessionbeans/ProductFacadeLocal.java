/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.sessionbeans;

import com.cp2296f02_group2onlineshoppingsystem.entities.Product;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author minhthuy
 */
@Local
public interface ProductFacadeLocal {

    void create(Product product);

    void edit(Product product);

    void remove(Product product);

    Product find(Object id);

    List<Product> findAll();

    List<Product> findRange(int[] range);

    public List<Product> getAllProduct();

    public List<Product> getAllProductByKeyword(String keyword);

    public List<String> getAllProductName();

    public Integer findCategoryIdByProductId(int productId);

    public List<Product> getAllProductByCategory(int categoryId);

    public List<Product> getAllProductByCategoryId(int categoryId);

    public List<Product> getNewProduct();

    public List<Product> getAProductByKeyword(String keyword);

    public List<Product> getRecentProduct(int cId);

    public List<Product> showPagination(double pageid, double total, int cid);

    public List<Product> showPaginationSearchProduct(double pageid, double total, String keyword);

    public List<Product> showAllProductCid(String keyword);

    public List<Product> getRelatedProduct(int cId);

    public Integer getCidByPid(int pId);

    public Product checkProductName(String productName);

    public List<Product> getAllProductPagination(double pageid, double total);

    public Product getProductByProductName(String productName, int pId);

    int count();

}
