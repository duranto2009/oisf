<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>

<head>
    <meta charset="utf-8"/>
    <c:set var="context" value="${pageContext.request.contextPath}"/>
    <%@ include file="../includes/head.jsp" %>
    <!-- BEGIN PAGE STYLES -->

    <link href="${context}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet"
          type="text/css"/>


    <%--<link href="${context}/assets/global/css/components.min.css" rel="stylesheet" id="style_components"--%>
    <%--type="text/css"/>--%>
    <link href="${context}/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>


    <link href="${context}/assets/global/plugins/bootstrap-editable/bootstrap-editable/css/bootstrap-editable.css"
          rel="stylesheet" type="text/css"/>
    <link href="${context}/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet"
          type="text/css"/>
    <link href="${context}/assets/global/plugins/bootstrap-editable/inputs-ext/address/address.css" rel="stylesheet"
          type="text/css"/>


    <%--<link href="${context}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>--%>
    <%--<link href="${context}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>--%>
    <%--<link href="${context}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>--%>


    <%--<!-- END PAGE STYLES -->--%>
    <%--<link href="${context}/assets/css/style.css" rel="stylesheet" type="text/css"/>--%>

    <style type="text/css">
        .blackcolor {
            color: #000000;
        }
    </style>
    <%--<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>
</head>

