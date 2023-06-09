<%-- 
    Document   : menu
    Created on : May 5, 2022, 11:15:00 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<script>
    $(function () {

        $("#searchProduct").autocomplete({

            source: function (request, response) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/searchproduct",
                    dataType: "json",
                    data: {
                        keyword: request.term
                    },
                    success: function (data) {
                        console.log(data);
                        response(data);
                    }

                });
            },
            minLength: 1
        });
    });
    const handleKeyDown = (event) => {
        var strkeyword = document.getElementById("searchProduct").value;
        if (event.key === 'Enter') {
            if (strkeyword == "") {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Please enter keyword',
                    showConfirmButton: false,
                    timer: 3000
                })
            } else {
                $.ajax({
                    type: "get",
                    data: "keyword=" + strkeyword + "&page=1", //send data directly
                    url: "${pageContext.request.contextPath}/user/searchproductpage",
                    success: function () {
                        window.location = "${pageContext.request.contextPath}/user/searchproductpage?keyword=" + strkeyword + "&page=1"
                    }

                });
            }
        }

    }


    function onClickSearch() {
        var strkeyword = document.getElementById("searchProduct").value;
        if (strkeyword == "") {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Please enter keyword',
                showConfirmButton: false,
                timer: 3000
            })
        } else {
            $.ajax({
                type: "get",
                data: "keyword=" + strkeyword + "&page=1", //send data directly
                url: "${pageContext.request.contextPath}/user/searchproductpage",
                success: function () {
                    window.location = "${pageContext.request.contextPath}/user/searchproductpage?keyword=" + strkeyword + "&page=1"
                }

            });
        }

    }
</script>
<section id="menu">
    <div class="container">
        <div class="menu-area">
            <!-- Navbar -->
            <div class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>          
                </div>
                <div class="navbar-collapse collapse">
                    <!-- Left nav -->
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/"><fmt:message key="menu.homepage"/></a></li>
                        <li><a href="" data-toggle="dropdown"   aria-haspopup="true" aria-expanded="true"><fmt:message key="menu.category"/></a>
                            <ul class="dropdown-menu"> 
                                <c:forEach var="category" items="${categoryList}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/showproductpage?cId=${category.categoryId}&page=1">${category.categoryName}</a></li>

                                </c:forEach>  
                            </ul>
                        </li>              
                        <li><a href="${pageContext.request.contextPath}/user/policy"><fmt:message key="menu.policy"/></a></li>
                        <li><a href="${pageContext.request.contextPath}/user/contact"><fmt:message key="menu.contact"/></a></li>
                        <li><a href="${pageContext.request.contextPath}/user/introduce"><fmt:message key="menu.introduce"/></a></li>
                        <li class="aa-search"><!-- search box -->
                            <a class="aa-search-box">
                                <input type="text" onkeydown="handleKeyDown(event)" name="keyword" id="searchProduct" placeholder="What do you need?">
                                 <button class="serach-box" onclick="onClickSearch()"><span class="fa fa-search"></span></button>
                            </a>
                                
                        </li>
                         <button id="btnTalk" style="padding-right:265px " class="serach-box"><span class="fa fa-microphone"></span></button>  
                        
                    </ul>
                </div><!--/.nav-collapse -->

            </div>
        </div>       
    </div>
</section>
<script>
       
    var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
    var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;

    var grammar = '#JSGF V1.0;'

    var recognition = new SpeechRecognition();
    var speechRecognitionList = new SpeechGrammarList();
    speechRecognitionList.addFromString(grammar, 1);
    recognition.grammars = speechRecognitionList;
    recognition.lang = 'en-US';
    recognition.interimResults = false;

    recognition.onresult = function (event) {
        var lastResult = event.results.length - 1;
        var content = event.results[lastResult][0].transcript;       
        document.getElementById("searchProduct").value = content;        
    };

    recognition.onspeechend = function () {
        recognition.stop();
    };

    recognition.onerror = function (event) {
        alert("Please allow access to the microphone");        
    }

    document.getElementById('btnTalk').addEventListener('click', function () {
        recognition.start();
    });
</script>