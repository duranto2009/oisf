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

            <div class="card">
                <div class="row">

                    <div class="clearfix">
                    </div>
                    <div class="col-md-12">
                        <div class="portlet box bordered ">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-settings font-dark"></i>
                                    <span class="caption-subject font-dark sbold uppercase"> পলিসি ইডিট</span>
                                </div>

                            </div>
                            <div class="portlet-body">
                                <form method="post" action="/policyupdate" class="form-horizontal"
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

                                        <%--<div class="bootstrap-growl alert alert-success alert-dismissible" style="position: fixed; margin: 0px; z-index: 9999; bottom: 100px; right: 20px;">--%>
                                        <%--<button class="close" data-dismiss="alert" type="button">--%>
                                        <%--<span aria-hidden="true">×</span><span class="sr-only">Close</span></button>Some demo text goes here</div>--%>


                                        <input type="hidden" name="id" value="${policy.getId()}">
                                        <input type="hidden" name="oldname_eng" value="${policy.getNameEng()}">
                                        <input type="hidden" name="oldname_bng" value="${policy.getNameBng()}">


                                        <div class="form-group">
                                            <label class=" col-md-3 control-label">Policy Name English <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <i class="fa fa-angle-double-right tooltips "
                                                       data-original-title="please write a Name"
                                                       data-container="body"></i>

                                                    <input type="text" data-required="1" class="form-control"
                                                           placeholder="Policy Name"
                                                           name="name_eng" value="${policy.getNameEng()}">


                                                </div>
                                            </div>

                                        </div>


                                        <div class="form-group">
                                            <label class=" col-md-3 control-label"> পলিসির নাম ( বাংলায়) <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <i class="fa fa-angle-double-right tooltips "
                                                       data-original-title="please write a Name"
                                                       data-container="body"></i>

                                                    <input type="text" data-required="1" class="form-control"
                                                           placeholder="Pপলিসির নাম ( বাংলায়)"
                                                           name="name_bng" value="${policy.getNameBng()}">


                                                </div>
                                            </div>

                                        </div>


                                        <div class="form-group">

                                            <label for="multiple" class="control-label"> অ্যাপ সিলেক্ট করুন</label>

                                            <select name="appid[]" id="multiple" class="form-control select2-multiple" multiple>
                                                <c:forEach var="app" items="${app}">
                                                    <option value="${app.getId()}">
                                                            ${app.getNameBng()}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>


                                        <input type="hidden" name="menuids[]" id ="jstreeselectednode"/>
                                        <div class="form-group col-md-12" style="margin-top: 40px">

                                            <label class="control-label col-md-12" style="width: auto"> মেনু সিলেক্ট করুন</label>

                                        </div>
                                        <div class="form-group" style="height: 475px;">


                                            <div class=" col-md-offset-1 col-md-10" id="jstree" style="height: 475px;overflow-y: scroll;">

                                            </div>
                                        </div>





                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn green"> জমা দিন</button>
                                                <a type="button" href="<%=request.getContextPath()%>/grouppolicylist"
                                                   class="btn grey-salsa btn-outline"> বাতিল করুন</a>
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





<script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>