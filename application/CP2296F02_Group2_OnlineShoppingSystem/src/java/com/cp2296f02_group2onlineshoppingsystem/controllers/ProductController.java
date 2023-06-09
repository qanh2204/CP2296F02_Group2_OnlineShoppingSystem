/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.controllers;

import com.cp2296f02_group2onlineshoppingsystem.entities.Cart;
import com.cp2296f02_group2onlineshoppingsystem.entities.Category;
import com.cp2296f02_group2onlineshoppingsystem.entities.OrderProduct;
import com.cp2296f02_group2onlineshoppingsystem.entities.Pagination;
import com.cp2296f02_group2onlineshoppingsystem.entities.Product;
import com.cp2296f02_group2onlineshoppingsystem.entities.Review;
import com.cp2296f02_group2onlineshoppingsystem.entities.Users;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.CategoryFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.OrderProductFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ProductFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ReviewFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.UsersFacadeLocal;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.json.Json;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.server.PathParam;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author minhthuy
 */
@Controller
public class ProductController {

    OrderProductFacadeLocal orderProductFacade1 = lookupOrderProductFacadeLocal1();

    OrderProductFacadeLocal orderProductFacade = lookupOrderProductFacadeLocal();

    ReviewFacadeLocal reviewFacade = lookupReviewFacadeLocal();

    UsersFacadeLocal usersFacade = lookupUsersFacadeLocal();

    CategoryFacadeLocal categoryFacade = lookupCategoryFacadeLocal();

    ProductFacadeLocal productFacade = lookupProductFacadeLocal();

    @RequestMapping(value = "/user/searchproduct", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody
    List<String> doAutoComplete(@RequestParam("keyword") final String keyword) {
        List<String> strings = simulateSearchResult(keyword);
        System.out.println(strings.toString());
        return strings;
    }

    private List<String> simulateSearchResult(String productName) {
        List<String> data = productFacade.getAllProductName();
        return data.stream().filter(s -> s.toLowerCase().contains(productName.toLowerCase())).collect(Collectors.toList());
    }

    @RequestMapping(value = "/user/searchproductpage", method = RequestMethod.GET)
    public String showSearchProductPage(@RequestParam("keyword") String keyword, @RequestParam("page") double pageId, Model model) {
        List<Product> productList = productFacade.getAllProductByKeyword(keyword);
        System.out.println("productFacade.getAProductByKeyword(keyword).size():" + productFacade.getAProductByKeyword(keyword).size());

        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("keyword", keyword);

        double totalPage = 9;
        if (pageId > 1) {
            pageId = (pageId - 1) * totalPage + 1;
        }
        List<Product> productSearchList = productFacade.showPaginationSearchProduct(pageId, totalPage, keyword);
        if (productFacade.getAProductByKeyword(keyword).size() == 0) {
            model.addAttribute("pList", productSearchList);
        } else {
            model.addAttribute("productList", productList);
        }
        System.out.println("size of productSearchList: " + productSearchList.size());

        double paginate = Math.ceil(productFacade.showAllProductCid(keyword).size() / totalPage);
        List<Pagination> indexList = new ArrayList();
        for (int i = 1; i <= paginate; i++) {
            System.out.println("index of indexList: " + i);
            Pagination page = new Pagination(i);
            indexList.add(page);
        }
        model.addAttribute("sizeOfList", indexList);
        model.addAttribute("count", indexList.size());
        return "user/search-product";
    }

    @RequestMapping(value = "user/showshoppingcart", method = RequestMethod.GET)
    public String showCart(Model model) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        List<Category> categories = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoriesList", categories);
        return "user/cart";
    }

    @RequestMapping(value = "user/addCartPage", method = RequestMethod.GET)
    public @ResponseBody
    HashMap<Integer, Cart> addCart(HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session, @PathParam("productId") int productId, Model model, Principal principal) throws IOException, URISyntaxException {

        if (principal != null) {

            HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
            if (cartItems == null) {
                cartItems = new HashMap<>();
            }
            Product product = productFacade.find(productId);
            if (product != null) {
                if (cartItems.containsKey(productId)) {
                    Cart item = cartItems.get(productId);
                    item.setProduct(product);
                    item.setQuantity(item.getQuantity() + 1);
                    cartItems.put(productId, item);
                } else {
                    Cart item = new Cart();
                    item.setProduct(product);
                    item.setQuantity(1);
                    cartItems.put(productId, item);
                }
            }
            session.setAttribute("myCartItems", cartItems);
            session.setAttribute("myCartTotal", totalPrice(cartItems));
            session.setAttribute("myCartNum", cartItems.size());
            Integer categoryId = productFacade.findCategoryIdByProductId(productId);
            suggestProduct(request, response, categoryId);
            return cartItems;
        } else {
            return null;
        }

    }

