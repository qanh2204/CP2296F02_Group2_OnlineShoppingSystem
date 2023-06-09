<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!-- Start header section -->
<jsp:include page = "main-header.jsp" flush = "true" />

<section id="aa-catg-head-banner">
    <img src="${pageContext.request.contextPath}/resources/user/images/products/banner_tc.jpg" alt="banner sản phẩm">
    <div class="aa-catg-head-banner-area">
        <div class="container">
            <div class="aa-catg-head-banner-content">
                <h2><fmt:message key="policy.privacypolicy"/></h2>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/"><fmt:message key="policy.homepage"/></a></li>
                    <li style="color:#fff"><fmt:message key="policy.policy"/></li>         
                </ol>
            </div>
        </div>
    </div>
</section>
<section id="aa-product-category">
    <div class="container">
        <div class="row">
            <div>
                <h1 style ="text-align: center; color: red;"><fmt:message key="policy.privacypolicy"/></h1>
                <strong><fmt:message key="policy.thank"/></strong><br><br>
                <p><fmt:message key="policy.word1"/>.</p>
                <p><fmt:message key="policy.word2"/>.</p>
                <p><fmt:message key="policy.word3"/>.</p>
                <p><fmt:message key="policy.word4"/>.</p>
                <strong>1. <fmt:message key="policy.collet"/></strong>
                <p>
                    <fmt:message key="policy.word5"/> agricultura24h.cusc.vn<br><br>

                    <fmt:message key="policy.word6"/>.<br><br>

                    <fmt:message key="policy.word7"/>.<br><br>

                    <fmt:message key="policy.word8"/>.<br><br>

                    <fmt:message key="policy.word9"/>.<br><br>

                    <fmt:message key="policy.word10"/>.
                </p>
                <strong><i><fmt:message key="policy.other"/></i></strong>
                <p><fmt:message key="policy.word11"/>.<br><br>

                    <fmt:message key="policy.word12"/>.<br><br>

                    <fmt:message key="policy.word13"/>.</p>
                <strong>2. <fmt:message key="policy.cooky"/></strong>
                <p>
                    <fmt:message key="policy.word14"/>.<br><br>

                    <fmt:message key="policy.word15"/>.
                </p>
                <strong>3. <fmt:message key="policy.security"/></strong>
                <p><fmt:message key="policy.word16"/>.<br><br>

                    <fmt:message key="policy.word17"/>.<br><br>

                    <fmt:message key="policy.word18"/>.<br><br>

                    <fmt:message key="policy.word19"/>.<br><br>

                    <fmt:message key="policy.word20"/>.<br><br>
                </p>
            </div>
        </div>
    </div>
</section>

<!--  footer-->
<jsp:include page = "footer.jsp" flush = "true" />
<!-- end footer-->
