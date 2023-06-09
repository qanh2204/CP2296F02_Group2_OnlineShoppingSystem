<%-- 
    Document   : products
    Created on : Apr 18, 2022, 10:29:03 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"  rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

        <!-- Custom styles for this template -->


        <link href="<%=request.getContextPath()%>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <script language="javascript">
            $(document).ready(function () {
                $('#dataProduct').DataTable({

                });
            });
        </script>
        <jsp:include page="header.jsp"/>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <center><h2>Review List</h2></center>
            </div>
            <div class="card-header py-3">
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataProduct" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Review Id</th>
                                <th>Customer</th>
                                <th>Product Name</th>
                                <td>Review Date</td>
                                <th>Star</th>
                                <th>Comment</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="item" items="${reviewList}">


                                <tr>
                                    <td>${item.reviewId}</td>
                                    <td>

                                        <c:forEach var="user" items="${userList}">
                                            <c:if test="${user.id==item.userId}">
                                                ${user.username}
                                            </c:if>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <c:forEach var="product" items="${productList}">
                                            <c:if test="${product.productId==item.productId}">
                                                ${product.productName}
                                            </c:if>
                                        </c:forEach>

                                    </td>
                                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${item.reviewDate}" /></td>
                                    <td>
                                        ${item.star}
                                    </td>
                                    <td>
                                        ${item.contentReview}
                                    </td>
                                </tr>

                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>


        <script src="<%=request.getContextPath()%>/resources/admin/vendor/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js" type="text/javascript"></script>

    </body>
</html>