    @RequestMapping(value = "user/updatecart", method = RequestMethod.GET)
    public @ResponseBody
    HashMap<Integer, Cart> updateCart(HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session, @PathParam("productId") int productId, Model model, Principal principal) throws IOException, URISyntaxException {

        if (principal != null) {

            HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
            if (cartItems == null) {
                cartItems = new HashMap<>();
            }
            Product product = productFacade.find(productId);
            if (product != null) {
                if (cartItems.containsKey(productId)) {
                    Cart item = cartItems.get(productId);
                    item.setProduct(product);
                    item.setQuantity(item.getQuantity() - 1);
                    cartItems.put(productId, item);
                } else {
                    Cart item = new Cart();
                    item.setProduct(product);
                    item.setQuantity(1);
                    cartItems.put(productId, item);
                }
            }
            session.setAttribute("myCartItems", cartItems);
            session.setAttribute("myCartTotal", totalPrice(cartItems));
            session.setAttribute("myCartNum", cartItems.size());
            Integer categoryId = productFacade.findCategoryIdByProductId(productId);
            suggestProduct(request, response, categoryId);
            return cartItems;
        } else {
            return null;
        }

    }

    @RequestMapping(value = "user/removeitems", method = RequestMethod.GET)
    public String removeProcess(ModelMap mm, HttpSession session, @PathParam("pid") int pid, Model model) {
        List<Category> categories = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoriesList", categories);

        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        if (cartItems.containsKey(pid)) {
            cartItems.remove(pid);
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        System.out.println(cartItems.size());
        return "redirect:/user/showshoppingcart";
    }

    public int totalPrice(HashMap<Integer, Cart> cartItems) {
        Integer count = 0;
        for (Map.Entry<Integer, Cart> list : cartItems.entrySet()) {
            count += list.getValue().getProduct().getProductPrice() * list.getValue().getQuantity();
        }
        return count;
    }

    @RequestMapping(value = "user/getcartinsession", method = RequestMethod.GET)
    public @ResponseBody
    HashMap<Integer, Cart> getCartInSession(HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session, Model model, Principal principal) throws IOException, URISyntaxException {

        if (principal != null) {

            HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
            cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");

            return cartItems;
        } else {
            return null;
        }

    }
//    @RequestMapping(value = "user/addCartPage", method = RequestMethod.GET)
//    public String addCart(HttpServletRequest request, HttpServletResponse response, ModelMap mm, HttpSession session, @PathParam("productId") int productId, Model model) {
//        Integer categoryId = productFacade.findCategoryIdByProductId(productId);
//        suggestProduct(request, response, categoryId);
//        return "";
//
//    }

    @RequestMapping(value = "user/allproduct", method = RequestMethod.GET)
    public String showAllProduct(@RequestParam("page") double pageId, Model model) {
        double totalPage = 9;
        if (pageId > 1) {
            pageId = (pageId - 1) * totalPage + 1;
        }
        List<Product> productList = productFacade.getAllProductPagination(pageId, totalPage);
        model.addAttribute("productList", productList);

        List<Product> pList = productFacade.getAllProduct();
        System.out.println("pList: " + pList.size());
        List<Pagination> indexList = new ArrayList();
        double paginate = Math.ceil(pList.size() / totalPage);
        for (int i = 1; i <= paginate; i++) {
            System.out.println("index of indexList: " + i);
            Pagination page = new Pagination(i);
            indexList.add(page);
        }
        model.addAttribute("sizeOfList", indexList);
        model.addAttribute("count", indexList.size());
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        return "user/allproduct";
    }

    @RequestMapping(value = "user/showproductpage", method = RequestMethod.GET)
    public String showProductPage(Model model, @RequestParam("cId") int cId, @RequestParam("page") double pageId) {
        double totalPage = 9;
        if (pageId > 1) {
            pageId = (pageId - 1) * totalPage + 1;
        }
        List<Product> productList = productFacade.showPagination(pageId, totalPage, cId);
        model.addAttribute("productList", productList);

        List<Product> pList = productFacade.getAllProductByCategoryId(cId);
        System.out.println("pList: " + pList.size());

        double paginate = Math.ceil(pList.size() / totalPage);
        List<Pagination> indexList = new ArrayList();
        for (int i = 1; i <= paginate; i++) {
            System.out.println("index of indexList: " + i);
            Pagination page = new Pagination(i);
            indexList.add(page);
        }
        model.addAttribute("sizeOfList", indexList);
        model.addAttribute("count", indexList.size());
        model.addAttribute("categoryId", cId);

        System.out.println("size of indexList: " + Math.ceil(pList.size() / totalPage));

        List<Product> recentProductList = productFacade.getRecentProduct(cId);
        model.addAttribute("recentProductList", recentProductList);
        System.out.println(recentProductList.size());
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        return "user/product";
    }

    @RequestMapping(value = "user/showproductdetail", method = RequestMethod.GET)
    public String showProductDetailPage(Model model, @RequestParam("pId") int pid) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);

