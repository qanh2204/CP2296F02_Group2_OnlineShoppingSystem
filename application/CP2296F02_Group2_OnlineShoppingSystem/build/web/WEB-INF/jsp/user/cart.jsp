<%-- 
    Document   : index
    Created on : May 5, 2022, 10:57:00 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- Start header section -->
<jsp:include page = "main-header.jsp" flush = "true" />
<script>
    const addToCart = (productId) => {
    <security:authorize access="!isAuthenticated()">
        window.location = "${pageContext.request.contextPath}/user/login"

    </security:authorize>
    <security:authorize access="isAuthenticated()">

        $.ajax({
            type: "get",
            data: "productId=" + productId, //send data directly
            url: "${pageContext.request.contextPath}/user/addCartPage",
            success: function (result) {
                window.location = "${pageContext.request.contextPath}/user/showshoppingcart"




//                $.each(result, function (key, value) {
//
//                    var name = value.product.productName;
//                    var quantity = value.quantity;
//                    var totalMoney = value.quantity * value.product.productPrice;
//                    var id = value.product.productId;
//                    var image = value.product.imageProduct;
//                    var price = value.product.productPrice;
//                    $("#oldCart").html(
//                            '<table class="table">'
//                            + ' <thead><tr class="">'
//                            + '<th scope="col">Product Image</th><th scope="col">Product Name</th>'
//                            + '<th scope="col">Product Price</th>'
//                            + '<th scope="col">Quantity</th>'
//                            + '<th scope="col">Total Price</th>'
//                            + ' <th scope="col">Action</th></tr> </thead> <tbody>' +
//                            '<tr>'
//                            + '<td ><img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/user/images/products/' + image + '"/></td>'
//                            + '<td style="padding-top:39px;">' + name + '</td>'
//                            + '<td style="padding-top:39px;">' + price + '</td>'
//                            + ' <td style="color:#007bff;padding-top:39px;"> <a style="cursor: pointer;color:#007bff">-&nbsp;&nbsp;&nbsp;</a>' + quantity + '&nbsp;&nbsp;&nbsp;<a style="cursor: pointer;color:#007bff" onclick="addToCart(' + id + ')">+</a></td>'
//                            + ' <td style="padding-top:39px;">'
//                            + totalMoney
//                            + '</td>'
//                            + '<td style="padding-top:39px;"><a  href="${pageContext.request.contextPath}/user/removeitems?pid=' + id + '">Delete</a></td>'
//                            + '</tr></tbody></table>+<div class="row" style="background-color: white;" id="oldTotal">'
//                            + ' <div class="col-md-9">'
//                            + '</div> <div class="col-md-3" style="margin-bottom:10px" >'
//                            + '      Total Money: '
//                            + totalMoney
//                            + '<a  href="${pageContext.request.contextPath}/users/checkout" style="background-color:#e99c2e"><button class="aa-browse-btn">Check out</button></a>'
//                            + '</div></div>');
//                });
            }

        });
    </security:authorize>
    }


    const updateCart = (productId) => {

        $.ajax({
            type: "get",
            data: "productId=" + productId, //send data directly
            url: "${pageContext.request.contextPath}/user/updatecart",
            success: function (result) {
                window.location = "${pageContext.request.contextPath}/user/showshoppingcart"




//                $.each(result, function (key, value) {
//
//                    var name = value.product.productName;
//                    var quantity = value.quantity;
//                    var totalMoney = value.quantity * value.product.productPrice;
//                    var id = value.product.productId;
//                    var image = value.product.imageProduct;
//                    var price = value.product.productPrice;
//                    $("#oldCart").html(
//                            '<table class="table">'
//                            + ' <thead><tr class="">'
//                            + '<th scope="col">Product Image</th><th scope="col">Product Name</th>'
//                            + '<th scope="col">Product Price</th>'
//                            + '<th scope="col">Quantity</th>'
//                            + '<th scope="col">Total Price</th>'
//                            + ' <th scope="col">Action</th></tr> </thead> <tbody>' +
//                            '<tr>'
//                            + '<td ><img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/user/images/products/' + image + '"/></td>'
//                            + '<td style="padding-top:39px;">' + name + '</td>'
//                            + '<td style="padding-top:39px;">' + price + '</td>'
//                            + ' <td style="color:#007bff;padding-top:39px;"> <a style="cursor: pointer;color:#007bff">-&nbsp;&nbsp;&nbsp;</a>' + quantity + '&nbsp;&nbsp;&nbsp;<a style="cursor: pointer;color:#007bff" onclick="addToCart(' + id + ')">+</a></td>'
//                            + ' <td style="padding-top:39px;">'
//                            + totalMoney
//                            + '</td>'
//                            + '<td style="padding-top:39px;"><a  href="${pageContext.request.contextPath}/user/removeitems?pid=' + id + '">Delete</a></td>'
//                            + '</tr></tbody></table>+<div class="row" style="background-color: white;" id="oldTotal">'
//                            + ' <div class="col-md-9">'
//                            + '</div> <div class="col-md-3" style="margin-bottom:10px" >'
//                            + '      Total Money: '
//                            + totalMoney
//                            + '<a  href="${pageContext.request.contextPath}/users/checkout" style="background-color:#e99c2e"><button class="aa-browse-btn">Check out</button></a>'
//                            + '</div></div>');
//                });
            }

        });

    }






