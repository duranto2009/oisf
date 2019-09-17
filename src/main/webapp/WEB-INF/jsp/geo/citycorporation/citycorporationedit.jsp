<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>

<head>
    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <%@ include file="../../includes/head.jsp" %>
    <c:set var="context" value="${pageContext.request.contextPath}" />




</head>

<body class="page-sidebar-page-sidebar-closed-hide-logo page-header-fixed page-footer-fixed">
<form action="" method="post" id="oisfForm" target="_blank">
    <input type="hidden" name="token" value="" id="token">
</form>
<!-- BEGIN HEADER -->
<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
    <%@ include file="../../includes/header.jsp" %>
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
        <div class="page-sidebar md-shadow-z-2-i  navbar-collapse collapse">
            <%@ include file="../../includes/menu.jsp" %>

        </div>

    </div>

    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">

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
                            <form:form method="post" action="${context}/editcitycorporation" class="form-horizontal"
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

                                    <input type="hidden" name="id" value="${city.getId()}">


                                    <div class="form-group">
                                        <label class=" col-md-3 control-label">City Corporation Name English <span
                                                class="required" aria-required="true"> * </span></label>

                                        <div class="col-md-6">
                                            <div class="input-icon">

                                                <i class="fa fa-angle-double-right tooltips "
                                                   data-original-title="please write a Name"
                                                   data-container="body"></i>

                                                <input type="text" data-required="1" class="form-control"
                                                       placeholder=" Name"
                                                       name="citynameeng" value="${city.getNameEng()}">

                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class=" col-md-3 control-label">City Corporation Name Bangla <span
                                                class="required" aria-required="true"> * </span></label>

                                        <div class="col-md-6">
                                            <div class="input-icon">

                                                <i class="fa fa-angle-double-right tooltips "
                                                   data-original-title="please write a Name"
                                                   data-container="body"></i>

                                                <input type="text" data-required="1" class="form-control"
                                                       placeholder=" Name Bangla"
                                                       name="citynamebng" value="${city.getNameBng()}">

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
                                                       name="bbscode" value="${city.getBbsCode()}">

                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Division Name</label>
                                        <div class="col-md-6">
                                            <select class="form-control" name="divdata" id="divisiondropdown">
                                                    <%--<option value="-1">...</option>--%>
                                                <c:forEach var="data" items="${division}">
                                                    <c:choose>
                                                        <c:when test="${city.getDivisionId() == data.getId()}">
                                                            <option value="${data.getId()}"
                                                                    data-bbs="${data.getBbsCode()}" selected="selected">
                                                                    ${data.getDivisionNameBng()}
                                                            </option>
                                                        </c:when>
                                                        <c:otherwise>

                                                            <option value="${data.getId()}"
                                                                    data-bbs="${data.getBbsCode()}">
                                                                    ${data.getDivisionNameBng()}
                                                            </option>
                                                        </c:otherwise>

                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">District Name</label>
                                        <div class="col-md-6">
                                            <select class="form-control" name="disdata" id="districtdropdown">
                                                    <%--<option value="-1">...</option>--%>
                                                <c:forEach var="data" items="${district}">
                                                    <%--<option value="${data.getId()}" data-bbs = "${data.getBbsCode()}">--%>
                                                    <%--${data.getDistrictNameBng()}--%>
                                                    <%--</option>--%>

                                                    <c:choose>
                                                        <c:when test="${city.getDistrictId() == data.getId()}">
                                                            <option value="${data.getId()}"
                                                                    data-bbs="${data.getBbsCode()}" selected="selected">
                                                                    ${data.getDistrictNameBng()}
                                                            </option>
                                                        </c:when>
                                                        <c:otherwise>

                                                            <option value="${data.getId()}"
                                                                    data-bbs="${data.getBbsCode()}">
                                                                    ${data.getDistrictNameBng()}
                                                            </option>
                                                        </c:otherwise>

                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>


                                    <input type="hidden" data-required="1" class="form-control"
                                           placeholder="BBS Code"
                                           name="divisionbbscode">

                                    <input type="hidden" data-required="1" class="form-control"
                                           placeholder="BBS Code"
                                           name="districtbbscode">


                                    <div class="form-group">
                                        <label class="col-md-3 control-label">Status</label>
                                        <div class="col-md-6">
                                            <select class="form-control" name="status">
                                                <option value="1">Active</option>
                                                <option value="0">In Active</option>
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
                            </form:form>


                        </div>

                    </div>
                </div>
            </div>

            <!-- END CONTENT -->
        </div>
    </div>
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../../includes/footer.jsp" %>
</div>
<%@ include file="../../includes/includes.jsp" %>

<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>

<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/common/validation.js" type="text/javascript"></script>

<!-- END PAGE LEVEL PLUGINS -->
<script> $(document).ready(function () {

    $('#divisiondropdown').change(function () {
        var data = "";
        $.ajax({
            type: "GET",
            url: "${context}/districtlistbydiv",
            data: {
                id: $(this).val()
            },
            async: false,
            success: function (response) {
                data = response;
                return response;
            },
            error: function () {
                 toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ");
            }
        });

        var select = $('#districtdropdown');
        select.empty();
        select.append($('<option></option>').val(-1).html('...'));
        $.each(data, function (index, value) {
            select.append(
                $('<option></option>').val(value.id).html(value.districtNameBng).attr('bbs', value.bbsCode)
            );
        });

        var selected = $(this).find('option:selected');
        var extra = selected.data('bbs');
        $('input[name = divisionbbscode]').val(extra);

    });

    $('#districtdropdown').change(function () {
        var selected = $(this).find('option:selected');
        var extra = selected.data('bbs');
        $('input[name = districtbbscode]').val(extra);

    });


});
</script>


</body>


</html>