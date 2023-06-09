/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cp2296f02_group2onlineshoppingsystem.controllers;

import com.cp2296f02_group2onlineshoppingsystem.configure.SpringMVCConfigure;
import com.cp2296f02_group2onlineshoppingsystem.entities.Cart;
import com.cp2296f02_group2onlineshoppingsystem.entities.Category;
import com.cp2296f02_group2onlineshoppingsystem.entities.OrderProduct;
import com.cp2296f02_group2onlineshoppingsystem.entities.Orders;
import com.cp2296f02_group2onlineshoppingsystem.entities.Product;
import com.cp2296f02_group2onlineshoppingsystem.entities.Review;
import com.cp2296f02_group2onlineshoppingsystem.entities.Users;
import com.cp2296f02_group2onlineshoppingsystem.service.ReportRevenueExcelFile;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.CategoryFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.OrderProductFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.OrdersFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ProductFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ReviewFacadeLocal;
import com.cp2296f02_group2onlineshoppingsystem.sessionbeans.UsersFacadeLocal;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author minhthuy
 */
@Controller
public class OrderController {

    ReviewFacadeLocal reviewFacade = lookupReviewFacadeLocal();

    OrderProductFacadeLocal orderProductFacade1 = lookupOrderProductFacadeLocal1();

    ProductFacadeLocal productFacade = lookupProductFacadeLocal();

    OrderProductFacadeLocal orderProductFacade = lookupOrderProductFacadeLocal();

    CategoryFacadeLocal categoryFacade = lookupCategoryFacadeLocal();

    UsersFacadeLocal usersFacade = lookupUsersFacadeLocal();

    OrdersFacadeLocal ordersFacade = lookupOrdersFacadeLocal();

    @Autowired
    JavaMailSender mailSender;

    @RequestMapping(value = "admin/orderlist", method = RequestMethod.GET)
    public String showFinishedOrderList(Model model) {
        model.addAttribute("orderList", ordersFacade.getAllOrderFinished());
        return "admin/orderlistfinished";
    }

    @RequestMapping(value = "admin/ordercancellist", method = RequestMethod.GET)
    public String showCancelOrderList(Model model) {
        model.addAttribute("orderList", ordersFacade.getAllOrderCancelled());
        return "admin/orderlistcancelled";
    }

    @RequestMapping(value = "admin/unfinishedorderlist", method = RequestMethod.GET)
    public String showUnfinishedOrderList(Model model) {
        model.addAttribute("orderList", ordersFacade.getAllOrderUnfinished());
        return "admin/orderlistunfinished";
    }

    @RequestMapping(value = "admin/updateorder", method = RequestMethod.GET)
    public String showUpdateOrder(Model model, @RequestParam("orderId") int orderId) {
        model.addAttribute("orderId", orderId);
        return "admin/update-order";
    }

    @ModelAttribute("OrderUpdateForm")
    public Orders showFormUpdateOrder() {
        return new Orders();
    }

    @RequestMapping(value = "admin/processupdate", method = RequestMethod.POST)
    public String processUpdateOrder(@RequestParam("orderId") int orderId, @RequestParam("deliveryDate") String deliveryDate) throws ParseException {
        System.out.println(deliveryDate);
        String formatDelDate = deliveryDate.substring(8, 10);
        formatDelDate += "/" + deliveryDate.substring(5, 7);
        formatDelDate += "/" + deliveryDate.substring(0, 4);
        Orders order = ordersFacade.find(orderId);
        order.setDeliveryDate(formatDelDate);
        order.setStatus(2);
        ordersFacade.edit(order);
        return "redirect:/admin/orderlist";
    }

    @RequestMapping(value = "users/checkout", method = RequestMethod.GET)
    public String showCheckoutPage(Model model) {
        List<Category> categories = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoriesList", categories);
        return "user/checkout";
    }

    @ModelAttribute("OrderForm")
    public Orders showFormCheckOut() {
        return new Orders();
    }

    @RequestMapping(value = "users/orderprocess", method = RequestMethod.POST)
    public String orderProcess(@ModelAttribute("OrderForm") Orders orders, HttpSession session, Principal principal, HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();

        Orders order = new Orders();
        order.setUserId(usersFacade.findIdByUsername(principal.getName()));
        order.setCustomerName(orders.getCustomerName());
        order.setOrderDate(date);
        order.setAddressReceive(orders.getAddressReceive());
        order.setPhone(orders.getPhone());
        order.setPayform(orders.getPayform());
        order.setTotalPrice((int) session.getAttribute("myCartTotal"));
        order.setStatus(0);
        ordersFacade.create(order);
        int oId = order.getOrderId();
        OrderProduct od = new OrderProduct();
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        for (Map.Entry<Integer, Cart> list : cartItems.entrySet()) {
            System.out.println("Product Id : " + list.getValue().getProduct().getProductId());
            System.out.println("Quantity: " + list.getValue().getQuantity());
            od.setProductId(list.getValue().getProduct().getProductId());
            od.setQuantity(list.getValue().getQuantity());
            od.setOrderId(oId);
            od.setProductPrice(list.getValue().getProduct().getProductPrice());
            od.setStatusReview(0);
            orderProductFacade.create(od);
            //Update quantity of product by product id
            Product pId = productFacade.find(list.getValue().getProduct().getProductId());
            System.out.println("Old Quantity: " + pId.getQuantity());
            System.out.println("Quantity of bill : " + list.getValue().getQuantity());
            System.out.println("Quantity after updated: " + (pId.getQuantity() - list.getValue().getQuantity()));
            pId.setQuantity(pId.getQuantity() - list.getValue().getQuantity());
            productFacade.edit(pId);

        }
        Users users = usersFacade.getUserByUsername(principal.getName());
        String payform = "";
        if (orders.getPayform() == 0) {
            payform = "Cash";
        } else {
            payform = "Credit card/Debit card";
        }
        sendEmail(users.getEmail(), true, true, orders.getCustomerName(), orders.getPhone(), payform, orders.getAddressReceive(), session, request);
        return "redirect:/users/vieworderlist";

    }

