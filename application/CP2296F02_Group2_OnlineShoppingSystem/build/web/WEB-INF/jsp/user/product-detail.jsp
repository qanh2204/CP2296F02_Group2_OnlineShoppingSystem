<%-- 
    Document   : index
    Created on : May 5, 2022, 10:57:00 PM
    Author     : qanh2204
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.cp2296f02_group2onlineshoppingsystem.entities.Review"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- Start header section -->

<!-- Start header section -->
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
            success: function () {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'The product added to your shopping cart',
                    showConfirmButton: false,
                    timer: 4000
                })
            }

        });
    </security:authorize>
    }

    $(function () {
        document.getElementById("stars").innerHTML = getStars(${totalStar});

        $(document).on({
            mouseover: function (event) {
                $(this).find('.far').addClass('star-over');
                $(this).prevAll().find('.far').addClass('star-over');
            },
            mouseleave: function (event) {
                $(this).find('.far').removeClass('star-over');
                $(this).prevAll().find('.far').removeClass('star-over');
            }
        }, '.rate');


        $(document).on('click', '.rate', function () {
            if (!$(this).find('.star').hasClass('rate-active')) {
                $(this).siblings().find('.star').addClass('far').removeClass('fas rate-active');
                $(this).find('.star').addClass('rate-active fas').removeClass('far star-over');
                $(this).prevAll().find('.star').addClass('fas').removeClass('far star-over');
            } else {
                console.log('has');
            }
        });

    });

    function getStars(rating) {

        // Round to nearest half
        rating = Math.round(rating * 2) / 2;
        let output = [];

        // Append all the filled whole stars
        for (var i = rating; i >= 1; i--)
            output.push('<i class="fa fa-star" aria-hidden="true" style="color: orange;"></i>&nbsp;');

        // If there is a half a star, append it
        if (i == .5)
            output.push('<i class="fa fa-star-half-o" aria-hidden="true" style="color: orange;"></i>&nbsp;');

        // Fill the empty stars
        for (let i = (5 - rating); i >= 1; i--)
            output.push('<i class="fa fa-star-o" aria-hidden="true" style="color: orange;"></i>&nbsp;');

        return output.join('');

    }

</script>
<style>
    .stars {
        width: fit-content;
        margin: 0 auto;
        cursor: pointer;
    }
    .star {
        color: #91a6ff !important;
    }
    .rate {
        height: 50px;
        margin-left: -5px;
        padding: 5px;
        font-size: 25px;
        position: relative;
        cursor: pointer;
    }
    .rate input[type="radio"] {
        opacity: 0;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,0%);
        pointer-events: none;
    }
    .star-over::after {
        font-family: 'Font Awesome 5 Free';
        font-weight: 900;
        font-size: 16px;
        content: "\f005";
        display: inline-block;
        color: #d3dcff;
        z-index: 1;
        position: absolute;
        top: 17px;
        left: 10px;
    }

    .rate:nth-child(1) .face::after {
        content: "\f119"; /* ☹ */
    }
    .rate:nth-child(2) .face::after {
        content: "\f11a"; /* 😐 */
    }
    .rate:nth-child(3) .face::after {
        content: "\f118"; /* 🙂 */
    }
    .rate:nth-child(4) .face::after {
        content: "\f580"; /* 😊 */
    }
    .rate:nth-child(5) .face::after {
        content: "\f59a"; /* 😄 */
    }
    .face {
        opacity: 0;
        position: absolute;
        width: 35px;
        height: 35px;
        background: #91a6ff;
        border-radius: 5px;
        top: -50px;
        left: 2px;
        transition: 0.2s;
        pointer-events: none;
    }
    .face::before {
        font-family: 'Font Awesome 5 Free';
        font-weight: 900;
        content: "\f0dd";
        display: inline-block;
        color: #91a6ff;
        z-index: 1;
        position: absolute;
        left: 9px;
        bottom: -15px;
    }
    .face::after {
        font-family: 'Font Awesome 5 Free';
        font-weight: 900;
        display: inline-block;
        color: #fff;
        z-index: 1;
        position: absolute;
        left: 5px;
        top: -1px;
    }

    .rate:hover .face {
        opacity: 1;
    }
    .checked {
        color: orange;
    }
</style>



<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/resources/user/images/products/banner-product.png" alt="banner sản phẩm">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Product details</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Home Page</a></li>         
                    <li><a href="${pageContext.request.contextPath}/view/client/product">Product</a></li>
                    <li style="color:#fff">${detail_product.name }</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- product category -->
