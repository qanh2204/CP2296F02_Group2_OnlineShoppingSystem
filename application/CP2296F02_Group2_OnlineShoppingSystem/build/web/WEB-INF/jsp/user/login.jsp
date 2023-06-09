<%-- 
    Document   : index
    Created on : May 5, 2022, 10:57:00 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="<%=request.getContextPath()%>/resources/user/js/login.js" type="text/javascript"></script>
<!-- Start header section -->
<jsp:include page = "main-header.jsp" flush = "true" />
<!-- / header section -->
<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="<%=request.getContextPath()%>/resources/user/images/products/archive-banner.png" alt="banner blog">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2><fmt:message key="pass.Login"/></h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/"><fmt:message key="contact.homepage"/></a></li>                   
                    <li style="color:#fff"><fmt:message key="pass.Login"/></li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- / catg header banner section -->

<!-- Cart view section -->
<section id="aa-myaccount">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-myaccount-area">         
                    <div class="row">
                        <div class="col-md-8 col-md-push-2">
                            <div class="aa-myaccount-login">
                                <h4><fmt:message key="pass.Login"/></h4>
                                <form action="<%=request.getContextPath()%>/user/login" method="post" class="aa-login-form" >
                                    <label for=""><fmt:message key="pass.Username"/><span>*</span></label>
                                    <input type="text" placeholder="Username" name="username" id="username">
                                    <p style="color:red; display:block" id="errUsername">
                                       
                                    </p>
                                    <label for=""><fmt:message key="pass.Password"/><span>*</span></label>
                                    <input type="password" placeholder="Password" name="password" id="password">
                                     <p style="color:red; display:block" id="errPassword">
                                    <p class="rememberme" style="display: block"> <a href="<%=request.getContextPath()%>/user/forgetpassword"><fmt:message key="pass.fyp"/>?</a>
</p> 

                                    
                                    <button type="submit" onclick="return checkValidateLogin();" class="aa-browse-btn"><fmt:message key="pass.Login"/></button>
                                </form>
                            </div>
                           
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


