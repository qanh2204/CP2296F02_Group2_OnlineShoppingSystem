<%-- 
    Document   : index
    Created on : May 5, 2022, 10:57:00 PM
    Author     : qanh2204
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- Start header section -->
<jsp:include page = "main-header.jsp" flush = "true" />
<!-- / header section -->

<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/resources/user/images/products/banner-cart.png" alt="banner giỏ hàng">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Order Detail</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Home Page </a></li>
                    <li style="color:#fff">Order Detail</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- Cart view section -->
<section id="cart-view">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="cart-view-area">
                    <div class="cart-view">

                        <div class="row" style="background-color: white;">
                            <table class="table table-responsive">
                                <thead>
                                    <tr class="">
                                        <th scope="col">Product Image</th>
                                        <th scope="col">Product Name</th>
                                        <th scope="col">Product Price</th>
                                        <th scope="col">Quantity</th> 
                                        <th scope="col">Action</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${orderProductList}">
                                        <tr class="">
                                            <td ><a href="${pageContext.request.contextPath}/user/showproductdetail?pId=${item[4]}"><img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/user/images/products/${item[0]}"/></a></td>

                                            <td style="padding-top:39px"><div  >${item[1]}</div></td> 
                                            <td style="padding-top:39px">$${item[2]}</td>


                                            <td style="padding-top:39px"><div  >${item[3]}</div></td>

                                            <td style="padding-top:39px">

                                                <c:if test="${item[8]==1}">
                                                    <a>Rated</a>
                                                </c:if>
                                                <c:if test="${item[8]==0 && item[6]==2}">
                                                    <button class="btn btn-success" style="background-color:#754110;color:white"><a style="color:white" href="${pageContext.request.contextPath}/user/reviewpage?pId=${item[4]}&orderId=${item[7]}">Rate and comment</a></button>
                                                </c:if>
                                                <c:if test="${item[6]!=2}">
                                                    <button class="btn btn-success" disabled="true" style="background-color:#754110;color:white"><a style="color:white" >Rate and comment</a></button>
                                                </c:if>



                                            </td>
                                        </tr>


                                    </c:forEach>

                                </tbody>
                            </table>

                        </div>

                    </div>



                </div>
            </div>
        </div>
    </div>
</div>
</section>
<!-- / Cart view section -->

<!--  end content-->

<!--  footer-->
<jsp:include page = "footer.jsp" flush = "true" />
<!-- end footer-->
