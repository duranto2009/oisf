<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

    <meta charset="utf-8"/>

    <%@ include file="../../includes/head.jsp" %>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <style>
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed">
<!-- BEGIN HEADER -->
<div class="page-header -i navbar navbar-fixed-top">
    <%@ include file="../../includes/header.jsp" %>
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar-wrapper" style="margin-top: 20px">
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <div class="page-sidebar navbar-collapse collapse">
            <%@ include file="../../includes/menu.jsp" %>
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- START MAIN CONTENT -->
        <div class="page-content">


            <!-- BEGIN PAGE HEADER-->
          <div class="card">
              <div class="row">

                  <div class="clearfix">
                  </div>
                  <div class="col-md-12">
                      <div class="portlet box bordered " >
                          <div class="portlet-title">
                              <div class="caption">
                                  <i class="icon-settings font-dark"></i>
                                  <span class="caption-subject font-dark sbold uppercase"> জেলা তৈরি করুন </span>
                              </div>

                          </div>
                          <div class="portlet-body">
                              <form method="post" action="${context}/districtadd" class="form-horizontal"
                                    role="form" novalidate="novalidate" id="form_b">
                                  <div class="form-body">

                                      <div class="alert alert-danger display-hide">
                                          <button class="close" data-close="alert"></button>
                                          ফর্ম সাবমিট এ সমস্যা রয়েছে। দয়া করে যাচাই করুন।
                                      </div>
                                      <div class="alert alert-success display-hide">
                                          <button class="close" data-close="alert"></button>
                                          সফলভাবে জেলা যুক্ত করা হয়েছে !
                                      </div>


                                      <div class="form-group">
                                          <label class=" col-md-3 control-label"> জেলার নাম (ইংরেজিতে)  <span
                                                  class="required" aria-required="true"> * </span></label>

                                          <div class="col-md-6">
                                              <div class="input-icon">

                                                  <i class="fa fa-angle-double-right tooltips "
                                                     data-original-title="please write a Name"
                                                     data-container="body"></i>

                                                  <input type="text" data-required="1" class="form-control"
                                                         placeholder=" ইংরেজিতে জেলার নাম "
                                                         name="disnameeng">

                                              </div>
                                          </div>

                                      </div>

                                      <div class="form-group">
                                          <label class=" col-md-3 control-label"> জেলার নাম ( বাংলায়)<span
                                                  class="required" aria-required="true"> * </span></label>

                                          <div class="col-md-6">
                                              <div class="input-icon">

                                                  <i class="fa fa-angle-double-right tooltips "
                                                     data-original-title="please write a Name"
                                                     data-container="body"></i>

                                                  <input type="text" data-required="1" class="form-control"
                                                         placeholder="বাংলাতে জেলার নাম  লিখুন  "
                                                         name="disnamebng">

                                              </div>
                                          </div>

                                      </div>

                                      <div class="form-group">
                                          <label class=" col-md-3 control-label"> বি বি এস কোড <span
                                                  class="required" aria-required="true"> * </span></label>

                                          <div class="col-md-6">
                                              <div class="input-icon">

                                                  <i class="fa fa-angle-double-right tooltips "
                                                     data-original-title="please write BBs Code"
                                                     data-container="body"></i>

                                                  <input type="text" data-required="1" class="form-control"
                                                         placeholder=" বি বি এস কোড  লিখুন "
                                                         name="bbscode">

                                              </div>
                                          </div>

                                      </div>

                                      <div class="form-group">
                                          <label class="col-md-3 control-label"> বিভাগ</label>
                                          <div class="col-md-6">
                                              <select class="form-control" name="divdata">
                                                  <option value="-1" disabled="disabled" selected="true"> --- বাছাই করুন ---</option>
                                                  <c:forEach var="data" items="${division}">
                                                      <option value="${data.getId()}">
                                                              ${data.getDivisionNameBng()}
                                                      </option>
                                                  </c:forEach>
                                              </select>
                                          </div>
                                      </div>




                                  </div>
                                  <div class="form-actions">
                                      <div class="row">
                                          <div class="col-md-offset-3 col-md-9">
                                              <button type="submit" class="btn green"> জমা দিন </button>
                                              <button type="button" onclick = "location.href='<%=request.getContextPath()%>/districtlist?menuid=${sessionScope.districtmenuid}'" class="btn btn-circle grey-salsa btn-outline"> বাতিল করুন </button>
                                          </div>
                                      </div>
                                  </div>
                              </form>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
            <input type="hidden" id="menuid" value="${menuid}">

            <!-- END PAGE HEADER-->

            <!-- Everything is here -->


        </div>
        <!--End of Everything -->
    </div>
    <!-- END MAIN CONTENT -->

</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../../includes/includes.jsp" %>

<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/common/validation.js" type="text/javascript"></script>


<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>