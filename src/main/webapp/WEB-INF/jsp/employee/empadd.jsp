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
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <!-- BEGIN PAGE STYLES -->
    <link rel="stylesheet" type="text/css" href="/assets/admin/pages/css/tasks.css"/>
    <link rel="stylesheet" type="text/css"
          href="${context}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/global/plugins/fullcalendar/fullcalendar.min.css"/>
    <link href="${context}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${context}/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${context}/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${context}/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${context}/assets/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css"/>


    <link rel="stylesheet" type="text/css" href="${context}/assets/global/plugins/select2/select2.css"/>
    <link rel="stylesheet" type="text/css"
          href="${context}/assets/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${context}/assets/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${context}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
    <!-- END PAGE STYLES -->
    <link href="${context}/assets/css/style.css" rel="stylesheet" type="text/css"/>


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
            var extra = selected.attr('bbs');
            $('input[name = districtbbscode]').val(extra);

        });

    });
    </script>

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
            <div class="portlet-body form">


                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet box green">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-gift"></i>Form Sample</div>
                                <div class="tools">
                                    <a href="javascript:;" class="collapse"></a>
                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>
                                    <a href="javascript:;" class="reload"></a>
                                    <a href="javascript:;" class="remove"></a>
                                </div>
                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <form:form action="empadd" modelAttribute="employee" class="form-horizontal">
                                    <div class="form-body">
                                        <h3 class="form-section">Person Info</h3>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Employee Name(English)</label>
                                                    <div class="col-md-9">
                                                        <input type="text" class="form-control" name="nameEng"
                                                               placeholder="">

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">বাংলায় নাম</label>
                                                    <div class="col-md-9">
                                                        <input type="text" class="form-control" name="nameBng"
                                                               placeholder="">

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Father Name English</label>
                                                    <div class="col-md-9">
                                                        <input type="text" name="fatherNameEng" class="form-control"
                                                               placeholder="Ex:">

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">First Name</label>
                                                    <div class="col-md-9">
                                                        <input type="text" name="fatherNameBng" class="form-control"
                                                               placeholder="Ex:">

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Father Name English</label>
                                                    <div class="col-md-9">
                                                        <input type="text" name="motherNameEng" class="form-control"
                                                               placeholder="Ex:">

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">First Name</label>
                                                    <div class="col-md-9">
                                                        <input type="text" name="motherNameBng" class="form-control"
                                                               placeholder=" Ex:">

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>


                                        <!--/row-->
                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Date of Birth</label>
                                                    <div class="col-md-9">
                                                        <input class="form-control form-control-inline input-medium date-picker"
                                                               size="16" name="dateOfBirth" type="text" value="">
                                                        <span class="help-block"> Select date </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Gender</label>
                                                    <div class="col-md-9">
                                                        <select class="form-control" name="gender">
                                                            <option value="M">Male</option>
                                                            <option value="F">Female</option>
                                                            <option value="O">Other</option>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Religion</label>
                                                    <div class="col-md-9">
                                                        <input class="form-control " size="16" name="religion"
                                                               type="text" value="">

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Blood Group</label>
                                                    <div class="col-md-9">
                                                        <select class="form-control" name="bloodGroup">
                                                            <option value="-1" disabled="disabled" selected="selected">
                                                                Select One
                                                            </option>
                                                            <option value="A+">A+</option>
                                                            <option value="B+">B+</option>
                                                            <option value="AB+">AB+</option>
                                                            <option value="O+">O+</option>
                                                            <option value="A-">A-</option>
                                                            <option value="B-">B-</option>
                                                            <option value="AB-">AB-</option>
                                                            <option value="O-">O-</option>
                                                            <option value="Ot">Other</option>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Maritial Status</label>
                                                    <div class="col-md-9">
                                                        <select class="form-control" name="maritalStatus">
                                                            <option value="-1" disabled="disabled" selected="selected">
                                                                Select One
                                                            </option>
                                                            <option value="0">Un Married</option>
                                                            <option value="1">Married</option>
                                                            <option value="2">Divorced</option>
                                                            <option value="3">Widowed</option>
                                                            <option value="4">Other</option>
                                                        </select>

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">


                                                <label class="control-label col-md-3">Profile Picture</label>
                                                <div class="col-md-9">
                                                    <div class="fileinput fileinput-new" data-provides="fileinput">
                                                        <div class="input-group input-large">
                                                            <div class="form-control uneditable-input input-fixed input-medium"
                                                                 data-trigger="fileinput">
                                                                <i class="fa fa-file fileinput-exists"></i>
                                                                <span class="fileinput-filename"> </span>
                                                            </div>
                                                            <span class="input-group-addon btn default btn-file">
                                                                <span class="fileinput-new"> Select file </span>
                                                                <input type="hidden"><input type="file"
                                                                                            name="..."> </span>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                    <h3 class="form-section" style="margin-left: 10px"> Official Information</h3>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">NID</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" name="nid"
                                                           placeholder="">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Birth Certificate No</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" name="bcn"
                                                           placeholder="">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Passport No:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="ppn" class="form-control"
                                                           placeholder="Ex:">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Email</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="personalEmail" class="form-control"
                                                           placeholder="Ex:">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Mobile No</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="personalMobile" class="form-control"
                                                           placeholder="Ex:">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Alternate Mobile No:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="alternativeMobile" class="form-control"
                                                           placeholder=" Ex:">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="col-md-3 control-label">Is Cadre?</label>
                                            <div class="col-md-9">
                                                <div class="radio-list" id="isCadre">
                                                    <label class="radio-inline">
                                                        <div class="radio" id="uniform-optionsRadios25"><span><input
                                                                type="radio" name="isCadre" id="cadreyes"
                                                                value="yes" checked=""></span></div>
                                                        Option 1 </label>
                                                    <label class="radio-inline">
                                                        <div class="radio" id="uniform-optionsRadios26"><span
                                                                class="checked"><input type="radio" name="optionsRadios"
                                                                                       id="optionsRadios26"
                                                                                       value="no"
                                                                                       checked=""></span></div>
                                                        No </label>

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Cadre Name</label>
                                                <div class="col-md-9">
                                                    <select class="form-control" name="employeeCadreId" id="cadredropdown">

                                                    </select>

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Service Ministry/Division  name</label>
                                                <div class="col-md-9">
                                                    <select class="form-control" name="serviceMinistryId" id="ministrydropdown">

                                                    </select>

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Service Office Name</label>
                                                <div class="col-md-9">
                                                    <select class="form-control" name="serviceOfficeId" id="officedropdown">

                                                    </select>

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Joining Date</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control " name="identityNo">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">ID Card No:</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control " name="identityNo">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Mobile No</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="personalMobile" class="form-control"
                                                           placeholder="Ex:">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">Alternate Mobile No:</label>
                                                <div class="col-md-9">
                                                    <input type="text" name="alternativeMobile" class="form-control"
                                                           placeholder=" Ex:">

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>


                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="row">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <button type="submit" class="btn green">Submit</button>
                                                        <button type="button" class="btn default">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                            <!-- END FORM-->
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
    <%@ include file="../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->

<!-- END PAGE LEVEL PLUGINS -->

<%@ include file="../includes/includes.jsp" %>


<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/appregistration/validation.js" type="text/javascript"></script>

<link href="${context}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet"
      type="text/css"/>
<link href="${context}/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet"
      type="text/css"/>
<link href="${context}/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet"
      type="text/css"/>
<link href="${context}/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
      type="text/css"/>
<link href="${context}/assets/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css"/>
</body>


</html>