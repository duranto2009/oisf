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
    <%@ include file="../includes/head.jsp" %>
    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css"/>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed">
<!-- BEGIN HEADER -->
<div class="page-header -i navbar navbar-fixed-top">
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
        <div class="page-sidebar navbar-collapse collapse">
            <%@ include file="../includes/menu.jsp" %>
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- START MAIN CONTENT -->
        <div class="page-content">
            <div class="card">
                <div class="portlet box ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-picture"></i> সার্ভিস সম্পাদনা
                        </div>
                    </div>


                    <div class="portlet-body">


                        <div id="unit_tree_div" class="row" style="display:block;">
                            <div class="col-md-4">
                                <div class="portlet light no-shadow">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class=""></i>সার্ভিসের তালিকা
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div id="jstree"></div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-8" id="unit_tree_expand_view" style="display: block;">

                            </div>


                        </div>
                    </div>
                </div>

                <input type="hidden" id="menuid" value="${menuid}">
                <div id="editform" style="display: none">
                    <div class="portlet light no-shadow">
                        <div class="portlet-title">
                            <div class="caption"><i class=""></i>সার্ভিস রুট সম্পাদনা</div>
                            <button onclick="deleteOwner()" class="btn btn-icon-only btn-danger pull-right">
                                <i class="fa fa-trash-o fa-lg"></i>
                            </button>
                        </div>
                        <div class="portlet-body form"><br><br>
                            <form id="OfficeOriginUnitEditForm" accept-charset="utf-8" method="post">
                                <input type="hidden" name="id" id="owner-id">
                                <div class="form-horizontal">


                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">নাম</label>

                                        <div class="col-sm-7">
                                            <div class="input text"><input type="text" id="service-name-bng-e"
                                                                           class="form-control" name="service_name_bng">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">নাম (ইংরেজি)</label>

                                        <div class="col-sm-7">
                                            <div class="input text"><input type="text" id="service-name-eng-e"
                                                                           class="form-control" name="service_name_eng">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">বিবরন</label>

                                        <div class="col-sm-7">
                                            <div class="input text"><textarea type="text" id="service-description-e"
                                                                              class="form-control"
                                                                              name="service_description"></textarea>
                                            </div>
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
                                            <button class="btn default btnClose" onclick="cancel()" type="button">
                                                বাতিল
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="addform" style="display: none">
                    <div class="portlet light no-shadow">
                        <div class="portlet-title">
                            <div class="caption"><i class=""></i>নতুন সার্ভিস রুট তৈরি</div>
                        </div>
                        <div class="portlet-body form"><br><br>
                            <form id="OfficeOriginUnitAddForm" accept-charset="utf-8" method="post">

                                <div class="form-horizontal">

                                    <!-- Start : Import Office Unit Category View From Cell -->

                                    <!-- End : Import Office Unit Category View From Cell -->

                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">নাম</label>

                                        <div class="col-sm-7">
                                            <div class="input text"><input type="text" id="service-name-bng-e"
                                                                           class="form-control" name="service_name_bng">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">নাম (ইংরেজি)</label>

                                        <div class="col-sm-7">
                                            <div class="input text"><input type="text" id="service-name-eng-e"
                                                                           class="form-control" name="service_name_eng">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">বিবরন</label>

                                        <div class="col-sm-7">
                                            <div class="input text"><textarea type="text" id="service-description-e"
                                                                              class="form-control"
                                                                              name="service_description"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-4 col-md-9">
                                                <button class="btn" style="background-color: #8dc542"
                                                        onclick="addNode()"
                                                        type="button">
                                                    সংরক্ষণ
                                                </button>
                                                <button class="btn default btnClose" onclick="cancel()" type="button">
                                                    বাতিল
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

                <div id="editserviceform" style="display: none">
                    <div class="portlet light no-shadow">
                        <div class="portlet-title">
                            <div class="caption"><i class=""></i>সার্ভিস সম্পাদনা</div>
                            <button onclick="deleteService()" class="btn btn-icon-only btn-danger pull-right">
                                <i class="fa fa-trash-o fa-lg"></i>
                            </button>
                        </div>
                        <div class="portlet-body form"><br><br>
                            <form id="ServiceEditForm" accept-charset="utf-8" method="post">
                                <input type="hidden" name="owner_id" id="owner-id">
                                <input type="hidden" name="id" id="service-id">
                                <div class="form-horizontal">


                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">নাম</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="service-name-bng-e"
                                                                           class="form-control" name="service_name_bng">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">নাম (ইংরেজি)</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="service-name-eng-e"
                                                                           class="form-control" name="service_name_eng">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">বিবরন</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><textarea type="text" id="service-description-e"
                                                                              class="form-control"
                                                                              name="service_description"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">মেটাডাটা রেফারেন্স</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="service-metadata-ref"
                                                                           class="form-control"
                                                                           name="service_metadata_ref">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">ডাটা স্ট্যান্ডার্ড রেফারেন্স</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="service-db-ref"
                                                                           class="form-control" name="service_db_ref">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">ইন্টিগ্রেশন স্ট্যান্ডার্ড
                                            রেফারেন্স</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="service-int-ref"
                                                                           class="form-control" name="service_int_ref">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">অওনার সাব সিস্টেম</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="owner-sub-sys"
                                                                           class="form-control" name="owner_sub_sys">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">রিকোয়েস্ট ইউ আর আই</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="request-uri"
                                                                           class="form-control" name="request_uri">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">ইনভকিং ইউ আর আই</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="invoking-uri"
                                                                           class="form-control" name="invoking_uri">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">এক্সাম্পল রিকোয়েস্ট</label>

                                        <div class="col-sm-9">
                                            <div class="input text">
                                                <textarea rows="6" type="text" id="example-req" class="form-control"
                                                          name="example_req">

                                                </textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">এক্সাম্পল রেস্পন্স</label>

                                        <div class="col-sm-9">
                                            <div class="input text">
                                                <textarea rows="6" type="text" id="example-response"
                                                          class="form-control" name="example_response">
                                                </textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"> আউটপুট টাইপ </label>

                                        <div class="col-sm-9">
                                            <div class="input select">
                                                <select type="text" id="output-type" class="form-control"
                                                        name="output_type">
                                                    <option value="data">Data</option>
                                                    <option value="service">Service</option>

                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-4 col-md-9">
                                            <button class="btn" style="background-color: #8dc542"
                                                    onclick="editServiceNode()"
                                                    type="button">
                                                সংরক্ষণ
                                            </button>
                                            <button class="btn default btnClose" onclick="cancel()" type="button">
                                                বাতিল
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="addserviceform" style="display: none">
                    <div class="portlet light no-shadow">
                        <div class="portlet-title">
                            <div class="caption"><i class=""></i>সার্ভিস সম্পাদনা</div>
                        </div>
                        <div class="portlet-body form"><br><br>
                            <form id="ServiceAddForm" accept-charset="utf-8" method="post">
                                <input type="hidden" name="owner_id" id="owner-id">
                                <div class="form-horizontal">


                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">নাম</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="service-name-bng-e"
                                                                           class="form-control" name="service_name_bng">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">নাম (ইংরেজি)</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="service-name-eng-e"
                                                                           class="form-control" name="service_name_eng">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">বিবরন</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><textarea type="text" id="service-description-e"
                                                                              class="form-control"
                                                                              name="service_description"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">মেটাডাটা রেফারেন্স</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="service-metadata-ref"
                                                                           class="form-control"
                                                                           name="service_metadata_ref">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">ডাটা স্ট্যান্ডার্ড রেফারেন্স</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="service-db-ref"
                                                                           class="form-control" name="service_db_ref">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">ইন্টিগ্রেশন স্ট্যান্ডার্ড
                                            রেফারেন্স</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="service-int-ref"
                                                                           class="form-control" name="service_int_ref">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">অওনার সাব সিস্টেম</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="owner-sub-sys"
                                                                           class="form-control" name="owner_sub_sys">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">রিকোয়েস্ট ইউ আর আই</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="request-uri"
                                                                           class="form-control" name="request_uri">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">ইনভকিং ইউ আর আই</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="invoking-uri"
                                                                           class="form-control" name="invoking_uri">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">এক্সাম্পল রিকোয়েস্ট</label>

                                        <div class="col-sm-9">
                                            <div class="input text">
                                                <textarea rows="6" type="text" id="example-req" class="form-control"
                                                          name="example_req">

                                                </textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">এক্সাম্পল রেস্পন্স</label>

                                        <div class="col-sm-9">
                                            <div class="input text">
                                                <textarea rows="6" type="text" id="example-response"
                                                          class="form-control" name="example_response">
                                                </textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"> আউটপুট টাইপ </label>

                                        <div class="col-sm-9">
                                            <div class="input select">
                                                <select type="text" id="output-type" class="form-control"
                                                        name="output_type">
                                                    <option value="data">Data</option>
                                                    <option value="service">Service</option>

                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-4 col-md-9">
                                            <button class="btn" style="background-color: #8dc542"
                                                    onclick="addServiceNode()"
                                                    type="button">
                                                সংরক্ষণ
                                            </button>
                                            <button class="btn default btnClose" onclick="cancel()" type="button">
                                                বাতিল
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div id="editfieldsform" style="display: none">
                    <div class="portlet light no-shadow">
                        <div class="portlet-title">
                            <div class="caption"><i class=""></i>সার্ভিস ফিল্ড সম্পাদনা</div>
                            <button onclick="deleteFields()" class="btn btn-icon-only btn-danger pull-right">
                                <i class="fa fa-trash-o fa-lg"></i>
                            </button>
                        </div>
                        <div class="portlet-body form"><br><br>
                            <form id="serviceFieldsEditForm" accept-charset="utf-8" method="post">
                                <input type="hidden" name="field_id" id="field-id">
                                <div class="form-horizontal">


                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">নাম</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="field-name-bng-e"
                                                                           class="form-control" name="field_name_bng">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">নাম (ইংরেজি)</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="field-name-eng-e"
                                                                           class="form-control" name="field_name_eng">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">বিবরন</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><textarea type="text" id="field-description-e"
                                                                              class="form-control"
                                                                              name="field_description"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">ফিল্ডের ধরন</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="field-field-type"
                                                                           class="form-control"
                                                                           name="field_type">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">টাইপ </label>

                                        <div class="col-sm-9">
                                            <div class="input select">
                                                <select type="text" id="type" class="form-control" name="type">
                                                    <option value="1">Input</option>
                                                    <option value="2">Output</option>

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"> ম্যানডেটরি? </label>

                                        <div class="col-sm-9">
                                            <div class="input select">
                                                <select type="text" id="is-mandatory" class="form-control"
                                                        name="mandatory">
                                                    <option value="0">Optional</option>
                                                    <option value="1">Mandatory</option>

                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-4 col-md-9">
                                            <button class="btn" style="background-color: #8dc542"
                                                    onclick="editFieldsNode()"
                                                    type="button">
                                                সংরক্ষণ
                                            </button>
                                            <button class="btn default btnClose" onclick="cancel()" type="button">
                                                বাতিল
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div id="addfieldsform" style="display: none">
                    <div class="portlet light no-shadow">
                        <div class="portlet-title">
                            <div class="caption"><i class=""></i>সার্ভিস ফিল্ড তৈরি</div>
                        </div>
                        <div class="portlet-body form"><br><br>
                            <form id="serviceFieldsAddForm" accept-charset="utf-8" method="post">
                                <input type="hidden" name="service_id" id="service-id">
                                <div class="form-horizontal">


                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">নাম</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="field-name-bng-e"
                                                                           class="form-control" name="field_name_bng">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">নাম (ইংরেজি)</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="field-name-eng-e"
                                                                           class="form-control" name="field_name_eng">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">বিবরন</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><textarea type="text" id="field-description-e"
                                                                              class="form-control"
                                                                              name="field_description"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">ফিল্ডের ধরন</label>

                                        <div class="col-sm-9">
                                            <div class="input text"><input type="text" id="field-field-type"
                                                                           class="form-control"
                                                                           name="field_type">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">টাইপ </label>

                                        <div class="col-sm-9">
                                            <div class="input select">
                                                <select type="text" id="type" class="form-control" name="type">
                                                    <option value="1">Input</option>
                                                    <option value="2">Output</option>

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"> ম্যানডেটরি? </label>

                                        <div class="col-sm-9">
                                            <div class="input select">
                                                <select type="text" id="is-mandatory" class="form-control"
                                                        name="mandatory">
                                                    <option value="0">Optional</option>
                                                    <option value="1">Mandatory</option>

                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-offset-4 col-md-9">
                                            <button class="btn" style="background-color: #8dc542"
                                                    onclick="addFieldsNode()"
                                                    type="button">
                                                সংরক্ষণ
                                            </button>
                                            <button class="btn default btnClose" onclick="cancel()" type="button">
                                                বাতিল
                                            </button>
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
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../includes/includes.jsp" %>


