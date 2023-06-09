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
<script>
    const searchOrder = () => {
        var startDate = document.getElementById("startDate").value;
        var endDate = document.getElementById("endDate").value;

        $.ajax({
            type: "get",
            data: "starDate=" + startDate + "&endDate=" + endDate,
            url: "${pageContext.request.contextPath}/users/searchorder",
            success: function () {
                window.location = "${pageContext.request.contextPath}/users/searchorder?starDate=" + startDate + "&endDate=" + endDate

            }

        });
    }
</script>
<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/resources/user/images/products/banner-cart.png" alt="banner giỏ hàng">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Order History</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/">Home Page </a></li>
                    <li style="color:#fff">Order History</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- Cart view section -->
<section id="cart-view">
    <div class="container">
        <div class="row" style="margin-top:20px">

            <div class="col-md-5">
                <div class="row">
                    <div class="col-md-3">
                        <label>Start Date:</label>

                    </div>
                    <div class="col-md-9">
                        <input type="date" name="startDate" id="startDate" class="form-control"/>

                    </div>

                </div>
            </div>
            <div class="col-md-5">
                  <div class="row">
                    <div class="col-md-3">
                        <label>End Date:</label>

                    </div>
                    <div class="col-md-9">
                <input type="date" name="endDate" id="endDate" class="form-control"/>

                    </div>

                </div>
            </div>
            <div class="col-md-2">
                <input type="submit" value="Search" style="background-color:#754110;color:white" onclick="searchOrder()" class="btn btn-success"/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="cart-view-area">
                    <div class="cart-view">
                        <div>
                         
                        </div>
                        <c:choose>
                            <c:when test="${empty orderList}">
                                <center><c:out value="There are no order."/><a href="${pageContext.request.contextPath}/">Go shopping</a></center>
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
                                                <th scope="col">Phone</th>
                                                <th scope="col">Total Price</th>
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
                                                                <c:out value="${items.deliveryDate}"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="Updating"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td><div  >${items.addressReceive}</div></td>
                                                    <td><div  >${items.phone}</div></td>
                                                    <td><div  >$${items.totalPrice}</div></td>
                                                    <td><div>
                                                            <c:if test="${items.status==2}">
                                                                <c:out value="Finished"/>
                                                            </c:if>
                                                            <c:if test="${items.status==3}">
                                                                <c:out value="Cancelled"/>
                                                            </c:if>

                                                        </div>
                                                    </td>

                                                    <td>
                                                        <c:if test="${items.status==2}">
                                                            <button class="btn btn-success" style="background-color:#754110;color:white"><a style="color:white" href="${pageContext.request.contextPath}/users/vieworderdetail?orderId=${items.orderId}">Review</a></button>
                                                        </c:if>
                                                    </td>
                                                </tr>

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
