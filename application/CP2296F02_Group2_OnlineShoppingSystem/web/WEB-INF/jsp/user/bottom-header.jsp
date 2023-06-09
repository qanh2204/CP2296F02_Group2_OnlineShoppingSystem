<%-- 
    Document   : bottomHeader
    Created on : May 5, 2022, 11:14:19 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="<%=request.getContextPath()%>/resources/user/css/style.css" rel="stylesheet" type="text/css"/>
<div class="aa-header-bottom">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-header-bottom-area">
                    <!-- logo  -->
                    <div class="aa-logo">
                        <!-- Text based logo -->
                        <!--                <a href="index.jsp">
                                          <span class="fa fa-shopping-cart"></span>
                                          <p>daily<strong>Shop</strong> <span>Your Shopping Partner</span></p>
                                        </a>-->
                        <!-- img based logo -->
                        <a href="${pageContext.request.contextPath}/"><img src="<%=request.getContextPath()%>/resources/user/images/logo.png" alt="logo img" width="100%"></a> 
                    </div>
                    <!-- / logo  -->
                    <!-- Shipping service -->
                    <div class="aa-shipping-box">
                        <a class="aa-shipping-boxsmall">
                            <span class="aa-shipping-boxsmall-icon fas fa-shipping-fast"></span>
                            <span class="aa-shipping-box-text">
                                <div class="aa-shipping-title"><fmt:message key="bottomheader.freeship"/></div>
                                <div class=""><fmt:message key="bottomheader.canthoarea"/></div>
                            </span>

                        </a>
                        <a class="aa-shipping-boxsmall">
                            <span class="aa-shipping-boxsmall-icon fas fa-phone"></span>
                            <span class="aa-shipping-box-text">
                                <div class="aa-shipping-title"><fmt:message key="bottomheader.support"/>: +84 0292 373 1072</div>
                                <div class=""><fmt:message key="bottomheader.consultation24"/></div>
                            </span>

                        </a>
                        <a class="aa-shipping-boxsmall">
                            <span class="aa-shipping-boxsmall-icon fas fa-shipping-fast"></span>
                            <span class="aa-shipping-box-text">
                                <div class="aa-shipping-title"><fmt:message key="bottomheader.nationwidedelivery"/></div>
                                <div class=""><fmt:message key="bottomheader.guaranteedprestigeandquality"/></div>
                            </span>

                        </a>
                    </div>
                    <!-- cart box -->
                    <div class="aa-cartbox">
                        <a class="aa-cart-link" href="${pageContext.request.contextPath}/user/showshoppingcart">
                            <span class="fas fa-cart-arrow-down"></span>
                            <span style="font-size:10px" class="aa-cart-title"><fmt:message key="bottomheader.cart"/>
                            (<c:choose>
                                    <c:when test="${sessionScope.myCartNum==null}">
                                        0
                                    </c:when>
                                    <c:otherwise>
                                        ${sessionScope.myCartNum}

                                    </c:otherwise>
                                </c:choose>)
                            </span>

                            


                        </a>
                    </div>
            </div>
        </div>
    </div>
</div>