<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed"
      style=" background-size: 100% 100%; overflow-x: hidden;">

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

            <div class="card">
                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN PROFILE SIDEBAR -->
                        <div class="profile-sidebar">
                            <!-- PORTLET MAIN -->
                            <div class="portlet light profile-sidebar-portlet ">
                                <!-- SIDEBAR USERPIC -->
                                <div class="profile-userpic">
                                    <img src="${userinfo.getEmployeeDTO().getImageFileName()}"
                                         class="img-responsive" alt=""></div>
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
                                                <span class="caption-subject font-blue-madison bold uppercase"> প্রোফাইল একাউন্ট</span>
                                            </div>
                                            <ul class="nav nav-tabs">
                                                <li class="active">
                                                    <a href="#tab_1_1" data-toggle="tab"> ব্যক্তিগত তথ্য
                                                    </a>
                                                </li>
                                                <li class="">
                                                    <a href="#tab_1_3" data-toggle="tab">পাসওয়ার্ড পরিবর্তন</a>
                                                </li>
                                                <li class="">
                                                    <a href="#tab_1_2" data-toggle="tab">ছবি পরিবর্তন</a>
                                                </li>
                                                <li class="">
                                                    <a href="#tab_1_5" data-toggle="tab">স্বাক্ষর পরিবর্তন</a>
                                                </li>


                                                <li class="">
                                                    <a href="#tab_1_4" data-toggle="tab"> সিকিউরিটি প্রশ্ন পরিবর্তন</a>
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

                                                            </div>
                                                            <div class="actions">
                                                                <a class="btn btn-sm btn-danger"
                                                                   href="${context}/userdashboard">

                                                                    ড্যাশবোর্ড </a>
                                                            </div>
                                                        </div>
                                                        <div class="portlet-body">
                                                            <div class="panel-body">
                                                                <table class="table table-bordered table-responsive"
                                                                       id="infoTable">
                                                                    <tbody>
                                                                    <tr>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            নাম
                                                                            (বাংলা)
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <%--${userinfo.getEmployeeDTO().getNameBng()}--%>
                                                                            <a href="#" id="nameBng" data-type="text"
                                                                               data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="বাংলায় নাম দিন"
                                                                               class="editable editable-click">
                                                                                ${userinfo.getEmployeeDTO().getNameBng()} </a>
                                                                            <%--<div class="popover editable-container editable-popup fade in top" role="tooltip" id="popover247584" style="top: -77px; left: 136.125px; display: block;"><div class="arrow" style="left: 50%;"></div><h3 class="popover-title">Enter username</h3><div class="popover-content"> <div><div class="editableform-loading" style="display: none;"></div><form class="form-inline editableform" style=""><div class="form-group"><div><div class="editable-input" style="position: relative;"><input type="text" class="form-control" style="padding-right: 24px;"><span class="editable-clear-x"></span></div><div class="editable-buttons"><button type="submit" class="btn blue editable-submit"><i class="fa fa-check"></i></button><button type="button" class="btn default editable-cancel"><i class="fa fa-times"></i></button></div></div><div class="editable-error-block help-block" style="display: none;"></div></div></form></div></div></div>--%>

                                                                        </td>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            নাম(ইংরেজি)
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="nameEng" data-type="text"
                                                                               data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="ইংরেজিতে নাম দিন"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getNameEng()} </a>
                                                                            <%--${userinfo.getEmployeeDTO().getNameEng()}--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            পিতার
                                                                            নাম (বাংলা)
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="fatherNameBng"
                                                                               data-type="text" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="পিতার নাম বাংলায় দিন"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getFatherNameBng()} </a>
                                                                            <%--${userinfo.getEmployeeDTO().getFatherNameBng()}--%>
                                                                        </td>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            পিতার
                                                                            নাম (ইংরেজি)
                                                                        </th>
                                                                        <td class="control-label col-md-4">

                                                                            <a href="#" id="fatherNameEng"
                                                                               data-type="text"
                                                                               data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="পিতার নাম ইংরেজিতে দিন"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getFatherNameEng()} </a>

                                                                            <%--${userinfo.getEmployeeDTO().getFatherNameEng()}--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            মাতার
                                                                            নাম (বাংলা)
                                                                        </th>
                                                                        <td class="control-label col-md-4">

                                                                            <a href="#" id="motherNameBng"
                                                                               data-type="text" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="মাতার নাম বাংলায় দিন"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getMotherNameBng()} </a>

                                                                            <%--${userinfo.getEmployeeDTO().getMotherNameBng()}</td>--%>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            মাতার
                                                                            নাম (ইংরেজি)
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="motherNameEng"
                                                                               data-type="text" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="মাতার নাম ইংরেজিতে দিন"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getMotherNameEng()} </a>

                                                                            <%--${userinfo.getEmployeeDTO().getMotherNameEng()}--%>

                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            জন্ম
                                                                            তারিখ
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="dateOfBirth"
                                                                               data-type="combodate"
                                                                               data-url="${context}/postValue"
                                                                               data-value="1984-05-15"
                                                                               data-format="YYYY-MM-DD"
                                                                               data-viewformat="DD/MM/YYYY"
                                                                               data-template="D / MMM / YYYY"
                                                                               data-pk="1"
                                                                               data-original-title="জন্ম তারিখ নির্বাচন করুন"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getDateOfBirth()}</a>

                                                                            <%--<a href="#" id="dateOfBirth" data-type="text" data-pk="1" data-url="/postValue" data-original-title="Enter username" class="editable editable-click"> ${userinfo.getEmployeeDTO().getDateOfBirth()} </a>--%>

                                                                            <%--${userinfo.getEmployeeDTO().getDateOfBirth()}--%>

                                                                        </td>

                                                                        <th class="control-label col-md-2 text-right">
                                                                            জন্ম
                                                                            স্থান
                                                                        </th>
                                                                        <td class="control-label col-md-4">

                                                                            <a href="#" id="placeOfBirth"
                                                                               data-type="text" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="জন্ম স্থান নির্বাচন করুন"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getPlaceOfBirth()} </a>
                                                                            <%--${userinfo.getEmployeeDTO().getPlaceOfBirth()}--%>
                                                                        </td>


                                                                    </tr>
                                                                    <tr>


                                                                        <th class="control-label col-md-2 text-right">
                                                                            জাতীয়তা
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="nationality"
                                                                               data-type="text" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="জাতীয়তা নির্বাচন করুন"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getNatioanality()} </a>

                                                                            <%--${userinfo.getEmployeeDTO().getNatioanality()}--%>
                                                                        </td>

                                                                        <th class="control-label col-md-2 text-right">
                                                                            পরিচয়পত্র নম্বর
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="nid" data-type="text"
                                                                               data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="এন আই ডি "
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getNid()} </a>

                                                                            <%--${userinfo.getEmployeeDTO().getNid()}--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            বর্তমান ঠিকানা
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="presentAddress"
                                                                               data-type="text" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="বরতমান ঠিকানা"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getPresentAddress()} </a>

                                                                            <%--${userinfo.getEmployeeDTO().getPresentAddress()}</td>--%>


                                                                        <th class="control-label col-md-2 text-right">
                                                                            স্থায়ী ঠিকানা
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="permanentAddress"
                                                                               data-type="text" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="স্থায়ী ঠিকানা"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getPermanentAddress()} </a>


                                                                            <%--${userinfo.getEmployeeDTO().getPermanentAddress()}--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            পেশা
                                                                        </th>

                                                                        <td class="control-label col-md-4">

                                                                            <a href="#" id="profession" data-type="text"
                                                                               data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="পেশা"
                                                                               class="editable editable-click">

                                                                                <c:choose>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getOccupation()==null}">
                                                                                        প্রদত্ত নয়
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        ${userinfo.getEmployeeDTO().getOccupation()}
                                                                                    </c:otherwise>


                                                                                </c:choose>
                                                                            </a>
                                                                        </td>


                                                                        <th class="control-label col-md-2 text-right">
                                                                            শিক্ষাগত যোগ্যতা
                                                                        </th>
                                                                        <td class="control-label col-md-4">

                                                                            <a href="#" id="qualification"
                                                                               data-type="text" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="শিক্ষাগত যোগ্যতা নির্বাচন"
                                                                               class="editable editable-click">


                                                                                <c:choose>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getEducationalQualifications()==null}">
                                                                                        প্রদত্ত নয়
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        ${userinfo.getEmployeeDTO().getEducationalQualifications()}
                                                                                    </c:otherwise>


                                                                                </c:choose>
                                                                            </a>

                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            লিঙ্গ
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="gender" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="লিঙ্গ"
                                                                               class="" data-value="">
                                                                                <c:choose>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getGender()==1}">
                                                                                        পুরুষ
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getGender()==2}">
                                                                                        মহিলা
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getGender()==3}">
                                                                                        তৃতীয় লিঙ্গ
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        ${userinfo.getEmployeeDTO().getGender()}
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </a>

                                                                        </td>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            ধর্ম
                                                                        </th>
                                                                        <td class="control-label col-md-4"><a href="#"
                                                                                                              id="religion"
                                                                                                              data-pk="1"
                                                                                                              data-url="${context}/postValue"
                                                                                                              data-original-title="ধর্ম"
                                                                                                              class="editable editable-click"
                                                                                                              data-value="">
                                                                            <c:set var='nodata' value=""/>
                                                                            <c:set var='rel' value="${userinfo.getEmployeeDTO().getReligion()}"/>
                                                                            <c:set var='one' value="1"/>
                                                                            <c:set var='two' value="2"/>
                                                                            <c:set var='three' value="3"/>
                                                                            <c:set var='four' value="4"/>
                                                                            <c:set var='five' value="5"/>
                                                                            <c:set var='six' value="6"/>
                                                                            <c:set var='seven' value="7"/>
                                                                            <c:set var='eight' value="8"/>
                                                                            <c:set var='nine' value="9"/>
                                                                            <c:set var='zerro' value="0"/>
                                                                            <c:choose>
                                                                                <c:when test="${rel.equals(one) || rel=='Islam'}">
                                                                                    মুসলমান
                                                                                </c:when>
                                                                                <c:when test="${rel.equals(two) || rel=='Hindu'}">
                                                                                    হিন্দু
                                                                                </c:when>
                                                                                <c:when test="${rel.equals(three)}">
                                                                                    বুদ্ধ
                                                                                </c:when>
                                                                                <c:when test="${rel.equals(four)}">
                                                                                    খ্রিষ্টান
                                                                                </c:when>
                                                                                <c:when test="${rel.equals(eight)}">
                                                                                    প্রদান করতে আগ্রহী নই
                                                                                </c:when>
                                                                                <c:when test="${rel.equals(nine)}">
                                                                                    ধর্মে বিশ্বাসী নই
                                                                                </c:when>
                                                                                <c:when test="${rel.equals(zerro)}">
                                                                                    অন্যান্য
                                                                                </c:when>
                                                                                <c:when test="${rel.equals(nodata)}">
                                                                                    পাওয়া যায়নি
                                                                                </c:when>
                                                                                <c:otherwise>

                                                                                    ${rel}

                                                                                </c:otherwise>

                                                                            </c:choose>


                                                                        </a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr id="insertafter">
                                                                        <th class="control-label col-md-2 text-right">
                                                                            রক্তের
                                                                            গ্রুপ
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="bloodGroup" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="রক্তের গ্রুপ নির্বাচন"
                                                                               class="editable editable-click"
                                                                               data-value="">
                                                                                <c:choose>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getBloodGroup()==one }">
                                                                                        ও+
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getBloodGroup()==two}">
                                                                                        ও-
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getBloodGroup()==three}">
                                                                                        এ+
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getBloodGroup()==four}">
                                                                                        এ-
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getBloodGroup()==five}">
                                                                                        বি+
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getBloodGroup()==six}">
                                                                                        বি-
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getBloodGroup()==seven}">
                                                                                        এবি+
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getBloodGroup()==eight}">
                                                                                        এবি-
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getBloodGroup()==nodata}">
                                                                                        পাওয়া যায়নি
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        ${userinfo.getEmployeeDTO().getBloodGroup()}
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </a>
                                                                        </td>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            বৈবাহিক অবস্থা
                                                                        </th>
                                                                        <td class="control-label col-md-4"
                                                                            id="isMarried_">
                                                                            <a href="#" id="isMarried" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="বৈবাহিক অবস্থা নির্বাচন"
                                                                               class="editable editable-click"
                                                                               data-value="">
                                                                                <c:choose>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getMaritalStatus()==one || userinfo.getEmployeeDTO().getMaritalStatus()=='Unmarried'}">
                                                                                        অবিবাহিত
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getMaritalStatus()==two || userinfo.getEmployeeDTO().getMaritalStatus()=='Married'}">
                                                                                        বিবাহিত
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getMaritalStatus()==three}">

                                                                                        <c:if test="${userinfo.getEmployeeDTO().getGender()=='Male' || userinfo.getEmployeeDTO().getGender()==1}">
                                                                                            বিপত্নীক
                                                                                        </c:if>
                                                                                        <c:if test="${userinfo.getEmployeeDTO().getGender()=='Female' || userinfo.getEmployeeDTO().getGender()==2}">
                                                                                            বিধবা
                                                                                        </c:if>
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getMaritalStatus()==four}">
                                                                                        বিছিন্ন
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getMaritalStatus()==five}">
                                                                                        তালাকপ্রাপ্ত
                                                                                    </c:when>
                                                                                    <c:when test="${userinfo.getEmployeeDTO().getMaritalStatus()==nodata}">
                                                                                        পাওয়া যায়নি
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        ${userinfo.getEmployeeDTO().getMaritalStatus()}
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </a>
                                                                        </td>
                                                                    </tr>
                                                                    <c:if test="${userinfo.getEmployeeDTO().getMaritalStatus()=='Married' || userinfo.getEmployeeDTO().getMaritalStatus()==two}">
                                                                        <c:if test="${userinfo.getEmployeeDTO().getGender()=='Male' || userinfo.getEmployeeDTO().getGender()==one}">
                                                                            <tr>
                                                                                <th class="control-label col-md-2 text-right">
                                                                                    স্ত্রী এর নাম (বাংলা)
                                                                                </th>
                                                                                <td class="control-label col-md-4">

                                                                                    <a href="#" id="spouseNameBng"
                                                                                       data-type="text" data-pk="1"
                                                                                       data-url="${context}/postValue"
                                                                                       data-original-title="স্ত্রী এর নাম বাংলায় দিন"
                                                                                       class="editable editable-click"> ${userinfo.getEmployeeDTO().getSpouseNameBng()}</a>

                                                                                        <%--${userinfo.getEmployeeDTO().getMotherNameBng()}</td>--%>
                                                                                <th class="control-label col-md-2 text-right">
                                                                                    স্ত্রী এর নাম(ইংরেজি)
                                                                                </th>
                                                                                <td class="control-label col-md-4">
                                                                                    <a href="#" id="spouseNameEng"
                                                                                       data-type="text" data-pk="1"
                                                                                       data-url="${context}/postValue"
                                                                                       data-original-title="স্ত্রী এর নাম ইংরেজিতে দিন"
                                                                                       class="editable editable-click">${userinfo.getEmployeeDTO().getSpouseNameEng()} </a>

                                                                                        <%--${userinfo.getEmployeeDTO().getMotherNameEng()}--%>

                                                                                </td>
                                                                            </tr>


                                                                        </c:if>
                                                                        <c:if test="${userinfo.getEmployeeDTO().getGender()=='Female' || userinfo.getEmployeeDTO().getGender()==2}">
                                                                            <tr>
                                                                                <th class="control-label col-md-2 text-right">
                                                                                    স্বামী এর নাম (বাংলা)
                                                                                </th>
                                                                                <td class="control-label col-md-4">

                                                                                    <a href="#" id="spouseNameBng"
                                                                                       data-type="text" data-pk="1"
                                                                                       data-url="${context}/postValue"
                                                                                       data-original-title=" স্বামী এর নাম বাংলায় দিন"
                                                                                       class="editable editable-click"> ${userinfo.getEmployeeDTO().getSpouseNameBng()}</a>

                                                                                        <%--${userinfo.getEmployeeDTO().getMotherNameBng()}</td>--%>
                                                                                <th class="control-label col-md-2 text-right">
                                                                                    স্বামী এর নাম(ইংরেজি)
                                                                                </th>
                                                                                <td class="control-label col-md-4">
                                                                                    <a href="#" id="spouseNameEng"
                                                                                       data-type="text" data-pk="1"
                                                                                       data-url="${context}/postValue"
                                                                                       data-original-title=" স্বামী এর নাম ইংরেজিতে দিন"
                                                                                       class="editable editable-click">${userinfo.getEmployeeDTO().getSpouseNameEng()} </a>

                                                                                        <%--${userinfo.getEmployeeDTO().getMotherNameEng()}--%>

                                                                                </td>
                                                                            </tr>


                                                                        </c:if>


                                                                    </c:if>


                                                                    <tr>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            ব্যক্তিগত ই-মেইল
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="personalEmail"
                                                                               data-type="text" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title=" ব্যক্তিগত ই-মেইল দিন"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getPersonalEmail()} </a>

                                                                            <%--${userinfo.getEmployeeDTO().getPersonalEmail()}--%>
                                                                        </td>
                                                                        <th class="control-label col-md-2 text-right">
                                                                            ব্যক্তিগত মোবাইল নম্বর
                                                                        </th>
                                                                        <td class="control-label col-md-4">
                                                                            <a href="#" id="personalMobile"
                                                                               data-type="text" data-pk="1"
                                                                               data-url="${context}/postValue"
                                                                               data-original-title="ব্যক্তিগত মোবাইল নম্বর দিন"
                                                                               class="editable editable-click"> ${userinfo.getEmployeeDTO().getPersonalMobile()} </a>

                                                                            <%--${userinfo.getEmployeeDTO().getPersonalMobile()}--%>
                                                                        </td>
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
                                                            <form action="${context}/imagechange"
                                                                  class="form-horizontal form-bordered"
                                                                  enctype="multipart/form-data" method="post">
                                                                <div class="form-body">


                                                                    <div class="form-group ">

                                                                        <label class="control-label col-md-3"> ছবি
                                                                            সম্পাদনা </label>
                                                                        <div class="col-md-9">
                                                                            <div class="fileinput fileinput-new"
                                                                                 data-provides="fileinput">
                                                                                <div class="fileinput-preview thumbnail"
                                                                                     data-trigger="fileinput"
                                                                                     style="width: 200px; height: 150px; line-height: 150px;">
                                                                                    <img alt="Photo"
                                                                                         class="img-responsive"
                                                                                         src="${userinfo.getEmployeeDTO().getImageFileName()}">
                                                                                </div>
                                                                                <div>
                                                                        <span class="btn red btn-outline btn-file">
                                                                    <span class="fileinput-new"> ছবি নির্বাচন  করুন </span>
                                                                    <span class="fileinput-exists"> পরিবর্তন
                                                                    </span>
                                                                    <input type="hidden" value="" name="...">
                                                                    <input id="uploadimage" type="file" name="file"
                                                                           accept="image/png,image/gif,image/jpeg,image/jpg">

                                                                        </span>
                                                                                    <a href="javascript:;"
                                                                                       class="btn red fileinput-exists"
                                                                                       data-dismiss="fileinput"> সরিয়ে
                                                                                        ফেলুন </a>
                                                                                </div>
                                                                            </div>

                                                                        </div>

                                                                    </div>
                                                                    <div class="form-actions">
                                                                        <div class="row">
                                                                            <div class="col-md-offset-3 col-md-9">
                                                                                <button type="submit" id="submitimage"
                                                                                        class="btn green"> সংরক্ষণ
                                                                                </button>
                                                                                <a href="javascript:;"
                                                                                   class="btn btn-outline grey-salsa">বাতিল</a>
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

                                                            <form method="post" accept-charset="utf-8" action="${context}/employee_records/passwordChange"
                                                                id="passform"  novalidate="novalidate" role="form">
                                                                <div style="display:none;"><input type="hidden"
                                                                                                  name="_method"
                                                                                                  value="POST"></div>
                                                                <div class="form-horizontal">
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">বর্তমান
                                                                            পাসওয়ার্ড</label>

                                                                        <div class="col-sm-6">
                                                                            <div class="input password required"><input
                                                                                    type="password"
                                                                                    name="current_password"
                                                                                    id="current_password"
                                                                                    required="required"
                                                                                    class="form-control validate[required]"
                                                                                    placeholder="বর্তমান পাসওয়ার্ড" onblur="checkOldPass()"></div>
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
                                                                                    minlength="8" ></div>

                                                                            <%--<span class="help-block font-red"><b>*</b> পাসওয়ার্ড নুন্যতম ৬ অক্ষরের হতে হবে। অন্তত একটি A-Z অথবা a-z থাকতে হবে।  --%>
                                                                            <%--</span>--%>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <label class="col-sm-4 control-label">পুনরায়
                                                                            নতুন
                                                                            পাসওয়ার্ডটি দিন</label>

                                                                        <div class="col-sm-6">
                                                                            <div class="input password required"><input
                                                                                    type="password" name="cpassword"
                                                                                    id="cpassword"
                                                                                    minlength="8"
                                                                                    class="form-control validate[required,min[6],equals[password]]"
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
                                                                প্রশ্নের উত্তর দিন
                                                            </div>
                                                        </div>
                                                        <div class="portlet-body form">
                                                            <form action="${context}/securityques" method="post"
                                                                  class="form-horizontal">


                                                                <div class="form-group">


                                                                    <label class="control-label col-md-3"> প্রথম প্রশ্ন
                                                                        সংযুক্ত করুন</label>
                                                                    <div class="col-md-9">


                                                                        <select class="form-control"
                                                                                name="securityques1"
                                                                                id="questiondropdown">

                                                                        </select>

                                                                    </div>
                                                                </div>

                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3">
                                                                        উত্তর:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text"
                                                                               class="form-control" name="ans1"
                                                                               id="ans_1"
                                                                               placeholder="">

                                                                    </div>
                                                                </div>


                                                                <div class="form-group">


                                                                    <label class="control-label col-md-3"> দ্বিতীয়
                                                                        প্রশ্ন সংযুক্ত করুন</label>
                                                                    <div class="col-md-9">


                                                                        <select class="form-control"
                                                                                name="securityques2"
                                                                                id="questiondropdown2">

                                                                        </select>

                                                                    </div>
                                                                </div>


                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3">
                                                                        উত্তর:</label>
                                                                    <div class="col-md-9">
                                                                        <input type="text"
                                                                               class="form-control" name="ans2"
                                                                               id="ans_2"
                                                                               placeholder="">

                                                                    </div>
                                                                </div>


                                                                <!--end profile-settings-->
                                                                <div class=" form-actions">
                                                                    <div class="row">
                                                                        <div class="col-md-offset-3 col-md-9">
                                                                            <button class="btn red " type="submit">সংরক্ষণ
                                                                            </button>

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
                                                            <form action="${context}/signchange"
                                                                  enctype="multipart/form-data"
                                                                  method="post" role="form"
                                                                  class="form-horizontal form-bordered">
                                                                <div class="form-body">


                                                                    <div class="form-group ">
                                                                        <label class="control-label col-md-3">স্বাক্ষর
                                                                            সম্পাদনা</label>
                                                                        <div class="col-md-9">
                                                                            <div class="fileinput fileinput-new"
                                                                                 data-provides="fileinput">
                                                                                <div class="fileinput-preview thumbnail"
                                                                                     data-trigger="fileinput"
                                                                                     style="width: 200px; height: 150px;">
                                                                                    <img alt="Photo"
                                                                                         class="img-responsive"
                                                                                         src="${userinfo.getEmployeeDTO().getESign()}">


                                                                                </div>
                                                                                <div>
                                                                                    <br>
                                                                                    <br>
                                                                                    <span class="btn blue btn-outline btn-file">
                                                                                <span class="fileinput-new">  সাক্ষর  নির্বাচন  করুন  </span>
                                                                                <span class="fileinput-exists">  পরিবর্তন  করুন </span>
                                                                                <input type="file" name="file"> </span>
                                                                                    <a href="javascript:;"
                                                                                       class="btn red fileinput-exists"
                                                                                       data-dismiss="fileinput"> সরিয়ে
                                                                                        ফেলুন </a>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-actions">
                                                                    <div class="row">
                                                                        <div class="col-md-offset-3 col-md-9">
                                                                            <button type="submit" class="btn green">
                                                                                <i class="fa fa-check"></i> সংরক্ষণ
                                                                            </button>
                                                                            <a href="javascript:;"
                                                                               class="btn btn-outline grey-salsa"> বাতিল
                                                                            </a>
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
                                            <canvas id="2"></canvas>
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
    </div>
    <!-- END CONTENT -->


