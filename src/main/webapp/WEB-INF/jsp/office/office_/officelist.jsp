<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

    <meta charset="utf-8"/>
    <title>Office Information and Service Framework (OISF)</title>
    <c:set var="context" value="${pageContext.request.contextPath}"/>
    <%@ include file="../../includes/head.jsp" %>
    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css"/>


    <style>
        .jstree-anchor {
            /*enable wrapping*/
            white-space: normal !important;
            /*ensure lower nodes move down*/
            height: auto !important;
            /*offset icon width*/
            padding-right: 24px;
        }

        .officeicon {
            background-image: url(../assets/img/home-office-icon.jpg) !important;
            height: 30px !important;
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
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <div class="page-sidebar navbar-collapse collapse">
            <%@ include file="../../includes/menu.jsp" %>
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- START MAIN CONTENT -->
        <div class="page-content">
            <div class="portlet box ">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-picture"></i>Ministry List
                    </div>
                </div>


                <div class="portlet-body">

                    <%--<div class="row">--%>
                    <%--<div class="col-md-12 form-group form-horizontal">--%>
                    <%--<label class="control-label">অফিস মন্ত্রণালয়</label>--%>
                    <%--<select id="ministrydropdown" class="form-control select2" name="officeMinistryId">--%>
                    <%--<option value="-1">...</option>--%>
                    <%--<c:forEach var="ministry" items="${ministry}">--%>
                    <%--<option value="${ministry.getId()}">--%>
                    <%--${ministry.getNameBng()}--%>
                    <%--</option>--%>
                    <%--</c:forEach>--%>

                    <%--</select>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <div class="row" style="margin-left: 15px;">
                        <label class="col-md-3 control-label"> মন্ত্রণালয়</label>
                        <div class="col-md-6">
                            <select class="form-control" name="ministrydata" id="ministrydropdown">
                                <option value="-1">...</option>
                                <c:forEach var="ministry" items="${ministry}">
                                    <option value="${ministry.getId()}">
                                            ${ministry.getNameBng()}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div id="unit_tree_div" class="row" style="display:block;">
                        <div class="col-md-6">
                            <div class="portlet light no-shadow">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class=""></i> মৌলিক দপ্তর
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div id="originofficetree"></div>
                                </div>
                            </div>

                            <div class="portlet light no-shadow">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class=""></i>দপ্তর
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div id="officetree"></div>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-6" id="office_tree_expand_view" style="display: block;">

                        </div>


                    </div>


                </div>
            </div>

            <input type="hidden" id="menuid" value="${menuid}">
            <div id="editform" style="display: none">
                <div class="portlet light no-shadow">
                    <div class="portlet-title">
                        <div class="caption"><i class=""></i>শাখা সম্পাদন</div>
                    </div>
                    <div class="portlet-body form"><br><br>
                        <form id="OfficeOriginUnitEditForm" accept-charset="utf-8" method="post">
                            <input type="hidden" name="id" id="id">
                            <div class="form-horizontal">

                                <!-- Start : Import Office Unit Category View From Cell -->
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">উর্ধ্বতন শাখা</label>

                                    <div class="col-sm-7">
                                        <div class="input select">
                                            <select id="parent-unit-id" class="form-control" name="parent_unit_id">

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">শাখার ধরণ</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="office-unit-category-e" class="form-control"
                                                   list="office_unit_category_list-e" name="office_unit_category">
                                        </div>
                                        <datalist id="office_unit_category_list-e">
                                            <option value="দপ্তর">দপ্তর</option>
                                            <option value="শাখা">শাখা</option>
                                            <option value="অনুবিভাগ">অনুবিভাগ</option>
                                            <option value="অধিশাখা">অধিশাখা</option>
                                        </datalist>
                                    </div>
                                </div>
                                <!-- End : Import Office Unit Category View From Cell -->

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">নাম</label>

                                    <div class="col-sm-7">
                                        <div class="input text"><input type="text" id="unit-name-bng-e"
                                                                       class="form-control" name="unit_name_bng"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">নাম (ইংরেজি)</label>

                                    <div class="col-sm-7">
                                        <div class="input text"><input type="text" id="unit-name-eng-e"
                                                                       class="form-control" name="unit_name_eng"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">শাখার লেভেল</label>

                                    <div class="col-sm-7">
                                        <div class="input text"><input type="text" id="unit-level-e"
                                                                       class="form-control" name="unit_level"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-9">
                                        <button class="btn" style="background-color: #8dc542" onclick="editNode()"
                                                type="button">
                                            সংরক্ষণ
                                        </button>
                                        <button class="btn default btnClose" onclick="cancel()" type="button">বাতিল
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <%--<div id="addform" style="display: none">--%>
            <%--<div class="portlet light no-shadow">--%>
            <%--<div class="portlet-title">--%>
            <%--<div class="caption"><i class=""></i>নতুন শাখা</div>--%>
            <%--</div>--%>
            <%--<div class="portlet-body form"><br><br>--%>
            <%--<form id="OfficeOriginUnitAddForm" accept-charset="utf-8" method="post">--%>
            <%--<input type="hidden"  id="parent_unit_id" name="parent_unit_id">--%>
            <%--<input type="hidden" id="office_ministry_id" name="office_ministry_id">--%>
            <%--<input type="hidden"  id="office_layer_id" name="office_layer_id">--%>
            <%--<input type="hidden"  id="office_origin_id" name="office_origin_id">--%>
            <%--<div class="form-horizontal">--%>

            <%--<!-- Start : Import Office Unit Category View From Cell -->--%>
            <%--<div class="form-group">--%>
            <%--<label class="col-sm-5 control-label">শাখার ধরণ</label>--%>

            <%--<div class="col-sm-7">--%>
            <%--<div class="input text">--%>
            <%--<input type="text" value="" id="office-unit-category-a" class="form-control" list="office_unit_category_list-a" name="office_unit_category">--%>
            <%--</div>--%>
            <%--<datalist id="office_unit_category_list-a">--%>
            <%--<option value="দপ্তর">দপ্তর</option>--%>
            <%--<option value="শাখা">শাখা</option>--%>
            <%--<option value="অনুবিভাগ">অনুবিভাগ</option>--%>
            <%--<option value="অধিশাখা">অধিশাখা</option>--%>
            <%--</datalist>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<!-- End : Import Office Unit Category View From Cell -->--%>

            <%--<div class="form-group">--%>
            <%--<label class="col-sm-5 control-label">নাম</label>--%>

            <%--<div class="col-sm-7">--%>
            <%--<div class="input text"><input type="text" id="unit-name-bng-a" class="form-control" name="unit_name_bng"></div>--%>
            <%--</div>--%>
            <%--</div>--%>

            <%--<div class="form-group">--%>
            <%--<label class="col-sm-5 control-label">নাম (ইংরেজি)</label>--%>

            <%--<div class="col-sm-7">--%>
            <%--<div class="input text"><input type="text" id="unit-name-eng-a" class="form-control" name="unit_name_eng"></div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="form-group">--%>
            <%--<label class="col-sm-5 control-label">শাখার লেভেল</label>--%>

            <%--<div class="col-sm-7">--%>
            <%--<div class="input text"><input type="text" id="unit-level-a"  class="form-control" name="unit_level"></div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="form-actions">--%>
            <%--<div class="row">--%>
            <%--<div class="col-md-offset-4 col-md-9">--%>
            <%--<button class="btn" style="background-color: #8dc542" onclick="addNode()" type="button">--%>
            <%--সংরক্ষণ--%>
            <%--</button>--%>
            <%--<button class="btn default btnClose" onclick="cancel()" type="button">বাতিল</button>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</form>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>

            <div id="basicform" style="display: none;">
                <div class="portlet light no-shadow">
                    <div class="portlet-title">
                        <div class="caption" id="formtag"></div>
                    </div>
                    <div class="portlet-body">
                        <div id="tree_panel">
                            <form method="post" id="officeform" action="#">
                                <input type="hidden" name="locationtype" id="locationtype" value="1">
                                <input type="hidden" name="office_ministry_id" id="office_ministry_id" >
                                <input type="hidden" name="office_layer_id" id="office_layer_id">
                                <input type="hidden" name="office_origin_id" id="office_origin_id">
                                <div class="form-body">

                                    <div class="row">
                                        <div class="col-md-6 form-group form-horizontal">
                                            <label class="control-label">নাম</label>
                                            <div class="input text"><input type="text" name="office_name_bng"
                                                                           class="form-control"
                                                                           placeholder="নাম(বাংলায়)"
                                                                           id="office-name-bng"></div>
                                        </div>
                                        <div class="col-md-6 form-group form-horizontal">
                                            <label class="control-label">&nbsp;</label>
                                            <div class="input text"><input type="text" name="office_name_eng"
                                                                           class="form-control"
                                                                           placeholder="নাম(ইংরেজি)"
                                                                           id="office-name-eng"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 form-group form-horizontal">
                                            <label class="control-label">ফোন</label>
                                            <div class="input text"><input type="text" name="office_phone"
                                                                           class="form-control" placeholder="ফোন"
                                                                           id="office-phone"></div>
                                        </div>
                                        <div class="col-md-6 form-group form-horizontal">
                                            <label class="control-label">মোবাইল</label>
                                            <div class="input text"><input type="text" name="office_mobile"
                                                                           class="form-control" placeholder="মোবাইল"
                                                                           id="office-mobile"></div>
                                        </div>
                                        <div class="col-md-6 form-group form-horizontal">
                                            <label class="control-label">ফ্যাক্স</label>
                                            <div class="input text"><input type="text" name="office_fax"
                                                                           class="form-control" placeholder="ফ্যাক্স"
                                                                           id="office-fax"></div>
                                        </div>
                                        <div class="col-md-6 form-group form-horizontal">
                                            <label class="control-label">ই-মেইল</label>
                                            <div class="input text"><input type="text" name="office_email"
                                                                           class="form-control" placeholder="ই-মেইল"
                                                                           id="office-email"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 form-group form-horizontal">
                                            <label class="control-label">দপ্তরের ওয়েবসাইট</label>
                                            <div class="input text"><input type="text" name="office_web"
                                                                           class="form-control"
                                                                           placeholder="দপ্তরের ওয়েবসাইট" id="office-web">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5 form-group form-horizontal">
                                            <label class="control-label">ডিজিটাল নথি কোড</label>
                                            <div class="input text"><input type="text" name="digital_nothi_code"
                                                                           class="form-control"
                                                                           placeholder="ডিজিটাল নথি কোড"
                                                                           id="digital-nothi-code"></div>
                                        </div>
                                        <div class="col-md-6 form-group form-horizontal">
                                            <label class="control-label"> রেফারেন্স কোড</label>
                                            <div class="input text"><input type="text" name="ref_code"
                                                                           class="form-control"
                                                                           placeholder="রেফারেন্স কোড" id="ref-code">
                                            </div>
                                        </div>
                                        <div class="col-md-6 form-group form-horizontal">
                                            <label class="control-label">দপ্তরের কোড</label>
                                            <div class="input text"><input type="text" name="office_code"
                                                                           class="form-control" placeholder="দপ্তরের কোড"
                                                                           id="office-code"></div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <h3 class="form-section" style="margin:0px;padding: 0px 15px;"> লোকেশন তথ্য</h3>
                                        <div style="padding: 15px;">
                                            <ul class="nav nav-tabs" id="tabpart">
                                                <li class="active"><a data-toggle="tab" href="#insidecountry" data-val="1">দেশের
                                                    মধ্যে</a></li>
                                                <li><a data-toggle="tab" href="#outsidecountry" data-val="2">দেশের বাইরে</a></li>

                                            </ul>

                                            <div class="tab-content">
                                                <div id="insidecountry" class="tab-pane fade in active">
                                                    <div>
                                                        <div class="row">
                                                            <div class="col-md-6">

                                                                <div class="form-group">


                                                                    <label class="control-label col-md-3">বিভাগ </label>
                                                                    <div class="col-md-9">


                                                                        <select id="divisiondropdown"
                                                                                name="divisionid"
                                                                                class="form-control">
                                                                            <option value="-1">-- Please Select --</option>
                                                                        </select>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/span-->
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3">জেলা </label>
                                                                    <div class="col-md-9">
                                                                        <select id="districtdropdown"
                                                                                name="districtid"
                                                                                class="form-control">
                                                                            <option value="-1">-- Please Select --</option>
                                                                        </select>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/span-->
                                                        </div>
                                                        <div class="row" style="margin-top: 7px;">
                                                            <div class="col-md-6">

                                                                <div class="form-group">


                                                                    <label class="control-label col-md-3">থানা </label>
                                                                    <div class="col-md-9">


                                                                        <select id="thanadropdown"
                                                                                name="thanaid"
                                                                                class="form-control">
                                                                            <option value="-1">-- Please Select --</option>

                                                                        </select>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/span-->
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3"> পোস্ট অফিস</label>
                                                                    <div class="col-md-9">
                                                                        <select id="postofficedropdown"
                                                                                name="postid"
                                                                                class="form-control">
                                                                            <option value="-1">-- Please Select --</option>

                                                                        </select>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--/span-->
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3">জেলার বিভক্তির ধরন</label>

                                                                    <label class="radio-inline">
                                                                        <input type="radio" name="upacityradio" value="1">উপজেলা
                                                                    </label>
                                                                    <label class="radio-inline">
                                                                        <input type="radio"  name="upacityradio" value="2">সিটি কর্পোরেশন
                                                                    </label>

                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group" id="upacitygroup">

                                                                    <div id="upazillaselectdiv"  style="display: none;">
                                                                        <div class="form-group">


                                                                            <label class="control-label col-md-3">উপাজেলা  </label>
                                                                            <div class="col-md-9">


                                                                                <select id="upaziladropdown"
                                                                                        name="upazilaid"
                                                                                        class="form-control">
                                                                                    <option value="-1">-- Please Select --</option>

                                                                                </select>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div id="cityselectdiv"  style="display: none;">
                                                                        <div class="form-group">


                                                                            <label class="control-label col-md-3">সিটি কর্পোরেশন
                                                                            </label>
                                                                            <div class="col-md-9">


                                                                                <select id="citydropdown"
                                                                                        name="cityid"
                                                                                        class="form-control">
                                                                                    <option value="-1">-- Please Select --</option>

                                                                                </select>

                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                </div>

                                                            </div>
                                                        </div>

                                                        <div class="row" id="muniuniselectiondiv"  style="display: none;">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="control-label col-md-3">উপাজেলা বিভক্তির ধরন</label>

                                                                    <label class="radio-inline">
                                                                        <input type="radio" name="unimuniradio" value="1">ইউনিয়ন
                                                                    </label>
                                                                    <label class="radio-inline">
                                                                        <input type="radio"  name="unimuniradio" value="2">পৌরসভা
                                                                    </label>

                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group" id="unimunigroup">

                                                                    <div id="uniselectdiv"  style="display: none;">
                                                                        <div class="form-group">


                                                                            <label class="control-label col-md-3">ইউনিয়ন   </label>
                                                                            <div class="col-md-9">


                                                                                <select id="uniondropdown"
                                                                                        name="unionid"
                                                                                        class="form-control">
                                                                                    <option value="-1">-- Please Select --</option>

                                                                                </select>

                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div id="muniselectdiv"  style="display: none;">
                                                                        <div class="form-group">


                                                                            <label class="control-label col-md-3">পৌরসভা
                                                                            </label>
                                                                            <div class="col-md-9">


                                                                                <select id="municipalitydropdown"
                                                                                        name="municipalityid"
                                                                                        class="form-control">
                                                                                    <option value="-1">-- Please Select --</option>

                                                                                </select>

                                                                            </div>
                                                                        </div>
                                                                    </div>


                                                                </div>

                                                            </div>  
                                                        </div>
                                                        <div class="row" id="addressnumdiv">
                                                            <div class="col-md-6" id="warddiv" style="display: none;">
                                                                <label class="control-label">ওয়ার্ড নং</label>
                                                                <div class="input text">
                                                                    <select id="wordno"
                                                                            name="wordno"
                                                                            class="form-control">
                                                                        <option value="-1">-- Please Select --</option>

                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6" id="addressdiv" style="display: none;">
                                                                <label class="control-label">ঠিকানা</label>
                                                                <div class="input text"><input type="text" name="address"
                                                                                               class="form-control" placeholder="ঠিকানা"
                                                                                               id="address"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="outsidecountry" class="tab-pane fade">
                                                    <div class="row">
                                                        <div class="col-md-6">

                                                            <div class="form-group">


                                                                <label class="control-label col-md-3">Country Name </label>
                                                                <div class="col-md-9">


                                                                    <select id="countryname"
                                                                            name="countryname"
                                                                            class="form-control">
                                                                        <option value="-1">-- Please Select --</option>
                                                                        <option value="1"> Afghanistan</option>
                                                                        <option value="2"> Albania</option>
                                                                        <option value="3"> Algeria</option>
                                                                        <option value="4"> American Samoa</option>
                                                                        <option value="5"> Andorra</option>
                                                                        <option value="6"> Angola</option>
                                                                        <option value="7"> Anguilla</option>
                                                                        <option value="8"> Antarctica</option>
                                                                        <option value="9"> Antigua and Barbuda</option>
                                                                        <option value="10"> Argentina</option>
                                                                        <option value="11"> Armenia</option>
                                                                        <option value="12"> Aruba</option>
                                                                        <option value="13"> Australia</option>
                                                                        <option value="14"> Austria</option>
                                                                        <option value="15"> Azerbaijan</option>
                                                                        <option value="16"> Bahamas</option>
                                                                        <option value="17"> Bahrain</option>
                                                                        <option value="18"> Bangladesh</option>
                                                                        <option value="19"> Barbados</option>
                                                                        <option value="20"> Belarus</option>
                                                                        <option value="21"> Belgium</option>
                                                                        <option value="22"> Belize</option>
                                                                        <option value="23"> Benin</option>
                                                                        <option value="24"> Bermuda</option>
                                                                        <option value="25"> Bhutan</option>
                                                                        <option value="26"> Bolivia</option>
                                                                        <option value="27"> Bosnia and Herzegovina</option>
                                                                        <option value="28"> Botswana</option>
                                                                        <option value="29"> Brazil</option>
                                                                        <option value="30"> British Indian Ocean Territory</option>
                                                                        <option value="31"> British Virgin Islands</option>
                                                                        <option value="32"> Brunei</option>
                                                                        <option value="33"> Bulgaria</option>
                                                                        <option value="34"> Burkina Faso</option>
                                                                        <option value="35"> Burundi</option>
                                                                        <option value="36"> Cambodia</option>
                                                                        <option value="37"> Cameroon</option>
                                                                        <option value="38"> Canada</option>
                                                                        <option value="39"> Cape Verde</option>
                                                                        <option value="40"> Cayman Islands</option>
                                                                        <option value="41"> Central African Republic</option>
                                                                        <option value="42"> Chad</option>
                                                                        <option value="43"> Chile</option>
                                                                        <option value="44"> China</option>
                                                                        <option value="45"> Christmas Island</option>
                                                                        <option value="46"> Cocos Islands</option>
                                                                        <option value="47"> Colombia</option>
                                                                        <option value="48"> Comoros</option>
                                                                        <option value="49"> Cook Islands</option>
                                                                        <option value="50"> Costa Rica</option>
                                                                        <option value="51"> Croatia</option>
                                                                        <option value="52"> Cuba</option>
                                                                        <option value="53"> Curacao</option>
                                                                        <option value="54"> Cyprus</option>
                                                                        <option value="55"> Czech Republic</option>
                                                                        <option value="56"> Democratic Republic of the Congo</option>
                                                                        <option value="57"> Denmark</option>
                                                                        <option value="58"> Djibouti</option>
                                                                        <option value="59"> Dominica</option>
                                                                        <option value="60"> Dominican Republic</option>
                                                                        <option value="61"> East Timor</option>
                                                                        <option value="62"> Ecuador</option>
                                                                        <option value="63"> Egypt</option>
                                                                        <option value="64"> El Salvador</option>
                                                                        <option value="65"> Equatorial Guinea</option>
                                                                        <option value="66"> Eritrea</option>
                                                                        <option value="67"> Estonia</option>
                                                                        <option value="68"> Ethiopia</option>
                                                                        <option value="69"> Falkland Islands</option>
                                                                        <option value="70"> Faroe Islands</option>
                                                                        <option value="71"> Fiji</option>
                                                                        <option value="72"> Finland</option>
                                                                        <option value="73"> France</option>
                                                                        <option value="74"> French Polynesia</option>
                                                                        <option value="75"> Gabon</option>
                                                                        <option value="76"> Gambia</option>
                                                                        <option value="77"> Georgia</option>
                                                                        <option value="78"> Germany</option>
                                                                        <option value="79"> Ghana</option>
                                                                        <option value="80"> Gibraltar</option>
                                                                        <option value="81"> Greece</option>
                                                                        <option value="82"> Greenland</option>
                                                                        <option value="83"> Grenada</option>
                                                                        <option value="84"> Guam</option>
                                                                        <option value="85"> Guatemala</option>
                                                                        <option value="86"> Guernsey</option>
                                                                        <option value="87"> Guinea</option>
                                                                        <option value="88"> Guinea-Bissau</option>
                                                                        <option value="89"> Guyana</option>
                                                                        <option value="90"> Haiti</option>
                                                                        <option value="91"> Honduras</option>
                                                                        <option value="92"> Hong Kong</option>
                                                                        <option value="93"> Hungary</option>
                                                                        <option value="94"> Iceland</option>
                                                                        <option value="95"> India</option>
                                                                        <option value="96"> Indonesia</option>
                                                                        <option value="97"> Iran</option>
                                                                        <option value="98"> Iraq</option>
                                                                        <option value="99"> Ireland</option>
                                                                        <option value="100"> Isle of Man</option>
                                                                        <option value="101"> Israel</option>
                                                                        <option value="102"> Italy</option>
                                                                        <option value="103"> Ivory Coast</option>
                                                                        <option value="104"> Jamaica</option>
                                                                        <option value="105"> Japan</option>
                                                                        <option value="106"> Jersey</option>
                                                                        <option value="107"> Jordan</option>
                                                                        <option value="108"> Kazakhstan</option>
                                                                        <option value="109"> Kenya</option>
                                                                        <option value="110"> Kiribati</option>
                                                                        <option value="111"> Kosovo</option>
                                                                        <option value="112"> Kuwait</option>
                                                                        <option value="113"> Kyrgyzstan</option>
                                                                        <option value="114"> Laos</option>
                                                                        <option value="115"> Latvia</option>
                                                                        <option value="116"> Lebanon</option>
                                                                        <option value="117"> Lesotho</option>
                                                                        <option value="118"> Liberia</option>
                                                                        <option value="119"> Libya</option>
                                                                        <option value="120"> Liechtenstein</option>
                                                                        <option value="121"> Lithuania</option>
                                                                        <option value="122"> Luxembourg</option>
                                                                        <option value="123"> Macau</option>
                                                                        <option value="124"> Macedonia</option>
                                                                        <option value="125"> Madagascar</option>
                                                                        <option value="126"> Malawi</option>
                                                                        <option value="127"> Malaysia</option>
                                                                        <option value="128"> Maldives</option>
                                                                        <option value="129"> Mali</option>
                                                                        <option value="130"> Malta</option>
                                                                        <option value="131"> Marshall Islands</option>
                                                                        <option value="132"> Mauritania</option>
                                                                        <option value="133"> Mauritius</option>
                                                                        <option value="134"> Mayotte</option>
                                                                        <option value="135"> Mexico</option>
                                                                        <option value="136"> Micronesia</option>
                                                                        <option value="137"> Moldova</option>
                                                                        <option value="138"> Monaco</option>
                                                                        <option value="139"> Mongolia</option>
                                                                        <option value="140"> Montenegro</option>
                                                                        <option value="141"> Montserrat</option>
                                                                        <option value="142"> Morocco</option>
                                                                        <option value="143"> Mozambique</option>
                                                                        <option value="144"> Myanmar</option>
                                                                        <option value="145"> Namibia</option>
                                                                        <option value="146"> Nauru</option>
                                                                        <option value="147"> Nepal</option>
                                                                        <option value="148"> Netherlands</option>
                                                                        <option value="149"> Netherlands Antilles</option>
                                                                        <option value="150"> New Caledonia</option>
                                                                        <option value="151"> New Zealand</option>
                                                                        <option value="152"> Nicaragua</option>
                                                                        <option value="153"> Niger</option>
                                                                        <option value="154"> Nigeria</option>
                                                                        <option value="155"> Niue</option>
                                                                        <option value="156"> North Korea</option>
                                                                        <option value="157"> Northern Mariana Islands</option>
                                                                        <option value="158"> Norway</option>
                                                                        <option value="159"> Oman</option>
                                                                        <option value="160"> Pakistan</option>
                                                                        <option value="161"> Palau</option>
                                                                        <option value="162"> Palestine</option>
                                                                        <option value="163"> Panama</option>
                                                                        <option value="164"> Papua New Guinea</option>
                                                                        <option value="165"> Paraguay</option>
                                                                        <option value="166"> Peru</option>
                                                                        <option value="167"> Philippines</option>
                                                                        <option value="168"> Pitcairn</option>
                                                                        <option value="169"> Poland</option>
                                                                        <option value="170"> Portugal</option>
                                                                        <option value="171"> Puerto Rico</option>
                                                                        <option value="172"> Qatar</option>
                                                                        <option value="173"> Republic of the Congo</option>
                                                                        <option value="174"> Reunion</option>
                                                                        <option value="175"> Romania</option>
                                                                        <option value="176"> Russia</option>
                                                                        <option value="177"> Rwanda</option>
                                                                        <option value="178"> Saint Barthelemy</option>
                                                                        <option value="179"> Saint Helena</option>
                                                                        <option value="180"> Saint Kitts and Nevis</option>
                                                                        <option value="181"> Saint Lucia</option>
                                                                        <option value="182"> Saint Martin</option>
                                                                        <option value="183"> Saint Pierre and Miquelon</option>
                                                                        <option value="184"> Saint Vincent and the Grenadines</option>
                                                                        <option value="185"> Samoa</option>
                                                                        <option value="186"> San Marino</option>
                                                                        <option value="187"> Sao Tome and Principe</option>
                                                                        <option value="188"> Saudi Arabia</option>
                                                                        <option value="189"> Senegal</option>
                                                                        <option value="190"> Serbia</option>
                                                                        <option value="191"> Seychelles</option>
                                                                        <option value="192"> Sierra Leone</option>
                                                                        <option value="193"> Singapore</option>
                                                                        <option value="194"> Sint Maarten</option>
                                                                        <option value="195"> Slovakia</option>
                                                                        <option value="196"> Slovenia</option>
                                                                        <option value="197"> Solomon Islands</option>
                                                                        <option value="198"> Somalia</option>
                                                                        <option value="199"> South Africa</option>
                                                                        <option value="200"> South Korea</option>
                                                                        <option value="201"> South Sudan</option>
                                                                        <option value="202"> Spain</option>
                                                                        <option value="203"> Sri Lanka</option>
                                                                        <option value="204"> Sudan</option>
                                                                        <option value="205"> Suriname</option>
                                                                        <option value="206"> Svalbard and Jan Mayen</option>
                                                                        <option value="207"> Swaziland</option>
                                                                        <option value="208"> Sweden</option>
                                                                        <option value="209"> Switzerland</option>
                                                                        <option value="210"> Syria</option>
                                                                        <option value="211"> Taiwan</option>
                                                                        <option value="212"> Tajikistan</option>
                                                                        <option value="213"> Tanzania</option>
                                                                        <option value="214"> Thailand</option>
                                                                        <option value="215"> Togo</option>
                                                                        <option value="216"> Tokelau</option>
                                                                        <option value="217"> Tonga</option>
                                                                        <option value="218"> Trinidad and Tobago</option>
                                                                        <option value="219"> Tunisia</option>
                                                                        <option value="220"> Turkey</option>
                                                                        <option value="221"> Turkmenistan</option>
                                                                        <option value="222"> Turks and Caicos Islands</option>
                                                                        <option value="223"> Tuvalu</option>
                                                                        <option value="224"> U.S. Virgin Islands</option>
                                                                        <option value="225"> Uganda</option>
                                                                        <option value="226"> Ukraine</option>
                                                                        <option value="227"> United Arab Emirates</option>
                                                                        <option value="228"> United Kingdom</option>
                                                                        <option value="229"> United States</option>
                                                                        <option value="230"> Uruguay</option>
                                                                        <option value="231"> Uzbekistan</option>
                                                                        <option value="232"> Vanuatu</option>
                                                                        <option value="233"> Vatican</option>
                                                                        <option value="234"> Venezuela</option>
                                                                        <option value="235"> Vietnam</option>
                                                                        <option value="236"> Wallis and Futuna</option>
                                                                        <option value="237"> Western Sahara</option>
                                                                        <option value="238"> Yemen</option>
                                                                        <option value="239"> Zambia</option>
                                                                        <option value="240"> Zimbabwe</option>

                                                                    </select>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="row" style="margin-top: 7px;">
                                                        <div class="col-md-12">

                                                            <div class="form-group">


                                                                <label class="control-label col-md-3">Detail Address </label><br/>
                                                                <div class="col-md-12">


                                                                    <input type="text" id="detailaddress"
                                                                            name="detailaddress"
                                                                            class="form-control">

                                                                    </input>

                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class=" form-group form-horizontal">
                                            <label class="control-label">উর্ধতন দপ্তর</label>
                                            <div class="input select">
                                                <select name="parent_office_id" class="form-control"
                                                        id="parent-office-id">
                                                    <option value="-1">-- Please Select --</option>

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-4 col-md-9">
                                                <button type="submit" onclick="saveOffice()" class="btn btn-primary">
                                                    সংরক্ষণ
                                                </button>
                                                <button class="btn purple btnClose" type="button">বন্ধ করুন</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <%--<button class="btn" onclick="pr()">click me</button>--%>


        </div>
    </div>
    <!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../../includes/includes.jsp" %>


<script>
    var originofficelist=[];
    var officelist=[];
    var addedit = -1;
    var templateselected =-1;
    var divisionstorage = [];
    var districtstorage = [];
    var upazillastorage = [];
    var unionstorage =[];
    var municipalitystorage = [];
    var citycorpoarationstorage = [];
    var citywordstorage =[];
    var muniwardstorage = [];
    var thanastorage =[];
    var poststorage = [];


    var aftersetdata;

    function bringdata_(url, id ,callback){
        $.ajax({
            type: "GET",
            url: url,
            data: {
                id: id
            },
            async: false,
            success: function (response) {
                callback(response);
            },
            error: function () {
                toastr.options = {"closeButton": true,"debug": false, "positionClass": "toast-bottom-right"};toastr.error(" পাওয়া যায়নি। আবার চেষ্টা করুন");
            }
        });
    }
    function bringdata(url,callback){
        $.ajax({
            type: "GET",
            url: url,
            async: false,
            success: function (response) {
                callback(response);
            },
            error: function () {
                toastr.options = {"closeButton": true,"debug": false, "positionClass": "toast-bottom-right"};toastr.error(" পাওয়া যায়নি। আবার চেষ্টা করুন");
            }
        });
    }

    function aftersetdata(){
        $(aftersetdata.selector).prop('selected',true);
        aftersetdata ='';
    }
    function setdata(select,data,propname) {
        select.empty();
        select.append($('<option></option>').val(0).html('...'));
        $.each(data, function(index, value) {
            select.append(
                $('<option></option>').val(value['id']).html(value[propname])
            );
        });
        aftersetdata();
    }
    function filldiv() {
        var $div = $('#office_tree_expand_view #divisiondropdown');
        var div = divisionstorage['#_'];
        if(div == undefined) {
            bringdata("divisiondata", function (data) {
                if(data.length!=0)divisionstorage['#_'] = data;
                setdata($div, data,'divisionNameBng');

            });
        }
        else{
            setdata($div,divisionstorage['#_'],'divisionNameBng');
        }
        $div.on('change',function (event) {
            filldis($(this).val());
            fillsuperioroffice( templateselected );
        });
    }
    
    function filldis(id) {
        var $dis = $('#office_tree_expand_view #districtdropdown');
        var dis = districtstorage['#_'+id];
        if(dis == undefined) {
            bringdata_("/districtlistbydiv",id, function (data) {
                if(data.length!=0)districtstorage['#_'+id] = data;
                setdata($dis, data,'districtNameBng');

            });
        }
        else{
            setdata($dis,districtstorage['#_'+id],'districtNameBng');
        }
        $dis.on('change',function (event) {
            var id = $(this).val();
            filltha(id);
            fillpost(id);
            fillsuperioroffice( templateselected );
        });
    }

    function fillupa(id) {
        var $upa = $('#office_tree_expand_view #upaziladropdown');
        var upa = upazillastorage['#_'+id];
        if(upa == undefined) {
            bringdata_("/upazillalistbydistrictid",id, function (data) {
                if(data.length!=0)upazillastorage['#_'+id] = data;
                setdata($upa, data,'upazillaNameBng');

            });
        }
        else{
            setdata($upa,upazillastorage['#_'+id],'upazillaNameBng');
        }
    }
    
    function filluni(id) {
        var $uni = $('#office_tree_expand_view #uniondropdown');
        var uni = unionstorage['#_'+id];
        if(uni == undefined) {
            bringdata_("/getunionlistbyupazillaid",id, function (data) {
                if(data.length!=0)unionstorage['#_'+id] = data;
                setdata($uni, data,'unionNameBng');

            });
        }
        else{
            setdata($uni,unionstorage['#_'+id],'unionNameBng');
        }
    }
    
    function filltha(id) {
        var $tha = $('#office_tree_expand_view #thanadropdown');
        var tha = thanastorage['#_'+id];
        if(tha == undefined) {
            bringdata_("/thanalistbydistrictid",id, function (data) {
                if(data.length!=0)thanastorage['#_'+id] = data;
                setdata($tha, data,'thanaNameBng');

            });
        }
        else{
            setdata($tha,thanastorage['#_'+id],'thanaNameBng');
        }
    }
    
    function fillpost(id) {
        var $post = $('#office_tree_expand_view #postofficedropdown');
        var post = poststorage['#_'+id];
        if(post == undefined) {
            bringdata_("/postofficebydis",id, function (data) {
                if(data.length!=0)poststorage['#_'+id] = data;
                setdata($post, data,'postOfficeNameBng');

            });
        }
        else{
            setdata($post,poststorage['#_'+id],'postOfficeNameBng');
        }
    }
    
    function fillmuni(id) {
        var $muni = $('#office_tree_expand_view #municipalitydropdown');
        var  muni = municipalitystorage['#_'+id];
        if(muni == undefined) {
            bringdata_("/municipalitylistbyupazillaid",id, function (data) {
                if(data.length!=0)municipalitystorage['#_'+id] = data;
                setdata($muni, data,'municipalityNameBng');

            });
        }
        else{
            setdata($muni,municipalitystorage['#_'+id],'municipalityNameBng');
        }

        $muni.on('change',function (event) {
            var id = $(this).val();
            fillmuniward(id);
        });
    }
    
    function fillmuniward(id) {
        var $ward = $('#office_tree_expand_view #wordno');
        var  ward = muniwardstorage['#_'+id];
        if(ward == undefined) {
            bringdata_("/municipalitywardlistbymunicipalityid",id, function (data) {
                if(data.length!=0)muniwardstorage['#_'+id] = data;
                setdata($ward, data,'wardNameBng');

            });
        }
        else{
            setdata($ward,muniwardstorage['#_'+id],'wardNameBng');
        }

    }

    function fillcityward(id) {
        var $ward = $('#office_tree_expand_view #wordno');

        var  ward = citywordstorage['#_'+id];
        if(ward == undefined) {
            bringdata_("wardlistbyid",id, function (data) {
                if(data.length!=0)citywordstorage['#_'+id] = data;
                setdata($ward, data,'nameBng');

            });
        }
        else{
            setdata($ward,citywordstorage['#_'+id],'nameBng');
        }
    }

    function fillcity(id) {
        var $city = $('#office_tree_expand_view #citydropdown');

        var  city = citycorpoarationstorage['#_'+id];
        if(city == undefined) {
            bringdata_("/citycorporationlistbydis",id, function (data) {
                if(data.length!=0)citycorpoarationstorage['#_'+id] = data;
                setdata($city, data,'nameBng');

            });
        }
        else{
            setdata($city,citycorpoarationstorage['#_'+id],'nameBng');
        }
        $city.on('change',function (event) {
            var id = $(this).val();
            fillcityward(id);
        });
    }

    function getdataforsuperior(selectedtemplateid){
        var list =new Array();
        var parentId = originofficelist['#_'+selectedtemplateid].parentOfficeId;
        var divisionid = $('#office_tree_expand_view #divisiondropdown').val();
        var districtid = $('#office_tree_expand_view #districtdropdown').val();
        for(var key in officelist){
            if(officelist.hasOwnProperty(key)) {
                if (officelist[key].officeOriginId == parentId && divisionid!="0" && districtid!="0"){

                 if(officelist[key].geoDivisionId == divisionid && officelist[key].geoDistrictId == districtid)list.push(officelist[key]);

                }
                else if(officelist[key].officeOriginId == parentId && divisionid!="0" ){
                   if( officelist[key].geoDivisionId == divisionid) list.push(officelist[key]);
                }
                else if(officelist[key].officeOriginId == parentId){
                    list.push(officelist[key]);
                }
            }
        }
        return list;
    }
    function fillsuperioroffice(id){
        var $superior = $('#office_tree_expand_view #parent-office-id');
        setdata($superior,getdataforsuperior(id),'officeNameBng')

    }

    function uncheckradiobutton($radio){
        $radio.prop('checked', false);
    }
    function clearlocal(){
        $('#office_tree_expand_view #districtdropdown').empty();
        $('#office_tree_expand_view #districtdropdown').append(
            $('<option></option>').val('-1').html('--Please Select--')
        );
        $('#office_tree_expand_view #upaziladropdown').empty();
        $('#office_tree_expand_view #upaziladropdown').append(
            $('<option></option>').val('-1').html('--Please Select--')
        );
        $('#office_tree_expand_view #thanadropdown').empty();
        $('#office_tree_expand_view #thanadropdown').append(
            $('<option></option>').val('-1').html('--Please Select--')
        );
        $('#office_tree_expand_view #citydropdown').empty();
        $('#office_tree_expand_view #citydropdown').append(
            $('<option></option>').val('-1').html('--Please Select--')
        );
        $('#office_tree_expand_view #postofficedropdown').empty();
        $('#office_tree_expand_view #postofficedropdown').append(
            $('<option></option>').val('-1').html('--Please Select--')
        );
        $('#office_tree_expand_view #uniondropdown').empty();
        $('#office_tree_expand_view #uniondropdown').append(
            $('<option></option>').val('-1').html('--Please Select--')
        );
        $('#office_tree_expand_view #municipalitydropdown').empty();
        $('#office_tree_expand_view #municipalitydropdown').append(
            $('<option></option>').val('-1').html('--Please Select--')
        );
        $('#office_tree_expand_view #wordno').empty();
        $('#office_tree_expand_view #wordno').append(
            $('<option></option>').val('-1').html('--Please Select--')
        );
        $('#office_tree_expand_view #address').val("");
        uncheckradiobutton($("#office_tree_expand_view input[name='unimuniradio']:radio"));
        uncheckradiobutton($("#office_tree_expand_view input[name='upacityradio']:radio"));

    }

    function clearglobal(){
        $('#office_tree_expand_view #detailaddress').val("");
    }
    function setlocationasEditInfo(office){

        var $domain = $('#office_tree_expand_view');
        aftersetdata = {'selector':'#divisiondropdown>option:eq("'+office.geoDivisionId+'")'};
        filldiv();
        aftersetdata = {'selector':'#districtdropdown>option:eq("'+office.geoDistrictId+'")'};
        filldis(office.geoDivisionId);
        aftersetdata = {'selector':'#thanadropdown>option:eq("'+office.geoThanaId+'")'};
        filltha(office.geoDistrictId);
        aftersetdata = {'selector':'#postofficedropdown>option:eq("'+office.geoPostOfficeId+'")'};
        fillpost(office.geoDistrictId);

       if(office.countryId>0){//outside country
           $('#tabpart > li:nth-child(2)',$domain).addClass('active');
           $('#countryname>option:eq("'+office.countryId+'")',$domain).prop('selected',true);
           $('#detailaddress',$domain).val(office.officeAddress);
       }else{//inside country
           $('#office_tree_expand_view #tabpart > li:nth-child(1)').addClass('active');
           if(office.geoCityCorporationId>0){//city
               aftersetdata = {'selector':'#citydropdown>option:eq("'+office.geoCityCorporationId+'")'};
               $("input[name='upacityradio']:radio:nth(1)",$domain).prop('checked',true).trigger('change');
               aftersetdata = {'selector':'#wordno>option:eq("'+office.geoCityCorporationWardId+'")'};
               fillcityward(office.geoCityCorporationId);
           }
           else if(office.geoUpazilaId>0){//upazilla
               aftersetdata = {'selector':'#upaziladropdown>option:eq("'+office.geoUpazilaId+'")'};
               $("input[name='upacityradio']:radio:nth(0)",$domain).prop('checked',true).trigger('change');
               if(office.geoUnionId>0) {//union
                   $("input[name='unimuniradio']:radio:nth(0)",$domain).prop('checked',true).trigger('change');
                   $('#uniondropdown>option:eq("'+office.geoUnionId+'")').prop('selected',true);
               }
               else if(office.geoMunicipalityId) {//municipality
                   $("input[name='unimuniradio']:radio:nth(1)",$domain).prop('checked',true).trigger('change');
                   $('#municipalitydropdown>option:eq("'+office.geoUnionId+'")').prop('selected',true);
                   fillmuniward(office.geoMunicipalityId);

               }
           }
       }
    }

    function setdataforEditInfo(office){
        setlocationasEditInfo(office);
    }
    function cancel() {
        $("#office_tree_expand_view").html("");
        $("#office_tree_expand_view").hide();
    }
    function addNode() {
        var formData = {
            'ministryid': $('#unit_tree_expand_view input[name=office_ministry_id]').val(),
            'layerid': $('#office_tree_expand_view input[name=office_layer_id]').val(),
            'originid': $('#office_tree_expand_view input[name=office_origin_id]').val(),
            'officecategory': $('#office_tree_expand_view input[name=office_unit_category]').val(),
            'originunitbng': $('#office_tree_expand_view input[name=unit_name_bng]').val(),
            'originuniteng': $('#office_tree_expand_view input[name=unit_name_eng]').val(),
            'unitlevel': $('#office_tree_expand_view input[name=unit_level]').val(),
            'parentunitid': $('#office_tree_expand_view input[name=parent_unit_id]').val()
        };

        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/addoriginunit",
            data: formData,
            async: false,
            success: function (response) {
                cancel();
                fetchData($("#origindropdown").val())
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
    }
    function editNode() {
        var formData = {
            'id': $('#office_tree_expand_view input[name=id]').val(),
            'officecategory': $('#office_tree_expand_view input[name=office_unit_category]').val(),
            'originunitbng': $('#office_tree_expand_view input[name=unit_name_bng]').val(),
            'originuniteng': $('#office_tree_expand_view input[name=unit_name_eng]').val(),
            'unitlevel': $('#office_tree_expand_view input[name=unit_level]').val(),
            'parentunitid': $('#office_tree_expand_view #parent-unit-id').val()
        };
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/editoriginunit",
            data: formData,
            async: false,
            success: function (response) {

                cancel();
                fetchData($("#origindropdown").val())
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
    }

    function addradiobuttonEvent($selectedpart){
        $("input[name='upacityradio']:radio",$selectedpart).on("change", function() {
            var value = $(this).val();
            switch (value){
                case "1":
                    $('#cityselectdiv').hide();
                    $('#warddiv').hide();
                    $('#addressdiv').hide();


                    $('#upazillaselectdiv').show('slow');
                    $('#muniuniselectiondiv').show('slow');

                    if($('#office_tree_expand_view #districtdropdown').val()!=0)fillupa($('#office_tree_expand_view #districtdropdown').val());
                    break;
                case "2":

                    $('#upazillaselectdiv').hide();
                    $('#muniselectdiv').hide();
                    $('#uniselectdiv').hide();
                    uncheckradiobutton($("input[name='unimuniradio']:radio",$selectedpart));
                    $('#muniuniselectiondiv').hide();
                    $('#addressdiv').hide();


                    $('#cityselectdiv').show('slow');
                    $('#warddiv').show('slow');
                    $('#addressdiv').show('slow');

                    if($('#office_tree_expand_view #districtdropdown').val()!=0)fillcity($('#office_tree_expand_view #districtdropdown').val());
                    break;
            }
        });

        $("input[name='unimuniradio']:radio",$selectedpart).on("change", function() {
            var value = $(this).val();
            switch (value){
                case "1":

                    $('#muniselectdiv').hide();
                    $('#addressdiv').hide();
                    $('#warddiv').hide();


//                            $('#uniselectdiv').css('display','block');
//                            $('#addressdiv').css('display','block');

                    $('#uniselectdiv').show('slow');
                    $('#addressdiv').show('slow');

                    if($('#office_tree_expand_view #upaziladropdown').val()!=0)filluni($('#office_tree_expand_view #upaziladropdown').val());
                    break;
                case "2":

                    $('#uniselectdiv').hide();
                    $('#addressdiv').hide();


                    $('#muniselectdiv').show('slow');
                    $('#warddiv').show('slow');
                    $('#addressdiv').show('slow');
                    if($('#office_tree_expand_view #upaziladropdown').val()!=0)fillmuni($('#office_tree_expand_view #upaziladropdown').val());
                    break;
            }
        });
    }

    function beforeSubmit($seletedpart){
        $seletedpart.on('submit',function () {
           if(addedit ==1){
               $('#office_tree_expand_view #office_ministry_id').val($('#ministrydropdown').val());
               $('#office_tree_expand_view #office_layer_id').val(originofficelist['#_'+templateselected].officeLayerId);
               $('#office_tree_expand_view #office_origin_id').val(templateselected);
           }
           else if(addedit == 2){
               alert("hello edit");
           }
        })
    }
    function addtabEvent($selectedpart){
         $("#tabpart a").on('click',function (event) {
             var choose =$(this).data('val');

             if(choose == "2")clearlocal();
             else clearglobal();
             $("#locationtype").val(choose);
         });
    }
    function eventInitializer($selctor,jsonData){
        $selctor.jstree('destroy');
        $selctor.jstree({
            'core': {
                'data': jsonData
            }
        });
        $selctor.jstree("refresh");
        $selctor.on("select_node.jstree", function (e, data) {
            console.log(this.id);
            if(this.id == "originofficetree") {
                addedit =1;
                $("#office_tree_expand_view").hide('slow', function () {

                    var addForm = $("#basicform").clone();

                    addForm.css('display', 'block');

                    $(this).html(addForm.html());
                    $('#formtag',this).text('নতুন দপ্তর তৈরি');

                    filldiv();
                    fillsuperioroffice(data.node.id);
                    templateselected = data.node.id;
                    var $selectedpart = $(this);
                    addradiobuttonEvent($selectedpart);
                    addtabEvent($selectedpart);
                    beforeSubmit($("#officeform",this));
                    $(this).show('slow');
                });
            }
            else{
                addedit =2;
                $("#office_tree_expand_view").hide('slow', function () {

                    var editForm = $("#basicform").clone();

                    editForm.css('display', 'block');
                    $(this).html(editForm.html());
                    $('#formtag',this).text('দপ্তর সম্পাদনা');

                    var office = officelist['#_'+data.node.id];

                    var $selectedpart = $(this);
                    addradiobuttonEvent($selectedpart);
                    addtabEvent($selectedpart);
                    setdataforEditInfo(office);
                    beforeSubmit($("#officeform",this));
                    $(this).show('slow');
                });
            }

        });
    }
    function childList(parentId, data) {
        var childs = [];
        for (var i = 0; i < data.length; i++) {
            if (data[i].parentOfficeId == parentId) childs.push(data[i]);
        }
        return childs;
    }

    function layerStructure1(id, data) {
        var jsonforjstree = '[';
        var childs = childList(id, data);
        for (var i = 0; i < childs.length; i++) {
            jsonforjstree += '{ "id" : "' + childs[i].id + '",';
            var checkChild = childList(childs[i].id, data);
            //if(checkChild.length ==0)jsonforjstree += '  "text" : "'+childs[i].officeNameBng+'<a  title=\'এই স্তরটি বাতিল করুন\' class=\'red equ\'  onclick=showModal(\''+childs[i].id+'\',\'/deleteoriginunit\')><i class=\'fa fa fa-minus-circle\'></i></a>",';
            /*else*/
            jsonforjstree += '  "text" : "' + childs[i].officeNameBng.trim() + '",';
            jsonforjstree += '  "icon" : "fa fa-home",';
            jsonforjstree += '  "li_attr" : {"ul" : "' + childs[i].officeLevel + '","oli" : "' + childs[i].officeLayerId + '","maxlevel" : "' + childs.length + '","bng" : "' + childs[i].officeNameBng.trim() + '","eng" : "' + childs[i].officeNameEng.trim() + '"},';
            jsonforjstree += (childs.length - 1 == i) ? '"children" : ' + layerStructure1(childs[i].id, data) + '}' : '  "children" : ' + layerStructure1(childs[i].id, data) + '},';
        }


        jsonforjstree += ']';
        return jsonforjstree;
    }


    function createJSTrees1(jsonData) {
            eventInitializer($('#originofficetree'),jsonData);
    }

    function layerStructure2(id, data) {
        var jsonforjstree = '[';
        var childs = childList(id, data);
        for (var i = 0; i < childs.length; i++) {
            jsonforjstree += '{ "id" : "' + childs[i].id + '",';
//            var checkChild = childList(childs[i].id, data);

            jsonforjstree += '  "text" : "' + childs[i].officeNameBng.trim() + '",';
            jsonforjstree += '  "icon" : "officeicon",';
            jsonforjstree += '  "li_attr" : {' +
                '"office_ministry_id" : "' + childs[i].officeMinistryId + '",' +
                '"office_layer_id" : "' + childs[i].officeLayerId + '",' +
                '"bng" : "' + childs[i].officeNameBng.trim() + '",' +
                '"eng" : "' + childs[i].officeNameEng.trim() + '"},';
            jsonforjstree += (childs.length - 1 == i) ? '"children" : ' + layerStructure2(childs[i].id, data) + '}' : '  "children" : ' + layerStructure2(childs[i].id, data) + '},';
        }



        jsonforjstree += ']';
        return jsonforjstree;
    }


    function createJSTrees2(jsonData) {

        eventInitializer($("#officetree"),jsonData);

    }
    function showModal(id, url) {
        bootbox.confirm({
            message: '<p class="text-center">Do you want to delete</p>',
            title: "Custom title",
            size: "small",
            buttons: {
                confirm: {
                    label: 'Yes',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'No',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result == true) {
                    var data;
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: {
                            id: id
                        },
                        async: false,
                        success: function (response) {
                            data = response;
                            $('.modal.in .modal-dialog').hide();
                            $(".modal.in .modal-dialog .btn").off("click");
                            cancel();
                            fetchData($("#origindropdown").val())
                        },
                        error: function () {
                            $('.modal.in .modal-dialog').hide();
                            $(".modal.in .modal-dialog .btn").off("click");
                            toastr.options = {
                                "closeButton": true,
                                "debug": false,
                                "positionClass": "toast-bottom-right"
                            };
                            toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ");
                        }
                    });

                } else {
                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");
                }

            }
        });
    }

    function fetchData(value) {

        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/originbyministry",
            data: {
                ministryid: value
            },
            async: false,
            success: function (response) {
                response.sort(function (a, b) {
                    var dif = a.officeSequence - b.officeSequence;
                    return (dif == 0) ? -1 : dif;
                });
                for(var i =0;i<response.length;i++){
                    originofficelist['#_'+response[i].id] = response[i];
                }

                var lStructure = layerStructure1(0, response);
                var myJsonString = JSON.parse(lStructure);
                createJSTrees1(myJsonString);
                var select = $('#parent-unit-id');
                select.empty();
                select.append($('<option></option>').val(0).html('...'));
                $.each(response, function (index, value) {
                    select.append(
                        $('<option></option>').val(value.id).html(value.officeNameBng)
                    );
                });
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

        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/officebyministry",
            data: {
                id: value
            },
            async: false,
            success: function (response) {
                for(var i =0;i<response.length;i++){
                    officelist['#_'+response[i].id] = response[i];
                }
                var lStructure = layerStructure2(0, response);
                var myJsonString = JSON.parse(lStructure);
                createJSTrees2(myJsonString);
                var select = $('#parent-unit-id');
                select.empty();
                select.append($('<option></option>').val(0).html('...'));
                $.each(response, function (index, value) {
                    select.append(
                        $('<option></option>').val(value.id).html(value.officeNameBng)
                    );
                });


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
    }

    $(document).ready(function () {


        $('#ministrydropdown').change(function () {
            var id = $(this).val();
            fetchData(id);


        });
        $(".radio").removeClass("radio");


    });

</script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
</body>
<!-- END BODY -->
</html>