        List<Product> pList = productFacade.getRelatedProduct(productFacade.getCidByPid(pid));
        model.addAttribute("pList", pList);

        List<Users> userList = usersFacade.findAll();
        model.addAttribute("userList", userList);

        Double totalStar = reviewFacade.getTotalStarByProductId(pid);
        model.addAttribute("totalStar", totalStar);

        Integer countTotalRate = reviewFacade.getCountTotalRate(pid);
        model.addAttribute("countTotalRate", countTotalRate);
        System.out.println("start: " + totalStar);
        List<Review> reviewList = reviewFacade.getReviewByProductId(pid);
        model.addAttribute("reviewList", reviewList);
        Product product = productFacade.find(pid);
        model.addAttribute("productName", product.getProductName());
        model.addAttribute("productPrice", product.getProductPrice());
        model.addAttribute("description", product.getDescription());
        model.addAttribute("status", product.getStatus());
        model.addAttribute("imageProduct", product.getImageProduct());
        model.addAttribute("pId", pid);

        return "user/product-detail";
    }

    public void suggestProduct(HttpServletRequest request, HttpServletResponse response, int categoryId) {
        Cookie[] cookie = request.getCookies();

        String txt = "";
        for (Cookie c : cookie) {
            if (c.getName().equals("product")) {
                txt += c.getValue() + categoryId;
            } else if (!c.getName().equals("product")) {
                txt = categoryId + "";
            }
        }
        Cookie cookie1 = new Cookie("product", txt);
        cookie1.setMaxAge(365 * 24 * 60 * 60);
        cookie1.setSecure(true);
        cookie1.setHttpOnly(true);
        cookie1.setPath("/");
        response.addCookie(cookie1);
    }

    @RequestMapping(value = "admin/productPage", method = RequestMethod.GET)
    public String showProductPage(Model model) {
        List<Product> products = productFacade.findAll();
        System.out.println(products.size());
        model.addAttribute("productsList", products);
        return "admin/productlist";
    }

    @RequestMapping(value = "admin/addproduct", method = RequestMethod.GET)
    public String showAddProductPage(Model model) {
        List<Category> categorys = categoryFacade.findAll();
        model.addAttribute("categoryList", categorys);
        showProductPage(model);
        return "admin/addproduct";
    }

    @ModelAttribute("AddProductForm")
    public Product showProductForm() {
        return new Product();
    }

    @RequestMapping(value = "admin/proccessaddproduct", method = RequestMethod.POST)
    public String saveNewProduct(@ModelAttribute("AddProductForm") Product product, Model model, @RequestParam("imageProduct") MultipartFile imageProduct, HttpServletRequest request) throws IOException, ParseException {
        List<Category> categorys = categoryFacade.findAll();
        model.addAttribute("categoryList", categorys);
//        if (error.hasErrors()) {
//            return "admin/add_product";
//        }
//        if (nProduct.equals("")) {
//            model.addAttribute("errName", "Vui lòng nhập tên sản phẩm");
//            return "admin/add_product";
//        }
        if (productFacade.checkProductName(product.getProductName()) != null) {
            model.addAttribute("errProductName", "Product Name exist in database");
            return "admin/addproduct";
        } else {
            if (imageProduct.getOriginalFilename().equals("")) {
                model.addAttribute("errImage", "Please choose image of product");
                return "admin/add_product";
            } else {
                System.out.println("CategoryId: " + product.getCategoryId());

                String applicationPath = request.getServletContext().getRealPath("/");
                String uploadFilePath = applicationPath + File.separator + "resources/user/images/products";
                File fileSaveDir = new File(uploadFilePath);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdirs();
                }
                String fileName = "";
                try {
                    fileName = imageProduct.getOriginalFilename();
                    System.out.print("File name: " + fileName + " </br>");
                    InputStream inputStream = null;
                    OutputStream outputStream = null;
                    try {
                        File outputFilePath = new File(uploadFilePath + File.separator + fileName);
                        inputStream = imageProduct.getInputStream();
                        outputStream = new FileOutputStream(outputFilePath);
                        int read = 0;
                        final byte[] bytes = new byte[1024];
                        while ((read = inputStream.read(bytes)) != -1) {
                            outputStream.write(bytes, 0, read);

                        }
                        System.out.print("File uploaded successfully!");
                        System.out.println(uploadFilePath);
                    } catch (Exception e) {
                        e.toString();
                        fileName = "";
                        System.out.print(e.getMessage());
                    } finally {
                        if (outputStream != null) {
                            outputStream.close();
                        }
                    }
                } catch (Exception e) {
                    fileName = "";
                    System.out.print(e.getMessage());
                }
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                Date date = new Date();
                String updateDate = formatter.format(date);
                Product p = new Product();
                p.setProductName(product.getProductName());

                p.setImageProduct(imageProduct.getOriginalFilename());
                p.setCategoryId(product.getCategoryId());
                p.setUpdateDate(updateDate);
                p.setProductPrice(product.getProductPrice());
                p.setDescription(product.getDescription());
                p.setQuantity(product.getQuantity());
                p.setStatus(0);
                productFacade.create(p);
                showProductPage(model);
                return "admin/productlist";

            }

        }
        // return "admin/add_product";

    }

    @RequestMapping(value = "admin/updateproduct", method = RequestMethod.GET)
    public String showUpdateProductPage(@RequestParam("pid") int pid, Model model) throws ParseException {
        //SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Product product = productFacade.find(pid);
        //String uDate = formatter.format(product.getDateUpdate());
        // Date d = formatter.parse(formatter.format(product.getDateUpdate()));
        //  System.out.println(formatter.format(product.getDateUpdate()));
        model.addAttribute("pId", pid);
        model.addAttribute("dateUpdate", product.getUpdateDate());
        model.addAttribute("im", product.getImageProduct());
        model.addAttribute("productName", product.getProductName());
        model.addAttribute("price", product.getProductPrice());
        model.addAttribute("description", product.getDescription());
        model.addAttribute("quantity", product.getQuantity());
        // System.out.println(category.getStatus());
        List<Category> categorys = categoryFacade.findAll();
        model.addAttribute("categoryList", categorys);
        return "admin/updateproduct";
    }

    @ModelAttribute("UpdateProductForm")
    public Product showForm() {
        return new Product();
    }

    @ModelAttribute("ReviewForm")
    public Review showReviewForm() {
        return new Review();
    }

    @RequestMapping(value = "user/processreviewproduct", method = RequestMethod.POST)
    public String reviewProduct(@ModelAttribute("ReviewForm") Review review, @RequestParam("pId") int pId, @RequestParam("orderId") int oId, Principal principal) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();
        Review r = new Review();
        r.setContentReview(review.getContentReview());
        r.setStar((review.getStar() == 0.0) ? 5 : review.getStar());
        r.setUserId(usersFacade.findIdByUsername(principal.getName()));
        r.setReviewDate(sdf.parse(sdf.format(date)));
        r.setProductId(pId);
        reviewFacade.create(r);
        orderProductFacade.updateOrderProduct(pId, oId);
        Product product = productFacade.find(pId);
        product.setTotalStar(reviewFacade.getTotalStarByProductId(pId));
        productFacade.edit(product);
        return "redirect:/users/vieworderdetail?orderId=" + oId;
    }

    @RequestMapping(value = "user/reviewpage", method = RequestMethod.GET)
    public String showReview(Model model, @RequestParam("pId") int pId, @RequestParam("orderId") int orderId) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        Product product = productFacade.find(pId);