</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->

<input type="hidden" id="security_q_1" value="${sessionScope.userInfo.getSecurityQues()}">
<input type="hidden" id="security_a_1" value="${sessionScope.userInfo.getSecurityQuesAns()}">
<input type="hidden"  id="security_q_2" value="${sessionScope.userInfo.getSecurityQues2()}">
<input type="hidden"  id="security_a_2" value="${sessionScope.userInfo.getSecurityQuesAns2()}">
<div class="page-footer">
    <%@ include file="../includes/footer.jsp" %>
</div>

<%@ include file="../includes/includes.jsp" %>


<script src="${context}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
        type="text/javascript"></script>





<%--start: code added by forhad--%>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${context}/assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery.mockjax.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/bootstrap-editable/bootstrap-editable/js/bootstrap-editable.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/bootstrap-editable/inputs-ext/address/address.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/bootstrap-editable/inputs-ext/wysihtml5/wysihtml5.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/bootstrap-typeahead/bootstrap3-typeahead.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="<%=request.getContextPath()%>/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=request.getContextPath()%>/assets/pages/scripts/form-editable.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<%--end: code added by forhad--%>


<%--<script src="/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>--%>
<%--<script src="/assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>

<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>

<script>
    <%--start:added by forhad --%>
    $(document).ready(function () {
        //toggle `popup` / `inline` mode
        $.fn.editable.defaults.mode = 'popup';

        //make username editable
//        $('#name').editable();
        $('#nameBng').editable();
        $('#nameEng').editable();
        $('#fatherNameEng').editable();
        $('#fatherNameBng').editable();
        $('#motherNameEng').editable();
        $('#motherNameBng').editable();
        $('#spouseNameBng').editable();
        $('#spouseNameEng').editable();
        $('#dateOfBirth').editable();
        $('#nid').editable();
        $('#nationality').editable();
        $('#placeOfBirth').editable();
        $('#presentAddress').editable();
        $('#permanentAddress').editable();
        $('#personalEmail').editable();
        $('#personalMobile').editable();
        $('#profession').editable();
        $('#qualification').editable();
        $('#religion').editable({
            type: 'select',
            source: [
                {value: "", text: 'নির্বাচন করুন'},
                {value: 1, text: 'মুসলমান'},
                {value: 2, text: 'হিন্দু'},
                {value: 3, text: 'বুদ্ধ'},
                {value: 4, text: 'খ্রিষ্টান'},
                {value: 8, text: 'প্রকাশ করতে অসম্মত'},
                {value: 9, text: 'বিশ্বাসী নয়'},
                {value: 0, text: 'অন্যান্য'},
            ],

        });
//        $('#bloodGroup').editable();
        $('#bloodGroup').editable({
            type: 'select',
            source: [
                {value: "", text: 'নির্বাচন করুন'},
                {value: 1, text: 'ও+'},
                {value: 2, text: 'ও-'},
                {value: 3, text: 'এ+'},
                {value: 4, text: 'এ-'},
                {value: 5, text: 'বি+'},
                {value: 6, text: 'বি-'},
                {value: 7, text: 'এবি+'},
                {value: 8, text: 'এবি-'},
            ],

        });

//        $('#isMarried').editable();

        //marital_status
        $('#isMarried').editable({
            title: 'Select Marital Status',
            type: 'select',
            value: 1,
            source: [
//                {value: -1, text: 'Select'},
                {value: "", text: 'নির্বাচন করুন'},
                {value: 1, text: 'অবিবাহিত'},
                {value: 2, text: 'বিবাহিত'},
                {value: 3, text: 'বিধবা/বিপত্নীক'},
                {value: 4, text: 'বিছিন্ন'},
                {value: 5, text: 'তালাকপ্রাপ্ত'},
            ],

        });


        $('#gender').editable({
            type: 'select',
            value: 1,
            source: [
                {value: "", text: 'নির্বাচন করুন'},
                {value: 1, text: 'পুরুষ'},
                {value: 2, text: 'মহিলা'},
                {value: 3, text: 'তৃতীয় লিঙ্গ'}
            ],

        });


    });
    <%--end:added by forhad --%>

