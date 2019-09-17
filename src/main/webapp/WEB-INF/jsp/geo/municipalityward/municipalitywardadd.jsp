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
           <div class="card">
               <div class="portlet-body form">



                   <div class="row">
                       <div class="col-md-12">
                           <div class="portlet box bordered ">
                               <div class="portlet-title">
                                   <div class="caption">
                                       <i class="icon-settings font-dark"></i>
                                       <span class="caption-subject font-dark sbold uppercase">Municipality Ward Form</span>
                                   </div>

                               </div>
                               <div class="portlet-body">
                                   <form method="post" action="${context}/addmunicipalityward"  class="form-horizontal"
                                         role="form" novalidate="novalidate">
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
                                               <label class=" col-md-3 control-label" >MunicipalityWard Name English <span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <div class="input-icon">

                                                       <i class="fa fa-angle-double-right tooltips "
                                                          data-original-title="please write a Name"
                                                          data-container="body"></i>

                                                       <input type="text" data-required="1" class="form-control"
                                                              placeholder="MunicipalityWard Name"
                                                              name="municipalitywardnameeng">

                                                   </div>
                                               </div>

                                           </div>

                                           <div class="form-group">
                                               <label class=" col-md-3 control-label">MunicipalityWard Name Bangla <span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <div class="input-icon">

                                                       <i class="fa fa-angle-double-right tooltips "
                                                          data-original-title="please write a Name"
                                                          data-container="body"></i>

                                                       <input type="text" data-required="1" class="form-control"
                                                              placeholder="MunicipalityWard Name Bangla"
                                                              name="municipalitywardnamebng">

                                                   </div>
                                               </div>

                                           </div>

                                           <div class="form-group">
                                               <label class=" col-md-3 control-label">MunicipalityWard BBS Code<span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <div class="input-icon">

                                                       <i class="fa fa-angle-double-right tooltips "
                                                          data-original-title="please write BBs Code"
                                                          data-container="body"></i>

                                                       <input type="text" data-required="1" class="form-control"
                                                              placeholder="BBS Code"
                                                              name="municipalitywardbbscode">

                                                   </div>
                                               </div>

                                           </div>

                                           <input type="hidden" data-required="1" class="form-control"
                                                  placeholder="BBS Code"
                                                  name="divisionbbscode">

                                           <input type="hidden" data-required="1" class="form-control"
                                                  placeholder="BBS Code"
                                                  name="districtbbscode">

                                           <input type="hidden" data-required="1" class="form-control"
                                                  placeholder="BBS Code"
                                                  name="upazillabbscode">

                                           <input type="hidden" data-required="1" class="form-control"

                                                  name="municipalitybbscode">

                                           <div class="form-group">
                                               <label class="col-md-3 control-label">Division Name</label>
                                               <div class="col-md-6">
                                                   <select class="form-control" name="divdata" id="divisiondropdown">
                                                       <option value="-1">...</option>
                                                       <c:forEach var="data" items="${division}">
                                                           <option value="${data.getId()}" data-bbs = "${data.getBbsCode()}">
                                                                   ${data.getDivisionNameBng()}
                                                           </option>
                                                       </c:forEach>
                                                   </select>
                                               </div>
                                           </div>

                                           <div class="form-group">
                                               <label class="col-md-3 control-label">District Name</label>
                                               <div class="col-md-6">
                                                   <select class="form-control" name="disdata" id="districtdropdown">

                                                   </select>
                                               </div>
                                           </div>

                                           <div class="form-group">
                                               <label class="col-md-3 control-label">Upazilla Name</label>
                                               <div class="col-md-6">
                                                   <select class="form-control" name="upadata" id="upazilladropdown">

                                                   </select>
                                               </div>
                                           </div>

                                           <div class="form-group">
                                               <label class="col-md-3 control-label">Municipality Name</label>
                                               <div class="col-md-6">
                                                   <select class="form-control" name="mundata" id="municipalitydropdown">

                                                   </select>
                                               </div>
                                           </div>
                                           <%--<div class="form-group">--%>
                                           <%--<label class="col-md-3 control-label">Status</label>--%>
                                           <%--<div class="col-md-6">--%>
                                           <%--<select class="form-control" name="status">--%>
                                           <%--<option value="1">Active</option>--%>
                                           <%--<option value="0">In Active</option>--%>
                                           <%--</select>--%>
                                           <%--</div>--%>
                                           <%--</div>--%>


                                       </div>
                                       <div class="form-actions">
                                           <div class="row">
                                               <div class="col-md-offset-3 col-md-9">
                                                   <button type="submit" class="btn green">Submit</button>
                                                   <button type="button"  onclick= "location.href='${context}/municipalitywardlistview'" class="btn btn-circle grey-salsa btn-outline">Cancel</button>
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

        </div>


        <!-- END CONTENT -->
    </div>
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../../includes/footer.jsp"%>
</div>

