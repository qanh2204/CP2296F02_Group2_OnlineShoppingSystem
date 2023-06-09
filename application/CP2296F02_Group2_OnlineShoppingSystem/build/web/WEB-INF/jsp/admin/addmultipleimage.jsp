<%-- 
    Document   : add_category
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
        <script src="${pageContext.request.contextPath}/resources/admin/js/category.js" type="text/javascript"></script>
        <script>
            function addImage() {
                var image = document.getElementById('imageProduct');
                var formData = new FormData();
                formData.append('imageProduct', image);
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/addimage',
                    type: 'put',
                    data: formData,
                    contentType: false,
                    processData: false,
                    async: true,
                    success: function (data) {
                        console.log("success");
                        console.log(data);
                    },
                    error: function (data) {
                        console.log("error");
                        console.log(data);
                    }
                });
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <center><h5><fmt:message key="admin.Add"/> <fmt:message key="admin.Category"/></h5></center>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.CategoryName"/></label>
                </div>             
                <div class="col-md-6">

                    <input id="productImage" type="file" name="imageProduct" cssClass="form-control" tabindex="2" multiple/>
                    <p style="color:red;" id="errProductImage"></p>

                </div>

            </div>

            <div class="form-group row">
                <div class="col-md-3">

                </div>
                <div class="col-md-8">
                    <button  class="btn btn-success" onclick="addImage()"><fmt:message key="admin.Add"/></button>
                </div>
            </div>
        </div>
    
            </body>
            </html>
