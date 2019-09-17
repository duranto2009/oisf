<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>

<head>
    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <%@ include file="../includes/head.jsp" %>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <!-- BEGIN PAGE STYLES -->

    <link href="${context}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css"/>


    <%--<link href="${context}/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css"/>--%>
    <link href="${context}/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>

    <link href="${context}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${context}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <link href="${context}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet"
          type="text/css"/>


    <!-- END PAGE STYLES -->
    <link href="${context}/assets/css/style.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">
        .blackcolor {
            color: #000000;
        }
    </style>
    <script src="${context}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
</head>

<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed"
      style=" background-size: 100% 100%; overflow-x: hidden;">
<form action="" method="post" id="oisfForm" target="_blank">
    <input type="hidden" name="token" value="" id="token">
</form>
<!-- BEGIN HEADER -->
<div class="page-header md-shadow-z-1-i navbar navbar-top ">
    <%@ include file="../includes/header.jsp" %>
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container" style="margin:5px 0 0 0">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar-wrapper" style="margin-top: 20px">
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <div class="page-sidebar md-shadow-z-2-i  navbar-collapse collapse">
            <%@ include file="../includes/menu.jsp" %>

        </div>

    </div>

    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- BEGIN CONTENT BODY -->
        <div class="page-content">

            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PROFILE SIDEBAR -->
                    <div class="profile-sidebar">
                        <!-- PORTLET MAIN -->
                        <div class="portlet light profile-sidebar-portlet ">
                            <!-- SIDEBAR USERPIC -->
                            <div class="profile-userpic">
                                <img src="${context}/${userinfo.getEmployeeDTO().getImageFileName()}" class="img-responsive" alt=""></div>
                            <!-- END SIDEBAR USERPIC -->
                            <!-- SIDEBAR USER TITLE -->
                            <div class="profile-usertitle">
                                <div class="profile-usertitle-name">
                                    ${userinfo.getEmployeeDTO().getNameBng()}
                                </div>
                                <div class="profile-usertitle-job">
                                    ${userinfo.getDesignation()}
                                </div>
                            </div>
                            <!-- END SIDEBAR USER TITLE -->
                            <!-- SIDEBAR BUTTONS -->

                            <!-- END SIDEBAR BUTTONS -->
                            <!-- SIDEBAR MENU -->
                            <div class="portlet light">
                                <div class="margin-top-20 profile-desc-link">
                                    <i class="fa fa-phone-square"></i>
                                    <a href="#">${userinfo.getEmployeeDTO().getPersonalMobile()}</a>
                                </div>

                            </div>
                            <!-- END MENU -->
                        </div>
                        <!-- END PORTLET MAIN -->
                        <!-- PORTLET MAIN -->

                        <!-- END PORTLET MAIN -->
                    </div>
                    <!-- END BEGIN PROFILE SIDEBAR -->
                    <!-- BEGIN PROFILE CONTENT -->
                    <div class="profile-content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="portlet light ">
                                    <div class="portlet-title tabbable-line">
                                        <div class="caption caption-md">
                                            <i class="icon-globe theme-font hide"></i>
                                            <span class="caption-subject font-blue-madison bold uppercase">Profile Account</span>
                                        </div>
                                        <ul class="nav nav-tabs">
                                            <li class="active">
                                                <a href="#tab_1_1" data-toggle="tab">Personal
                                                    Info</a>
                                            </li>
                                            <li class="">
                                                <a href="#tab_1_3" data-toggle="tab">Change
                                                    Password</a>
                                            </li>
                                            <li class="">
                                                <a href="#tab_1_2" data-toggle="tab">Change
                                                    Image</a>
                                            </li>
                                            <li class="">
                                                <a href="#tab_1_5" data-toggle="tab">Change
                                                    Signature</a>
                                            </li>


                                            <li class="">
                                                <a href="#tab_1_4" data-toggle="tab">Add Security Question</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="portlet-body">
                                        <div class="tab-content">
                                            <!-- PERSONAL INFO TAB -->
                                            <div class="tab-pane active" id="tab_1_1">
                                                <div class="portlet light">
                                                    <div class="portlet-title">
                                                        <div class="caption showContent">প্রোফাইল তথ্য
                                                            <a class="btn btn-default btn-circle btn-sm"
                                                               data-toggle="tooltip" title=""
                                                               href="/employee_records/profileEdit"
                                                               data-original-title="পরিবর্তন করুন"><i
                                                                    class="fa fa-edit"></i></a>
                                                        </div>
                                                        <div class="actions">
                                                            <a class="btn btn-sm btn-danger" href="/">

                                                                ড্যাশবোর্ড </a>
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <div class="panel-body">
                                                            <table class="table table-bordered table-responsive"
                                                                   id="infoTable">
                                                                <tbody>
                                                                <tr>
                                                                    <th class="control-label col-md-2 text-right">নাম
                                                                        (বাংলা)
                                                                    </th>
                                                                    <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getNameBng()}
                                                                    </td>
                                                                    <th class="control-label col-md-2 text-right">নাম
                                                                        (ইংরেজি)
                                                                    </th>
                                                                    <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getNameEng()}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th class="control-label col-md-2 text-right">পিতার
                                                                        নাম (বাংলা)
                                                                    </th>
                                                                    <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getFatherNameBng()}
                                                                    </td>
                                                                    <th class="control-label col-md-2 text-right">পিতার
                                                                        নাম (ইংরেজি)
                                                                    </th>
                                                                    <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getFatherNameEng()}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th class="control-label col-md-2 text-right">মাতার
                                                                        নাম (বাংলা)
                                                                    </th>
                                                                    <td class="control-label col-md-4"> ${userinfo.getEmployeeDTO().getMotherNameBng()}</td>
                                                                    <th class="control-label col-md-2 text-right">মাতার
                                                                        নাম (ইংরেজি)
                                                                    </th>
                                                                    <td class="control-label col-md-4"> ${userinfo.getEmployeeDTO().getMotherNameEng()}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th class="control-label col-md-2 text-right">জন্ম
                                                                        তারিখ
                                                                    </th>
                                                                    <td class="control-label col-md-4"> ${userinfo.getEmployeeDTO().getDateOfBirth()}</td>

                                                                    <th class="control-label col-md-2 text-right">জন্ম
                                                                        স্থান
                                                                    </th>
                                                                    <td class="control-label col-md-4"> ${userinfo.getEmployeeDTO().getPlaceOfBirth()}</td>


                                                                </tr>
                                                                <tr>


                                                                    <th class="control-label col-md-2 text-right">
                                                                        জাতীয়তা
                                                                    </th>
                                                                    <td class="control-label col-md-4">
                                                                        ${userinfo.getEmployeeDTO().getNatioanality()}
                                                                    </td>

                                                                    <th class="control-label col-md-2 text-right">
                                                                        পরিচয়পত্র নম্বর
                                                                    </th>
                                                                    <td class="control-label col-md-4">
                                                                        ${userinfo.getEmployeeDTO().getNid()}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th class="control-label col-md-2 text-right">
                                                                        বর্তমান ঠিকানা
                                                                    </th>
                                                                    <td class="control-label col-md-4"> ${userinfo.getEmployeeDTO().getPresentAddress()}</td>


                                                                    <th class="control-label col-md-2 text-right">
                                                                        স্থায়ী ঠিকানা
                                                                    </th>
                                                                    <td class="control-label col-md-4">
                                                                        ${userinfo.getEmployeeDTO().getPermanentAddress()}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th class="control-label col-md-2 text-right">পেশা
                                                                    </th>

                                                                    <td class="control-label col-md-4">
                                                                        <c:choose>
                                                                            <c:when test="${userinfo.getEmployeeDTO().getOccupation()==null}">
                                                                                প্রদত্ত নয়
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                ${userinfo.getEmployeeDTO().getOccupation()}
                                                                            </c:otherwise>


                                                                        </c:choose>
                                                                    </td>


                                                                    <th class="control-label col-md-2 text-right">
                                                                        শিক্ষাগত যোগ্যতা
                                                                    </th>
                                                                    <td class="control-label col-md-4">
                                                                        <c:choose>
                                                                            <c:when test="${userinfo.getEmployeeDTO().getEducationalQualifications()==null}">
                                                                                প্রদত্ত নয়
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                ${userinfo.getEmployeeDTO().getEducationalQualifications()}
                                                                            </c:otherwise>


                                                                        </c:choose>

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th class="control-label col-md-2 text-right">
                                                                        লিঙ্গ
                                                                    </th>
                                                                    <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getGender()}</td>
                                                                    <th class="control-label col-md-2 text-right">
                                                                        ধর্ম
                                                                    </th>
                                                                    <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getReligion()}</td>
                                                                </tr>
                                                                <tr id="insertafter">
                                                                    <th class="control-label col-md-2 text-right">রক্তের
                                                                        গ্রুপ
                                                                    </th>
                                                                    <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getBloodGroup()}</td>
                                                                    <th class="control-label col-md-2 text-right">
                                                                        বৈবাহিক অবস্থা
                                                                    </th>
                                                                    <td class="control-label col-md-4"
                                                                        id="isMarried">${userinfo.getEmployeeDTO().getMaritalStatus()}</td>
                                                                </tr>
                                                                <c:if test="${userinfo.getEmployeeDTO().getMaritalStatus()=='Married'}">
                                                                    <c:if test="${userinfo.getEmployeeDTO().getGender()=='Male'}">
                                                                        <tr>
                                                                            <th class="control-label col-md-2 text-right">
                                                                                স্ত্রী এর নাম
                                                                            </th>
                                                                            <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getSpouseNameEng()}</td>
                                                                            <th class="control-label col-md-2 text-right">
                                                                                স্ত্রী এর নাম (বাংলা)
                                                                            </th>
                                                                            <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getSpouseNameBng()}</td>
                                                                        </tr>

                                                                    </c:if>
                                                                    <c:if test="${userinfo.getEmployeeDTO().getGender()=='Female'}">
                                                                        <tr>
                                                                            <th class="control-label col-md-2 text-right">
                                                                                স্বামী এর নাম
                                                                            </th>
                                                                            <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getSpouseNameEng()}</td>
                                                                            <th class="control-label col-md-2 text-right">
                                                                                স্বামী এর নাম (বাংলা)
                                                                            </th>
                                                                            <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getSpouseNameBng()}</td>
                                                                        </tr>

                                                                    </c:if>


                                                                </c:if>


                                                                <tr>
                                                                    <th class="control-label col-md-2 text-right">
                                                                        ব্যক্তিগত ই-মেইল
                                                                    </th>
                                                                    <td class="control-label col-md-4">
                                                                        ${userinfo.getEmployeeDTO().getPersonalEmail()}
                                                                    </td>
                                                                    <th class="control-label col-md-2 text-right">
                                                                        ব্যক্তিগত মোবাইল নম্বর
                                                                    </th>
                                                                    <td class="control-label col-md-4">${userinfo.getEmployeeDTO().getPersonalMobile()}</td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                            <!-- END PERSONAL INFO TAB -->
                                            <!-- CHANGE AVATAR TAB -->
                                            <div class="tab-pane " id="tab_1_2">
                                                <div class="portlet light ">

                                                    <div class="portlet-body form">


                                                        <!-- BEGIN FORM-->
                                                        <form action="${context}/imagechange" class="form-horizontal form-bordered"
                                                              enctype="multipart/form-data" method="post">
                                                            <div class="form-body">


                                                                <div class="form-group ">

                                                                    <label class="control-label col-md-3">Upload
                                                                        Image</label>
                                                                    <div class="col-md-9">
                                                                        <div class="fileinput fileinput-new"
                                                                             data-provides="fileinput">
                                                                            <div class="fileinput-preview thumbnail"
                                                                                 data-trigger="fileinput"
                                                                                 style="width: 200px; height: 150px; line-height: 150px;">
                                                                                <img id="previewImg" src="" />
                                                                            </div>
                                                                            <div>
                                                                        <span class="btn red btn-outline btn-file">
                                                                    <span class="fileinput-new"> Select image </span>
                                                                    <span class="fileinput-exists"> Change </span>
                                                                    <input type="hidden" value="" name="...">
                                                                    <input id="uploadimage" type="file" name="file"
                                                                           onchange="uploadPhotos('imagechange')"
                                                                           accept="image/png,image/gif,image/jpeg,image/jpg">

                                                                        </span>
                                                                                <a href="javascript:;"
                                                                                   class="btn red fileinput-exists"
                                                                                   data-dismiss="fileinput"> Remove </a>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                </div>
                                                                <div class="form-actions">
                                                                    <div class="row">
                                                                        <div class="col-md-offset-3 col-md-9">
                                                                            <button type="submit"
                                                                                    class="btn green">Submit
                                                                            </button>
                                                                            <a href="javascript:;"
                                                                               class="btn btn-outline grey-salsa">Cancel</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <!-- END FORM-->
                                                    </div>
                                                </div>
                                            </div>


                                            <!-- END CHANGE AVATAR TAB -->
                                            <!-- CHANGE PASSWORD TAB -->
                                            <div class="tab-pane" id="tab_1_3">

                                                <div class="portlet light">
                                                    <div class="portlet-title">
                                                        <div class="caption showContent"> পাসওয়ার্ড পরিবর্তন
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body form">

                                                        <form method="post" accept-charset="utf-8"
                                                              action="${context}/employee_records/passwordChange?_=1507434634642">
                                                            <div style="display:none;"><input type="hidden"
                                                                                              name="_method"
                                                                                              value="POST"></div>
                                                            <div class="form-horizontal">
                                                                <div class="form-group">
                                                                    <label class="col-sm-4 control-label">বর্তমান
                                                                        পাসওয়ার্ড</label>

                                                                    <div class="col-sm-6">
                                                                        <div class="input password required"><input
                                                                                type="password" name="current_password"
                                                                                id="current_password"
                                                                                required="required"
                                                                                class="form-control validate[required]"
                                                                                placeholder="বর্তমান পাসওয়ার্ড"
                                                                                value=""></div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-4 control-label"> নতুন
                                                                        পাসওয়ার্ড</label>

                                                                    <div class="col-sm-6">
                                                                        <div class="input password required"><input
                                                                                type="password" name="password"
                                                                                id="password" required="required"
                                                                                class="form-control validate[required,min[6],funcCall[checkPassword]]"
                                                                                placeholder=" নতুন পাসওয়ার্ড"
                                                                                minlength="6" value=""></div>
                                                                        <span id="custommsg"></span>
                                                                        <span class="help-block font-red"><b>*</b> পাসওয়ার্ড নুন্যতম ৬ অক্ষরের হতে হবে। অন্তত একটি A-Z অথবা a-z থাকতে হবে।  </span>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label class="col-sm-4 control-label">পুনরায় নতুন
                                                                        পাসওয়ার্ডটি দিন</label>

                                                                    <div class="col-sm-6">
                                                                        <div class="input password required"><input
                                                                                type="password" name="cpassword"
                                                                                id="cpassword"
                                                                                class="form-control validate[required,min[8],equals[password]]"
                                                                                required="required"
                                                                                placeholder="পুনরায় নতুন পাসওয়ার্ডটি দিন">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-actions">
                                                                <button type="submit" id="btn_submit"
                                                                        class="btn green uppercase">সংরক্ষণ
                                                                </button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>

                                            </div>
                                            <!-- END CHANGE PASSWORD TAB -->
                                            <!-- PRIVACY SETTINGS TAB -->
                                            <div class="tab-pane" id="tab_1_4">
                                                <div class="portlet light">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            Ans Questions
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body form">
                                                        <form action="${context}/securityques" method="post"
                                                              class="form-horizontal">


                                                            <div class="form-group">


                                                                <label class="control-label col-md-3">Select Security
                                                                    Question</label>
                                                                <div class="col-md-9">


                                                                    <select class="form-control"
                                                                            name="securityques" id="questiondropdown">

                                                                    </select>

                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="control-label col-md-3">Ans:</label>
                                                                <div class="col-md-9">
                                                                    <input type="text"
                                                                           class="form-control" name="ans"
                                                                           placeholder="Ans">

                                                                </div>
                                                            </div>

                                                            <!--end profile-settings-->
                                                            <div class=" form-actions">
                                                                <div class="row">
                                                                    <div class="col-md-offset-3 col-md-9">
                                                                        <button class="btn red " type="submit"> Save
                                                                            Changes
                                                                        </button>
                                                                        <a href="javascript:;" class="btn default">
                                                                            Cancel </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <div class="margin-top-20">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_1_5">
                                                <div class="portlet light form-fit bordered">

                                                    <div class="portlet-body form">
                                                        <!-- BEGIN FORM-->
                                                        <form action="${context}/signchange" enctype="multipart/form-data"
                                                              method="post" role="form"
                                                              class="form-horizontal form-bordered">
                                                            <div class="form-body">


                                                                <div class="form-group ">
                                                                    <label class="control-label col-md-3">Signature
                                                                        Upload
                                                                    </label>
                                                                    <div class="col-md-9">
                                                                        <div class="fileinput fileinput-new"
                                                                             data-provides="fileinput">
                                                                            <div class="fileinput-preview thumbnail"
                                                                                 data-trigger="fileinput"
                                                                                 style="width: 200px; height: 150px;"></div>
                                                                            <div>
                                                                                <br>
                                                                                <br>
                                                                                <span class="btn blue btn-outline btn-file">
                                                                                <span class="fileinput-new"> Select Signature </span>
                                                                                <span class="fileinput-exists"> Change </span>
                                                                                <input type="file" name="file"> </span>
                                                                                <a href="javascript:;"
                                                                                   class="btn red fileinput-exists"
                                                                                   data-dismiss="fileinput"> Remove </a>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-actions">
                                                                <div class="row">
                                                                    <div class="col-md-offset-3 col-md-9">
                                                                        <button type="submit" class="btn green">
                                                                            <i class="fa fa-check"></i> Submit
                                                                        </button>
                                                                        <a href="javascript:;"
                                                                           class="btn btn-outline grey-salsa">Cancel</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </form>
                                                        <!-- END FORM-->
                                                    </div>
                                                </div>

                                            </div>
                                        </div>


                                        <canvas id="canvasEl"></canvas>
                                        <canvas id ="2"> </canvas>
                                        <!-- END PRIVACY SETTINGS TAB -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PROFILE CONTENT -->
            </div>
        </div>
    </div>
    <!-- END CONTENT -->


