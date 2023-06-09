<%-- 
    Document   : index
    Created on : May 5, 2022, 10:57:00 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Start header section -->
<jsp:include page = "main-header.jsp" flush = "true" />
<!-- / header section -->

<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/resources/user/images/products/contact-banner.png" alt="banner liên hệ">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2><fmt:message key="contact.contact"/></h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/"><fmt:message key="contact.homepage"/></a></li>         
                    <li style="color:#fff"><fmt:message key="contact.contact"/></li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->
<!-- start contact section -->
<section id="aa-contact">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-contact-area">
                    <div class="aa-contact-top">
                        <h2><fmt:message key="contact.word1"/></h2>
                        <p><fmt:message key="contact.word2"/></p>
                    </div>

                    <!-- Contact address -->
                    <div class="aa-contact-address">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="aa-contact-map">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d491.0990809056583!2d105.77974962035532!3d10.03396254026976!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a0881f9a732075%3A0xfa43fbeb2b00ca73!2sCUSC%20-%20Cantho%20University%20Software%20Center!5e0!3m2!1svi!2s!4v1653551845771!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="aa-contact-address-right">
                                    <address>
                                        <h4><fmt:message key="contact.namecom"/></h4>
                                        <p><fmt:message key="contact.word3"/></p>
                                        <p><span class="fa fa-home"></span> <fmt:message key="contact.address"/></p>
                                        <p><span class="fa fa-phone"></span>+84 0292 373 1072</p>
                                        <p><span class="fa fa-envelope"></span>Email: pqanha19084@cusc.ctu.edu.com</p>
                                    </address>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--  end content-->

<!--  footer-->
<jsp:include page = "footer.jsp" flush = "true" />
<!-- end footer-->



