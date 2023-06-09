<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Start header section -->
<jsp:include page = "main-header.jsp" flush = "true" />


<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/resources/user/images/products/banner-product.png" alt="banner sản phẩm">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2><fmt:message key="introduce.introduce"/></h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/"><fmt:message key="introduce.homepage"/></a></li>      
                    <li style="color:#fff"><fmt:message key="introduce.introduce"/></li>   
                </ol>
            </div>
        </div>
    </div>
</section>
<section id="aa-product-category">
    <div class="container">
        <div class="row">
            <div>
                <h1 style ="text-align: center; color: red;"><fmt:message key="introduce.namecom"/></h1>
                <p><fmt:message key="introduce.word1"/><strong><fmt:message key="introduce.namecom"/></strong><fmt:message key="introduce.word17"/>
                    <strong>“<fmt:message key="introduce.sologan"/>”</strong>. <fmt:message key="introduce.word2"/>.</p>
                <img src="${pageContext.request.contextPath}/resources/user/images/products/introduce_thuc_pham_sach.png" alt="Thực phẩm sạch"/> <br/> <br>
                <p><fmt:message key="introduce.word3"/> <strong><fmt:message key="introduce.namecom"/> </strong> <fmt:message key="introduce.word4"/>.</p>
                <p><fmt:message key="introduce.word5"/></p>
                <img src="${pageContext.request.contextPath}/resources/user/images/products/introduce_thuc_pham_sach2.jpg" alt="Thực phẩm sạch" width= "1160" height= "600"/> <br/> <br>
                <strong><fmt:message key="introduce.word6"/> <fmt:message key="introduce.namecom"/> <fmt:message key="introduce.word7"/>:</strong><br/>
                <p> <strong><fmt:message key="introduce.word8"/>: </strong>
                    <fmt:message key="introduce.word9"/> <strong><fmt:message key="introduce.namecom"/></strong> <fmt:message key="introduce.word10"/>.</p>
                <p><strong><fmt:message key="introduce.word11"/>: </strong>
                    <fmt:message key="introduce.word12"/>.<strong><fmt:message key="introduce.namecom"/></strong> <fmt:message key="introduce.word18"/>
                </p>
                <p><strong><fmt:message key="introduce.word13"/>: </strong>
                    <fmt:message key="introduce.word14"/>.</p>
                <p><strong><fmt:message key="introduce.word15"/></strong> <fmt:message key="introduce.word16"/>.</p>
                <br />
            </div>
        </div>
    </div>
</section>

<!--  footer-->
<jsp:include page = "footer.jsp" flush = "true" />
<!-- end footer-->
