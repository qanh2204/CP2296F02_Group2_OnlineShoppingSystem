<%-- 
    Document   : add_product
    Created on : Apr 18, 2022, 11:59:01 PM
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
        <link href="<c:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />" rel="stylesheet">
        <script src="<c:url value="http://code.jquery.com/jquery-1.11.1.min.js" />"></script>
        <script src="<c:url value="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" />"></script>
        <script src="${pageContext.request.contextPath}/resources/admin/js/product.js" type="text/javascript"></script>
        <script>
            $(function(){
                $("#productPrice").val("");
                  $("#quantity").val("");
            });
            

        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <form:form action="${pageContext.request.contextPath}/admin/proccessaddproduct" enctype="multipart/form-data" method="post" modelAttribute="AddProductForm" >
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <center><h5><fmt:message key="admin.Add"/> <fmt:message key="admin.New"/> <fmt:message key="admin.Product"/></h5></center>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.ProductName"/></label>
                </div>             
                <div class="col-md-6">
                    <form:input path="productName" id="productName"   cssClass="form-control"  tabindex="1"/>
                    <p style="color:red;" id="errProductName"></p>

                </div>

            </div>

            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.Image"/> <fmt:message key="admin.Product"/></label>
                </div>             
                <div class="col-md-6">
                    
                    <form:input path="imageProduct" id="productImage" type="file" name="imageProduct" cssClass="form-control" tabindex="2"/>
                    <p style="color:red;" id="errProductImage"></p>

                </div>

            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.Category"/></label>
                </div>
                <div class="col-md-6">
                    <form:select path="categoryId" id="category" cssClass="form-control">

                        <c:forEach items="${categoryList}" var="itemCategory">
                            <form:option value="${itemCategory.categoryId}">${itemCategory.categoryId} - ${itemCategory.categoryName}</form:option>
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
                    <form:input path="productPrice" id="productPrice" cssClass="form-control" tabindex="4"/>
                    <form:errors path="productPrice" cssStyle="color:red;"/>
                    <p style="color:red;" id="errProductPrice"></p>
                </div>

            </div>

            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.Description"/></label>
                </div>             
                <div class="col-md-6">
                    <form:textarea path="description" id="description" cssClass="form-control" tabindex="5"/>
                    <form:errors path="description" cssStyle="color:red;"/>
                    <p style="color:red;" id="errDescription"/>
                </div>

            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.Quantity"/></label>
                </div>             
                <div class="col-md-6">
                    <form:input path="quantity" id="quantity" cssClass="form-control" tabindex="6"/>
                    <form:errors path="quantity" cssStyle="color:red;"/>
                    <p style="color:red;" id="errQuantity"></p>
                </div>

            </div>

            <div class="form-group row">
                <div class="col-md-3">

                </div>
                <div class="col-md-8">
                    <form:button  class="btn btn-success" onclick="return check();"><fmt:message key="admin.Add"/></form:button>
                    </div>
                </div>
            </div>
    </form:form>
</body>
<script>

</script>
</html>
