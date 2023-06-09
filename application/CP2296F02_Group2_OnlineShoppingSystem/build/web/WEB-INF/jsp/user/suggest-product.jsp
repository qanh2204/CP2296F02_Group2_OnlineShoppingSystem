<%-- 
    Document   : index
    Created on : May 5, 2022, 10:57:00 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
</script>
<c:if test="${!empty suggestProductList}">

    <section id="aa-popular-category">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="aa-popular-category-area">
                            <!-- start prduct navigation -->
                            <ul class="nav nav-tabs aa-products-tab">
                                <li class="active"><a href="#sanphammoi" data-toggle="tab"><fmt:message key="homepage.suggestproduct"/></a></li>                                                     
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <!-- Start men popular category -->
                                <div class="tab-pane fade in active" id="sanphammoi">
                                    <ul class="aa-product-catg aa-popular-slider">


                                        <c:forEach items="${suggestProductList}" var="product">
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
                            
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </section>

</c:if>