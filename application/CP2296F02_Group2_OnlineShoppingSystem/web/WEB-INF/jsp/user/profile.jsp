<%-- 
    Document   : profile
    Created on : Sep 12, 2022, 10:13:37 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<script src="${pageContext.request.contextPath}/resources/user/js/register.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page = "main-header.jsp"  />
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="container" >
                        <div class="row">
                            <div class="col-md-12">
                                <h2 style="text-align: center">Profile</h2>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p style="color:red" >${err}</p>
                                            <form:form method="post" modelAttribute="UpdateProfileForm" action="${pageContext.request.contextPath}/users/updateprofile">
                                                <div class="form-group row">
                                                    <label
                                                        for="staticEmail"
                                                        class="col-sm-2 col-form-label"
                                                        >
                                                        Username
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <form:input path="username" class="form-control" id="username" value="${username}" readonly="true"/>

                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label for="" class="col-sm-2 col-form-label">
                                                        Birthday
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <input value="${birthday}"
                                                               type="date"
                                                               class="form-control"
                                                               name="birthday" id="birthday"
                                                               />

                                                        <p style="color:red; display:block" id="errBirthday">

                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label
                                                        for="address"
                                                        class="col-sm-2 col-form-label"
                                                        >
                                                        Address
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <form:input path="address"
                                                                    value="${address}"
                                                                    class="form-control"
                                                                    id="address"
                                                                    />
                                                        <p style="color:red; display:block" id="errAddress">

                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label
                                                        for="phone"
                                                        class="col-sm-2 col-form-label"
                                                        >
                                                        Phone
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <form:input path="phone" value="${phone}"
                                                                    class="form-control"
                                                                    id="phone"
                                                                    />
                                                        <p style="color:red; display:block" id="errPhone">

                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label
                                                        for="email"
                                                        class="col-sm-2 col-form-label"
                                                        >
                                                        Email
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <form:input path="email" value="${email}"

                                                                    class="form-control"
                                                                    id="email"
                                                                    />
                                                        <p style="color:red; display:block" id="errEmail">

                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label
                                                        for="email"
                                                        class="col-sm-2 col-form-label"
                                                        >
                                                        Gender
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <c:if test="${gender==0}">
                                                            <form:select class="form-control" path="gender" value="${gender}">
                                                                <form:option value="0">Female</form:option>
                                                                <form:option value="1">Male</form:option>

                                                            </form:select>
                                                        </c:if>
                                                        <c:if test="${gender==1}">
                                                            <form:select class="form-control" path="gender" value="${gender}">
                                                                <form:option value="1">Male</form:option>
                                                                <form:option value="0">Female</form:option>
                                                            </form:select>
                                                        </c:if>

                                                    </div>
                                                </div>
                                                <center style="margin-bottom: 20px">
                                                    <form:button
                                                      onclick="return checkValidateProfileForm();"
                                                        class="aa-browse-btn"
                                                        >
                                                        Update
                                                    </form:button>
                                                </center>
                                            </form:form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page = "footer.jsp"  />

    </body>
</html>
