<%-- 
    Document   : update_product
    Created on : Apr 25, 2022, 3:41:25 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key="topheader.title"/></title>
        <script src="${pageContext.request.contextPath}/resources/admin/js/product.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <form:form action="${pageContext.request.contextPath}/admin/processupdateproduct" enctype="multipart/form-data" method="post" modelAttribute="UpdateProductForm">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <center><h5><fmt:message key="admin.Update"/> <fmt:message key="admin.Product"/></h5></center>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.ProductName"/></label>
                </div>             
                <div class="col-md-6">
                    <input type="hidden" name="pid" value="${pId}"/>
                    <form:input path="productName" id="productName" value="${productName}" cssClass="form-control" tabindex="1"/>
                    <form:errors path="productName" cssStyle="color:red;"/>
                    <p style="color:red;" id="errProductName"></p>
                    <p style="color:red;" >${err}</p>

                </div>

            </div>

            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.Image"/> <fmt:message key="admin.Product"/></label>
                </div>             
                <div class="col-md-6">
                    <img src="${pageContext.request.contextPath}/resources/user/images/products/${im}" width="50%" />
                    <input type="hidden" name="imageOld" value="${im}"/>
                    <input type="file" id="productImage" name="imageP" cssClass="form-control" tabindex="2"/>
                    <p style="color:red;">${err}</p>

                </div>

            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.Category"/></label>
                </div>             
                <div class="col-md-6">
                    <form:select path="categoryId"  cssClass="form-control"  tabindex="3">
                        <form:option value="0">Chọn loại sản phẩm</form:option>
                        <c:forEach items="${categoryList}" var="item">
                            <form:option value="${item.categoryId}">${item.categoryName}</form:option>
                        </c:forEach>                
                    </form:select>
                    <form:errors path="categoryId" cssStyle="color:red;"/>

                </div>

            </div>

            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.ProductPrice"/>($):</label>
                </div>             
                <div class="col-md-6">
                    <form:input path="productPrice" id="productPrice" value="${price}" cssClass="form-control" tabindex="4"/>
                    <form:errors path="productPrice" cssStyle="color:red;"/>
                </div>

            </div>

            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.Description"/>:</label>
                </div>             
                <div class="col-md-6">
                    <form:input value="${description}" id="description" cssStyle="height:100px;" path="description" cssClass="form-control" tabindex="5"/>
                    <form:errors path="description" cssStyle="color:red;"/>
                </div>

            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.Quantity"/>:</label>
                </div>             
                <div class="col-md-6">
                    <form:input path="quantity" id="quantity" value="${quantity}" cssClass="form-control" tabindex="6"/>
                    <form:errors path="quantity" cssStyle="color:red;"/>
                </div>

            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.Update"/> <fmt:message key="admin.Date"/>:</label>
                </div>             
                <div class="col-md-6">
                    <form:input path="updateDate" id="updateDate" value="${dateUpdate}" cssClass="form-control" tabindex="6"/>
                    <form:errors path="updateDate" cssStyle="color:red;"/>
                </div>

            </div>
            <div class="form-group row">
                <div class="col-md-3">

                </div>
                <div class="col-md-8">
                    <form:button  class="btn btn-success" onclick="return check();"><fmt:message key="admin.Update"/></form:button>
                    </div>
                </div>
            </div>
    </form:form>
</body>
</html>
