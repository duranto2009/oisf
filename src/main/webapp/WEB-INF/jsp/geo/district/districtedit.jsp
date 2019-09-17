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
    <c:set var="context" value="${pageContext.request.contextPath}" />

    <%@ include file="../../includes/head.jsp" %>
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
            <div class="row">

                <div class="clearfix">
                </div>
                <div class="col-md-12">
                    <div class="portlet box bordered ">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-settings font-dark"></i>
                                <span class="caption-subject font-dark sbold uppercase">dISTRICT Form</span>
                            </div>

                        </div>
                        <div class="portlet-body">
                            <form method="post" action="${context}/editdistrict"  class="form-horizontal"
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

                                    <input type="hidden" name="id" value="${district.getId()}">

                                    <div class="form-group">
                                        <label class=" col-md-3 control-label">District Name English <span
                                                class="required" aria-required="true"> * </span></label>

                                        <div class="col-md-6">
                                            <div class="input-icon">

                                                <i class="fa fa-angle-double-right tooltips "
                                                   data-original-title="please write a Name"
                                                   data-container="body"></i>

                                                <input type="text" data-required="1" class="form-control"
                                                       placeholder="District Name"
                                                       name="disnameeng" value="${district.getDistrictNameEng()}">

                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class=" col-md-3 control-label">District Name Bangla <span
                                                class="required" aria-required="true"> * </span></label>

                                        <div class="col-md-6">
                                            <div class="input-icon">

                                                <i class="fa fa-angle-double-right tooltips "
                                                   data-original-title="please write a Name"
                                                   data-container="body"></i>

                                                <input type="text" data-required="1" class="form-control"
                                                       placeholder="District Name Bangla"
                                                       name="disnamebng" value="${district.getDistrictNameBng()}">

                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class=" col-md-3 control-label">BBS Code <span
                                                class="required" aria-required="true"> * </span></label>

                                        <div class="col-md-6">
                                            <div class="input-icon">

                                                <i class="fa fa-angle-double-right tooltips "
                                                   data-original-title="please write BBs Code"
                                                   data-container="body"></i>

                                                <input type="text" data-required="1" class="form-control"
                                                       placeholder="BBS Code"
                                                       name="bbscode" value="${district.getBbsCode()}">

                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Division Name</label>
                                        <div class="col-md-6">

                                            <select class="form-control" name="divdata">


                                                <c:forEach var="data" items="${division}">
                                                    <c:choose>
                                                        <c:when test="${district.getDivisionId() == data.getId()}">
                                                            <option value="${data.getId()}" data-bbs = "${data.getBbsCode()}" selected="selected">
                                                                    ${data.getDivisionNameBng()}
                                                            </option>
                                                        </c:when>
                                                        <c:otherwise>

                                                            <option value="${data.getId()}" data-bbs = "${data.getBbsCode()}">
                                                                    ${data.getDivisionNameBng()}
                                                            </option>
                                                        </c:otherwise>

                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>






                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-3 col-md-9">
                                            <button type="submit" class="btn green">Submit</button>
                                            <button type="button" class="btn grey-salsa btn-outline">Cancel</button>
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