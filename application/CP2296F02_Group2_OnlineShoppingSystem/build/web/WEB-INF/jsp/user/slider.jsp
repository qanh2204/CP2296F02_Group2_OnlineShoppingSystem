<%-- 
    Document   : slider
    Created on : May 5, 2022, 11:56:52 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section id="aa-slider">
    <div class="aa-slider-area">
        <div id="sequence" class="seq">
            <div class="seq-screen">
                <ul class="seq-canvas">
                    <!-- single slide item -->
                    <li>
                        <div class="seq-model">
                            <img data-seq src="<%=request.getContextPath()%>/resources/user/images/products/slide_1.jpg" alt="Men slide img" />
                        </div>
                        <div class="seq-title">
                            <span data-seq><fmt:message key="slider.onsale"/> 50%</span>                
                            <h2 data-seq><fmt:message key="slider.nuts"/></h2>                
                            <p data-seq><fmt:message key="slider.nutssologan"/></p>
                            <a data-seq href="${pageContext.request.contextPath}/product" class="aa-shop-now-btn aa-secondary-btn"><fmt:message key="slider.viewproduct"/></a>
                        </div>
                    </li>
                    <!-- single slide item -->
                    <li>
                        <div class="seq-model">
                            <img data-seq src="<%=request.getContextPath()%>/resources/user/images/products/slide_2.jpg" alt="Wristwatch slide img" />
                        </div>
                        <div class="seq-title">
                            <span data-seq><fmt:message key="slider.onsale"/> 20%</span>                
                            <h2 data-seq><fmt:message key="slider.vegetables"/></h2>                
                            <p data-seq><fmt:message key="slider.vegetablessologan"/></p>
                            <a data-seq href="${pageContext.request.contextPath}/product" class="aa-shop-now-btn aa-secondary-btn"><fmt:message key="slider.viewproduct"/></a>
                        </div>
                    </li>
                    <!-- single slide item -->
                    <li>
                        <div class="seq-model">
                            <img data-seq src="<%=request.getContextPath()%>/resources/user/images/products/slide_3.jpg" alt="Women Jeans slide img" />
                        </div>
                        <div class="seq-title">
                            <span data-seq><fmt:message key="slider.onsale"/> 33%</span>                
                            <h2 data-seq><fmt:message key="slider.fruits"/></h2>                
                            <p data-seq><fmt:message key="slider.fruitssologan"/></p>
                            <a data-seq href="${pageContext.request.contextPath}/product" class="aa-shop-now-btn aa-secondary-btn"><fmt:message key="slider.viewproduct"/></a>
                        </div>
                    </li>
                    <!-- single slide item -->           
                    <li>
                        <div class="seq-model">
                            <img data-seq src="<%=request.getContextPath()%>/resources/user/images/products/slide_4.jpg" alt="Shoes slide img" />
                        </div>
                        <div class="seq-title">
                            <span data-seq><fmt:message key="slider.onsale"/> 25%</span>                
                            <h2 data-seq><fmt:message key="slider.honey"/></h2>                
                            <p data-seq><fmt:message key="slider.honeysologan"/></p>
                            <a data-seq href="${pageContext.request.contextPath}/product" class="aa-shop-now-btn aa-secondary-btn"><fmt:message key="slider.viewproduct"/></a>
                        </div>
                    </li>                   
                </ul>
            </div>
            <!-- slider navigation btn -->
            <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
                <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
                <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
            </fieldset>
        </div>
    </div>
</section>
