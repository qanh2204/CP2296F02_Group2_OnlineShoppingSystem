<%-- 
    Document   : footer
    Created on : May 5, 2022, 11:25:37 PM
    Author     : qanh2204
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <footer id="aa-footer">
    <!-- footer bottom -->
    <div class="aa-footer-top">
     <div class="container">
        <div class="row">
        <div class="col-md-12">
          <div class="aa-footer-top-area">
            <div class="row">
              <div class="col-md-4 col-sm-6">
                <div class="aa-footer-widget">
                  <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/user/images/products/logo_footer.jpg" alt="logo img" width="185px"></a> 
                  <ul class="aa-footer-nav">
                    <li><p style="color:#888; text-align: justify; width: 95%"><fmt:message key="footer.sologan"/></p></li>
                    <li><img src="${pageContext.request.contextPath}/resources/user/images/products/dadangky.png" alt="logo img" width="40%"></li>
                  </ul>
                </div>
              </div>
              <div class="col-md-4 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3><fmt:message key="footer.customersupport"/></h3>
                    <ul class="aa-footer-nav">
                      <li><a href="${pageContext.request.contextPath}/view/client/order"><fmt:message key="footer.orderingguide"/></a></li>
                      <li><a href="${pageContext.request.contextPath}/view/client/payment"><fmt:message key="footer.paymentguide"/></a></li>
                      <li><a href="${pageContext.request.contextPath}/view/client/security"><fmt:message key="footer.informationprivacypolicy"/></a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-4 col-sm-6">
                <div class="aa-footer-widget">
                  <div class="aa-footer-widget">
                    <h3><fmt:message key="footer.contact"/></h3>
                    <address>
                      <p><fmt:message key="footer.address"/></p>
                      <p><span class="fa fa-phone"></span>+84 0292 373 1072</p>
                      <p><span class="fa fa-envelope"></span>pqanha19084@cusc.ctu.edu.com</p>
                    </address>
                    <div class="aa-footer-social">
                      <a href="#"><span class="fab fa-facebook"></span></a>
                      <a href="#"><span class="fab fa-youtube"></span></a>
                      <a href="#"><span class="fab fa-instagram"></span></a>
                      <a href="#"><span class="fab fa-skype"></span></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
     </div>
    </div>
    <!-- footer-bottom -->
    <div class="aa-footer-bottom">
      <div class="container">
        <div class="row">
        <div class="col-md-12">
          <div class="aa-footer-bottom-area">
            <p>Copyright 2022 &copy CP2296F02_Group2</p>
            <div class="aa-footer-payment">
              <span class="fab fa-cc-mastercard"></span>
              <span class="fab fa-cc-visa"></span>
              <span class="fab fa-paypal"></span>
              <span class="fab fa-cc-discover"></span>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
  </footer>
  <!-- / footer -->
   
    </body>

	<script type="text/javascript">
	var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
	(function(){
	var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
	s1.async=true;
	s1.src='https://embed.tawk.to/5eedbd889e5f69442290f4d1/default';
	s1.charset='UTF-8';
	s1.setAttribute('crossorigin','*');
	s0.parentNode.insertBefore(s1,s0);
	})();
	</script>
<!--End of Tawk.to Script-->
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="<%=request.getContextPath()%>/resources/user/js/bootstrap.js" type="text/javascript"></script>
  <!-- SmartMenus jQuery plugin -->
  <!-- SmartMenus jQuery Bootstrap Addon -->

  <!-- To Slider JS -->
  
  <script src="<%=request.getContextPath()%>/resources/user/js/sequence.js" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/resources/user/js/sequence-theme.modern-slide-in.js" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/resources/user/js/jquery.simpleGallery.js" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/resources/user/js/jquery.simpleLens.js" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/resources/user/js/slick.js" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/resources/user/js/nouislider.js" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/resources/user/js/validate.js" type="text/javascript"></script>
  <script src="<%=request.getContextPath()%>/resources/user/js/custom.js" type="text/javascript"></script>
  
  
</html>
