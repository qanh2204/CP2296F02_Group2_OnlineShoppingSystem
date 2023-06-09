<%-- 
    Document   : index
    Created on : May 5, 2022, 10:57:00 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!-- Start header section -->
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<jsp:include page = "main-header.jsp" flush = "true" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- / header section -->

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
    $(document).ready(function () {
        $("#disable1").hide();
        if (<%=request.getParameter("page")%> == 1) {
            $("#hideLi").hide();
            $("#disable").append('<li class="page-item disabled">"');

        }
        if (<%=request.getParameter("page")%> == ${count}) {
            $("#hideLi1").hide();
            $("#disable1").append('<li class="page-item disabled">"');
        }
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

        document.getElementById("stars").innerHTML=output.join('');

    }
    
</script>




<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/resources/user/images/products/banner-product.png" alt="banner sản phẩm">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Product</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/">Home Page</a></li>         
                    <li style="color:#fff">list of products</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- product category -->
<section id="aa-product-category">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-8 col-md-push-3">
                <div class="aa-product-catg-content">

                    <div class="aa-product-catg-body">
                        <ul class="aa-product-catg">
                            <!-- start single product item -->
                            <c:if test="${empty productList}">
                                <p style="margin-left: 30px">No product!</p>
                            </c:if>
                            <c:forEach items="${productList}" var="product">
                                <li>
                                    <figure>
                                        <a class="aa-product-img" href="${pageContext.request.contextPath}/user/showproductdetail?pId=${product.productId}"><img src="${pageContext.request.contextPath}/resources/user/images/products/${product.imageProduct}" alt="${product.productName}"></a>
                                        <button class="aa-add-card-btn"  onclick="addToCart(${product.productId})"><span class="fa fa-shopping-cart"></span>Add to cart</button>
                                        <figcaption>
                                            <h4 class="aa-product-title"><a href="${pageContext.request.contextPath}/user/showproductdetail?pId=${product.productId}">${product.productName}</a></h4>

                                            <span onclick="getStars(${product.productPrice})" class="aa-product-price">$${product.productPrice}</span><span class="aa-product-price">                                                    
                                           
                                           
                                            </span>
                                                
                                        </figcaption>
                                    </figure>


                                </li>
                            </c:forEach>                                       
                        </ul>

                        <!-- / quick view modal -->   
                    </div>
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item" id="hideLi">
                                <div id="disable"></div>
                                <c:set var="page" value="<%=request.getParameter("page")%>"/>
                                <a class="page-link" href="${pageContext.request.contextPath}/user/allproduct?page=${page-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <c:forEach var="item" items="${sizeOfList}">
                                <li class="page-item <c:if test="${page==item.index}">
                                        <c:out value="active"/>
                                    </c:if>">

                                    <a  class="page-link" href="${pageContext.request.contextPath}/user/allproduct?page=${item.index}">${item.index}</a></li>
                                </c:forEach>                         
                            <li class="page-item" id="hideLi1">
                                <div id="disable1"></div>
                                <a class="page-link" href="${pageContext.request.contextPath}/user/allproduct?page=${page+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>

                        <!-- Tab panes -->

                    </nav>

                </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-4 col-md-pull-9">
                <aside class="aa-sidebar">
                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Catology</h3>
                        <ul class="aa-catg-nav">
                            <c:forEach items="${categoryList}" var="item">
                                <li><a href="${pageContext.request.contextPath}/user/showproductpage?cId=${item.categoryId}">${item.categoryName}</a></li>
                                </c:forEach>                
                        </ul>
                    </div>
                    <!-- single sidebar -->

                    <!-- single sidebar -->
                    <div class="aa-sidebar-widget">
                        <h3>Recent Products</h3>
                        <div class="aa-recently-views">
                            <ul>
                                <c:forEach items="${recentProductList}" var="product">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.productId}" class="aa-cartbox-img"><img alt="img" src="${pageContext.request.contextPath}/resources/user/images/products/${product.imageProduct}"></a>
                                        <div class="aa-cartbox-info">
                                            <h4><a href="${pageContext.request.contextPath}/view/client/product-detail?id=${product.productId}">${product.productName }</a></h4>
                                            <span class="aa-product-price">$${product.productPrice}</span><span class="aa-product-price"></span>


                                        </div>                    
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>                                 
                    </div>
                    <!-- single sidebar -->

                </aside>
            </div>

        </div>
    </div>
</section>
<!-- / product category -->
<!--  end content-->

<!--  footer-->
<jsp:include page = "footer.jsp" flush = "true" />
<!-- end footer-->



