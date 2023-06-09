<%-- 
    Document   : topHeader
    Created on : May 5, 2022, 11:13:25 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- start header top  -->

<div class="aa-header-top">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-header-top-area">
                    <!-- start header top left -->
                    <div class="aa-header-top-left">
                        <div class="cellphone hidden-xs">
                            <p><span class="fas fa-home"></span><fmt:message key="topheader.title"/></p>
                        </div>
                        <!-- start language -->
                        <div class="aa-language">
                            <div class="dropdown">
                                <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <a href="?lang=vi"><img src="<%=request.getContextPath()%>/resources/user/img/flag/vietnam.png" alt="vietnam flag"><fmt:message key="topheader.vn"/></a>
                                    <a href="?lang=en"><img src="<%=request.getContextPath()%>/resources/user/img/flag/english.jpg" alt="english flag"><fmt:message key="topheader.en"/></a>
                                </a>                   
                            </div>
                        </div>
                        <!-- / language -->

                        <!-- start cellphone -->
                        <!--                <div class="cellphone hidden-xs">
                                          <p><span class="fa fa-phone"></span>00-62-658-658</p>
                                        </div>-->
                        <!-- / cellphone -->
                    </div>
                    <!-- / header top left -->
                    <div class="aa-header-top-right">
                        <ul class="aa-head-top-nav-right">
                            <security:authorize access="isAuthenticated()">
                                <a href="${pageContext.request.contextPath}/users/profile"> <security:authentication property="principal.username" /></a> 
                                <li class="hidden-xs"><a href="${pageContext.request.contextPath}/users/vieworderlist">Order List</a></li>
                                <li class="hidden-xs"><a href="${pageContext.request.contextPath}/users/vieworderhistorylist">Order History</a></li>
                                <li class="hidden-xs"><a href="${pageContext.request.contextPath}/logout"><fmt:message key="topheader.logout"/></a></li>



                            </security:authorize>


                            <security:authorize access="!isAuthenticated()">

                                <li class="hidden-xs"><a href="${pageContext.request.contextPath}/user/register"><fmt:message key="topheader.signup"/></a></li>
                                <li><a href="${pageContext.request.contextPath}/user/login"><fmt:message key="topheader.signin"/></a></li>
                                </nav>
                            </security:authorize>

                            <!--  data-toggle="modal" data-target="#login-modal" -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- / header top  -->