<script>


    function fetchService(appid) {
        $('#jstree').jstree({
            'core': {
                'data': {
                    'method': 'POST',
                    'url': function (node) {

                        return '<%=request.getContextPath()%>/getownersbyapp';
                    },
                    'data': function (node) {

                        return {
                            'appid': appid,
                            "li_attr": "",
                            "a_attr": "",
                            "text": "<a  title=\'এই স্তরটি বাতিল করুন\' class=\'red equ\'></a>"
                        };

                    }

                },
                'themes': {
                    'responsive': false
                },
            }, 'types': {
                'default': {
                    'icon': 'fa fa-arrow-circle-right icon-state-warning icon-lg'
                },
                'file': {
                    'icon': 'fa fa-file icon-state-warning icon-lg'
                }
            },
            // 'checkbox': {
            //     'keep_selected_style': false,
            //     'three_state': false,
            //     'cascade': ''
            // },
            'plugins': ['types']
        });

        var OKtoCascadeUp = 0;
        var OKtoCascadeDown = 0;
        var propagtionLevel = 0;
        var propagate = true;


        // $("#jstree").on('loaded.jstree', function(event, data) {
        //     $(this).jstree().open_all();
        //     var $tree = $(this);
        //     $($tree.jstree().get_json($tree, {
        //         flat: true
        //     }))
        //         .each(function(index, value) {
        //             var node = $("#jstree").jstree().get_node(this.id);
        //             var select = document.getElementById(value.id).getElementsByTagName("a")[0];
        //              var copy = select.getElementsByTagName("i")[0];
        //              var copyt = select.textContent;
        //              select.innerHTML= "";
        //              var btn = document.createElement("BUTTON");
        //              // btn.addClass("btn btn-primary");
        //             var t = document.createTextNode('+');
        //             btn.appendChild(t);
        //             select.appendChild(copy);
        //             select.appendChild(btn);
        //             select.appendChild(document.createTextNode(copyt));
        //             //select.append(t);
        //             //console.log('node index = ' + idx + ' level = ' + lvl);
        //         });
        //     $(this).jstree().close_all(); // close all again
        // });

        function CascadeUp(inNode, inCommand) {
            if (OKtoCascadeUp < 1) {
                ParentNode = $('#jstree').jstree('get_parent', inNode);
                $('#jstree').jstree(inCommand, ParentNode);
            }
        }

        function CascadeUpBack(inNode, inCommand) {
            if (propagtionLevel <= 1) {
                ParentNode = $('#jstree').jstree('get_parent', inNode);
                ChildrenNodes = jQuery.makeArray($('#jstree').jstree('get_children_dom', ParentNode));


                for (var i = 0; i < ChildrenNodes.length; i++) {
                    var value = $("#" + ChildrenNodes[i].id).attr('aria-selected');//ChildrenNodes[i].attributes[1].nodeValue;
                    if (value == "true") {
                        propagate = false;
                    }
                }
                if (propagate) {
                    propagtionLevel -= 2;
                    $('#jstree').jstree(inCommand, ParentNode);
                }

            }
        }

        function CascadeDown(inNode, inCommand) {
            if (OKtoCascadeDown < 1) {
                ChildrenNodes = jQuery.makeArray($('#jstree').jstree('get_children_dom', inNode));
                $('#jstree').jstree(inCommand, ChildrenNodes);
            }
        }


        $('#jstree').on("select_node.jstree", function (e, data) {
            // $('#jstree').jstree('open_node', data.node);
            // OKtoCascadeDown++;
            // CascadeUp(data.node, 'select_node');
            // OKtoCascadeDown--;
            // CascadeDown(data.node, 'open_node');
            // CascadeDown(data.node, 'select_node');

            var inst = data.inst;
            // var level=inst.get_path().length;
            var level = data.node.parents.length;
            ;


            // alert(level);
            if (level == 1) {

                if (data.node.original.hasOwnProperty("id")) {
                    $("#unit_tree_expand_view").hide('slow', function () {
                        var editForm = $("#editform").clone();
                        editForm.css('display', 'block');
                        $("#unit_tree_expand_view").html(editForm.html());
                        var selectedpart = $("#unit_tree_expand_view");


                        // $('#parent-unit-id > option[value=' + data.node.parent + ']', selectedpart).attr('selected', true);
                        // $('#office-unit-category-e', selectedpart).val(data.node.li_attr.ouc);
                        $('#owner-id', selectedpart).val(data.node.id.split("_")[1]);
                        //alert($('#owner-id', selectedpart).val());
                        $('#service-name-bng-e', selectedpart).val(data.node.original.bng);
                        $('#service-name-eng-e', selectedpart).val(data.node.text);
                        $('#service-description-e', selectedpart).val(data.node.original.description);
                        // $('#unit-level-e', selectedpart).val(data.node.li_attr.ul);
                        // $('#id', selectedpart).val(data.node.original.id);
                        $("#unit_tree_expand_view").show('slow');
                    });


                }
                else {
                    $("#unit_tree_expand_view").hide('slow', function () {
                        var addForm = $("#addform").clone();
                        addForm.css('display', 'block');
                        $("#unit_tree_expand_view").html(addForm.html());
                        var selectedpart = $("#unit_tree_expand_view");
                        var parent = data.node.parent;
                        if (parent == '#') $('#parent_unit_id', selectedpart).val(0);
                        else $('#parent_unit_id', selectedpart).val(parent);
                        $("#unit_tree_expand_view").show('slow');
                    });
                }

            }
            else if (level == 2) {

                if (data.node.original.hasOwnProperty("id")) {
                    $("#unit_tree_expand_view").hide('slow', function () {
                        var editForm = $("#editserviceform").clone();
                        editForm.css('display', 'block');
                        $("#unit_tree_expand_view").html(editForm.html());
                        var selectedpart = $("#unit_tree_expand_view");

                        $('#service-id', selectedpart).val(data.node.id.split("_")[1]);
                        $('#owner-id', selectedpart).val(data.node.original.parent_id);
                        //alert($('#owner-id', selectedpart).val());
                        $('#service-name-bng-e', selectedpart).val(data.node.original.bng);
                        $('#service-name-eng-e', selectedpart).val(data.node.text);
                        $('#service-description-e', selectedpart).val(data.node.original.description);
                        $('#service-metadata-ref', selectedpart).val(data.node.original.metadata);
                        $('#service-db-ref', selectedpart).val(data.node.original.data_standard);
                        $('#service-int-ref', selectedpart).val(data.node.original.int_standard);
                        $('#owner-sub-sys', selectedpart).val(data.node.original.owner_sub);
                        $('#request-uri', selectedpart).val(data.node.original.request);
                        $('#invoking-uri', selectedpart).val(data.node.original.invoking);
                        $('#example-req', selectedpart).val(data.node.original.sample_req);
                        $('#example-response', selectedpart).val(data.node.original.sample_response);
                        if (data.node.original.output_type.toLowerCase() === "service") {
                            $('#output-type option[value=service]').attr('selected', 'selected');
                        } else {
                            $('#output-type option[value=data]').attr('selected', 'selected');
                        }
                        $("#unit_tree_expand_view").show('slow');
                    });


                } else {
                    $("#unit_tree_expand_view").hide('slow', function () {
                        var editForm = $("#addserviceform").clone();
                        editForm.css('display', 'block');
                        $("#unit_tree_expand_view").html(editForm.html());
                        var selectedpart = $("#unit_tree_expand_view");

                        var parent = data.node.parent;
                        // if (parent == '#') $('#parent_unit_id', selectedpart).val(0);
                        // else $('#parent_unit_id', selectedpart).val(parent);

                        $('#owner-id', selectedpart).val(parent.split("_")[1]);
                        //alert($('#owner-id').val());
                        //alert($('#owner-id', selectedpart).val());
                        $("#unit_tree_expand_view").show('slow');
                    });
                }
            }
            else if (level == 3) {

                if (data.node.original.hasOwnProperty("id")) {
                    $("#unit_tree_expand_view").hide('slow', function () {
                        var editForm = $("#editfieldsform").clone();
                        editForm.css('display', 'block');
                        $("#unit_tree_expand_view").html(editForm.html());
                        var selectedpart = $("#unit_tree_expand_view");


                        $('#field-id', selectedpart).val(data.node.id.split("_")[1]);
                        //alert($('#owner-id', selectedpart).val());
                        $('#field-name-bng-e', selectedpart).val(data.node.original.bng);
                        $('#field-name-eng-e', selectedpart).val(data.node.text);
                        $('#field-description-e', selectedpart).val(data.node.original.description);
                        $('#field-field-type', selectedpart).val(data.node.original.field_type);
                        $('#field-description-e', selectedpart).val(data.node.original.description);

                        if (data.node.original.type === 1) {
                            $('#type option[value=1]').attr('selected', 'selected');
                        } else {
                            $('#type option[value=2]').attr('selected', 'selected');
                        }
                        if (data.node.original.is_mandatory === 0) {
                            $('#is-mandatory option[value=0]').attr('selected', 'selected');
                        } else {
                            $('#is-mandatory option[value=1]').attr('selected', 'selected');
                        }
                        $("#unit_tree_expand_view").show('slow');
                    });


                }
                else {
                    $("#unit_tree_expand_view").hide('slow', function () {
                        var addForm = $("#addfieldsform").clone();
                        addForm.css('display', 'block');
                        $("#unit_tree_expand_view").html(addForm.html());
                        var selectedpart = $("#unit_tree_expand_view");
                        var parent = data.node.parent;
                        $('#service-id', selectedpart).val(parent.split("_")[1]);
                        $("#unit_tree_expand_view").show('slow');
                    });
                }

            }


        });

        // Deselection Actions
        $('#jstree').on("deselect_node.jstree", function (e, data) {
            $('#jstree').jstree('open_node', data.node); //need this to have it deselect hidden nodes
            propagtionLevel++;
            if (propagtionLevel >= 1) {
                CascadeDown(data.node, 'open_node');
                CascadeDown(data.node, 'deselect_node');
            }
            if (propagate == true) CascadeUpBack(data.node, 'deselect_node');
            propagate = true;
            propagtionLevel = 0;
            // CascadeDown(data.node, 'close_node');
            // $('#jstree').jstree('close_node', data.node); //need this to have it deselect hidden nodes
        });


    }

    function cancel() {
        $("#unit_tree_expand_view").html("");
        $("#unit_tree_expand_view").hide();
    }

    function addNode() {
        var formData = {
            'service_name_bng': $('#unit_tree_expand_view input[name=service_name_bng]').val(),
            'service_name_eng': $('#unit_tree_expand_view input[name=service_name_eng]').val(),
            'service_description': $('#unit_tree_expand_view textarea[name=service_description]').val(),
            'appid': ${appid}
        };

        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/addserviceowner",
            data: formData,
            async: false,
            success: function (response) {
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "positionClass": "toast-bottom-right"
                };
                toastr.success(" সফলভাবে সম্পন্ন হয়েছে ");
                $('#jstree').jstree("refresh");
                cancel();
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
        //location.reload();

    }

    function editNode() {
        var formData = {
            'id': $('#unit_tree_expand_view input[name=id]').val(),
            'service_name_bng': $('#unit_tree_expand_view input[name=service_name_bng]').val(),
            'service_name_eng': $('#unit_tree_expand_view input[name=service_name_eng]').val(),
            'service_description': $('#unit_tree_expand_view textarea[name=service_description]').val(),
            'appid': ${appid}
        };
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/editserviceowner",
            data: formData,
            async: false,
            success: function (response) {


                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "positionClass": "toast-bottom-right"
                };
                toastr.success(" সফলভাবে সম্পন্ন হয়েছে ");
                $('#jstree').jstree("refresh");
                cancel();

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
       // location.reload();

    }

    function editServiceNode() {
        var formData = {
            'id': $('#unit_tree_expand_view input[name=id]').val(),
            'owner_id': $('#unit_tree_expand_view input[name=owner_id]').val(),
            'service_name_bng': $('#unit_tree_expand_view input[name=service_name_bng]').val(),
            'service_name_eng': $('#unit_tree_expand_view input[name=service_name_eng]').val(),
            'service_description': $('#unit_tree_expand_view textarea[name=service_description]').val(),
            'service_metadata_ref': $('#unit_tree_expand_view input[name=service_metadata_ref]').val(),
            'service_db_ref': $('#unit_tree_expand_view input[name=service_db_ref]').val(),
            'service_int_ref': $('#unit_tree_expand_view input[name=service_int_ref]').val(),
            'owner_sub_sys': $('#unit_tree_expand_view input[name=owner_sub_sys]').val(),
            'request_uri': $('#unit_tree_expand_view input[name=request_uri]').val(),
            'invoking_uri': $('#unit_tree_expand_view input[name=invoking_uri]').val(),
            'example_req': $('#unit_tree_expand_view textarea[name=example_req]').val(),
            'example_response': $('#unit_tree_expand_view textarea[name=example_response]').val(),
            'output_type': $('#unit_tree_expand_view select[name=output_type]').val(),
            'appid': ${appid}
        };
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/editservices",
            data: formData,
            async: false,
            success: function (response) {


                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "positionClass": "toast-bottom-right"
                };
                toastr.success(" সফলভাবে সম্পন্ন হয়েছে ");
                $('#jstree').jstree("refresh");
                cancel();

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
        //location.reload();

    }

    function addServiceNode() {
        var formData = {
            'owner_id': $('#unit_tree_expand_view input[name=owner_id]').val(),
            'service_name_bng': $('#unit_tree_expand_view input[name=service_name_bng]').val(),
            'service_name_eng': $('#unit_tree_expand_view input[name=service_name_eng]').val(),
            'service_description': $('#unit_tree_expand_view textarea[name=service_description]').val(),
            'service_metadata_ref': $('#unit_tree_expand_view input[name=service_metadata_ref]').val(),
            'service_db_ref': $('#unit_tree_expand_view input[name=service_db_ref]').val(),
            'service_int_ref': $('#unit_tree_expand_view input[name=service_int_ref]').val(),
            'owner_sub_sys': $('#unit_tree_expand_view input[name=owner_sub_sys]').val(),
            'request_uri': $('#unit_tree_expand_view input[name=request_uri]').val(),
            'invoking_uri': $('#unit_tree_expand_view input[name=invoking_uri]').val(),
            'example_req': $('#unit_tree_expand_view textarea[name=example_req]').val(),
            'example_response': $('#unit_tree_expand_view textarea[name=example_response]').val(),
            'output_type': $('#unit_tree_expand_view select[name=output_type]').val(),
            'appid': ${appid}
        };
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/addservices",
            data: formData,
            async: false,
            success: function (response) {


                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "positionClass": "toast-bottom-right"
                };
                toastr.success(" সফলভাবে সম্পন্ন হয়েছে ");
                $('#jstree').jstree("refresh");
                cancel();
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

        //location.reload();
    }

    function editFieldsNode() {
        var formData = {
            'id': $('#unit_tree_expand_view input[name=field_id]').val(),
            'field_name_bng': $('#unit_tree_expand_view input[name=field_name_bng]').val(),
            'field_name_eng': $('#unit_tree_expand_view input[name=field_name_eng]').val(),
            'field_description': $('#unit_tree_expand_view textarea[name=field_description]').val(),
            'field_type': $('#unit_tree_expand_view input[name=field_type]').val(),
            'type': $('#unit_tree_expand_view select[name=type]').val(),
            'mandatory': $('#unit_tree_expand_view select[name=mandatory]').val()
        };
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/editservicefields",
            data: formData,
            async: false,
            success: function (response) {


                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "positionClass": "toast-bottom-right"
                };
                toastr.success(" সফলভাবে সম্পন্ন হয়েছে ");
                $('#jstree').jstree("refresh");
                cancel();
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
        // location.reload();

    }

    function addFieldsNode() {
        var formData = {
            'service_id': $('#unit_tree_expand_view input[name=service_id]').val(),
            'field_name_bng': $('#unit_tree_expand_view input[name=field_name_bng]').val(),
            'field_name_eng': $('#unit_tree_expand_view input[name=field_name_eng]').val(),
            'field_description': $('#unit_tree_expand_view textarea[name=field_description]').val(),
            'field_type': $('#unit_tree_expand_view input[name=field_type]').val(),
            'type': $('#unit_tree_expand_view select[name=type]').val(),
            'mandatory': $('#unit_tree_expand_view select[name=mandatory]').val()
        };
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/addservicefields",
            data: formData,
            async: false,
            success: function (response) {
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "positionClass": "toast-bottom-right"
                };
                toastr.success(" সফলভাবে সম্পন্ন হয়েছে ");
                $('#jstree').jstree("refresh");
                cancel();

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
        // location.reload();

    }

    function deleteOwner() {

        var id=$('#owner-id').val();
        var url="deleteserviceowner";
        var text="সার্ভিস রুট "
        showModal(id,url,text);

    }
    function deleteService() {


        var id=$('#service-id').val();
        var url="deleteservice";
        var text="সার্ভিস "
        showModal(id,url,text);

    }
    function deleteFields() {


        var id=$('#field-id').val();
        var url="deleteservicefield";
        var text="সার্ভিস ফিল্ড "
        showModal(id,url,text);

    }


    function showModal(id, url,text) {
        bootbox.confirm({
            message: '<p class="text-center">আপনি কি এই'+text+'টি মুছতে চান?</p>',
            title: text+" মুছুন",
            size: "small",
            buttons: {
                confirm: {
                    label: 'হ্যাঁ',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'না',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result == true) {
                    var data;
                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/"+url,
                        data: {
                            id: id
                        },
                        async: false,
                        success: function (response) {
                            data = response;
                            $('.modal.in .modal-dialog').hide();
                            $(".modal.in .modal-dialog .btn").off("click");
                            $('#jstree').jstree("refresh");
                            cancel();
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

                } else {
                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");
                }

            }
        });
        // location.reload();

    }


    $(document).ready(function () {
        fetchService(${appid});

    });

</script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
</body>
<!-- END BODY -->
</html>
