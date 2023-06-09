<%-- 
    Document   : users_list
    Created on : Apr 26, 2022, 11:29:51 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- Start header section -->

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"  rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <link href="<%=request.getContextPath()%>/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom styles for this page -->

    </head>
    <body>
        <script language="javascript">
            $(document).ready(function () {
                $('#dataOrderDetail').DataTable({

                });
            });
        </script>
        <jsp:include page="header.jsp"/>

        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <center><h2>Finished Order List</h2></center>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped" id="dataOrderDetail" width="100%" cellspacing="0">
                                <thead>
                                    <tr class="">
                                        <th scope="col">Product Image</th>
                                        <th scope="col">Product Name</th>
                                        <th scope="col">Product Price($)</th>
                                        <th scope="col">Quantity</th> 

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${orderProductList}">
                                        <tr class="">
                                            <td ><a href="${pageContext.request.contextPath}/user/showproductdetail?pId=${item[4]}"><img width="100px" height="100px" src="${pageContext.request.contextPath}/resources/user/images/products/${item[0]}"/></a></td>

                                            <td style="padding-top:39px"><div  >${item[1]}</div></td> 
                                            <td style="padding-top:39px">${item[2]}</td>


                                            <td style="padding-top:39px"><div  >${item[3]}</div></td>

                                            
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
