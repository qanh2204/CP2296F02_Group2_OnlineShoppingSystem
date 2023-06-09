<%-- 
    Document   : index
    Created on : May 5, 2022, 10:57:00 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    const addReview = () => {
//        console.log(${orderProductList.get(0)[4]});
//        for(var i=0;i<${orderProductList.size()};i++){
//            
//                   alert($("#${orderProductList.get(i)[4]}").val());
//
//        }
//        var review = {
//            "star1": "labels",
//            "comment1": "keyArray"
//        };
//        $.ajax({
//            type: 'POST',
//            url: '${pageContext.request.contextPath}/user/processreviewproduct',
//            data: {
//                star1:'1'
//            },
//            success: function (data) {
//                window.alert("done");
//            },
//            error: function (e) {
//
//            }
//        });
    }
    function onHandle() {
        var content = document.getElementById("content").value;
        if(content ==""){
            document.getElementById("errContent").innerHTML = "Please your write comment!";
          return false;
        }
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

</style>



<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/resources/user/images/products/banner-product.png" alt="banner sản phẩm">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Review product</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Home Page</a></li>         
                    <li><a href="${pageContext.request.contextPath}/view/client/product">Review product</a></li>
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
                    <div class="aa-product-details-content">



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


                                    <form:form class="aa-review-form" action="${pageContext.request.contextPath}/user/processreviewproduct?pId=${pId}&orderId=${orderId}" method="post" modelAttribute="ReviewForm">
                                        <div class="row">
                                            <div class="col-md-2"> <h4>Star:</h4></div>
                                            <div class="col-md-5">
                                                <div class="wrap">

                                                    <div class="stars">

                                                        <label class="rate">
                                                            <form:radiobutton  path="star" name="radio1" id="star1" value="1"/>
                                                            <div class="face"></div>
                                                            <i class="far fa-star star one-star"></i>
                                                        </label>
                                                        <label class="rate">
                                                            <form:radiobutton path="star" name="radio1" id="star2" value="2"/>
                                                            <div class="face"></div>
                                                            <i class="far fa-star star two-star"></i>
                                                        </label>
                                                        <label class="rate">
                                                            <form:radiobutton path="star" name="radio1" id="star3" value="3"/>
                                                            <div class="face"></div>
                                                            <i class="far fa-star star three-star"></i>
                                                        </label>
                                                        <label class="rate">
                                                            <form:radiobutton path="star"  name="radio1" id="star4" value="4"/>
                                                            <div class="face"></div>
                                                            <i class="far fa-star star four-star"></i>
                                                        </label>
                                                        <label class="rate">
                                                            <form:radiobutton  path="star"  name="radio1" id="star5" value="5"/>
                                                            <div class="face"></div>
                                                            <i class="far fa-star star five-star"></i>
                                                        </label>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <!-- review form -->

                                        <div class="form-group">
                                            <label for="message">Write your reviews</label>
                                            <form:textarea type="radio" class="form-control" rows="3" id="content" name="content" path="contentReview"></form:textarea>
                                            <p style="color:red" id="errContent"></p>  
                                        </div>
                                        <form:button onclick="return onHandle();" style="margin-bottom:20px;background-color:#754110;color:white"  class="form-control">Send</form:button>

                                    </form:form>

                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="aa-product-details-bottom">
                        <ul class="nav nav-tabs aa-products-tab" id="myTab2">
                        </ul>

                        <!-- Tab panes -->
                        <div class="tab-content">

                            <div class="tab-pane fade in active" id="review">
                                <div class="aa-product-review-area">                                  

                                </div>
                            </div>            
                        </div>
                    </div>

                    <!-- Related product -->
                </div>
            </div>
            <div class="row">
                <center>

                </center>
            </div>
        </div>
    </div>
</section>
<!-- / product category -->
<!--  end content-->

<!--  footer-->
<jsp:include page = "footer.jsp" flush = "true" />
<!-- end footer-->


