<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title><fmt:message key="topheader.title"/></title>
        <script src="<%=request.getContextPath()%>/resources/user/js/forgetpassword.js" type="text/javascript"></script>
        <!-- Custom fonts for this template-->
        <link href="<%=request.getContextPath()%>/resources/admin/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="<%=request.getContextPath()%>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet" type="text/css"/>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>     
    

        <script>
            $(document).ready(function () {
                if (${success=="yes"}) {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Please check your email and reset your password.',
                        showConfirmButton: false,
                        timer: 6000
                    })

                }

            });
        </script>
    </head>

    <body class="bg-gradient-primary" style=" background-color: white;
          background-image: linear-gradient(180deg,#ecf1ff 10%,#ffffff 100%);
          background-size: cover;
          ">

        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-password-image" style="background-image: url('${pageContext.request.contextPath}/resources/user/images/products/introduce_thuc_pham_sach.png')"></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-2"><fmt:message key="pass.fyp"/>?</h1>
                                            <p class="mb-4"><fmt:message key="pass.word"/>!</p>
                                        </div>
                                        <form:form action="${pageContext.request.contextPath}/sendemail" method="post" modelAttribute="ForgetPasswordForm">
                                            <div class="form-group">
                                                <form:input path="email" id="email" class="form-control form-control-user"  placeholder="Enter Email Address..."/>
                                                <p id="errEmail" style="color:red"></p>
                                                <p style="color:red">${errExist}</p>
                                            </div>
                                            <form:button onclick="return checkValidate();" class="btn btn-primary btn-user btn-block"><fmt:message key="pass.Reset"/> <fmt:message key="pass.Password"/></form:button>
                                        </form:form>                      
                                        <hr>
                                        <div class="text-center">
                                            <a class="small" href="${pageContext.request.contextPath}/user/register"><fmt:message key="pass.caa"/>!</a>
                                        </div>
                                        <div class="text-center">
                                            <a class="small" href="${pageContext.request.contextPath}/user/login"><fmt:message key="pass.ahaa"/>? <fmt:message key="pass.Login"/>!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <script src="<%=request.getContextPath()%>/resources/admin/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/resources/admin/vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>


        <script src="<%=request.getContextPath()%>/resources/admin/js/sb-admin-2.min.js" type="text/javascript"></script>


    </body>

</html>