//        model.addAttribute("productName", product.getProductName());
//        model.addAttribute("productPrice", product.getProductPrice());
//        model.addAttribute("description", product.getDescription());
//        model.addAttribute("status", product.getStatus());
        model.addAttribute("imageProduct", product.getImageProduct());
        model.addAttribute("pId", pId);
        model.addAttribute("orderId", orderId);
        return "user/reviewproduct";
    }

    @RequestMapping(value = "admin/processupdateproduct", method = RequestMethod.POST)
    public String updateProduct(@ModelAttribute("UpdateProductForm") Product product, Model model, @RequestParam("imageOld") String imageOld, @RequestPart("imageP") MultipartFile imageP, @RequestParam("pid") int pid, HttpServletRequest request) {

        System.out.println(imageP.getOriginalFilename());
        if (productFacade.getProductByProductName(product.getProductName(), pid) == null) {
            System.out.println("CategoryId: " + product.getCategoryId());

            String applicationPath = request.getServletContext().getRealPath("/");
            String uploadFilePath = applicationPath + File.separator + "resources/user/images/products";
            File fileSaveDir = new File(uploadFilePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }
            String fileName = "";
            try {
                fileName = imageP.getOriginalFilename();
                System.out.print("File name: " + fileName + " </br>");
                InputStream inputStream = null;
                OutputStream outputStream = null;
                try {
                    File outputFilePath = new File(uploadFilePath + File.separator + fileName);
                    inputStream = imageP.getInputStream();
                    outputStream = new FileOutputStream(outputFilePath);
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = inputStream.read(bytes)) != -1) {
                        outputStream.write(bytes, 0, read);

                    }
                    System.out.print("File uploaded successfully!");
                } catch (Exception e) {
                    e.toString();
                    fileName = "";
                    System.out.print(e.getMessage());
                } finally {
                    if (outputStream != null) {
                        outputStream.close();
                    }
                }
            } catch (Exception e) {
                fileName = "";
                System.out.print(e.getMessage());
            }
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            Date date = new Date();
            String updateDate = formatter.format(date);
            System.out.println(updateDate);
            Product p = productFacade.find(pid);
            p.setProductName(product.getProductName());

            p.setImageProduct(imageP.getOriginalFilename().equals("") ? imageOld : imageP.getOriginalFilename());
            p.setCategoryId(product.getCategoryId());
            p.setUpdateDate(product.getUpdateDate());
            p.setProductPrice(product.getProductPrice());
            p.setDescription(product.getDescription());
            p.setQuantity(product.getQuantity());
            p.setStatus(product.getStatus());
            productFacade.edit(p);
            showProductPage(model);
            return "admin/productlist";
        } else {
            model.addAttribute("err", "Product name was used!");
            return "admin/updateproduct";
        }

    }

    @RequestMapping(value = "admin/deleteproduct", method = RequestMethod.GET)
    public String deleteProcess(@RequestParam("pId") int pId, Model model) {
        Product products = productFacade.find(pId);
        products.setStatus(1);
        productFacade.edit(products);
        return "redirect:/admin/productPage";
    }

    @RequestMapping(value = "admin/addimageproduct", method = RequestMethod.GET)
    public String showAddMultipleImage(@RequestParam("pid") int pId) {
        return "admin/addmultipleimage";
    }

    @RequestMapping(value = "admin/addimage", method = RequestMethod.POST, consumes = "multipart/form-data")
    public @ResponseBody
    void addImage(@RequestParam("imageProduct") MultipartFile file) throws FileUploadException, IOException {
//        byte[] bytes = getBytesFromFile(request);
//        System.out.println(bytes);
//        Image image = new Image();
//        image.setByteData(bytes);
//        imageService.addImage(image);
        System.out.println(file.getOriginalFilename());
    }

    private byte[] getBytesFromFile(HttpServletRequest request) throws FileUploadException, IOException {
        ServletFileUpload upload = new ServletFileUpload();
        byte[] bytes = null;
        FileItemIterator iter;
        // try {
        iter = upload.getItemIterator(request);
        while (iter.hasNext()) {
            FileItemStream item = iter.next();
            InputStream stream = item.openStream();
            bytes = IOUtils.toByteArray(stream);
        }
        return bytes;
//        } catch (IOException | FileUploadException e) {
//            throw new Ex
//            //throw new ImageException("The problem while storing file. Try again.", e);
//        }
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

    private UsersFacadeLocal lookupUsersFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (UsersFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/UsersFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.UsersFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
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

    private OrderProductFacadeLocal lookupOrderProductFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (OrderProductFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/OrderProductFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.OrderProductFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private OrderProductFacadeLocal lookupOrderProductFacadeLocal1() {
        try {
            Context c = new InitialContext();
            return (OrderProductFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/OrderProductFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.OrderProductFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

}
