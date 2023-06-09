<%-- 
    Document   : homepage
    Created on : Aug 24, 2022, 8:22:51 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            const getAllProductList = () => {
                $("#allProduct").empty();
                $.ajax({
                    type: "get",
                    contentType: 'application/json; charset=utf-8',
                    url: "${pageContext.request.contextPath}/user/getproductlist",
                    success: function (result) {
                        $("#tabProduct").hide();

                        var productList = $("#allProduct");
                        $.each(result, function (i) {
                            productList.append('<li><a class="aa-product-img" href="${pageContext.request.contextPath}/WEB-INF/jsp/user/product-detail?productId=' + result[i].productId + '"><img src="${pageContext.request.contextPath}/resources/user/images/products/' + result[i].imageProduct + '" alt="polo shirt img"></a>'
                                    + '<figure>'
                                    + '<figcaption>'
                                    + '<h4 class="aa-product-title"><a href="${pageContext.request.contextPath}/WEB-INF/jsp/user/product-detail?id=' + result[i].productId + '">' + result[i].productName + '</a><span tooltip="Add to cart" class="fa fa-shopping-cart" onclick="addToCart(${product.productId})"></span></h4>'

                                    + '<span class="aa-product-price" >$' + result[i].productPrice + ' </span><span class="aa-product-price"></span>'
                                    + '</figcaption> </figure>   </li> ');
                        });

                    }

                });
            }




            const getProductList = (categoryId) => {
                $("#product").empty();
                $.ajax({
                    type: "get",
                    data: "categoryId=" + categoryId, //send data directly
                    contentType: 'application/json; charset=utf-8',
                    url: "${pageContext.request.contextPath}/user/getproductlist",
                    success: function (result) {
                        $("#tabProduct").hide();

                        var productList = $("#product");
                        $.each(result, function (i) {
                            productList.append('<li><a class="aa-product-img" href="${pageContext.request.contextPath}/WEB-INF/jsp/user/product-detail?productId=' + result[i].productId + '"><img src="${pageContext.request.contextPath}/resources/user/images/products/' + result[i].imageProduct + '" alt="polo shirt img"></a>'
                                    + '<figure>'
                                    + '<figcaption>'
                                    + '<h4 class="aa-product-title"><a href="${pageContext.request.contextPath}/WEB-INF/jsp/user/product-detail?id=' + result[i].productId + '">' + result[i].productName + '</a><span tooltip="Add to cart" class="fa fa-shopping-cart" onclick="addToCart(${product.productId})"></span></h4>'

                                    + '<span class="aa-product-price" >$' + result[i].productPrice + ' </span><span class="aa-product-price"></span>'
                                    + '</figcaption> </figure>   </li> ');
                        });

                    }

                });
            }


        </script>
    </head>
    <body>
        <jsp:include page = "main-header.jsp"  />
        <jsp:include page = "slider.jsp" flush = "true" />
        <jsp:include page="suggest-product.jsp"/>
        <section id="aa-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">        
                        <div class="row">
                            <div class="aa-banner-area">
                                <a href="#"><img src="<%=request.getContextPath()%>/resources/user/images/products/banner_tc.jpg" alt="banner trang chủ"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section id="aa-popular-category">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="aa-popular-category-area">
                                <!-- start prduct navigation -->
                                <ul class="nav nav-tabs aa-products-tab">
                                    <li class="active"><a href="#sanphammoi" data-toggle="tab"><fmt:message key="homepage.newproduct"/></a></li>                                                     
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <!-- Start men popular category -->
                                    <div class="tab-pane fade in active" id="sanphammoi">
                                        <ul class="aa-product-catg aa-popular-slider">


                                            <c:forEach items="${newProductList}" var="product">
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="${pageContext.request.contextPath}/user/showproductdetail?pId=${product.productId}"><img src="${pageContext.request.contextPath}/resources/user/images/products/${product.imageProduct}" alt="${product.productName}"></a>
                                                        <button class="aa-add-card-btn"  onclick="addToCart(${product.productId})"><span class="fa fa-shopping-cart"></span><fmt:message key="homepage.Addtocart"/></button>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="${pageContext.request.contextPath}/user/showproductdetail?pId=${product.productId}">${product.productName}</a></h4>

                                                            <span class="aa-product-price">$${product.productPrice} </span><span class="aa-product-price"></span>

                                                        </figcaption>
                                                    </figure>


                                                </li>
                                            </c:forEach>   

                                        </ul>

                                    </div>

                                </div>

                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </section>
        <section id="aa-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">        
                        <div class="row">
                            <div class="aa-banner-area">
                                <a href="#"><img src="<%=request.getContextPath()%>/resources/user/images/products/bannerimage.jpg" alt="banner trang chủ"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="aa-popular-category">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="aa-popular-category-area">
                                <!-- start prduct navigation -->
                                <ul class="nav nav-tabs aa-products-tab">
                                    <li class="active"><a href="#sanphammoi" data-toggle="tab">All Product</a></li>                                                     
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <!-- Start men popular category -->
                                    <div class="tab-pane fade in active" id="sanphammoi">
                                        <ul class="aa-product-catg aa-popular-slider">


                                            <c:forEach items="${productList}" var="product">
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="${pageContext.request.contextPath}/user/showproductdetail?pId=${product.productId}"><img src="${pageContext.request.contextPath}/resources/user/images/products/${product.imageProduct}" alt="${product.productName}"></a>
                                                        <button class="aa-add-card-btn"  onclick="addToCart(${product.productId})"><span class="fa fa-shopping-cart"></span><fmt:message key="homepage.Addtocart"/></button>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="${pageContext.request.contextPath}/user/showproductdetail?pId=${product.productId}">${product.productName}</a></h4>

                                                            <span class="aa-product-price">$${product.productPrice}</span><span class="aa-product-price"></span>

                                                        </figcaption>
                                                    </figure>


                                                </li>
                                            </c:forEach>   

                                        </ul>

                                    </div>

                                </div>
                                <div class="more-product">
                                    <a class="aa-browse-btn" href="${pageContext.request.contextPath}/user/allproduct?page=1">View all product<span class="fa fa-long-arrow-right"></span></a>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </section>

        <section id="aa-support">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aa-support-area">
                            <!-- single support -->
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="aa-support-single">
                                    <span class="fa fa-truck"></span>
                                    <h4><fmt:message key="homepage.freeship"/></h4>
                                    <P><fmt:message key="homepage.word1"/> 100$.</P>
                                </div>
                            </div>
                            <!-- single support -->
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="aa-support-single">
                                    <span class="fa fa-clock-o"></span>
                                    <h4><fmt:message key="homepage.delivery"/></h4>
                                    <P><fmt:message key="homepage.word2"/></P>
                                </div>
                            </div>
                            <!-- single support -->
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="aa-support-single">
                                    <span class="fa fa-phone"></span>
                                    <h4><fmt:message key="homepage.support"/> 24/7</h4>
                                    <P><fmt:message key="homepage.word3"/></P>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>                
        <!-- Testimonial -->
        <section id="aa-testimonial">  
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aa-testimonial-area">
                            <ul class="aa-testimonial-slider">
                                <!-- single slide -->
                                <li>
                                    <div class="aa-testimonial-single">
                                        <img class="aa-testimonial-img" src="<%=request.getContextPath()%>/resources/admin/img/sunflower4.jpg" alt="avatar 1">
                                        <span class="fa fa-quote-left aa-testimonial-quote"></span>                                        
                                        <div class="aa-testimonial-info">
                                            <p>Trương Thị Minh Thùy</p>
                                            <span><fmt:message key="homepage.teamleader"/></span>
                                        </div>
                                    </div>
                                </li>
                                <!-- single slide -->
                                <li>
                                    <div class="aa-testimonial-single">
                                        <img class="aa-testimonial-img" src="<%=request.getContextPath()%>/resources/user/images/products/avater-2.jpg" alt="avatar 2">
                                        <span class="fa fa-quote-left aa-testimonial-quote"></span>                                        
                                        <div class="aa-testimonial-info">
                                            <p>Phạm Quốc Anh</p>
                                            <span><fmt:message key="homepage.teamember"/></span>
                                        </div>
                                    </div>
                                </li>                   
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page = "footer.jsp"  />

    </body>
</html>