    public void sendEmail(String recipientEmail, boolean isMultipart, boolean isHtml, String customerName, String phone, String payform, String addressReceive, HttpSession session, HttpServletRequest request)
            throws MessagingException, UnsupportedEncodingException {
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, isMultipart, "UTF-8");
        String content = "";
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");

        System.out.println(session.getAttribute("myCartTotal"));
        content = "<p><b>Customer name: </b>" + customerName + "<br/><b>Email:</b>" + recipientEmail
                + "<br/><b>Phone:</b>" + phone + "<br/><b>Address Receive:</b>" + addressReceive + ""
                + "<br/><b>Payform: </b>" + payform + ""
                + "<br/><b>Thank you for ordered at Agricultural 24h, please wait a minute in while we confirm order.</b></p>";
        content += "<table border='1' cellpadding='10px' cellspacing='1px' width='100%'>"
                + "<tr>"
                + "<td align='center' bgcolor='#65e5fa' colspan='4' style='font-size: 25px'>Payment Bill</td>"
                + "</tr><tr>"
                + "<th>Product Name</th>"
                + "<th>Product Price</th>"
                + "<th>Quantity</th>"
                + "<th>Total Price</th>"
                + "</tr>";
        for (Map.Entry<Integer, Cart> list : cartItems.entrySet()) {
            System.out.println("http://localhost:8080" + request.getContextPath() + "/resources/user/images/products/" + list.getValue().getProduct().getImageProduct());
            content += "<tr>"
                    + "<td align='center'>" + list.getValue().getProduct().getProductName() + "</td>"
                    + "<td align='center'>$" + list.getValue().getProduct().getProductPrice() + "</td>"
                    + "<td align='center'>" + list.getValue().getQuantity() + "</td>"
                    + "<td align='center'>$" + list.getValue().getQuantity() * list.getValue().getProduct().getProductPrice() + "</td></tr>";

        }
        content += "<tr>"
                + "<td colspan='3' align='center'>Total Money:</td>"
                + "<td align='center'>$" + session.getAttribute("myCartTotal") + "</td>"
                + "</tr>"
                + "</table>";
        messageHelper.setTo(recipientEmail);
        messageHelper.setSubject("Bill information was ordered at Agricultural 24h");
        messageHelper.setText(content, isHtml);
        mailSender.send(mimeMessage);
        session.removeAttribute("myCartItems");
        session.removeAttribute("myCartTotal");
        session.removeAttribute("myCartNum");
    }

    @RequestMapping(value = "users/vieworderlist", method = RequestMethod.GET)
    public String showOrderList(Principal principal, Model model) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        List<Orders> orderList = ordersFacade.getAllOrderByUserId(usersFacade.findIdByUsername(principal.getName()));
        model.addAttribute("orderList", orderList);
        return "user/order-list";
    }

    @RequestMapping(value = "users/vieworderhistorylist", method = RequestMethod.GET)
    public String showOrderHistoryList(Principal principal, Model model) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        List<Orders> orderList = ordersFacade.getAllOrderHistoryByUserId(usersFacade.findIdByUsername(principal.getName()));
        System.out.println(usersFacade.findIdByUsername(principal.getName()));
        model.addAttribute("orderList", orderList);

        return "user/order-history";
    }

    @RequestMapping(value = "users/searchorder", method = RequestMethod.GET)
    public String searchOrder(@RequestParam("starDate") String starDate, @RequestParam("endDate") String endDate, Model model, Principal principal) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        List<Object[]> oList = ordersFacade.getOrderListByStarDateEndDate(starDate, endDate, usersFacade.findIdByUsername(principal.getName()));
        System.out.println("star:" + starDate + "end:" + endDate);
        System.out.println(oList.size());
        model.addAttribute("oList", oList);
        return "user/searchorder";
    }

    @RequestMapping(value = "users/cancelorder", method = RequestMethod.GET)
    public String cancelOrder(@RequestParam("orderId") int orderId) {
        List<OrderProduct> opList = orderProductFacade.getOrderProductByOid(orderId);
        for (int i = 0; i < opList.size(); i++) {           
            Product p = productFacade.find(opList.get(i).getProductId());
            p.setQuantity(p.getQuantity()+ opList.get(i).getQuantity());
            productFacade.edit(p);
        }
        Orders o = ordersFacade.find(orderId);
        o.setStatus(3);
        ordersFacade.edit(o);
        return "redirect:/users/vieworderlist";
    }

    @RequestMapping(value = "admin/confirmorder", method = RequestMethod.GET)
    public String showConfirmOrder(Model model, @RequestParam("orderId") int orderId) {
        Orders o = ordersFacade.find(orderId);
        o.setStatus(1);
        ordersFacade.edit(o);
        return "redirect:/admin/unfinishedorderlist";
    }

    @RequestMapping(value = "admin/orderdetail", method = RequestMethod.GET)
    public String showOrderDetail(Model model, @RequestParam("orderId") int orderId) {
        List<Object[]> orderProductList = orderProductFacade.getOrderProductByOrderId(orderId);
        model.addAttribute("orderProductList", orderProductList);
        return "admin/orderdetail";
    }

    @RequestMapping(value = "chart/statisticByMonth", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Integer> getStatisticByMonth(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {
        Map<String, Integer> data = new LinkedHashMap<String, Integer>();
        int index = 0;
        List<Object[]> statisticList = null;
        if (startDate.equals("none") && endDate.equals("none")) {
            statisticList = ordersFacade.statisticTotalMoneyByMonth();

        } else {
            statisticList = ordersFacade.statisticTotalMoneyByMonth(startDate, endDate);

        }
        for (int i = 0; i < statisticList.size(); i++) {
            String month = "";
            if ((Integer) statisticList.get(i)[0] == 1) {
                month = "January";
            } else if ((Integer) statisticList.get(i)[0] == 2) {
                month = "February";
            } else if ((Integer) statisticList.get(i)[0] == 3) {
                month = "March";
            } else if ((Integer) statisticList.get(i)[0] == 4) {
                month = "April";
            } else if ((Integer) statisticList.get(i)[0] == 5) {
                month = "May";
            } else if ((Integer) statisticList.get(i)[0] == 6) {
                month = "June";
            } else if ((Integer) statisticList.get(i)[0] == 7) {
                month = "July";
            } else if ((Integer) statisticList.get(i)[0] == 8) {
                month = "August";
            } else if ((Integer) statisticList.get(i)[0] == 9) {
                month = "September";
            } else if ((Integer) statisticList.get(i)[0] == 10) {
                month = "October";
            } else if ((Integer) statisticList.get(i)[0] == 11) {
                month = "November";
            } else if ((Integer) statisticList.get(i)[0] == 12) {
                month = "December";
            }
            data.put(month, (Integer) statisticList.get(index)[1]);
            index++;
        }
        return data;
    }

    @RequestMapping(value = "/chart/statisticByYear", method = RequestMethod.GET)
    @ResponseBody
    public Map<Integer, Integer> getStatisticByYear(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate) {
        Map<Integer, Integer> data = new LinkedHashMap<Integer, Integer>();
        int index = 0;
        List<Object[]> statisticList = null;
        if (startDate.equals("none") && endDate.equals("none")) {
            statisticList = ordersFacade.statisticTotalMoneyByYear();

        } else {
            statisticList = ordersFacade.statisticTotalMoneyByYear(startDate, endDate);

        }
        for (int i = 0; i < statisticList.size(); i++) {
            data.put((Integer) statisticList.get(i)[0], (Integer) statisticList.get(index)[1]);
            index++;
        }
        return data;
    }

    @RequestMapping(value = "/admin/exportexcelfile", method = RequestMethod.GET)
    public ModelAndView getExcel() {
        List<Object[]> revenueList = ordersFacade.generateReport();
        ReportRevenueExcelFile excelFile = new ReportRevenueExcelFile();
        return new ModelAndView(excelFile, "revenueExcelFile", revenueList);
    }

    @RequestMapping(value = "/users/vieworderdetail", method = RequestMethod.GET)
    public String showOrderDetail(@RequestParam("orderId") int orderId, Model model, Principal principal) {
        List<Category> categoryList = categoryFacade.getAllCategoryEnable();
        model.addAttribute("categoryList", categoryList);
        List<Object[]> orderProductList = orderProductFacade.getOrderProductByOrderId(orderId);
        model.addAttribute("orderProductList", orderProductList);

        return "user/orderdetail";
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

    private CategoryFacadeLocal lookupCategoryFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (CategoryFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/CategoryFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.CategoryFacadeLocal");
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

    private ProductFacadeLocal lookupProductFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (ProductFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/ProductFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ProductFacadeLocal");
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

    private ReviewFacadeLocal lookupReviewFacadeLocal() {
        try {
            Context c = new InitialContext();
            return (ReviewFacadeLocal) c.lookup("java:global/CP2296F02_Group2_OnlineShoppingSystem/ReviewFacade!com.cp2296f02_group2onlineshoppingsystem.sessionbeans.ReviewFacadeLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

}