</script>
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/resources/user/images/products/banner-cart.png" alt="banner giỏ hàng">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Shopping Cart</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Home Page </a></li>
                    <li style="color:#fff">Cart Information</li>
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
                    <div class="cart-view" id="oldCart">

                        <c:choose>
                            <c:when test="${sessionScope.myCartNum==null}">
                                <center><c:out value="There are no product in your shopping cart."/></center>
                                </c:when>
                                <c:otherwise>
                                <div class="row" style="background-color: white;">
                                    <table class="table" >
                                        <thead>
                                            <tr class="">
                                                <th scope="col">Product Image</th>
                                                <th scope="col">Product Name</th>
                                                <th scope="col">Product Price</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Total Price</th>
                                                <th scope="col">Action</th>

                                            </tr>
                                        </thead>
                                        <tbody id="oldCart">
                                            <c:forEach var="items" items="${sessionScope.myCartItems}">
                                                <tr class="">
                                                    <td><a href="${pageContext.request.contextPath}/user/showproductdetail?pId=${items.value.product.productId}"><img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/user/images/products/${items.value.product.imageProduct}"/></a></td>
                                                    <td  style="padding-top:39px"><div >${items.value.product.productName}</div></td> 
                                                    <td  style="padding-top:39px"><div >
                                                            <fmt:formatNumber currencySymbol="$" maxFractionDigits="0" type="currency" value="${items.value.product.productPrice}" />

                                                        </div></td>
                                                        <c:if test="${items.value.quantity==1}">
                                                        <td style="color:#007bff;padding-top:39px"> <a style="cursor: pointer;color:#007bff" >-&nbsp;&nbsp;&nbsp;</a>${items.value.quantity}&nbsp;&nbsp;&nbsp;<a style="cursor: pointer;color:#007bff" onclick="addToCart(${items.value.product.productId})">+</a></td>
                                                    </c:if>
                                                    <c:if test="${items.value.quantity>1}">
                                                    <td style="color:#007bff;padding-top:39px"> <a style="cursor: pointer;color:#007bff" onclick="updateCart(${items.value.product.productId})" >-&nbsp;&nbsp;&nbsp;</a>${items.value.quantity}&nbsp;&nbsp;&nbsp;<a style="cursor: pointer;color:#007bff" onclick="addToCart(${items.value.product.productId})">+</a></td>
                                                    </c:if>
                                                    <td  style="padding-top:39px"><div  ><c:out value=""/>
                                                            <fmt:formatNumber currencySymbol="$" maxFractionDigits="0" type="currency" value="${items.value.quantity * items.value.product.productPrice}" />

                                                        </div></td>

                                                    <td  style="padding-top:39px"><a  href="${pageContext.request.contextPath}/user/removeitems?pid=${items.value.product.productId}">Delete</a></td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row" style="background-color: white;" id="oldTotal">
                                    <div class="col-md-9">

                                    </div>
                                    <div class="col-md-3" style="margin-bottom:10px" >
                                        Total Money: 
                                        <fmt:formatNumber currencySymbol="$" maxFractionDigits="0" type="currency" value="${sessionScope.myCartTotal}" />

                                        <a  href="${pageContext.request.contextPath}/users/checkout" style="background-color:#e99c2e"><button class="aa-browse-btn">Check out</button></a>
                                    </div>


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
