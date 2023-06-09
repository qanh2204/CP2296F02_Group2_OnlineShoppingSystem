<%-- 
    Document   : header
    Created on : Apr 15, 2022, 9:13:54 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title><fmt:message key="topheader.title"/></title>

        <!-- Custom fonts for this template-->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"  rel="stylesheet">
        <link href="<%=request.getContextPath()%>/resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom styles for this template-->
        <link href="<%=request.getContextPath()%>/resources/admin/css/sb-admin-2.min.css" rel="stylesheet" type="text/css"/>

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">

                    <div class="sidebar-brand-text mx-3">Agricultural 24h<sup></sup></div>
                </a>
                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="<%=request.getContextPath()%>/admin/homepageadmin">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span><fmt:message key="admin.Dashboard"/></span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/admin/userlist">
                        <i class="fas fa-fw fa-table"></i>
                        <span><fmt:message key="admin.Manage"/> <fmt:message key="admin.Users"/></span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/admin/categoryPage">
                        <i class="fas fa-fw fa-table"></i>
                        <span><fmt:message key="admin.Manage"/> <fmt:message key="admin.Category"/></span></a>
                </li>
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span><fmt:message key="admin.Manage"/> <fmt:message key="admin.Product"/></span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="<%=request.getContextPath()%>/admin/productPage"><fmt:message key="admin.Product"/></a>
                            <a class="collapse-item" href="<%=request.getContextPath()%>/admin/reviewlist"><fmt:message key="admin.Review"/></a>
                        </div>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseThree"
                       aria-expanded="true" aria-controls="collapseThree">
                        <i class="fas fa-fw fa-cog"></i>
                        <span><fmt:message key="admin.Manage"/> <fmt:message key="admin.Orders"/></span>
                    </a>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <a class="collapse-item" href="<%=request.getContextPath()%>/admin/orderlist"><fmt:message key="admin.Finished"/> </a>
                            <a class="collapse-item" href="<%=request.getContextPath()%>/admin/unfinishedorderlist"><fmt:message key="admin.Unfinished"/> </a>
                            <a class="collapse-item" href="<%=request.getContextPath()%>/admin/ordercancellist">Cancelled</a>
                       
                        </div>
                    </div>
                </li>
                <!-- Nav Item - Utilities Collapse Menu -->


                <!-- Nav Item - Charts -->


                <!-- Nav Item - Tables -->

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>



            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                       
                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                     aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Search for..." aria-label="Search"
                                                   aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Nav Item - Change Lang -->
                         
                        
                                   <a href="?lang=vi" style="margin-top:20px;text-decoration: none"><img src="<%=request.getContextPath()%>/resources/user/img/flag/vietnam.png" alt="vietnam flag"><fmt:message key="topheader.vn"/></a><br/>
                                   &nbsp; &nbsp; &nbsp; &nbsp;   <a href="?lang=en"  style="margin-top:20px;text-decoration: none"><img src="<%=request.getContextPath()%>/resources/user/img/flag/english.jpg" alt="english flag"><fmt:message key="topheader.en"/></a>
                                                       
                                
                           
                            
                            
                            <!-- Nav Item - Messages -->
                            <li class="nav-item dropdown no-arrow mx-1">
                                <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <!-- Counter - Messages -->
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="messagesDropdown">
                                    <h6 class="dropdown-header">
                                        Message Center
                                    </h6>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                                 alt="...">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div class="font-weight-bold">
                                            <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                                problem I've been having.</div>
                                            <div class="small text-gray-500">Emily Fowler · 58m</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                                 alt="...">
                                            <div class="status-indicator"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">I have the photos that you ordered last month, how
                                                would you like them sent to you?</div>
                                            <div class="small text-gray-500">Jae Chun · 1d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                                 alt="...">
                                            <div class="status-indicator bg-warning"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Last month's report looks great, I am very happy with
                                                the progress so far, keep up the good work!</div>
                                            <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" href="#">
                                        <div class="dropdown-list-image mr-3">
                                            <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                                 alt="...">
                                            <div class="status-indicator bg-success"></div>
                                        </div>
                                        <div>
                                            <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                                told me that people say this to all dogs, even if they aren't good...</div>
                                            <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                                </div>
                            </li>

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                        <security:authorize access="isAuthenticated()">
                                            <security:authentication property="principal.username" /> 
                                        </security:authorize>
                                    </span>
                                    <img class="img-profile rounded-circle"
                                         src="<%=request.getContextPath()%>/resources/admin/img/sunflower4.jpg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">

                                    <a class="dropdown-item" href="<%=request.getContextPath()%>/logout">
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- Bootstrap core JavaScript-->
                    <script src="<%=request.getContextPath()%>/resources/admin/vendor/jquery/jquery.min.js" type="text/javascript"></script>
                    <script src="<%=request.getContextPath()%>/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
                    <script src="<%=request.getContextPath()%>/resources/admin/vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>
                    <script src="<%=request.getContextPath()%>/resources/admin/js/sb-admin-2.min.js" type="text/javascript"></script>
                    <script src="<%=request.getContextPath()%>/resources/admin/js/demo/chart-area-demo.js" type="text/javascript"></script>
                    <script src="<%=request.getContextPath()%>/resources/admin/vendor/chart.js/Chart.min.js" type="text/javascript"></script>
                    <script src="<%=request.getContextPath()%>/resources/admin/js/demo/chart-pie-demo.js" type="text/javascript"></script>

                    </body>
                    </html>
