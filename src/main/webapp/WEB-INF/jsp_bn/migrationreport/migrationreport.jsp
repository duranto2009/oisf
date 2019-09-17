<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>

<head>
    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <%@ include file="../includes/head.jsp" %>
    <c:set var="context" value="${pageContext.request.contextPath}"/>


    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/themes/base/jquery-ui.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css" rel="stylesheet">






</head>

<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed">
<form action="" method="post" id="oisfForm" target="_blank">
    <input type="hidden" name="token" value="" id="token">
</form>
<!-- BEGIN HEADER -->
<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
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
        <div class="page-sidebar md-shadow-z-2-i  navbar-collapse collapse">
            <%@ include file="../includes/menu.jsp" %>

        </div>

    </div>

    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">

            <div class="card" >
                <div class="portlet-body form">


                    <div class="row">
                        <div class="col-md-12">
                            <div class="portlet box ">
                                <div class="portlet-title">
                                    <div class="caption"><i class="fa fa-gift"></i> মাইগ্রেশন রিপোর্ট </div>

                                </div>

                                <div class="portlet-body ">

                                        <div class="row " style=" margin: 15px;">
                                            <label class="control-label" >Select Migration Date <span class="text-danger">*</span></label>

                                            <input type="text" style="margin-top: 10px" name="migration_date" class="col-md-7 form-control date-picker" placeholder="--select date--" id="migration-date">

                                        </div>

                                        <div class="row" style=" margin: 15px;">
                                            <label class="control-label">Select Migration Time <span class="text-danger">*</span></label>
                                            <select id="migration-time" class="form-control " name="migration_time">
                                                <%--<option value="">--select time--</option>--%>
                                            </select>
                                        </div>

                                        <div class="row  table-scrollable" style="margin-top: 15px">
                                            <h2 >Migration Report</h2>
                                            <table class="table table-bordered table-hover" id="reportTable" style="margin-top: 20px">
                                                <tbody>

                                                </tbody>
                                            </table>
                                        </div>


                                    <%--</div>--%>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <input type="hidden" id="menuid" value="${menuid}">
        </div>

    </div>


    <!-- END CONTENT -->
</div>

<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->

<!-- END PAGE LEVEL PLUGINS -->

<%@ include file="../includes/includes.jsp" %>
<%--<script src="${context}/assets/js/common/validation.js" type="text/javascript"></script>--%>
<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<%--<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js" type="text/javascript"></script>--%>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
        type="text/javascript"></script>
<%--<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.min.js" type="text/javascript"></script>--%>
<script src="${context}/assets/js/common/validation-office.js" type="text/javascript"></script>

<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>


<script>
    $(document).ready(function () {

        $('#migration-date').change(function () {
            var data = "";
            $.ajax({
                type: "POST",
                url: "${context}/migrationTimeList",
                data: {
                    date: $(this).val()
                },
                async: false,
                success: function (response) {
                    data = response;
                    var select = $('#migration-time');
                    select.empty();
                    select.append($('<option></option>').val(-1).prop('selected','selected').prop('disabled','disabled').html('--select time--'));
                    var flag=0;
                    $.each(data, function (index, value) {

                        if(value != null)
                        {
                            var hour;
                            if(value == 0)  hour = "Hour: 12 AM";
                            else if(value < 12 ) hour = "Hour: " + value + " AM";
                            else if(value == 12) hour = "Hour: 12 PM";
                            else
                            {
                                var value_pm = value % 12;
                                hour = "Hour: " + value_pm + " PM";
                            }

                            select.append(
                                $('<option></option>').val(value).html(hour)
                            );
                            flag=1;
                        }

                    });

                    if(flag == 0) toastr.error(" There is no migration on this date!","Sorry ");


                },
                error: function () {
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" There has some errors. Please try again later!,Sorry ");
                }
            });

        });


        $("#migration-time").on('change',function(e){

            var data = "";
            $.ajax({
                type: "POST",
                url: "${context}/getReport",
                data: {
                    date: $('#migration-date').val(),
                    time: $(this).val()
                },
                async: false,
                success: function (rows) {

                    if (rows.length > 0) {
                        $("#reportTable tbody").html("");
                        var tbodyStr = "";
                        tbodyStr += "<tr>" +
                            "<td width='7%' class='text-left'> <b>Serial No </b></td>" +
                            "<td width='15%' class='text-left'> <b>Table Name </b></td>" +
                            "<td width='16%' class='text-left'> <b>Total Row in Nothi </b></td>" +
                            "<td width='15%' class='text-left'> <b>Total Row in OISF </b></td>" +
                            "<td width='15%' class='text-left'> <b>Inserted Row </b></td>" +
                            "<td width='15%' class='text-left'><b> Updated Row </b></td>" +
                            "<td width='15%' class='text-left'> <b>Deleted Row </b> </td>" +
                            "</tr>";

                        $(rows).each(function(index, row){
                            if(row != null) {
                                tbodyStr += "<tr>";
                                tbodyStr += "<td width='7%' class='text-left'>" + (index+1) + "</td>";
                                tbodyStr += "<td width='15%' class='text-left'>" + row.destination_table + "</td>";
                                tbodyStr += "<td width='16%' class='text-left'>" + row.source_table_row + "</td>";
                                tbodyStr += "<td width='15%' class='text-left'>" + row.destination_table_row + "</td>";
                                tbodyStr += "<td width='15%' class='text-left'>" + row.inserted + "</td>";
                                tbodyStr += "<td width='15%' class='text-left'>" + row.updated + "</td>";
                                tbodyStr += "<td width='15%' class='text-left'>" + row.deleted + "</td>";

                                tbodyStr += "</tr>"
                            }

                        });

                    } else {

                        tbodyStr += "<tr><td colspan='3' class='red'>Sorry! There is no report of this.</td></tr>";
                    }

                    $("#reportTable tbody").html(tbodyStr);


                },
                error: function () {
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" There has some errors. Please try again later! ");
                }
            });

        });

        $(function () {
            $('#migration-date').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: "yy-mm-dd",
                yearRange: "-90:+00"

            });
        });

    });
</script>
</body>


</html>
