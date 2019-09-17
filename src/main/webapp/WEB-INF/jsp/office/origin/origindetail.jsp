<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

<head>
    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../../includes/head.jsp"%>

</head>

<body class="page-sidebar-page-sidebar-closed-hide-logo page-header-fixed page-footer-fixed">
<form action="" method="post" id="oisfForm" target="_blank">
    <input type="hidden" name="token" value="" id="token">
</form>
<!-- BEGIN HEADER -->
<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
    <%@ include file="../../includes/header.jsp"%>
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
            <%@ include file="../../includes/menu.jsp"%>

        </div>

    </div>

    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="portlet-body form">



                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet box bordered ">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-settings font-dark"></i>
                                    <span class="caption-subject font-dark sbold">Office Origin Detail</span>
                                </div>

                            </div>
                            <div class="portlet-body">
                                <form  class="form-horizontal" id ="target"
                                      role="form" novalidate="novalidate" id="form_b">
                                    <div class="form-body">
                                        <div class="form-group">
                                            <label class=" col-md-3 control-label" > Name English <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <label>
                                                        ${origin.getOfficeNameEng()}
                                                    </label>

                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label"> Name Bangla <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <label>
                                                        ${origin.getOfficeNameBng()}
                                                    </label>

                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label"> Office Origin Lavel  <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <label>
                                                        ${origin.getOfficeLevel()}
                                                    </label>

                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label"> Office Origin Sequence<span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <label>
                                                        ${origin.getOfficeSequence()}
                                                    </label>

                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label"> Ministry <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">


                                                    <c:forEach var="ministry" items="${ministry}">
                                                        <c:choose>
                                                            <c:when test="${origin.getOfficeMinistryId() == ministry.getId()}">
                                                                <label >
                                                                        ${ministry.getNameBng()}
                                                                </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                            </c:otherwise>

                                                        </c:choose>
                                                    </c:forEach>

                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label"> Office Layer <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">

                                                    <c:forEach var="layer" items="${layer}">
                                                        <c:choose>
                                                            <c:when test="${origin.getOfficeLayerId() == layer.getId()}">
                                                                <label>
                                                                        ${layer.getLayerNameBng()}
                                                                </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                            </c:otherwise>

                                                        </c:choose>
                                                    </c:forEach>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label"> Superior Office <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">

                                                    <c:forEach var="origins" items="${origins}">
                                                        <c:choose>
                                                            <c:when test="${origin.getParentOfficeId() == origins.getId()}">
                                                                <label>
                                                                        ${origins.getOfficeNameBng()}
                                                                </label>
                                                            </c:when>
                                                            <c:otherwise>
                                                            </c:otherwise>

                                                        </c:choose>
                                                    </c:forEach>

                                            </div>

                                        </div>



                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>


        <!-- END CONTENT -->
    </div>
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../../includes/footer.jsp"%>
</div>
<!-- END FOOTER -->
<%@ include file="../../includes/includes.jsp" %>
<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/appregistration/validation.js" type="text/javascript"></script>

<script> $(document).ready(function() {



});
</script>

</body>




</html>