</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../includes/footer.jsp" %>
</div>

<%@ include file="../includes/includes.jsp" %>


<%--<script src="../assets/js/menu.js" type="text/javascript"></script>--%>
<script src="${context}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>

<%--<script src="/assets/global/plugins/exif-js-master/exif.js" type="text/javascript"></script>--%>


<%--<script src=" static/assets/global/plugins/jquery-file-upload/js/jquery.fileupload-image.js" type="text/javascript"></script>--%>

<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>


<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/common/validation.js" type="text/javascript"></script>


<%--<script src="/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>--%>
<%--<script src="/assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>



<script>

    $(document).ready(function () {

        $('#questiondropdown').ready(function () {
            var data = "";
            $.ajax({
                type: "GET",
                url: "${context}/questions",
                async: false,
                success: function (response) {
                    data = response;
                    return response;
                },
                error: function () {
                    var select = $('#questiondropdown')
                    select.empty();
                    select.append($('<option></option>').val(-1).html('পাওয়া যায়নি'));
                }
            });

            var select = $('#questiondropdown');
            select.empty();
            select.append($('<option></option>').val(-1).html('Select One'));
            $.each(data, function (index, value) {
                select.append(
                    $('<option></option>').val(value).html(value)
                );
            });
        });


        /*
         -------------------------------
         -------HANDLE FILE UPLOAD------
         -------------------------------
         */

        var input = $("#uploadimage");
        input.on('change', handleFiles);

        function handleFiles(e) {
            var img = new Image;
            img.src = URL.createObjectURL(e.target.files[0]);
            img.onload = function() {
                resizeImgSimple(img, 240, 240, 40,'jpeg',function (base64String) {
                    var blobBin = atob(base64String.split(',')[1]);
                    alert(blobBin.length);
                    var array = [];
                    for(var i = 0; i < blobBin.length; i++) {
                        array.push(blobBin.charCodeAt(i));
                    }
                    var file=new Blob([new Uint8Array(array)], {type: 'image/jpeg'});


                    var formdata = new FormData();
                    formdata.append("file", file);
                    $.ajax({
                        type: "POST",
                        processData: false,
                        contentType: false,
                        url: "${context}/imagechange",
                        data: formdata,
                        async: false,
                        success: function (response) {
                            alert("sucess");
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
                });


            }
        }



        function resizeImgSimple(img, width, height, quality, output_format,callback){

            var mime_type;
            if(output_format==="png"){
                mime_type = "image/png";
            } else if(output_format==="webp") {
                mime_type = "image/webp";
            } else {
                mime_type = "image/jpeg";
            }

            //converting to jpeg

            var canvasforjpeg =document.createElement('canvas');// document.getElementById("canvasEl");
            var ctx = canvasforjpeg.getContext('2d');
            canvasforjpeg.height = img.naturalHeight;
            canvasforjpeg.width = img.naturalWidth;
            ctx.fillStyle = '#fff';
            ctx.fillRect(0,0,canvasforjpeg.width, canvasforjpeg.height);
            ctx.drawImage(img,0,0,canvasforjpeg.width, canvasforjpeg.height);
            var image = new Image;
            image.src = canvasforjpeg.toDataURL('image/jpeg');
            image.onload = function () {
                //resizing and quality changing
                var canvas = document.createElement('canvas');

                var  heightratio ,widthration;

                heightratio = height/img.height;
                widthratio = width/img.width;

                canvas.width = img.width*widthratio;
                canvas.height = img.height*heightratio;
                canvas.getContext("2d").drawImage(image, 0, 0, img.width*widthratio, img.height*heightratio);

                var newImageData = canvas.toDataURL(mime_type, quality/100);

                callback(newImageData);


            };


        }
        function resizeImg(img, maxWidth, maxHeight, degrees) {
            var imgWidth = img.width,
                imgHeight = img.height;

            var ratio = 1,
                ratio1 = 1,
                ratio2 = 1;
            ratio1 = maxWidth / imgWidth;
            ratio2 = maxHeight / imgHeight;

            // Use the smallest ratio that the image best fit into the maxWidth x maxHeight box.
            if (ratio1 < ratio2) {
                ratio = ratio1;
            } else {
                ratio = ratio2;
            }
            var canvas = document.createElement("canvas");
            var canvasContext = canvas.getContext("2d");
            var canvasCopy = document.createElement("canvas");
            var copyContext = canvasCopy.getContext("2d");
            var canvasCopy2 = document.createElement("canvas");
            var copyContext2 = canvasCopy2.getContext("2d");
            canvasCopy.width = imgWidth;
            canvasCopy.height = imgHeight;
            copyContext.drawImage(img, 0, 0);

            // init
            canvasCopy2.width = imgWidth;
            canvasCopy2.height = imgHeight;
            copyContext2.drawImage(canvasCopy, 0, 0, canvasCopy.width, canvasCopy.height, 0, 0, canvasCopy2.width, canvasCopy2.height);


            var rounds = 1;
            var roundRatio = ratio * rounds;
            for (var i = 1; i <= rounds; i++) {


                // tmp
                canvasCopy.width = imgWidth * roundRatio / i;
                canvasCopy.height = imgHeight * roundRatio / i;

                copyContext.drawImage(canvasCopy2, 0, 0, canvasCopy2.width, canvasCopy2.height, 0, 0, canvasCopy.width, canvasCopy.height);

                // copy back
                canvasCopy2.width = imgWidth * roundRatio / i;
                canvasCopy2.height = imgHeight * roundRatio / i;
                copyContext2.drawImage(canvasCopy, 0, 0, canvasCopy.width, canvasCopy.height, 0, 0, canvasCopy2.width, canvasCopy2.height);

            } // end for

            canvas.width = imgWidth * roundRatio / rounds;
            canvas.height = imgHeight * roundRatio / rounds;
            canvasContext.drawImage(canvasCopy2, 0, 0, canvasCopy2.width, canvasCopy2.height, 0, 0, canvas.width, canvas.height);


            if (degrees == 90 || degrees == 270) {
                canvas.width = canvasCopy2.height;
                canvas.height = canvasCopy2.width;
            } else {
                canvas.width = canvasCopy2.width;
                canvas.height = canvasCopy2.height;
            }

            canvasContext.clearRect(0, 0, canvas.width, canvas.height);
            if (degrees == 90 || degrees == 270) {
                canvasContext.translate(canvasCopy2.height / 2, canvasCopy2.width / 2);
            } else {
                canvasContext.translate(canvasCopy2.width / 2, canvasCopy2.height / 2);
            }
            canvasContext.rotate(degrees * Math.PI / 180);
            canvasContext.drawImage(canvasCopy2, -canvasCopy2.width / 2, -canvasCopy2.height / 2);


            var dataURL = canvas.toDataURL();

            return dataURL;
        }

    });


</script>

<style>
    .profile-sidebar {
        float: left;
        width: 275px;
        margin-right: 20px;
    }

    .profile-content {
        overflow: hidden;
    }

    /* PROFILE SIDEBAR */
    .profile-sidebar-portlet {
        padding: 30px 0 0 0 !important;
    }

    .profile-userpic img {
        float: none;
        margin: 0 auto;
        width: 190px;
        height: 170px;
        -webkit-border-radius: 50% !important;
        -moz-border-radius: 50% !important;
        border-radius: 50% !important;
    }

    .profile-usertitle {
        text-align: center;
        margin-top: 20px;
    }

    .profile-usertitle-name {
        color: #5a7391;
        font-size: 20px;
        font-weight: 600;
        margin-bottom: 7px;
    }

    .profile-usertitle-job {
        text-transform: uppercase;
        color: #5b9bd1;
        font-size: 13px;
        font-weight: 800;
        margin-bottom: 7px;
    }

    .profile-userbuttons {
        text-align: center;
        margin-top: 10px;
    }

    .profile-userbuttons .btn {
        margin-right: 5px;
    }

    .profile-userbuttons .btn:last-child {
        margin-right: 0;
    }

    .profile-userbuttons button {
        text-transform: uppercase;
        font-size: 11px;
        font-weight: 600;
        padding: 6px 15px;
    }

    .profile-usermenu {
        margin-top: 30px;
        padding-bottom: 20px;
    }

    .profile-usermenu ul li {
        border-bottom: 1px solid #f0f4f7;
    }

    .profile-usermenu ul li:last-child {
        border-bottom: none;
    }

    .profile-usermenu ul li a {
        color: #93a3b5;
        font-size: 16px;
        font-weight: 400;
    }

    .profile-usermenu ul li a i {
        margin-right: 8px;
        font-size: 16px;
    }

    .profile-usermenu ul li a:hover {
        background-color: #fafcfd;
        color: #5b9bd1;
    }

    .profile-usermenu ul li.active a {
        color: #5b9bd1;
        background-color: #f6f9fb;
        border-left: 2px solid #5b9bd1;
        margin-left: -2px;
    }

    .profile-stat {
        padding-bottom: 20px;
        border-bottom: 1px solid #f0f4f7;
    }

    .profile-stat-title {
        color: #7f90a4;
        font-size: 25px;
        text-align: center;
    }

    .profile-stat-text {
        color: #5b9bd1;
        font-size: 11px;
        font-weight: 800;
        text-align: center;
    }

    .profile-desc-title {
        color: #7f90a4;
        font-size: 17px;
        font-weight: 600;
    }

    .profile-desc-text {
        color: #7e8c9e;
        font-size: 14px;
    }

    .profile-desc-link i {
        /*width: 22px;*/
        font-size: 19px;
        color: #abb6c4;
        margin-right: 5px;
    }

    .profile-desc-link a {
        font-size: 14px;
        font-weight: 600;
        color: #5b9bd1;
    }

    /* END PROFILE SIDEBAR */
    /* RESPONSIVE MODE */
    @media (max-width: 991px) {
        /* 991px */
        /* 991px */
        .profile-sidebar {
            float: none;
            width: 100% !important;
            margin: 0;
        }

        .profile-sidebar > .portlet {
            margin-bottom: 20px;
        }

        .profile-content {
            overflow: visible;
        }
    }


</style>
</div>
</body>


