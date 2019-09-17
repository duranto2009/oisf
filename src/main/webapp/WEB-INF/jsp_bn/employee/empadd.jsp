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
                                <div class="caption"><i class="fa fa-gift"></i> কর্মকর্তার তথ্য</div>

                            </div>

                            <div class="portlet-body ">
                                <form method="post" action="${context}/employeeadd" id="target" role="form" novalidate="novalidate" >
                                    <%--<div style="display:none;"><input type="hidden" name="_method" value="POST"></div>--%>
                                    <div class="form-body" style="margin: 10px 30px;">
                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            ফর্ম সাবমিট এ সমস্যা রয়েছে। দয়া করে যাচাই করুন।
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            সফলভাবে কর্মকর্তা যুক্ত করা হয়েছে !
                                        </div>

                                        <h3 class="form-section">ব্যক্তিগত তথ্য</h3>

                                        <input type="hidden" name="menuid" value="${menuid}">


                                        <div class="row">
                                            <div class="col-md-6 form-group form-horizontal">
                                                <label class="control-label">নাম  <span
                                                        class="required" aria-required="true"> * </span></label>


                                                    <input type="text" name="name_bng"
                                                        class="form-control"
                                                        placeholder="নাম(বাংলা)"
                                                        id="name-bng">
                                                <%--</div>--%>
                                            </div>
                                            <div class="col-md-6 form-group form-horizontal">
                                                <label class="control-label">&nbsp;</label>
                                                <div class="input text"><input type="text" name="name_eng"
                                                                               class="form-control"
                                                                               placeholder="নাম(ইংরেজি)" id="name-eng">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 form-group form-horizontal">
                                                <label class="control-label">পিতার নাম </label>
                                                <div class="input text"><input type="text" name="father_name_bng"
                                                                               class="form-control"
                                                                               placeholder="পিতার নাম(বাংলা)"
                                                                               id="father-name-bng"></div>
                                            </div>

                                            <div class="col-md-6 form-group form-horizontal">
                                                <label class="control-label">&nbsp;</label>
                                                <div class="input text"><input type="text" name="father_name_eng"
                                                                               class="form-control"
                                                                               placeholder="পিতার নাম(ইংরেজি)"
                                                                               id="father-name-eng"></div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 form-group form-horizontal">
                                                <label class="control-label">মাতার নাম </label>
                                                <div class="input text"><input type="text" name="mother_name_bng"
                                                                               class="form-control"
                                                                               placeholder="মাতার নাম(বাংলা)"
                                                                               id="mother-name-bng"></div>
                                            </div>

                                            <div class="col-md-6 form-group form-horizontal">
                                                <label class="control-label">&nbsp;</label>
                                                <div class="input text"><input type="text" name="mother_name_eng"
                                                                               class="form-control"
                                                                               placeholder="মাতার নাম(ইংরেজি)"
                                                                               id="mother-name-eng"></div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 form-group form-horizontal">
                                                <label class="control-label">জন্ম তারিখ <span
                                                        class="text-danger">*</span></label>
                                                <%--<div class="input text">--%>
                                                    <input type="text" name="birth_date"
                                                                               class="form-control date-picker"
                                                                               placeholder="জন্ম তারিখ"
                                                                               id="date-of-birth">
                                                <%--</div>--%>
                                            </div>


                                            <div class="col-md-3 form-group form-horizontal">
                                                <label class="control-label">জাতীয় পরিচয়পত্র নম্বর <span
                                                        class="text-danger">*</span></label>
                                                <div class="input text required"><input type="text" name="nid"
                                                                                        class="form-control"
                                                                                        placeholder="জাতীয় পরিচয়পত্র নম্বর"
                                                                                         id="nid">
                                                </div>
                                                <%--<span class="help-block font-red"><b>*</b> জাতীয় পরিচয়পত্র নম্বর ১৭ সংখ্যার  হতে হবে। প্রথম চার সংখ্যা  জন্মসন । </span>--%>
                                            </div>
                                            <div class="col-md-3 form-group form-horizontal">
                                                <label class="control-label">জন্ম সনদ নম্বর</label>
                                                <div class="input text"><input type="text" name="bcn"
                                                                               class="form-control"
                                                                               placeholder="জন্ম সনদ নম্বর" id="bcn">
                                                </div>
                                            </div>
                                            <div class="col-md-3 form-group form-horizontal">
                                                <label class="control-label">পাসপোর্ট নম্বর</label>
                                                <div class="input text"><input type="text" name="ppn"
                                                                               class="form-control"
                                                                               placeholder="পাসপোর্ট নম্বর" id="ppn">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-3 form-group form-horizontal">
                                                <label class="control-label">লিঙ্গ </label>
                                                <select class="form-control" name="gender">
                                                    <option value="1"> পুরুষ</option>
                                                    <option value="2"> মহিলা</option>
                                                    <option value="3"> অন্যান্য</option>
                                                </select>
                                            </div>
                                            <%--<div class="input select"><div class="select2-container form-control" id="s2id_gender"><a href="javascript:void(0)" class="select2-choice" tabindex="-1">   <span class="select2-chosen" id="select2-chosen-1">Male</span><abbr class="select2-search-choice-close"></abbr>   <span class="select2-arrow" role="presentation"><b role="presentation"></b></span></a><label for="s2id_autogen1" class="select2-offscreen"></label><input class="select2-focusser select2-offscreen" type="text" aria-haspopup="true" role="button" aria-labelledby="select2-chosen-1" id="s2id_autogen1"><div class="select2-drop select2-display-none select2-with-searchbox">   <div class="select2-search">       <label for="s2id_autogen1_search" class="select2-offscreen"></label>       <input type="text" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" class="select2-input" role="combobox" aria-expanded="true" aria-autocomplete="list" aria-owns="select2-results-1" id="s2id_autogen1_search" placeholder="">   </div>   <ul class="select2-results" role="listbox" id="select2-results-1">   </ul></div></div><div class="select2-container form-control" id="s2id_gender" title=""><a href="javascript:void(0)" class="select2-choice" tabindex="-1">   <span class="select2-chosen" id="select2-chosen-1">Male</span><abbr class="select2-search-choice-close"></abbr>   <span class="select2-arrow" role="presentation"><b role="presentation"></b></span></a><label for="s2id_autogen1" class="select2-offscreen"></label><input class="select2-focusser select2-offscreen" type="text" aria-haspopup="true" role="button" aria-labelledby="select2-chosen-1" id="s2id_autogen1" tabindex="-1"></div><select name="gender" class="form-control select2-offscreen" placeholder="লিঙ্গ" id="gender" tabindex="-1" title=""><option value="">--বাছাই করুন--</option><option value="1" selected="selected">Male</option><option value="2">Female</option><option value="3">Others</option></select></div>    </div>--%>
                                            <div class="col-md-3 form-group form-horizontal">
                                                <label class="control-label">ধর্ম </label>
                                                <select class="form-control" name="religion">
                                                    <option value="1"> মুসলিম</option>
                                                    <option value="2"> হিন্দু</option>
                                                    <option value="3"> বৌদ্ধ</option>
                                                    <option value="4"> খ্রিস্টান</option>
                                                    <option value="8">প্রকাশ করতে অনাগ্রহী </option>
                                                    <option value="9"> ধর্মে বিশ্বাসী নয়</option>
                                                    <option value="0"> অন্যান্য</option>
                                                </select>
                                            </div>
                                            <%--<div class="input select"><div class="select2-container form-control" id="s2id_religion"><a href="javascript:void(0)" class="select2-choice" tabindex="-1">   <span class="select2-chosen" id="select2-chosen-2">--বাছাই করুন--</span><abbr class="select2-search-choice-close"></abbr>   <span class="select2-arrow" role="presentation"><b role="presentation"></b></span></a><label for="s2id_autogen2" class="select2-offscreen"></label><input class="select2-focusser select2-offscreen" type="text" aria-haspopup="true" role="button" aria-labelledby="select2-chosen-2" id="s2id_autogen2"><div class="select2-drop select2-display-none select2-with-searchbox">   <div class="select2-search">       <label for="s2id_autogen2_search" class="select2-offscreen"></label>       <input type="text" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" class="select2-input" role="combobox" aria-expanded="true" aria-autocomplete="list" aria-owns="select2-results-2" id="s2id_autogen2_search" placeholder="">   </div>   <ul class="select2-results" role="listbox" id="select2-results-2">   </ul></div></div><div class="select2-container form-control" id="s2id_religion" title=""><a href="javascript:void(0)" class="select2-choice" tabindex="-1">   <span class="select2-chosen" id="select2-chosen-2">Islam</span><abbr class="select2-search-choice-close"></abbr>   <span class="select2-arrow" role="presentation"><b role="presentation"></b></span></a><label for="s2id_autogen2" class="select2-offscreen"></label><input class="select2-focusser select2-offscreen" type="text" aria-haspopup="true" role="button" aria-labelledby="select2-chosen-2" id="s2id_autogen2" tabindex="-1"></div><select name="religion" class="form-control select2-offscreen" placeholder="ধর্ম" id="religion" tabindex="-1" title=""><option value="">--বাছাই করুন--</option><option value="Islam">Islam</option><option value="Hindu">Hindu</option><option value="Christian">Christian</option><option value="Buddhist">Buddhist</option><option value="Others">Others</option></select></div>    </div>--%>
                                            <div class="col-md-3 form-group form-horizontal">
                                                <label class="control-label">রক্তের গ্রুপ</label>

                                                <select class="form-control" name="blood_group">

                                                    <option value="1">O+</option>
                                                    <option value="2">O-</option>
                                                    <option value="3">A+</option>
                                                    <option value="4">A-</option>
                                                    <option value="5">B+</option>
                                                    <option value="6">B-</option>
                                                    <option value="7">AB+</option>
                                                    <option value="8">AB-</option>

                                                </select>

                                            </div>

                                            <%--<div class="input select"><div class="select2-container form-control" id="s2id_blood-group"><a href="javascript:void(0)" class="select2-choice" tabindex="-1">   <span class="select2-chosen" id="select2-chosen-3">--বাছাই করুন--</span><abbr class="select2-search-choice-close"></abbr>   <span class="select2-arrow" role="presentation"><b role="presentation"></b></span></a><label for="s2id_autogen3" class="select2-offscreen"></label><input class="select2-focusser select2-offscreen" type="text" aria-haspopup="true" role="button" aria-labelledby="select2-chosen-3" id="s2id_autogen3"><div class="select2-drop select2-display-none select2-with-searchbox">   <div class="select2-search">       <label for="s2id_autogen3_search" class="select2-offscreen"></label>       <input type="text" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" class="select2-input" role="combobox" aria-expanded="true" aria-autocomplete="list" aria-owns="select2-results-3" id="s2id_autogen3_search" placeholder="">   </div>   <ul class="select2-results" role="listbox" id="select2-results-3">   </ul></div></div><div class="select2-container form-control" id="s2id_blood-group" title=""><a href="javascript:void(0)" class="select2-choice" tabindex="-1">   <span class="select2-chosen" id="select2-chosen-3">--বাছাই করুন--</span><abbr class="select2-search-choice-close"></abbr>   <span class="select2-arrow" role="presentation"><b role="presentation"></b></span></a><label for="s2id_autogen3" class="select2-offscreen"></label><input class="select2-focusser select2-offscreen" type="text" aria-haspopup="true" role="button" aria-labelledby="select2-chosen-3" id="s2id_autogen3" tabindex="-1"></div><select name="blood_group" class="form-control select2-offscreen" placeholder="রক্তের গ্রুপ" id="blood-group" tabindex="-1" title=""><option value="">--বাছাই করুন--</option><option value="A+">A+</option><option value="A-">A-</option><option value="B+">B+</option><option value="B-">B-</option><option value="O+">O+</option><option value="O-">O-</option><option value="AB+">AB+</option><option value="AB-">AB-</option></select></div>    </div>--%>
                                            <div class="col-md-3 form-group form-horizontal">
                                                <label class="control-label">বৈবাহিক অবস্থা</label>

                                                <select class="form-control" name="maritalStatus">
                                                    <%--<option value="-1" disabled="disabled" selected="selected">Select One</option>--%>
                                                    <option value="1"> অবিবাহিত</option>
                                                    <option value="2"> বিবাহিত</option>

                                                    <option value="3"> বিধবা / বিপত্নীক</option>
                                                        <option value="4"> স্বামী / স্ত্রী পৃথক</option>
                                                    <option value="5">তালাক প্রাপ্ত / বিবাহ বিচ্ছিন্ন</option>
                                                </select>

                                            </div>

                                            <%--<div class="input select"><div class="select2-container form-control" id="s2id_marital-status"><a href="javascript:void(0)" class="select2-choice" tabindex="-1">   <span class="select2-chosen" id="select2-chosen-4">--বাছাই করুন--</span><abbr class="select2-search-choice-close"></abbr>   <span class="select2-arrow" role="presentation"><b role="presentation"></b></span></a><label for="s2id_autogen4" class="select2-offscreen"></label><input class="select2-focusser select2-offscreen" type="text" aria-haspopup="true" role="button" aria-labelledby="select2-chosen-4" id="s2id_autogen4"><div class="select2-drop select2-display-none select2-with-searchbox">   <div class="select2-search">       <label for="s2id_autogen4_search" class="select2-offscreen"></label>       <input type="text" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" class="select2-input" role="combobox" aria-expanded="true" aria-autocomplete="list" aria-owns="select2-results-4" id="s2id_autogen4_search" placeholder="">   </div>   <ul class="select2-results" role="listbox" id="select2-results-4">   </ul></div></div><div class="select2-container form-control" id="s2id_marital-status" title=""><a href="javascript:void(0)" class="select2-choice" tabindex="-1">   <span class="select2-chosen" id="select2-chosen-4">Married</span><abbr class="select2-search-choice-close"></abbr>   <span class="select2-arrow" role="presentation"><b role="presentation"></b></span></a><label for="s2id_autogen4" class="select2-offscreen"></label><input class="select2-focusser select2-offscreen" type="text" aria-haspopup="true" role="button" aria-labelledby="select2-chosen-4" id="s2id_autogen4" tabindex="-1"></div><select name="marital_status" class="form-control select2-offscreen" placeholder="বৈবাহিক অবস্থা" id="marital-status" tabindex="-1" title=""><option value="">--বাছাই করুন--</option><option value="Single">Single</option><option value="Married">Married</option><option value="Widowed">Widowed</option><option value="Separated">Separated</option></select></div>    </div>--%>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-3 form-group form-horizontal">
                                                <label class="control-label"> ব্যক্তিগত ই-মেইল <span
                                                        class="text-danger">*</span></label>
                                                <div class="input text"><input type="text" name="personal_email"
                                                                               class="form-control" placeholder="ই-মেইল"
                                                                               id="personal-email"></div>
                                            </div>
                                            <div class="col-md-3 form-group form-horizontal">
                                                <label class="control-label"> ব্যক্তিগত মোবাইল নম্বর <span
                                                        class="text-danger">*</span></label>
                                                <div class="input text required"><input type="text"
                                                                                        name="personal_mobile"
                                                                                        class="form-control"
                                                                                        placeholder="মোবাইল"
                                                                                        <%--required="required"--%>
                                                                                        id="personal-mobile"></div>
                                            </div>
                                            <div class="col-md-6 form-group form-horizontal">
                                                <label class="control-label">বিকল্প মোবাইল নম্বর </label>
                                                <div class="input text"><input type="text" name="alternative_mobile"
                                                                               class="form-control"
                                                                               placeholder="বিকল্প মোবাইল "
                                                                               id="alternative-mobile"></div>
                                            </div>
                                        </div>

                                        <h3 class="form-section">পেশাগত তথ্য </h3>
                                        <!-- Type Selection Div START-->
                                        <!-- Type Selection Div END-->
                                        <div class="form-group">
                                            <div class="radio-list">
                                                <label class="radio-inline">
                                                    <div class="radio" id="uniform-cadre"><span class="checked"><div
                                                            class="radio" id="uniform-cadre"><span
                                                            class="checked"><input type="radio" class="cadre_type"
                                                                                   name="is_cadre" id="cadre" value="1"
                                                                                   checked=""></span></div></span></div>
                                                    ক্যাডার </label>
                                                <label class="radio-inline">
                                                    <div class="radio" id="uniform-non_cadre"><span><div class="radio"
                                                                                                         id="uniform-non_cadre"><span
                                                            class=""><input type="radio" class="cadre_type"
                                                                            name="is_cadre" id="non_cadre"
                                                                            value="2"></span></div></span></div>
                                                    নন ক্যাডার </label>
                                                <label class="radio-inline">
                                                    <div class="radio" id="uniform-montri"><span><div class="radio"
                                                                                                      id="uniform-montri"><span
                                                            class=""><input type="radio" class="cadre_type"
                                                                            name="is_cadre" id="montri"
                                                                            value="7"></span></div></span></div>
                                                    জনপ্রতিনিধি </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <!-- CADRE DIV START-->
                                        <div id="cadre_div" style="display: block;">
                                            <div class="row">

                                                <div class="col-md-4 form-group form-horizontal">
                                                    <label class="control-label">ক্যাডার নম্বর</label>


                                                    <select name="employee_cadre_id"
                                                            class="form-control "
                                                            id="employee-cadre-id">
                                                        <option value="0">--বাছাই করুন--</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                        <option value="13">13</option>
                                                        <option value="14">14</option>
                                                        <option value="15">15</option>
                                                        <option value="16">16</option>
                                                        <option value="17">17</option>
                                                        <option value="18">18</option>
                                                        <option value="19">19</option>
                                                        <option value="20">20</option>
                                                        <option value="21">21</option>
                                                        <option value="22">22</option>
                                                        <option value="23">23</option>
                                                        <option value="24">24</option>
                                                        <option value="25">25</option>
                                                        <option value="26">26</option>
                                                        <option value="27">27</option>
                                                        <option value="28">28</option>
                                                        <option value="29">29</option>
                                                        <option value="30">30</option>
                                                    </select>

                                                </div>
                                                <div class="col-md-4 form-group form-horizontal">
                                                    <label class="control-label">ব্যাচ নম্বর </label>
                                                    <select name="employee_batch_id"
                                                            class="form-control "
                                                            id="employee-batch-id">
                                                        <option value="0">--বাছাই করুন--</option>
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                        <option value="3">3</option>
                                                        <option value="4">4</option>
                                                        <option value="5">5</option>
                                                        <option value="6">6</option>
                                                        <option value="7">7</option>
                                                        <option value="8">8</option>
                                                        <option value="9">9</option>
                                                        <option value="10">10</option>
                                                        <option value="11">11</option>
                                                        <option value="12">12</option>
                                                        <option value="13">13</option>
                                                        <option value="14">14</option>
                                                        <option value="15">15</option>
                                                        <option value="16">16</option>
                                                        <option value="17">17</option>
                                                        <option value="18">18</option>
                                                        <option value="19">19</option>
                                                        <option value="20">20</option>
                                                        <option value="21">21</option>
                                                        <option value="22">22</option>
                                                        <option value="23">23</option>
                                                        <option value="24">24</option>
                                                        <option value="25">25</option>
                                                        <option value="26">26</option>
                                                        <option value="27">27</option>
                                                        <option value="28">28</option>
                                                        <option value="29">29</option>
                                                        <option value="30">30</option>
                                                        <option value="31">31</option>
                                                        <option value="32">32</option>
                                                        <option value="33">33</option>
                                                        <option value="34">34</option>
                                                        <option value="35">35</option>
                                                        <option value="36">36</option>
                                                        <option value="37">37</option>
                                                        <option value="38">38</option>
                                                        <option value="39">39</option>
                                                        <option value="40">40</option>
                                                        <option value="41">41</option>
                                                        <option value="42">42</option>
                                                        <option value="43">43</option>
                                                        <option value="44">44</option>
                                                        <option value="45">45</option>
                                                        <option value="46">46</option>
                                                        <option value="47">47</option>
                                                        <option value="48">48</option>
                                                        <option value="49">49</option>
                                                        <option value="50">50</option>
                                                        <option value="51">51</option>
                                                        <option value="52">52</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-4 form-group form-inline">
                                                    <label class="control-label">পরিচিতি নম্বর</label>
                                                    <div class="input checkbox"><input type="hidden"
                                                                                       name="no_service_id" value="0">
                                                        <div class="checker" id="uniform-no-service-id"><span
                                                                class="checked"><input type="checkbox"
                                                                                       name="no_service_id" value="1"
                                                                                       checked="checked"
                                                                                       id="no-service-id"></span></div>
                                                    </div>
                                                    <div class="input text"><input type="text" name="identity_no"
                                                                                   class="form-control"
                                                                                   placeholder="পরিচিতি নম্বর"
                                                                                   id="identity-no"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- CADRE DIV END-->

                                        <!-- NON CADRE DIV START-->
                                        <div style="display: none;" id="non_cadre_div">
                                            <div class="row">
                                                <div class="col-md-6 form-group form-horizontal">
                                                    <label class="control-label">নিয়োগ পত্রের স্মারক নম্বর </label>
                                                    <div class="input text"><input type="text"
                                                                                   name="appointment_memo_no"
                                                                                   class="form-control"
                                                                                   placeholder="নিয়োগ পত্রের স্মারক নম্বর "
                                                                                   id="appointment-memo-no"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-3 form-group form-horizontal">
                                                <label class="control-label">যোগদানের তারিখ <span
                                                        class="text-danger">*</span></label>
                                                <%--<div class="input text">--%>
                                                <input  type="text" name="joining_date"
                                                        class="form-control "
                                                        placeholder="যোগদানের তারিখ"
                                                        id="joining_date">
                                                <%--</div>--%>
                                            </div>

                                        </div>
                                        <div class="row">

                                            <%--<!-- NON CADRE DIV END-->--%>
                                            <script type="text/javascript">
                                                $(".cadre_type").click(function () {
                                                    if ($(this).val() == "1") {
                                                        $("#cadre_div").show('slow');
                                                        $("#non_cadre_div").hide('slow');
                                                    }
                                                    else {
                                                        $("#cadre_div").hide('slow');
                                                        $("#non_cadre_div").show('slow');
                                                    }
                                                });
                                                $("#no-service-id").click(function () {
                                                    if (this.checked == true) {
                                                        $('#identity-no').removeAttr('disabled');
                                                    }
                                                    else {
                                                        $('#identity-no').attr('disabled', 'disabled');
                                                    }
                                                });
                                            </script>

                                        </div>

                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-4 col-md-9">
                                                    <button type="submit" class="btn btn-circle blue">সংরক্ষণ</button>
                                                    <button type="reset" class="btn btn-circle default" onclick = "location.href='<%=request.getContextPath()%>/empshow?menuid=${menuid}'">বাতিল</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            <%--</div>--%>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

                <input type="hidden" id="menuid" value="${menuid}">
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


