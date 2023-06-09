<%-- 
    Document   : edit_category
    Created on : Apr 21, 2022, 10:29:40 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title><fmt:message key="topheader.title"/></title>
        <script src="${pageContext.request.contextPath}/resources/admin/js/category.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <form:form action="${pageContext.request.contextPath}/admin/processupdatecategory" method="Post" modelAttribute="UpdateCategoryForm">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <center><h5><fmt:message key="admin.Update"/> <fmt:message key="admin.Category"/></h5></center>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.CategoryName"/></label>
                </div>             
                <div class="col-md-6">
                    <input type="hidden" value="${cId}" name="cid" />
                    <form:input path="categoryName" id="categoryName" value="${categoryN}" cssClass="form-control" tabindex="1"/>
                    <form:errors path="categoryName" cssStyle="color:red;"/>
                    <p style="color:red;" id="errCategoryName"></p>
                    <p style="color:red;" >${err}</p>
                </div>

            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label><fmt:message key="admin.Status"/></label>
                </div>        
                <div class="col-md-6">

                    <form:select path="status" cssClass="form-control">
                        <c:choose>
                            <c:when test="${categoryStatus=='Inactive'}">
                                <form:option value="1">Unable</form:option>
                                <form:option value="0">Enable</form:option>

                            </c:when>
                            <c:otherwise>
                                <form:option value="0">Enable</form:option>
                                <form:option value="1">Unable</form:option>
                            </c:otherwise>
                        </c:choose>
                    </form:select>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-3">

                </div>
                <div class="col-md-8">
                    <form:button value="" class="btn btn-success" onclick="return checkValidateCategoryForm();"><fmt:message key="admin.Update"/></form:button>
                    </div>
                </div>
            </div>
    </form:form>
</body>
</html>