<section id="aa-product-details">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-product-details-area">
                    <div class="">
                        <div class="row">
                            <!-- Modal view slider -->

                            <div class="col-md-5 col-sm-5 col-xs-12">                              
                                <div class="aa-product-view-slider">                                
                                    <div id="demo-1" class="simpleLens-gallery-container">
                                        <div class="simpleLens-container">
                                            <div class="simpleLens-big-image-container"><a data-lens-image="${pageContext.request.contextPath}/resources/user/images/products/${imageProduct}" class="simpleLens-lens-image"><img src="${pageContext.request.contextPath}/resources/user/images/products/${imageProduct}" class="simpleLens-big-image"></a></div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!-- Modal view content -->

                            <div class="col-md-7 col-sm-7 col-xs-12">
                                <div class="aa-product-view-content">
                                    <h3>${productName}</h3>
                                    <div class="aa-price-block">

                                        <span class="aa-product-price">$${productPrice}</span><span class="aa-product-price"></span>
                                        <p>
                                            <c:choose>
                                                <c:when test="${totalStar == null}"> 
                                                    <c:out value="No rating"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <b style="color:orange">${totalStar} <span id=stars></span> (${countTotalRate} Ratings)</b>
                                                </c:otherwise>
                                            </c:choose>


                                        </p>

                                        <p class="aa-product-avilability">Status: <span>
                                                <c:choose>
                                                    <c:when test="${status == 0}"> 
                                                        <c:out value="Available"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:out value="Sold out"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </span></p>
                                    </div>
                                    <p>${description}</p>
                                    <div class="aa-prod-quantity">                  

                                        <p class="aa-prod-category">
                                            <c:forEach items="${name_cate_of_product}" var="name_cate">
                                                <strong>Catology:</strong> <a href="product.jsp">${name_cate.name }</a>
                                            </c:forEach>
                                        </p>
                                    </div>
                                    <div class="aa-prod-view-bottom">
                                        <a class="aa-add-to-cart-btn" style="background-color:#754110;color:white" onclick="addToCart(<%=request.getParameter("pId")%>)">Add to cart</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="aa-product-details-bottom">
                        <ul class="nav nav-tabs aa-products-tab" id="myTab2">
                            <li class="active"><a href="#review" data-toggle="tab">Review</a></li>                
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">

                            <div class="tab-pane fade in active " id="review">
                                <div class="aa-product-review-area">
                                    <ul class="aa-review-nav">
                                        <li>
                                            <div class="media">
                                                <div class="media-body">
                                                    <c:choose>
                                                        <c:when test="${empty reviewList}">
                                                            <c:out value="There are no review"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:forEach var="item" items="${reviewList}">
                                                                <h4 class="media-heading"><strong>
                                                                        <c:forEach var="user" items="${userList}">
                                                                            <c:if test="${user.id==item.userId}">
                                                                                <c:out value="${user.username}"/>
                                                                            </c:if>

                                                                        </c:forEach>


                                                                    </strong> - <span><fmt:formatDate pattern="dd/MM/yyyy" value="${item.reviewDate}"/></span></h4>
                                                                <div class="aa-product-rating">
                                                                    <c:set var="star" value="${item.star}"/>
                                                                    <%
                                                                        Integer totalStar = (Integer) pageContext.getAttribute("star");
                                                                        for (int i = 0; i < totalStar; i++) {
                                                                    %>
                                                                    <span class="fa fa-star"></span>

                                                                    <%
                                                                        }
                                                                    %>  

                                                                </div>
                                                                <p>${item.contentReview}</p>
                                                            </c:forEach>

                                                        </c:otherwise>
                                                    </c:choose>


                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Related product -->
                            <div class="aa-product-related-item">
                                <h3>RELATED PRODUCTS</h3>
                                <ul class="aa-product-catg aa-related-item-slider">
                                    <!-- start single product item -->
                                    <c:forEach items="${pList}" var="product">
                                        <li>
                                            <figure>
                                                <a class="aa-product-img" href="${pageContext.request.contextPath}/user/showproductdetail?pId=${product.productId}"><img src="${pageContext.request.contextPath}/resources/user/images/products/${product.imageProduct}" alt="${product.productName}"></a>
                                                <button class="aa-add-card-btn"  onclick="addToCart(${product.productId})"><span class="fa fa-shopping-cart"></span>Add to cart</button>
                                                <figcaption>
                                                    <h4 class="aa-product-title"><a href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.productId}">${product.productName}</a></h4>

                                                    <span class="aa-product-price">$${product.productPrice}</span><span class="aa-product-price"></span>

                                                </figcaption>
                                            </figure>



                                        </li>
                                    </c:forEach>
                                    <!-- start single product item -->                                                                                   
                                </ul>

                            </div>  
                        </div>
                    </div>
                </div>
            </div>
            </section>
            <!-- / product category -->
            <!--  end content-->

            <!--  footer-->
            <jsp:include page = "footer.jsp" flush = "true" />
            <!-- end footer-->


