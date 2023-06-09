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
                <h2>Order List</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Home Page </a></li>
                    <li style="color:#fff">Order List</li>
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

                        <c:choose>
                            <c:when test="${empty orderList}">
                                <center> <c:out value="There are no order."/><a href="${pageContext.request.contextPath}/">Go shopping</a></center>
                                </c:when>
                                <c:otherwise>
                                <div class="row" style="background-color: white;">
                                    <table class="table table-responsive">
                                        <thead>
                                            <tr class="">
                                                <th scope="col">Order Id</th>
                                                <th scope="col">Order Date</th>
                                                <th scope="col">Delivery Date</th>
                                                <th scope="col">Address Receive</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="items" items="${orderList}">
                                                <tr class="">
                                                    <td><div  >${items.orderId}</div></td> 
                                                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${items.orderDate}" /></td>


                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${items.deliveryDate!=null}">
                                                                <c:out value="${items.deliveryDate}" />
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="Updating"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td><div  >${items.addressReceive}</div></td>
                                                    <td><div>
                                                            <c:choose>
                                                                <c:when test="${items.status==0}">
                                                                    <c:out value="Pending" />
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <c:out value="Confirmed"/>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </div>
                                                    </td>

                                                    <td>
                                                        <button class="btn btn-success"style="background-color:#754110;color:white" ><a style="color:white"href="${pageContext.request.contextPath}/users/vieworderdetail?orderId=${items.orderId}">View Detail</a></button>

                                                        <c:if test="${items.status==0}">
                                                            <a href="#myModal_${items.orderId}" data-toggle="modal"><button class="btn btn-danger" style="background-color:#754110;color:white">Cancel Order</button></a>
                                                        </c:if>
                                                        <c:if test="${items.status==1}">
                                                            <button class="btn btn-primary" disabled="true" style="background-color:#754110;color:white" > <c:out value="Confirmed"/></button>
                                                        </c:if>

                                                    </td>

                                                </tr>
                                            <div id="myModal_${items.orderId}" class="modal fade">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>                                      
                                                        </div>

                                                        <div class="modal-body">
                                                            <p>Are you sure you want to cancel this order?</p>
                                                        </div>
                                                        <div class="modal-footer">

                                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Close"/>

                                                            <a href="<%=request.getContextPath()%>/users/cancelorder?orderId=${items.orderId}" class="btn btn-danger" title="Update">Cancel</a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>  
                                        </c:forEach>

                                        </tbody>
                                    </table>

                                </div>

                            </div>
                        </c:otherwise>
                    </c:choose>



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
