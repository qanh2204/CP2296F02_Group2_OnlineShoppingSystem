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
                <center><h2><fmt:message key="admin.ProductsList"/></h2></center>
            </div>
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary"><a href="<%=request.getContextPath()%>/admin/addproduct"><fmt:message key="admin.Add"/> <fmt:message key="admin.New"/> <fmt:message key="admin.Product"/></a></h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataProduct" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th><fmt:message key="admin.Product"/> Id</th>
                                <th>Product Image</th>
                                <th><fmt:message key="admin.ProductName"/></th>
                                 <th>Product Price</th>
                                <th>Total Star($)</th>
                                <td><fmt:message key="admin.Status"/></td>
                                <th><fmt:message key="admin.Action"/></th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="itemProduct" items="${productsList}">


                                <tr>
                                    <td>${itemProduct.productId}</td>
                                    <td><img src="${pageContext.request.contextPath}/resources/user/images/products/${itemProduct.imageProduct}" width="50%"/></td>
                                    <td>${itemProduct.productName}</td>
                                    <td>${itemProduct.productPrice}</td>
                                    <td>${itemProduct.totalStar}</td>

                                    <td>
                                        <c:choose>
                                            <c:when test="${itemProduct.status==0}">
                                                <c:out value="Enable"/>
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="Unable"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                         <c:choose>
                                            <c:when test="${itemProduct.status==0}">
                                                <a href="<%=request.getContextPath()%>/admin/addimageproduct?pid=${itemProduct.productId}"><i class="bi bi-images"></i></a>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:out value=""/>
                                                </c:otherwise>
                                            </c:choose>
                                        <c:choose>
                                            <c:when test="${itemProduct.status==0}">
                                                <a href="<%=request.getContextPath()%>/admin/updateproduct?pid=${itemProduct.productId}"><i class="bi bi-pencil-square"></i></a>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:out value=""/>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${itemProduct.status==0}">
                                                <a href="#myModal_${itemProduct.productId}" data-toggle="modal"><i class="bi bi-trash3"></i></a>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:out value="Deleted"/>
                                                </c:otherwise>
                                            </c:choose>
                                                

                                    </td>
                                </tr>
                            <div id="myModal_${itemProduct.productId}" class="modal fade">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>                                      
                                        </div>

                                        <div class="modal-body">
                                            <p><fmt:message key="admin.Areyousure"/></p>
                                        </div>
                                        <div class="modal-footer">

                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Close"/>

                                            <a href="<%=request.getContextPath()%>/admin/deleteproduct?pId=${itemProduct.productId}" class="btn btn-danger" title="Delete"><i class="fa fa-trash-o"></i><fmt:message key="admin.Delete"/></a>

                                        </div>
                                    </div>
                                </div>
                            </div>  
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
