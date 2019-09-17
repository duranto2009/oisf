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
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../includes/head.jsp" %>
    <!-- BEGIN PAGE STYLES -->
    <link rel="stylesheet" type="text/css" href="${context}/assets/admin/pages/css/tasks.css"/>
    <link rel="stylesheet" type="text/css" href="${context}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"/>

    <link rel="stylesheet" type="text/css" href="${context}/assets/global/plugins/fullcalendar/fullcalendar.min.css"/>
    <link href="${context}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css"/>
    <link href="${context}/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"/>
    <link href="${context}/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css"/>
    <link href="${context}/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>
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


    <script>



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
            <div class="clearfix"></div>
            <div class="portlet-body form">


                <div class="row">
                    <div class="col-md-12">
                        <div class="portlet box">
                            <div class="portlet-title">
                                <div class="caption"><i class="fa fa-gift"></i>Form Sample</div>

                            </div>
                            <div class="portlet-body form">
                                <!-- BEGIN FORM-->
                                <form:form action="${context}/addoffice" modelAttribute="office" class="form-horizontal">
                                <div class="form-body">
                                    <div class="form-body">
                                        <h3 class="form-section">Office Info</h3>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Office Name(English)</label>
                                                    <div class="col-md-9">
                                                        <form:input type="text" path="officeNameEng"
                                                                    class="form-control" name="nameEng"
                                                                    placeholder=""></form:input>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">বাংলায় নাম</label>
                                                    <div class="col-md-9">
                                                        <form:input type="text" path="officeNameBng"
                                                                    class="form-control" name="nameBng"
                                                                    placeholder=""></form:input>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">

                                                <div class="form-group">


                                                    <label class="control-label col-md-3">Service Ministry/Division
                                                        name</label>
                                                    <div class="col-md-9">


                                                        <form:select class="bs-select form-control"
                                                                     data-live-search=" true" path="officeMinistryId"
                                                                     id="ministrydropdown">

                                                            <c:forEach var="data" items="${ministry}">
                                                                <option value="${data.getId()}">
                                                                        ${data.getNameBng()}
                                                                </option>
                                                            </c:forEach>

                                                        </form:select>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3"> Office Layer Name</label>
                                                    <div class="col-md-9">
                                                        <form:select path="officeLayerId" class="form-control" name=""
                                                                     id="layerdropdown">

                                                        </form:select>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">

                                                <div class="form-group">


                                                    <label class="control-label col-md-3">Origin</label>
                                                    <div class="col-md-9">


                                                        <form:select class="bs-select form-control"
                                                                     data-live-search=" true" path="officeOriginId"
                                                                     id="origindropdown">

                                                            <c:forEach var="data" items="${origin}">
                                                                <option value="${data.getId()}">
                                                                        ${data.getNameBng()}
                                                                </option>
                                                            </c:forEach>

                                                        </form:select>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3"> parentOfficeId</label>
                                                    <div class="col-md-9">
                                                        <form:select path="parentOfficeId" class="form-control" name=""
                                                                     id="parentdropdown">

                                                        </form:select>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>



                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Digital Nothi Code</label>
                                                    <div class="col-md-9">
                                                        <form:input path="digitalNothiCode" type="text" name=" "
                                                                    class="form-control"
                                                                    placeholder="Ex:"></form:input>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Office Code</label>
                                                    <div class="col-md-9">
                                                        <form:input type="text" path="officeCode" name=""
                                                                    class="form-control"
                                                                    placeholder="Ex:"></form:input>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Office Phone</label>
                                                    <div class="col-md-9">
                                                        <form:input path="officePhone" type="text" name=""
                                                                    class="form-control"
                                                                    placeholder="Ex:"></form:input>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Office Mobile</label>
                                                    <div class="col-md-9">
                                                        <form:input path="officeMobile" type="text" name=""
                                                                    class="form-control"
                                                                    placeholder=" Ex:"></form:input>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>

                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Office Fax</label>
                                                    <div class="col-md-9">
                                                        <form:input path="officeFax" type="text" name=""
                                                                    class="form-control"
                                                                    placeholder=" Ex:"></form:input>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Office Email</label>
                                                    <div class="col-md-9">

                                                        <form:input path="officeEmail" type="text" name=""
                                                                    class="form-control"
                                                                    placeholder=" Ex:"></form:input>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="control-label col-md-3">Office Website</label>
                                                    <div class="col-md-9">
                                                        <form:input path="officeWeb" class="form-control " size="16"
                                                                    name="religion"
                                                                    type="text" value=""></form:input>

                                                    </div>
                                                </div>
                                            </div>


                                        </div>


                                    </div>

                                    <h3 class="form-section" style="margin-left: 10px"> লোকেশন তথ্য</h3>


                                    <div class="row">
                                        <div class="col-md-6">

                                            <div class="form-group">


                                                <label class="control-label col-md-3">বিভাগের নাম</label>
                                                <div class="col-md-9">


                                                    <form:select class="form-control" path="geoDivisionId"
                                                                 name="divdata" id="divisiondropdown">
                                                        <option value="-1">...</option>
                                                        <c:forEach var="data" items="${division}">
                                                            <option value="${data.getId()}"
                                                                    data-bbs="${data.getBbsCode()}">
                                                                    ${data.getDivisionNameBng()}
                                                            </option>
                                                        </c:forEach>
                                                    </form:select>

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">  জেলার নাম</label>
                                                <div class="col-md-9">
                                                    <form:select path="geoDistrictId" class="form-control" name=""
                                                                 id="districtdropdown">

                                                    </form:select>

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>

                                    <%--<form:input type="hidden" path="geoUpazilaId"--%>
                                                <%--name="upazilaid" ></form:input>--%>

                                    <%--<form:hidden path="geoCityCorporationId"--%>
                                                  <%--name="cityid" ></form:hidden>--%>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">জেলার বিভক্তির ধরন</label>
                                                <div class="radio-list col-md-9 " id="upacity">
                                                    <label class="radio-inline ">
                                                        <div class="radio">
                                                                <span class="">
                                                                    <input type="radio" name="optionsRadios" value="1">
                                                                </span>
                                                        </div>
                                                        উপজেলা
                                                    </label>
                                                    <label class="radio-inline">
                                                        <div class="radio" id="uniform-optionsRadios5">
                                                                <span>
                                                                    <input type="radio" name="optionsRadios" value="2">
                                                                </span>
                                                        </div>
                                                        সিটি কর্পোরেশন
                                                    </label>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group" id="upacitygroup" >

                                                <label class="control-label col-md-3" id="uplebel">Geo name</label>
                                                <div class="col-md-9">
                                                    <form:select path="geoUpazilaId" class="form-control"  name="upadata"
                                                                  id="upazilladropdown">

                                                </form:select>
                                                    <form:select  path="geoCityCorporationId" class="form-control"  name="citydata" id="citydropdown">

                                                    </form:select>
                                                </div>


                                            </div>

                                        </div>
                                    </div>

                                    <div class="row" id="forhide">
                                        <div class="col-md-6">

                                            <div class="form-group" id="unionmuniradio">
                                                <label class="control-label col-md-3" id="unimunilebel"> </label>
                                                <div class="radio-list btn-group  col-md-9 " id="uniminiward">


                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group" id="unionmunidiv">
                                                <label class="control-label col-md-3" id="unimunilebelname"> নাম</label>
                                                <div class="col-md-9">
                                                    <form:select path="geoUnionId" class="form-control" name="unidata"
                                                                 id="uniondropdown">

                                                    </form:select>
                                                    <form:select path="geoMunicipalityId" class="form-control" name="unidata"
                                                                 id="municipalitydropdown">

                                                    </form:select>

                                                </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6" id="wardhide">
                                            <div class="form-group" >
                                                <label class="control-label col-md-3">  ওয়ার্ড নং</label>
                                                <div class="col-md-9">
                                                    <form:select path="geoMunicipalityWardId" class="form-control" name="unidata"
                                                                 id="muniwarddropdown">

                                                    </form:select>

                                                    <form:select path="geoCityCorporationWardId"  class="form-control" name="citydata"
                                                             id="citywarddropdown">

                                                    </form:select>



                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-3">অবশিষ্ট ঠিকানা</label>
                                                <div class="col-md-9">
                                                    <input type="text" path="officeAddress" name=" "
                                                                class="form-control"
                                                                placeholder="Ex:"/>

                                                </div>
                                            </div>
                                        </div>
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

<script src="${context}/assets/js/geo/geosetup" type="text/javascript"></script>


<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>

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