<%@ include file="../../includes/includes.jsp"%>
<!-- END FOOTER -->
<script src="${context}/assets/global/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>




<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/common/validation.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<script> $(document).ready(function() {

    $('#divisiondropdown').change(function() {
        var data = "";
        $.ajax({
            type:"GET",
            url : "${context}/districtlistbydiv",
            data : {
                id: $(this).val()
            },
            async: false,
            success : function(response) {
                data = response;
                return response;
            },
            error: function() {
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
        select.append($('<option></option>').val(-1).prop('disabled','disabled').html('Select District'));
        $.each(data, function(index, value) {
            select.append(
                $('<option></option>').val(value.id).html(value.districtNameBng).attr('bbs',value.bbsCode)
            );
        });

        var selected = $(this).find('option:selected');
        var extra = selected.data('bbs');
        $('input[name = divisionbbscode]').val(extra);

    });

    $('#districtdropdown').change(function() {
        var data = "";
        $.ajax({
            type:"POST",
            url : "${context}/upazillalistbydistrictid",
            data : {
                id: $(this).val()
            },
            async: false,
            success : function(response) {
                data = response;
                return response;
            },
            error: function() {
                 toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ");
            }
        });

        var select = $('#upazilladropdown');
        select.empty();
        select.append($('<option></option>').val(-1).prop('disabled','disabled').html('Select Upazila'));
        $.each(data, function(index, value) {
            select.append(
                $('<option></option>').val(value.id).html(value.upazillaNameBng).attr('bbs',value.bbsCode)
            );
        });
        var selected = $(this).find('option:selected');
        var extra = selected.data('bbs');
        $('input[name = districtbbscode]').val(extra);

    });

    $('#upazilladropdown').change(function() {
        var data = "";
        $.ajax({
            type:"POST",
            url : "${context}/municipalitylistbyupazillaid",
            data : {
                id: $(this).val()
            },
            async: false,
            success : function(response) {
                data = response;
                return response;
            },
            error: function() {
                 toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ");
            }
        });

        var select = $('#municipalitydropdown');
        select.empty();
        select.append($('<option></option>').val(-1).prop('disabled','disabled').html('Select Municipality'));
        $.each(data, function(index, value) {
            select.append(
                $('<option></option>').val(value.id).html(value.municipalityNameBng).attr('bbs',value.bbsCode)
            );
        });
        var selected = $(this).find('option:selected');
        var extra = selected.data('bbs');
        $('input[name = upazillabbscode]').val(extra);

    });



    $('#municipalitydropdown').change(function() {

        var selected = $(this).find('option:selected');
        var extra = selected.data('bbs');
        $('input[name = municipalitybbscode]').val(extra);

    });

    $("button").click(function () {


        $.ajax({
            url: "${context}/getoffice",
            method: "GET",
            data: {
                id: 19
            },
            beforeSend: function () {

            },
            error: function () {

            },
            success: function (result) {
                $('#stage').html('<p> Name: ' + result.office_ministry_id + '</p>');
                $('#stage').append('<p>Age : ' + result.parent_layer_id + '</p>');
                $('#stage').append('<p> Sex: ' + result.layer_name_eng + '</p>');
            }
        });
    });
});
</script>

</body>




</html>