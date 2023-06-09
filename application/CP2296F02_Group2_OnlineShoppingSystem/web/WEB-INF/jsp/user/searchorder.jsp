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
                <h2>Order List</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/">Home Page </a></li>
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
        <div class="row" style="margin-left:200px;margin-top:20px">
            <div class="col-md-4">
                <input type="date" name="startDate" id="startDate" class="form-control"/>
            </div>
            <div class="col-md-4">
                <input type="date" name="endDate" id="endDate" class="form-control"/>
            </div>
            <div class="col-md-4">
                <input type="submit" value="Search" onclick="searchOrder()" class="btn btn-success"/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="cart-view-area">
                    <div class="cart-view">

                        <c:choose>
                            <c:when test="${empty oList}">
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
                                            <c:forEach var="items" items="${oList}">
                                                <tr class="">
                                                    <td><div  >${items[0]}</div></td> 
                                                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${items[1]}" /></td>


                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${items[2]!=null}">
                                                                <c:out value="${items[2]}"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="Updating"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td><div  >${items[3]}</div></td>
                                                    <td><div  >${items[5]}</div></td> 
                                                    <td><div  >${items[6]}</div></td> 
                                                    <td><div>
                                                            <c:if test="${items[4]==2}">
                                                                <c:out value="Finished"/>
                                                            </c:if>
                                                            <c:if test="${items[4]==3}">
                                                                <c:out value="Cancelled"/>
                                                            </c:if>

                                                        </div>
                                                    </td>

                                                    <td>
                                                        <c:if test="${items[4]==2}">
                                                            <button class="btn btn-success" style="background-color:#754110;color:white"><a style="color:white" href="${pageContext.request.contextPath}/users/vieworderdetail?orderId=${items[0]}">Review</a></button>
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
