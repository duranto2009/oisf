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
    <c:set var="context" value="${pageContext.request.contextPath}"/>

    <%@ include file="../includes/head.jsp" %>
    <link href="${context}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet"
          type="text/css"/>
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
    <div class="page-sidebar-wrapper" style="margin-top: 20px">
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
            <div class="card">
                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet box bordered ">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-settings font-dark"></i>
                                    <span class="caption-subject font-dark sbold uppercase">পাবলিশ ${appname}</span>
                                </div>

                            </div>
                            <div class="portlet-body">
                                <c:if test="${published==0}">
                                    <form method="post" enctype="multipart/form-data" action="${context}/publish"
                                          id="form_b" class="form-horizontal"
                                          role="form" novalidate="novalidate">

                                        <input type="hidden" name="id" value="${appid}">
                                        <div class="form-body" style="min-height: 400px">

                                            <div class="alert alert-danger display-hide">
                                                <button class="close" data-close="alert"></button>
                                                You have some form errors. Please check below.
                                            </div>
                                            <div class="alert alert-success display-hide">
                                                <button class="close" data-close="alert"></button>
                                                Your form validation is successful!
                                            </div>

                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Single Sign on Processed</label>
                                                <div class="col-md-9">
                                                    <div class="mt-radio-list">
                                                        <label class="mt-radio mt-radio-outline">
                                                            <input type="radio" name="optionsRadios" id="optionsRadios22" value="option1" checked=""> Yes
                                                            <span></span>
                                                        </label>
                                                        <label class="mt-radio mt-radio-outline">
                                                            <input type="radio" name="optionsRadios" id="optionsRadios23" value="option2" checked=""> No
                                                            <span></span>
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>

                                            <%--<div class="col-md-12 form-group">--%>
                                                <%--<label class="control-lebel">Single Sign on Processed</label>--%>
                                                <%--<div class="btn-group" data-toggle="buttons">--%>
                                                    <%--<label class="btn btn-default">--%>
                                                        <%--<input type="radio" class="toggle"> Yes </label>--%>
                                                    <%--<label class="btn btn-default active">--%>
                                                        <%--<input type="radio" class="toggle"> No </label>--%>
                                                <%--</div>--%>
                                            <%--</div>--%>


                                        </div>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <button type="submit" class="btn green">জমা দিন</button>
                                                        <%--<button type="button" class="btn grey-salsa btn-outline">বাতিল করুন</button>--%>
                                                    <a type="button" href="<%=request.getContextPath()%>/list"
                                                       class="btn grey-salsa btn-outline">বাতিল করুন</a>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


            <!-- END PAGE HEADER-->

            <!-- Everything is here -->

            <input type="hidden" id="menuid" value="${menuid}">
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


<script src="${context}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
        type="text/javascript"></script>


<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<%--form validation--%>
<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/js/common/validation.js" type="text/javascript"></script>


<script>
    $(document).ready(function () {
        var $appUrl = $('#app_url').val
        if ($appUrl != null && $appUrl.length > 1) {
            // console.log($appUrl);
        }
    });
</script>
</body>
<!-- END BODY -->
</html>