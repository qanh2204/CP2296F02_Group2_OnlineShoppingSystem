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
<script src="${pageContext.request.contextPath}/resources/user/js/register.js" type="text/javascript"></script>
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
    <img src="<%=request.getContextPath()%>/resources/user/images/products/archive-banner.png" alt="banner blog">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2>Sign up</h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/"><fmt:message key="contact.homepage"/></a></li>                   
                    <li style="color:#fff"><fmt:message key="pass.Signup"/></li>
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
                                <h4><fmt:message key="pass.Signup"/></h4>
                                <form:form class="signin-form" action="${pageContext.request.contextPath}/user/processRegister.htm" method="post" modelAttribute="RegisterForm">
                                    <div class="form-group mb-3">
                                        <label class="label" for="name"><fmt:message key="pass.Username"/></label>
                                        <form:input path="username" onchange="return onchangeUsername();" class="form-control" placeholder="Username" id="username"/>
                                        <p style="color:red; display:block" id="errUsername">
                                        <p style="color:red; display:block">${errUname}</p>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name"><fmt:message key="pass.Password"/></label>
                                        <form:password path="password" onchange="return onchangePassword();" class="form-control" placeholder="Password" id="password"/>
                                        <p style="color:red; display:block" id="errPassword">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name"><fmt:message key="pass.Password"/></label>
                                        <input type="password" class="form-control" onchange="return onchangeRepassword();" placeholder="Re-password" id="repassword"/>
                                        <p style="color:red; display:block" id="errRePassword">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name"><fmt:message key="pass.Birthday" /></label>
                                        <input type="date" name="birthday" id="birthday" onchange="return onchangeBirthday();" class="form-control"/>
                                        <p style="color:red; display:block" id="errBirthday">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name"><fmt:message key="pass.Address"/></label>
                                        <form:input path="address" id="address" class="form-control" onchange="return onchangeAddress();" placeholder="Address"/>
                                        <p style="color:red; display:block" id="errAddress">

                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name"><fmt:message key="pass."/>Email</label>
                                        <form:input path="email" id="email" class="form-control" onchange="return onchangeEmail();" placeholder="Email"/>
                                        <p style="color:red; display:block" id="errEmail">
                                        <p style="color:red; display:block">${errE}</p>

                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name"><fmt:message key="pass.Gender"/></label>
                                        <form:select path="gender"  class="form-control">
                                            <form:option value="0">Female</form:option>
                                            <form:option value="1">Male</form:option>
                                        </form:select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label class="label" for="name"><fmt:message key="pass.Phone"/></label>
                                        <form:input path="phone" id="phone" class="form-control" placeholder="Phone" onchange="return onchangePhone();"/>
                                        <p style="color:red; display:block" id="errPhone">

                                    </div>
                                    <div class="form-group">
                                        <form:button onclick="return checkValidateRegisterForm();" class="form-control btn btn-primary rounded submit px-3"><fmt:message key="pass.Register"/></form:button>
                                        </div>
                                        <div class="form-group d-md-flex">

                                            <div class="w-50 text-md-right">
                                                <a href="#"><fmt:message key="pass.chtl"/></a>
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


