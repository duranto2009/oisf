<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

<head>
    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../includes/head.jsp"%>
    <!-- BEGIN PAGE STYLES -->
    <link rel="stylesheet" type="text/css" href="${context}/assets/admin/pages/css/tasks.css" />
    <link href="${context}/assets/css/style.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE STYLES -->



</head>

<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed">
<form action="" method="post" id="oisfForm" target="_blank">
    <input type="hidden" name="token" value="" id="token">
</form>
<!-- BEGIN HEADER -->
<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
    <%@ include file="../includes/header.jsp"%>
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
        <div class="page-sidebar md-shadow-z-2-i  navbar-collapse collapse">
            <%@ include file="../includes/menu.jsp"%>

        </div>

    </div>

    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
           <div class="card">
               <div class="portlet-body form">



                   <div class="row">
                       <div class="col-md-12">
                           <div class="portlet box bordered " >
                               <div class="portlet-title">
                                   <div class="caption">
                                       <i class="icon-settings font-dark"></i>
                                       <span class="caption-subject font-dark sbold uppercase"> মেনু ফরম সংযুক্ত দিন</span>
                                   </div>

                               </div>
                               <div class="portlet-body">
                                   <form method="post" action="${context}/addmenu"  class="form-horizontal"
                                         role="form" novalidate="novalidate" id="form_b">
                                       <div class="form-body">

                                           <div class="alert alert-danger display-hide">
                                               <button class="close" data-close="alert"></button>
                                               You have some form errors. Please check below.
                                           </div>
                                           <div class="alert alert-success display-hide">
                                               <button class="close" data-close="alert"></button>
                                               Your form validation is successful!
                                           </div>


                                           <div class="form-group">
                                               <label class=" col-md-3 control-label" > মেনু নাম(ইংরেজিতে)<span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <div class="input-icon">

                                                       <i class="fa fa-angle-double-right tooltips "
                                                          data-original-title="please write a Name"
                                                          data-container="body"></i>

                                                       <input type="text" data-required="1" class="form-control"
                                                              placeholder=" মেনুর নাম"
                                                              name="menunameeng">

                                                   </div>
                                               </div>

                                           </div>

                                           <div class="form-group">
                                               <label class=" col-md-3 control-label"> মেনু নাম বাংলাতে<span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <div class="input-icon">

                                                       <i class="fa fa-angle-double-right tooltips "
                                                          data-original-title="please write a Name"
                                                          data-container="body"></i>

                                                       <input type="text" data-required="1" class="form-control"
                                                              placeholder=" মেনু নাম বাংলাতে"
                                                              name="menunamebng">

                                                   </div>
                                               </div>

                                           </div>

                                           <div class="form-group">
                                               <label class=" col-md-3 control-label">  ইউ আর এল <span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <div class="input-icon">

                                                       <i class="fa fa-angle-double-right tooltips "
                                                          data-original-title="please write url"
                                                          data-container="body"></i>

                                                       <input type="text" data-required="1" class="form-control"
                                                              placeholder="url"
                                                              name="menuurl">

                                                   </div>
                                               </div>

                                           </div>

                                           <div class="form-group">
                                               <label class="col-md-3 control-label"> প্যারেন্ট নাম</label>
                                               <div class="col-md-6">
                                                   <select class="form-control" name="pardata" id="pardropdown">
                                                       <option value="-1">...</option>
                                                       <c:forEach var="par" items="${parent}">
                                                           <option value="${par.getId()}">
                                                                   ${par.getNameBng()}
                                                           </option>
                                                       </c:forEach>
                                                   </select>
                                               </div>
                                           </div>
                                           <div class="form-group">
                                               <label class="col-md-3 control-label"> ম্যান টাইপ</label>
                                               <div class="col-md-6">
                                                   <select class="form-control" name="type" >
                                                       <option value="0">Side Menu</option>
                                                       <option value="10">List</option>
                                                       <option value="2">add</option>
                                                       <option value="3">edit</option>
                                                       <option value="4">delete</option>
                                                       <option value="5">assign</option>
                                                       <option value="6">history</option>

                                                   </select>
                                               </div>
                                           </div>



                                       </div>
                                       <div class="form-actions">
                                           <div class="row">
                                               <div class="col-md-offset-3 col-md-9">
                                                   <button type="submit" class="btn green"> জমা দিন</button>
                                                   <button type="button"  onclick = "location.href='<%=request.getContextPath()%>/ministrylist?menuid=${sessionScope.ministrymenuid}'"  class="btn btn-circle grey-salsa btn-outline"> বাতিল করুন</button>
                                               </div>
                                           </div>
                                       </div>
                                   </form>
                               </div>
                           </div>
                       </div>

                   </div>
                   <input type="hidden" id="menuid" value="${menuid}">
               </div>
           </div>

        </div>


        <!-- END CONTENT -->
    </div>
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../includes/footer.jsp"%>
</div>
<!-- END FOOTER -->


<%@ include file="../includes/includes.jsp"%>

<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/appregistration/validation.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->


</body>




</html>