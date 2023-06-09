<%-- 
    Document   : index
    Created on : May 5, 2022, 10:57:00 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- Start header section -->
<script src="${pageContext.request.contextPath}/resources/user/js/checkout.js" type="text/javascript"></script>
<!-- Start header section -->
<jsp:include page = "main-header.jsp" flush = "true" />
<!-- / header section -->

<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/resources/user/images/products/checkout-banner.png" alt="banner thanh toán">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Check out</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/">Home Page</a></li>
                    <li style="color:#fff">Cart Information</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- Cart view section -->
<section id="checkout">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="checkout-area">
                    <div class="container" >
                        <div class="row" style="background-color: white;">
                            <table class="table">
                                <thead>
                                    <tr class="">
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">Product Name</th>
                                        <th scope="col">Product Price</th>
                                        <th scope="col">Quantity</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="items" items="${sessionScope.myCartItems}">
                                        <tr class="">
                                            <td><img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/user/images/products/${items.value.product.imageProduct}"/></td>
                                            <td><div  style="padding-top:39px">${items.value.product.productName}</div></td> 
                                            <td><div  style="padding-top:39px">
                                                    <fmt:formatNumber currencySymbol="$" maxFractionDigits="0" type="currency" value="${items.value.product.productPrice}" />

                                                </div></td>
                                            <td><div  style="padding-top:39px">${items.value.quantity}</div></td>


                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <table>
                                <tr>
                                    <td><b>Total Money: </b> 
                                <fmt:formatNumber currencySymbol="$" maxFractionDigits="0" type="currency" value="${sessionScope.myCartTotal}" />

                                </td>
                                </tr>
                            </table>
                        </div>


                    </div>
                    <div class="container" style="margin-top: 10px">
                        <div class="row" style="background-color: white;">
                            <form:form action="${pageContext.request.contextPath}/users/orderprocess" method="post" modelAttribute="OrderForm">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <center><h2 style="padding-top: 20px;padding-bottom: 20px;">Check out information</h2></center>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-1">
                                    </div>
                                    <div class="col-md-2">
                                        <label>Customer Name</label>
                                    </div>             
                                    <div class="col-md-6">
                                        <form:input path="customerName" onchange="return onchangeCustomer();" id="customerName" cssClass="form-control" tabindex="1"/>
                                        <form:errors path="customerName" cssStyle="color:red;"/>
                                        <p style="color:red;" id="errCustomerName"></p>
                                    </div>

                                </div>
                                <div class="form-group row">
                                    <div class="col-md-1">
                                    </div>
                                    <div class="col-md-2">
                                        <label>Address Receive</label>
                                    </div>             
                                    <div class="col-md-6">
                                        <form:input path="addressReceive" onchange="return onchangeAddress();" id="address" cssClass="form-control" tabindex="1"/>
                                        <form:errors path="addressReceive" cssStyle="color:red;"/>
                                        <p style="color:red;" id="errAddress">${errAddress}</p>
                                    </div>

                                </div>
                                <div class="form-group row">
                                    <div class="col-md-1">
                                    </div>
                                    <div class="col-md-2">
                                        <label>Phone</label>
                                    </div>        
                                    <div class="col-md-6">
                                        <form:input path="phone" onchange="return onchangePhone();" id="phone" cssClass="form-control" tabindex="1"/>
                                        <form:errors path="phone" cssStyle="color:red;"/>
                                        <p style="color:red;" id="errPhone"></p>

                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-1">
                                    </div>
                                    <div class="col-md-2">
                                        <label>PayForm</label>
                                    </div>        
                                    <div class="col-md-6">
                                        <form:select path="payform" cssClass="form-control">
                                            <form:option value="0">Cash</form:option>
                                            <form:option value="1">Credit card/Debit card</form:option>

                                        </form:select>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-md-3">

                                    </div>
                                    <div class="col-md-8">
                                        <form:button onclick="return checkValidateForm();" class="btn btn-success" style="background-color:#754110;color:white">Place Order</form:button>
                                    </div>
                                </div>
                        </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</section>
<!-- / Cart view section -->
<!--  end content-->
<script>
    var date = new Date();

    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();

    if (month < 10)
        month = "0" + month;
    if (day < 10)
        day = "0" + day;

    var today = year + "-" + month + "-" + day;


    document.getElementById('the-date').value = today;
</script>
<!--  footer-->
<jsp:include page = "footer.jsp" flush = "true" />
<!-- end footer-->



