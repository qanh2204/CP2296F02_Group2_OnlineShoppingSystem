<%-- 
    Document   : update-order
    Created on : Sep 20, 2022, 10:10:22 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">

        <title>JSP Page</title>
        <script>
            $(function () {
                $('#datetimepicker1').datetimepicker();
            });
            function handleUpdate(){
                var date = document.getElementById("deliveryDate").value;
                if (date == "") {
                    document.getElementById("err").innerHTML = "Please choose delivery date!";
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <form:form action="${pageContext.request.contextPath}/admin/processupdate" method="Post" modelAttribute="OrderUpdateForm">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <center><h5>Update Order</h5></center>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label>Delivery Date</label>
                </div>             
                <div class="col-md-6">
                    <input type="hidden" value="${orderId}" name="orderId" />

                    <input type="date" class="form-control"  name="deliveryDate" id="deliveryDate"  pattern="\d{1,2}/\d{1,2}/\d{4}"/>
                    <p style="color:red;" id="err"></p>
                </div>

            </div>
            <div class="form-group row">
                <div class="col-md-1">
                </div>
                <div class="col-md-2">
                    <label>Status</label>
                </div>        
                <div class="col-md-6">

                    <form:select path="status" cssClass="form-control" >

                        <form:option value="2">Finished</form:option>


                    </form:select>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-3">

                </div>
                <div class="col-md-8">
                    <form:button onclick="return handleUpdate();" class="btn btn-success">Update</form:button>
                    </div>
                </div>
            </div>
    </form:form>
</body>
</html>
