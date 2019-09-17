<%--
  Created by IntelliJ IDEA.
  User: forhad hossain methun
  Date: 1/18/18
  Time: 1:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

    <meta charset="utf-8"/>

    <%@ include file="../includes/head.jsp" %>
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
    <%@ include file="../includes/header.jsp" %>
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar-wrapper">
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <div class="page-sidebar navbar-collapse collapse">
            <%@ include file="../includes/menu.jsp" %>
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- START MAIN CONTENT -->
        <div class="page-content">


            <!-- BEGIN PAGE HEADER-->
            <div class="row">

                <div class="clearfix">
                </div>
                <div class="col-md-12">
                    <div class="portlet box bordered ">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-settings font-dark"></i>
                                <span class="caption-subject font-dark sbold uppercase">Add  </span>
                            </div>

                        </div>
                        <div class="portlet-body">
                            <form method="post" action="/portaladd" class="form-horizontal"
                                  role="form" novalidate="novalidate" id="form_b">
                                <div class="form-body">

                                    <div class="alert alert-danger display-hide">
                                        <button class="close" data-close="alert"></button>
                                        You have some form errors. Please check below.
                                    </div>
                                    <div class="alert alert-success display-hide">
                                        <button class="close" data-close="alert" ></button>
                                        Your form validation is successful!
                                    </div>


                                    <div class="form-group">
                                        <label class=" col-md-3 control-label">  ${headingeng} <span
                                                class="required" aria-required="true"> * </span></label>

                                        <div class="col-md-6">
                                            <div class="input-icon">

                                                <i class="fa fa-angle-double-right tooltips "
                                                   data-original-title="please write a Name"
                                                   data-container="body"></i>

                                                <input type="text" data-required="1" class="form-control"
                                                       placeholder="  Name"
                                                       name="nameEng">

                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class=" col-md-3 control-label">  ${headingbng}
                                            <%--<span class="required" aria-required="true"> * </span>--%>


                                        </label>

                                        <div class="col-md-6">
                                            <div class="input-icon">

                                                <i class="fa fa-angle-double-right tooltips "
                                                   data-original-title="please write a Name"
                                                   data-container="body"></i>

                                                <input type="text" data-required="1" class="form-control"
                                                       placeholder="  Name Bangla"
                                                       name="nameBng">

                                            </div>
                                        </div>

                                    </div>

                                    <%--<div class="form-group">--%>
                                        <%--<label class=" col-md-3 control-label">  BBS Code <span--%>
                                                <%--class="required" aria-required="true"> * </span></label>--%>

                                        <%--<div class="col-md-6">--%>
                                            <%--<div class="input-icon">--%>

                                                <%--<i class="fa fa-angle-double-right tooltips "--%>
                                                   <%--data-original-title="please write BBs Code"--%>
                                                   <%--data-container="body"></i>--%>

                                                <%--<input type="text" data-required="1" class="form-control"--%>
                                                       <%--placeholder="BBS Code"--%>
                                                       <%--name="bbscode">--%>

                                            <%--</div>--%>
                                        <%--</div>--%>

                                    <%--</div>--%>

                                    <input type="hidden" name="type" value="${type}">







                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-3 col-md-9">
                                            <button type="submit" class="btn green">Submit</button>
                                            <a type="button" href="<%=request.getContextPath()%>/ list" class="btn grey-salsa btn-outline">Cancel</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


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
    <%@ include file="../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../includes/includes.jsp" %>
<%--form validation--%>
<script src="/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="static/assets/js/common/validation.js" type="text/javascript"></script>

<%--other--%>
<script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>