<script >

    var FormValidation = function () {
        var e = function () {
                var e = $("#target"),
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

                        personal_mobile: {
                            required: !0,
                            number: !0,
                            minlength: 11,
                            maxlength: 13
                        },
                        alternative_mobile: {
                            number: !0,
                            minlength: 11,
                            maxlength: 13
                        },
                        nid: {
                            required: !0,
                            number: !0,
                            minlength: 17,
                            maxlength: 17,
                        },
                        personal_email: {
                            required: !0,
                            email: !0,


                        },
                        birth_date:{
                            required: !0,
                            date: !0,
                        },
                        joining_date: {
                            required: !0,
                            date: !0,
                        },
                        select: {required: !0},
                        select_multi: {
                            required: !0, minlength: 1,
                            maxlength: 3
                        },

                        name_bng:{
                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedBngname: true,

                        },

                        name_eng:{

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedEngname: true,

                        },
                        father_name_bng:{

                            minlength: 3,
                            maxlength: 100,
                            checkSpacedBngname: true,

                        },

                        father_name_eng:{
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedEngname: true,

                        },
                        mother_name_bng:{

                            minlength: 3,
                            maxlength: 100,
                            checkSpacedBngname: true,

                        },

                        mother_name_eng:{
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedEngname: true,

                        },
                        identity_no:{
                            required: $(".cadre_type").val()==1,

                            maxlength: 10,


                        },



                    }, messages: {

                        name_bng: {
                            required: "বাংলায় নাম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        personal_mobile:{
                            required: "ইংরেজিতে মোবাইল নং দিন",
                            number:"নম্বর ইংরেজিতে দিন",
                            minlength: "কমপক্ষে ১১ টি অংক দিন",
                            maxlength: "১৩ টি অংকের কম দিন"
                        },
                        alternative_mobile:{

                            number:"নম্বর ইংরেজিতে দিন",
                            minlength: "কমপক্ষে ১১ টি অংক দিন",
                            maxlength: "১৩ টি অংকের কম দিন"
                        },
                        nid:{
                            required: "ইংরেজিতে NID দিন",
                            number:"নম্বর ইংরেজিতে দিন",
                            minlength: "১৭ অংকের জাতীয় পরিচয়পত্র নম্বর দিন। প্রথম চার অংক জন্মসন ।",
                            maxlength: "জাতীয় পরিচয়পত্র নম্বর ১৭ অংকের",
                        },
                        personal_email: {
                            required: "ইংরেজিতে ইমেইল দিন",
                            email: "সঠিক ইমেইল দিন"

                        },
                        name_eng: {
                            required: "ইংরেজিতে  নাম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        father_name_bng: {

                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        father_name_eng: {

                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        mother_name_bng: {

                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        mother_name_eng: {

                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        birth_date: {
                            required: "সঠিক ডেট দিন",
                            date: "গ্রহণযোগ্য নয়",
                        },
                        joining_date: {
                            required: " সঠিক ডেট দিন",
                             date: "গ্রহণযোগ্য নয়",
                        },
                        identity_no:{
                            required: " পরিচিতি নম্বর দিন ",

                            maxlength: "১০ টি অক্ষর এর কম দিন",


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
        $.validator.addMethod('checkEngname', function (value, element) {
            return this.optional(element) || (/^[a-zA-Z]*$/.test(value));

        }, " No space or Number or  Special Charecter or  Bangla  character is allowed");

        $.validator.addMethod('checkBngname', function (value, element) {
            return this.optional(element) || (!/\s/g.test(value) && !/[^\u0980-\u09ff]/.test(value));

        }, " No space or Number or  No  Special Charecter or  English character is allowed");


        $.validator.addMethod('checkSpacedEngname', function (value, element) {
            return this.optional(element) || (/^[a-zA-Z0-9,.;?;\s]*$/.test(value));


        }, "বাংলা অক্ষর গ্রহণযোগ্য নয়। ");


        $.validator.addMethod('checkSpacedBngname', function (value, element) {
            return this.optional(element) || (!/[^\u0980-\u09ff0-9,.;?!/\s]/.test(value));

        }, " ইংরেজি অক্ষর গ্রহণযোগ্য নয়।");


        return {
            init: function () {
                t(), e()
            }
        }
    }();

    jQuery(document).ready(function () {
        FormValidation.init();


        // $(document).on("submit", "form", function(e){
        //     e.preventDefault();
        //     alert('it works!');
        //     return  false;
        // });

        // $( "form" ).submit(function( event ) {
        //     //alert( "Handler for .submit() called." );
        //
        //     if ($(".cadre_type").val()==1 && $("#identity-no").val()=="") {
        //         toastr.error("পরিচিতি নম্বর দিন");
        //         //$('#target').submit(false);
        //         event.preventDefault(event);
        //         //return false;
        //     }
        //
        // });

        // if ($(".cadre_type").val()==1 && $("#identity-no").val()=="") {
        //     toastr.error("পরিচিতি নম্বর দিন");
        //     return false;
        // }


    });

    $(function () {
        //   OfficeSetup.init();
        $('#date-of-birth,#joining_date').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: "yy-mm-dd",
            yearRange: "-90:+00"

            });

    });

</script>
</body>


</html>