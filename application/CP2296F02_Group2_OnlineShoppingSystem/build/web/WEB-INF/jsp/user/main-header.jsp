<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Agricultural 24h - Trusted choice</title>

        <!-- Font awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
              integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V" crossorigin="anonymous">
        <link href="<%=request.getContextPath()%>/resources/user/css/font-awesome.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap -->
        <link href="<%=request.getContextPath()%>/resources/user/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="<%=request.getContextPath()%>/resources/user/images/favicon.png" type="image/x-icon">
        <!-- SmartMenus jQuery Bootstrap Addon CSS -->
        <link href="<%=request.getContextPath()%>/resources/user/css/jquery.smartmenus.bootstrap.css" rel="stylesheet" type="text/css"/>
        <!-- Product view slider -->
        <link href="<%=request.getContextPath()%>/resources/user/css/jquery.simpleLens.css" rel="stylesheet" type="text/css"/>
        <!-- slick slider -->
        <link href="<%=request.getContextPath()%>/resources/user/css/slick.css" rel="stylesheet" type="text/css"/>
        <!-- price picker slider -->
        <link href="<%=request.getContextPath()%>/resources/user/css/nouislider.css" rel="stylesheet" type="text/css"/>
        <!-- Theme color -->
        <link id="switcher"  href="<%=request.getContextPath()%>/resources/user/css/theme-color/default-theme.css" rel="stylesheet" type="text/css"/>
        <!-- Top Slider CSS -->
        <link href="<%=request.getContextPath()%>/resources/user/css/sequence-theme.modern-slide-in.css" rel="stylesheet" type="text/css" media="all"/>
        <!-- Main style sheet -->
        <link href="<%=request.getContextPath()%>/resources/user/css/style.css" rel="stylesheet" type="text/css"/>
        <!-- Google Font -->
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>     
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    </head>
    <body>

        <header id="aa-header">
            <jsp:include page = "top-header.jsp"  />
            <!-- start header bottom  -->
            <jsp:include page = "bottom-header.jsp"/>
            <!-- / header bottom  -->
        </header>

        <!-- menu -->
        <jsp:include page = "menu.jsp"/>
        <!-- / menu -->

    </body>
</html>
