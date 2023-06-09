<%-- 
    Document   : homepage
    Created on : Aug 29, 2022, 2:41:59 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>   
        <script type="text/javascript">
            $(document).ready(function () {
                $.ajax({
                    type: 'GET',
                    headers: {
                        Accept: "application/json; charset=utf-8",
                        "Content-Type": "application/json; charset=utf-8"
                    },
                    data: "startDate=none" + "&endDate=none",
                    url: '${pageContext.request.contextPath}/chart/statisticByMonth',
                    success: function (result) {
                        google.charts.load('current', {
                            'packages': ['corechart']
                        });
                        google.charts.setOnLoadCallback(function () {
                            drawChart(result);
                        });
                    }
                });
                function drawChart(result) {

                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Month');
                    data.addColumn('number', 'Money($)');
                    Object.keys(result).forEach(function (key) {
                        data.addRow([key, result[key]]);
                    });
                    var options = {
                        title: 'Total money earned($) by month',
                        hAxis: {
                            title: 'Statistic revenue by month',
                        },
                        vAxis: {
                            title: ''
                        }
                    };
                    var chart = new google.visualization.ColumnChart(document
                            .getElementById('chart_div_month'));
                    chart.draw(data, options);
                }

            });

            $(document).ready(function () {

                $.ajax({
                    type: 'GET',
                    headers: {
                        Accept: "application/json; charset=utf-8",
                        "Content-Type": "application/json; charset=utf-8"
                    },
                    data: "startDate=none" + "&endDate=none",

                    url: '${pageContext.request.contextPath}/chart/statisticByYear',
                    success: function (result) {
                        google.charts.load('current', {
                            'packages': ['corechart']
                        });
                        google.charts.setOnLoadCallback(function () {
                            drawChart(result);
                        });
                    }
                });
                function drawChart(result) {

                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Year');
                    data.addColumn('number', 'Money($)');
                    Object.keys(result).forEach(function (key) {
                        data.addRow([key, result[key]]);
                    });
                    var options = {
                        title: 'Total money earned($) by year',
                        hAxis: {
                            title: 'Statistic revenue by year',
                        },
                        vAxis: {
                            title: ''
                        }
                    };
                    var chart = new google.visualization.ColumnChart(document
                            .getElementById('chart_div_year'));
                    chart.draw(data, options);
                }

            });

            function handleStatistic() {
                var startDate = document.getElementById("startDate").value;
                var endDate = document.getElementById("endDate").value;
                if (startDate == "") {
                    document.getElementById("errStartDate").innerHTML = "Please choose start date";
                    return false;
                } else if (endDate == "") {
                    document.getElementById("errEndDate").innerHTML = "Please choose end date";
                    return false;
                } else {
                    document.getElementById("errStartDate").innerHTML = "";
                    document.getElementById("errEndDate").innerHTML = "";

                    $(document).ready(function () {
                        $.ajax({
                            type: 'GET',
                            headers: {
                                Accept: "application/json; charset=utf-8",
                                "Content-Type": "application/json; charset=utf-8"
                            },
                            data: "startDate=" + startDate + "&endDate=" + endDate,
                            url: '${pageContext.request.contextPath}/chart/statisticByMonth',
                            success: function (result) {
                                google.charts.load('current', {
                                    'packages': ['corechart']
                                });
                                google.charts.setOnLoadCallback(function () {
                                    drawChart(result);
                                });
                            }
                        });

                        function drawChart(result) {

                            var data = new google.visualization.DataTable();
                            data.addColumn('string', 'Month');
                            data.addColumn('number', 'Money($)');
                            Object.keys(result).forEach(function (key) {
                                data.addRow([key, result[key]]);
                            });
                            var options = {
                                title: 'Total money earned($) by month',
                                hAxis: {
                                    title: 'Statistic revenue by month',
                                },
                                vAxis: {
                                    title: ''
                                }
                            };
                            var chart = new google.visualization.ColumnChart(document
                                    .getElementById('chart_div_month'));
                            chart.draw(data, options);
                        }

                    });

                    $(document).ready(function () {

                        $.ajax({
                            type: 'GET',
                            headers: {
                                Accept: "application/json; charset=utf-8",
                                "Content-Type": "application/json; charset=utf-8"
                            },
                            data: "startDate=" + startDate + "&endDate=" + endDate,
                            url: '${pageContext.request.contextPath}/chart/statisticByYear',
                            success: function (result) {
                                google.charts.load('current', {
                                    'packages': ['corechart']
                                });
                                google.charts.setOnLoadCallback(function () {
                                    drawChart(result);
                                });
                            }
                        });
                        function drawChart(result) {

                            var data = new google.visualization.DataTable();
                            data.addColumn('string', 'Year');
                            data.addColumn('number', 'Money($)');
                            Object.keys(result).forEach(function (key) {
                                data.addRow([key, result[key]]);
                            });
                            var options = {
                                title: 'Total money earned($) by year',
                                hAxis: {
                                    title: 'Statistic revenue by year',
                                },
                                vAxis: {
                                    title: ''
                                }
                            };
                            var chart = new google.visualization.ColumnChart(document
                                    .getElementById('chart_div_year'));
                            chart.draw(data, options);
                        }

                    });
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                <a href="${pageContext.request.contextPath}/admin/exportexcelfile" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                        class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
            </div>

            <!-- Content Row -->
            <div class="row">

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        Earning Money</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">$${money}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        Users</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${amount}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        Finished Orders</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${countOrder}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-danger shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">
                                        Cancelled Orders</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${cancelledOrder}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row" style="margin-bottom: 20px"> 

                <div class="col-md-5">
                    <div class="row">
                        <div class="col-md-3">
                            <label>Start Date:</label>
                        </div>
                        <div class="col-md-9">
                            <input type="date" id="startDate" name="startDate" class="form-control"/>                
                            <p style="color:red;" id="errStartDate"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="row">
                        <div class="col-md-3">
                            <label>End Date:</label>
                        </div>
                        <div class="col-md-9">
                            <input type="date" id="endDate" name="endDate" class="form-control"/> 
                            <p style="color:red;" id="errEndDate"></p>

                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <input type="button" class="btn btn-success" value="Search" onclick="return handleStatistic();"/>

                </div>
            </div>
        </div>

        <div align="center" style="width: 100%;">
            <div id="chart_div_month"></div>
        </div>
        <div align="center" style="width: 100%;margin-top:20px">
            <div id="chart_div_year"></div>
        </div>

    </body>
</html>