</script>

<script>
    var FormValidation = function () {
        var e = function () {
                var e = $("#passform"),
                    r = $(".alert-danger", e),
                    i = $(".alert-success", e);

                e.validate({
                    errorElement: "span", errorClass: "help-block help-block-error",
                    focusInvalid: !1, ignore: "", messages: {
                        select_multi: {
                            maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                            minlength: jQuery.validator.format("At least {0} items must be selected")
                        }
                    }, rules: {

                        password: {
                            required: !0,
                            checkPass:true
                        },
                        cpassword: {
                            required: !0,
                            equalTo: "#password"
                        },
                        current_password: {
                            required: !0
                        }


                    }, messages: {

                        password: {
                            required: "অবশ্য পূরণীয়",
                            minlength:"পাসওয়ার্ড নুন্যতম ৮ অক্ষরের হতে হবে। "
                        },
                        cpassword: {
                            required: "অবশ্য পূরণীয়",
                            equalTo: "পাসওয়ার্ড ম্যাচ করেনি"
                        },
                        current_password: {
                            required: "অবশ্য পূরণীয়",
                        },


                    },
                    invalidHandler: function (e, t) {
                        i.hide(), r.show(), App.scrollTo(r, -200)
                    },
                    highlight: function (e) {
                        $(e).closest(".form-group").addClass("has-error")
                    },
                    unhighlight: function (e) {
                        $(e).closest(".form-group").removeClass("has-error")
                    },
                    success: function (e) {
                        e.closest(".form-group").removeClass("has-error")

                    },
                    submitHandler: function (e) {
                        i.show(), r.hide(), e.submit()

                    }
                });
            },

            t = function () {
                jQuery().wysihtml5 && $(".wysihtml5").size() > 0 && $(".wysihtml5").wysihtml5({stylesheets: ["../assets/global/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]})
            };







        $.validator.addMethod('checkPass', function (value, element) {
            return this.optional(element) || /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/.test(value);

        }, "অন্তত একটি A-Z অথবা a-z থাকতে হবে। এবং কমপক্ষে একটি নম্বর থাকতে হবে ");


        return {
            init: function () {
                t(), e()
            }
        }

    }();
    function checkOldPass(){
        var pass=$('#current_password').val();
        $.ajax({
            type: "POST",
            url: "/checkpass",
            async: false,
            data:{
                pass:pass
            },
            success: function (response) {
                data = response;
                //alert (response);
                if(response==1){
                    $('#current_password').attr("readonly",true);
                    $('#password').attr("readonly", false);
                    $('#cpassword').attr("readonly", false);
                    $('#btn_submit').attr("disabled", false);
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.success(" নতুন পাসওয়ার্ড নির্বাচন করুন ");

                }else {
                    $('#current_password').attr("readonly", false);
                    $('#password').attr("readonly", true);
                    $('#cpassword').attr("readonly", true);
                    $('#btn_submit').attr("disabled", true);
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" প্রদত্ত পাসওয়ার্ড সঠিক নয় ");

                }
                // return response;
            },
            error: function () {
                var select = $('#questiondropdown')
                select.empty();
                select.append($('<option></option>').val(-1).html('পাওয়া যায়নি'));
            }
        });


    }

    $(document).ready(function () {
        FormValidation.init();


        var data = "";
        $.ajax({
            type: "GET",
            url: "/questions",
            async: false,
            success: function (response) {
                data = response;
                return response;
            },
            error: function () {
                var select = $('#questiondropdown')
                select.empty();
                select.append($('<option></option>').val(-1).html('পাওয়া যায়নি'));

                var select2 = $('#questiondropdown2')
                select2.empty();
                select2.append($('<option></option>').val(-1).html('পাওয়া যায়নি'));
            }
        });

        $('#questiondropdown').ready(function () {



            var select = $('#questiondropdown');
            select.empty();
            select.append($('<option></option>').val(-1).html('Select One'));
            $.each(data, function (index, value) {

                //select.append($('<option></option>').val(value).html(value));
                if(value==$('#security_q_1').val()){

                    select.append($('<option>', {
                        value: value,
                        text : value,
                        selected:'selected'
                    }));

                    $('#ans_1').val($('#security_a_1').val());
                    //select.append($('<option></option>').val(value).html(value)).attr('selected','selected');
                    // $('#questiondropdown option[value=]').attr('selected','selected')
                }
                else {
                    select.append($('<option></option>').val(value).html(value));
               }
            });
        });
        $('#questiondropdown2').ready(function () {

            var select = $('#questiondropdown2');
            select.empty();
            select.append($('<option></option>').val(-1).html('Select One'));
            $.each(data, function (index, value) {
                if(value==$('#security_q_2').val()){
                    select.append($('<option>', {
                        value: value,
                        text : value,
                        selected:'selected'
                    }));

                    $('#ans_2').val($('#security_a_2').val());

                }
                else {
                    select.append($('<option></option>').val(value).html(value));
                }
            });
        });


        <%--var filename = "";--%>
        <%--var image = $('#uploadimage');--%>
        <%--image.on('change', function (e) {--%>
        <%--image = URL.createObjectURL(e.target.files[0]);--%>
        <%--filename=image;--%>


        <%--});--%>


        <%--var input = $("#submitimage");--%>
        <%--input.on('click',--%>

        <%--function handleFiles(e) {--%>
        <%--var img = new Image;--%>
        <%--var imageinp = $('#uploadimage');--%>
        <%--// img.src = URL.createObjectURL(filename);--%>
        <%--img.src = filename;--%>
        <%--img.onload = function () {--%>
        <%--resizeImgSimple(img, 240, 240, 40, 'jpeg', function (base64String) {--%>
        <%--var blobBin = atob(base64String.split(',')[1]);--%>
        <%--alert(blobBin.length);--%>
        <%--var array = [];--%>
        <%--for (var i = 0; i < blobBin.length; i++) {--%>
        <%--array.push(blobBin.charCodeAt(i));--%>
        <%--}--%>
        <%--var file = new Blob([new Uint8Array(array)], {type: 'image/jpeg'});--%>


        <%--var formdata = new FormData();--%>
        <%--formdata.append("file", file);--%>
        <%--$.ajax({--%>
        <%--type: "POST",--%>
        <%--processData: false,--%>
        <%--contentType: false,--%>
        <%--url: "<%=request.getContextPath()%>/imagechange",--%>
        <%--data: formdata,--%>
        <%--async: false,--%>
        <%--success: function (response) {--%>
        <%--alert("sucess");--%>
        <%--},--%>
        <%--error: function () {--%>
        <%--toastr.options = {--%>
        <%--"closeButton": true,--%>
        <%--"debug": false,--%>
        <%--"positionClass": "toast-bottom-right"--%>
        <%--};--%>
        <%--toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ");--%>
        <%--}--%>
        <%--});--%>
        <%--});--%>


        <%--}--%>
        <%--}--%>
        <%--);--%>


        <%--function resizeImgSimple(img, width, height, quality, output_format, callback) {--%>

        <%--var mime_type;--%>
        <%--if (output_format === "png") {--%>
        <%--mime_type = "image/png";--%>
        <%--} else if (output_format === "webp") {--%>
        <%--mime_type = "image/webp";--%>
        <%--} else {--%>
        <%--mime_type = "image/jpeg";--%>
        <%--}--%>

        <%--//converting to jpeg--%>

        <%--var canvasforjpeg = document.createElement('canvas');// document.getElementById("canvasEl");--%>
        <%--var ctx = canvasforjpeg.getContext('2d');--%>
        <%--canvasforjpeg.height = img.naturalHeight;--%>
        <%--canvasforjpeg.width = img.naturalWidth;--%>
        <%--ctx.fillStyle = '#fff';--%>
        <%--ctx.fillRect(0, 0, canvasforjpeg.width, canvasforjpeg.height);--%>
        <%--ctx.drawImage(img, 0, 0, canvasforjpeg.width, canvasforjpeg.height);--%>
        <%--var image = new Image;--%>
        <%--image.src = canvasforjpeg.toDataURL('image/jpeg');--%>
        <%--image.onload = function () {--%>
        <%--//resizing and quality changing--%>
        <%--var canvas = document.createElement('canvas');--%>

        <%--var heightratio, widthration;--%>

        <%--heightratio = height / img.height;--%>
        <%--widthratio = width / img.width;--%>

        <%--canvas.width = img.width * widthratio;--%>
        <%--canvas.height = img.height * heightratio;--%>
        <%--canvas.getContext("2d").drawImage(image, 0, 0, img.width * widthratio, img.height * heightratio);--%>

        <%--var newImageData = canvas.toDataURL(mime_type, quality / 100);--%>

        <%--callback(newImageData);--%>


        <%--};--%>


        <%--}--%>

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


