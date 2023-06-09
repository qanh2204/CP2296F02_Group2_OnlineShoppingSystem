<%-- 
    Document   : index
    Created on : May 5, 2022, 10:57:00 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Start header section -->
<jsp:include page = "main-header.jsp" flush = "true" />
<!-- / header section -->
<!--  content -->
<script src="<%=request.getContextPath()%>/resources/user/js/forgetpassword.js" type="text/javascript"></script>
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="<%=request.getContextPath()%>/resources/user/images/products/archive-banner.png" alt="banner blog">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Reset Password</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/"><fmt:message key="contact.homepage"/></a></li>                   
                    <li style="color:#fff"><fmt:message key="pass.Reset"/> <fmt:message key="pass.Password"/></li>
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
                            <div class="aa-myaccount-register">                 
                                <h4><fmt:message key="pass.Reset"/> <fmt:message key="pass.Password"/></h4>
                                <form:form class="signin-form" action="${pageContext.request.contextPath}/updatepassword" method="post" modelAttribute="ResetPasswordForm">

                                    <div class="form-group mb-3">
                                        <form:password path="password" class="form-control" placeholder="Password" id="password"/>
                                        <input type="hidden" name="token" value="${token}"/>
                                        <input type="hidden" name="email" value="${email}"/>
                                        <p style="color:red; display:block" id="errPassword">

                                    </div>

                                    <div class="form-group mb-3">
                                        <input type="password"  class="form-control" placeholder="Re-password" id="repassword"/>
                                        <input type="hidden" name="token" value="${token}"/>
                                        <input type="hidden" name="email" value="${email}"/>
                                        <p style="color:red; display:block" id="errRePassword">

                                    </div>
                                    <div class="form-group">
                                        <form:button onclick="return checkResetPasswordForm();" class="form-control btn btn-primary rounded submit px-3">Update</form:button>
                                        </div>
                                        
                                    </div>
                                </form:form>    
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


