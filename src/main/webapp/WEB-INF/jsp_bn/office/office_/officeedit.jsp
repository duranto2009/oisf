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
            <div class="card">


                <div id="basicform">
                    <div class="portlet box purple">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-pencil"></i>দপ্তরের তথ্য
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div id="tree_panel">
                                <form method="post" id="officeform" action="#"  role="form" novalidate="novalidate">
                                    <input type="hidden" name="locationtype" id="locationtype" value="1">
                                    <input type="hidden" name="office_ministry_id" id="office_id" value="${office.id}">
                                    <input type="hidden" name="office_ministry_id" id="office_ministry_id" value="${office.officeMinistryId}">
                                    <input type="hidden" name="office_layer_id" id="office_layer_id" value="${office.officeLayerId}">
                                    <input type="hidden" name="office_origin_id" id="office_origin_id" value="${office.officeOriginId}">
                                    <input type="hidden" name="office_origin_id" id="parent_office_id" value="${office.parentOfficeId}">
                                    <div class="form-body">

                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            You have some form errors. Please check below.
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            Your form validation is successful!
                                        </div>

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
                                                                               class="form-control"
                                                                               placeholder="ফ্যাক্স"
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
                                                <label class="control-label">অফিস ওয়েবসাইট</label>
                                                <div class="input text"><input type="text" name="office_web"
                                                                               class="form-control"
                                                                               placeholder="অফিস ওয়েবসাইট"
                                                                               id="office-web">
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
                                                                               placeholder="রেফারেন্স কোড"
                                                                               id="ref-code">
                                                </div>
                                            </div>
                                            <div class="col-md-6 form-group form-horizontal">
                                                <label class="control-label">অফিস কোড</label>
                                                <div class="input text"><input type="text" name="office_code"
                                                                               class="form-control"
                                                                               placeholder="অফিস কোড"
                                                                               id="office-code"></div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <h3 class="form-section" style="margin:0px;padding: 0px 15px;"> লোকেশন
                                                তথ্য</h3>
                                            <div style="padding: 15px;">
                                                <ul class="nav nav-tabs" id="tabpart">
                                                    <li class="active"><a data-toggle="tab" href="#insidecountry"
                                                                          data-val="0">দেশের
                                                        মধ্যে</a></li>
                                                    <li><a data-toggle="tab" href="#outsidecountry" data-val="1">দেশের
                                                        বাইরে</a></li>

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
                                                                                <option value="0">-- Please Select --
                                                                                </option>
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
                                                                                <option value="-1">-- Please Select --
                                                                                </option>
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
                                                                                <option value="-1">-- Please Select --
                                                                                </option>

                                                                            </select>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--/span-->
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3"> পোস্ট
                                                                            অফিস</label>
                                                                        <div class="col-md-9">
                                                                            <select id="postofficedropdown"
                                                                                    name="postid"
                                                                                    class="form-control">
                                                                                <option value="-1">-- Please Select --
                                                                                </option>

                                                                            </select>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--/span-->
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3">জেলার
                                                                            বিভক্তির ধরন</label>

                                                                        <label class="radio-inline">
                                                                            <input type="radio" name="upacityradio"
                                                                                   value="0">উপজেলা
                                                                        </label>
                                                                        <label class="radio-inline">
                                                                            <input type="radio" name="upacityradio"
                                                                                   value="1">সিটি কর্পোরেশন
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group" id="upacitygroup">

                                                                        <div id="upazillaselectdiv"
                                                                             style="display: none;">
                                                                            <div class="form-group">


                                                                                <label class="control-label col-md-3">উপাজেলা </label>
                                                                                <div class="col-md-9">


                                                                                    <select id="upaziladropdown"
                                                                                            name="upazilaid"
                                                                                            class="form-control">
                                                                                        <option value="-1">-- Please
                                                                                            Select --
                                                                                        </option>

                                                                                    </select>

                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div id="cityselectdiv" style="display: none;">
                                                                            <div class="form-group">


                                                                                <label class="control-label col-md-3">সিটি
                                                                                    কর্পোরেশন
                                                                                </label>
                                                                                <div class="col-md-9">


                                                                                    <select id="citydropdown"
                                                                                            name="cityid"
                                                                                            class="form-control">
                                                                                        <option value="-1">-- Please
                                                                                            Select --
                                                                                        </option>

                                                                                    </select>

                                                                                </div>
                                                                            </div>
                                                                        </div>


                                                                    </div>

                                                                </div>
                                                            </div>

                                                            <div class="row" id="muniuniselectiondiv"
                                                                 style="display: none;">
                                                                <div class="col-md-6">
                                                                    <div class="form-group">
                                                                        <label class="control-label col-md-3">উপাজেলা
                                                                            বিভক্তির ধরন</label>

                                                                        <label class="radio-inline">
                                                                            <input type="radio" name="unimuniradio"
                                                                                   value="0">ইউনিয়ন
                                                                        </label>
                                                                        <label class="radio-inline">
                                                                            <input type="radio" name="unimuniradio"
                                                                                   value="1">পৌরসভা
                                                                        </label>

                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group" id="unimunigroup">

                                                                        <div id="uniselectdiv" style="display: none;">
                                                                            <div class="form-group">


                                                                                <label class="control-label col-md-3">ইউনিয়ন </label>
                                                                                <div class="col-md-9">


                                                                                    <select id="uniondropdown"
                                                                                            name="unionid"
                                                                                            class="form-control">
                                                                                        <option value="-1">-- Please
                                                                                            Select --
                                                                                        </option>

                                                                                    </select>

                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div id="muniselectdiv" style="display: none;">
                                                                            <div class="form-group">


                                                                                <label class="control-label col-md-3">পৌরসভা
                                                                                </label>
                                                                                <div class="col-md-9">


                                                                                    <select id="municipalitydropdown"
                                                                                            name="municipalityid"
                                                                                            class="form-control">
                                                                                        <option value="-1">-- Please
                                                                                            Select --
                                                                                        </option>

                                                                                    </select>

                                                                                </div>
                                                                            </div>
                                                                        </div>


                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <div class="row" id="addressnumdiv">
                                                                <div class="col-md-6" id="warddiv"
                                                                     style="display: none;">
                                                                    <label class="control-label">ওয়ার্ড নং</label>
                                                                    <div class="input text">
                                                                        <select id="wordno"
                                                                                name="wordno"
                                                                                class="form-control">
                                                                            <option value="-1">-- Please Select --
                                                                            </option>

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6" id="addressdiv"
                                                                     style="display: none;">
                                                                    <label class="control-label">ঠিকানা</label>
                                                                    <div class="input text"><input type="text"
                                                                                                   name="address"
                                                                                                   class="form-control"
                                                                                                   placeholder="ঠিকানা"
                                                                                                   id="address"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="outsidecountry" class="tab-pane fade">
                                                        <div class="row">
                                                            <div class="col-md-6">

                                                                <div class="form-group">


                                                                    <label class="control-label col-md-3">Country
                                                                        Name </label>
                                                                    <div class="col-md-9">


                                                                        <select id="countryname"
                                                                                name="countryname"
                                                                                class="form-control">
                                                                            <option value="0">-- Please Select --
                                                                            </option>
                                                                            <option value="1"> Afghanistan</option>
                                                                            <option value="2"> Albania</option>
                                                                            <option value="3"> Algeria</option>
                                                                            <option value="4"> American Samoa</option>
                                                                            <option value="5"> Andorra</option>
                                                                            <option value="6"> Angola</option>
                                                                            <option value="7"> Anguilla</option>
                                                                            <option value="8"> Antarctica</option>
                                                                            <option value="9"> Antigua and Barbuda
                                                                            </option>
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
                                                                            <option value="27"> Bosnia and Herzegovina
                                                                            </option>
                                                                            <option value="28"> Botswana</option>
                                                                            <option value="29"> Brazil</option>
                                                                            <option value="30"> British Indian Ocean
                                                                                Territory
                                                                            </option>
                                                                            <option value="31"> British Virgin Islands
                                                                            </option>
                                                                            <option value="32"> Brunei</option>
                                                                            <option value="33"> Bulgaria</option>
                                                                            <option value="34"> Burkina Faso</option>
                                                                            <option value="35"> Burundi</option>
                                                                            <option value="36"> Cambodia</option>
                                                                            <option value="37"> Cameroon</option>
                                                                            <option value="38"> Canada</option>
                                                                            <option value="39"> Cape Verde</option>
                                                                            <option value="40"> Cayman Islands</option>
                                                                            <option value="41"> Central African
                                                                                Republic
                                                                            </option>
                                                                            <option value="42"> Chad</option>
                                                                            <option value="43"> Chile</option>
                                                                            <option value="44"> China</option>
                                                                            <option value="45"> Christmas Island
                                                                            </option>
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
                                                                            <option value="56"> Democratic Republic of
                                                                                the Congo
                                                                            </option>
                                                                            <option value="57"> Denmark</option>
                                                                            <option value="58"> Djibouti</option>
                                                                            <option value="59"> Dominica</option>
                                                                            <option value="60"> Dominican Republic
                                                                            </option>
                                                                            <option value="61"> East Timor</option>
                                                                            <option value="62"> Ecuador</option>
                                                                            <option value="63"> Egypt</option>
                                                                            <option value="64"> El Salvador</option>
                                                                            <option value="65"> Equatorial Guinea
                                                                            </option>
                                                                            <option value="66"> Eritrea</option>
                                                                            <option value="67"> Estonia</option>
                                                                            <option value="68"> Ethiopia</option>
                                                                            <option value="69"> Falkland Islands
                                                                            </option>
                                                                            <option value="70"> Faroe Islands</option>
                                                                            <option value="71"> Fiji</option>
                                                                            <option value="72"> Finland</option>
                                                                            <option value="73"> France</option>
                                                                            <option value="74"> French Polynesia
                                                                            </option>
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
                                                                            <option value="131"> Marshall Islands
                                                                            </option>
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
                                                                            <option value="149"> Netherlands Antilles
                                                                            </option>
                                                                            <option value="150"> New Caledonia</option>
                                                                            <option value="151"> New Zealand</option>
                                                                            <option value="152"> Nicaragua</option>
                                                                            <option value="153"> Niger</option>
                                                                            <option value="154"> Nigeria</option>
                                                                            <option value="155"> Niue</option>
                                                                            <option value="156"> North Korea</option>
                                                                            <option value="157"> Northern Mariana
                                                                                Islands
                                                                            </option>
                                                                            <option value="158"> Norway</option>
                                                                            <option value="159"> Oman</option>
                                                                            <option value="160"> Pakistan</option>
                                                                            <option value="161"> Palau</option>
                                                                            <option value="162"> Palestine</option>
                                                                            <option value="163"> Panama</option>
                                                                            <option value="164"> Papua New Guinea
                                                                            </option>
                                                                            <option value="165"> Paraguay</option>
                                                                            <option value="166"> Peru</option>
                                                                            <option value="167"> Philippines</option>
                                                                            <option value="168"> Pitcairn</option>
                                                                            <option value="169"> Poland</option>
                                                                            <option value="170"> Portugal</option>
                                                                            <option value="171"> Puerto Rico</option>
                                                                            <option value="172"> Qatar</option>
                                                                            <option value="173"> Republic of the Congo
                                                                            </option>
                                                                            <option value="174"> Reunion</option>
                                                                            <option value="175"> Romania</option>
                                                                            <option value="176"> Russia</option>
                                                                            <option value="177"> Rwanda</option>
                                                                            <option value="178"> Saint Barthelemy
                                                                            </option>
                                                                            <option value="179"> Saint Helena</option>
                                                                            <option value="180"> Saint Kitts and Nevis
                                                                            </option>
                                                                            <option value="181"> Saint Lucia</option>
                                                                            <option value="182"> Saint Martin</option>
                                                                            <option value="183"> Saint Pierre and
                                                                                Miquelon
                                                                            </option>
                                                                            <option value="184"> Saint Vincent and the
                                                                                Grenadines
                                                                            </option>
                                                                            <option value="185"> Samoa</option>
                                                                            <option value="186"> San Marino</option>
                                                                            <option value="187"> Sao Tome and Principe
                                                                            </option>
                                                                            <option value="188"> Saudi Arabia</option>
                                                                            <option value="189"> Senegal</option>
                                                                            <option value="190"> Serbia</option>
                                                                            <option value="191"> Seychelles</option>
                                                                            <option value="192"> Sierra Leone</option>
                                                                            <option value="193"> Singapore</option>
                                                                            <option value="194"> Sint Maarten</option>
                                                                            <option value="195"> Slovakia</option>
                                                                            <option value="196"> Slovenia</option>
                                                                            <option value="197"> Solomon Islands
                                                                            </option>
                                                                            <option value="198"> Somalia</option>
                                                                            <option value="199"> South Africa</option>
                                                                            <option value="200"> South Korea</option>
                                                                            <option value="201"> South Sudan</option>
                                                                            <option value="202"> Spain</option>
                                                                            <option value="203"> Sri Lanka</option>
                                                                            <option value="204"> Sudan</option>
                                                                            <option value="205"> Suriname</option>
                                                                            <option value="206"> Svalbard and Jan
                                                                                Mayen
                                                                            </option>
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
                                                                            <option value="218"> Trinidad and Tobago
                                                                            </option>
                                                                            <option value="219"> Tunisia</option>
                                                                            <option value="220"> Turkey</option>
                                                                            <option value="221"> Turkmenistan</option>
                                                                            <option value="222"> Turks and Caicos
                                                                                Islands
                                                                            </option>
                                                                            <option value="223"> Tuvalu</option>
                                                                            <option value="224"> U.S. Virgin Islands
                                                                            </option>
                                                                            <option value="225"> Uganda</option>
                                                                            <option value="226"> Ukraine</option>
                                                                            <option value="227"> United Arab Emirates
                                                                            </option>
                                                                            <option value="228"> United Kingdom</option>
                                                                            <option value="229"> United States</option>
                                                                            <option value="230"> Uruguay</option>
                                                                            <option value="231"> Uzbekistan</option>
                                                                            <option value="232"> Vanuatu</option>
                                                                            <option value="233"> Vatican</option>
                                                                            <option value="234"> Venezuela</option>
                                                                            <option value="235"> Vietnam</option>
                                                                            <option value="236"> Wallis and Futuna
                                                                            </option>
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


                                                                    <label class="control-label col-md-3">Detail
                                                                        Address </label><br/>
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

                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-4 col-md-9">
                                                    <button type="submit"
                                                            class="btn btn-primary">
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

            </div>


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

<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/common/validation-office.js" type="text/javascript"></script>


<script>
    var originofficelist = [];
    var officelist = [];
    var addedit = -1;
    var templateselected = -1;
    var officeselected = -1;
    var divisionstorage = [];
    var districtstorage = [];
    var upazillastorage = [];
    var unionstorage = [];
    var municipalitystorage = [];
    var citycorpoarationstorage = [];
    var citywordstorage = [];
    var muniwardstorage = [];
    var thanastorage = [];
    var poststorage = [];
    var activetab = 0, radio1, radio2;

    var selectlist = ['#divisiondropdown',//0
        ' #districtdropdown',//1
        ' #thanadropdown',//2
        ' #postofficedropdown',//3
        ' #upaziladropdown',//4
        ' #uniondropdown',//5
        ' #municipalitydropdown',//6
        ' #wordno',//7
        ' #citydropdown',//8
        ' #countryname'//9

    ];
    var ctree = {
        "name": "decisionnode",
        "decisionnode": 1,
        "child": [{
            "name": "div",
            "decisionnode": 0,
            "child": [{
                "name": "dis",
                "decisionnode": 0,
                "child": [{
                    "name": "thana",
                    "decisionnode": 0,
                    "child": [],
                    "decisionvalue": -1,
                    "index": 2
                },
                    {
                        "name": "postoffice",
                        "decisionnode": 0,
                        "child": [],
                        "decisionvalue": -1,
                        "index": 3
                    },
                    {
                        "name": "decisionnode",
                        "decisionnode": 1,
                        "child": [{
                            "name": "upazila",
                            "decisionnode": 0,
                            "child": [{
                                "name": "decisionnode",
                                "decisionnode": 1,
                                "child": [{
                                    "name": "union",
                                    "decisionnode": 0,
                                    "child": [],
                                    "decisionvalue": -1,
                                    "index": 5
                                }, {
                                    "name": "municipality",
                                    "decisionnode": 0,
                                    "child": [{
                                        "name": "word",
                                        "decisionnode": 0,
                                        "child": [],
                                        "decisionvalue": -1,
                                        "index": 7
                                    }],
                                    "decisionvalue": -1,
                                    "index": 6
                                }],
                                "decisionvalue": "",
                                "index": -1
                            }],
                            "decisionvalue": -1,
                            "index": 4
                        },
                            {
                                "name": "citycorporation",
                                "decisionnode": 0,
                                "child": [{
                                    "name": "word",
                                    "decisionnode": 0,
                                    "child": [],
                                    "decisionvalue": -1,
                                    "index": 7
                                }],
                                "decisionvalue": -1,
                                "index": 8
                            }
                        ],
                        "decisionvalue": "",
                        "index": -1
                    }
                ],
                "decisionvalue": -1,
                "index": 1
            }],
            "decisionvalue": -1,
            "index": 0
        }, {
            "name": "'country",
            "decisionnode": 0,
            "child": [],
            "decisionvalue": -1,
            "index": 9
        }],
        "decisionvalue": "",
        "index": -1
    };
    var aftersetdata;
    var activeflag = 0;


    function arraygenerator(afterhwho, content) {
        var array = [];
        if (content.decisionnode == 1) {
            if (content.decisionvalue == 0) array.push.apply(array, arraygenerator(afterhwho, content.child[0]));
            else if (content.decisionvalue == 1) array.push.apply(array, arraygenerator(afterhwho, content.child[1]));
        }
        else {

            if (content.index == afterhwho) activeflag = 1;
            if (activeflag == 1) array.push(content.index);
            var childlist = content.child;
            for (var i = 0; i < childlist.length; i++) {
                array.push.apply(array, arraygenerator(afterhwho, content.child[i]));
            }
            if (content.index == afterhwho) activeflag = 0;
        }
        return array;


    }

    function cleartree(who, whichtab) {
        ctree.decisionvalue = whichtab;
        ctree.child["0"].child["0"].child[2].decisionvalue = radio1;
        ctree.child["0"].child["0"].child[2].child["0"].child["0"].decisionvalue = radio2;
        var list = arraygenerator(who, ctree);
        console.log(list);
        for (var i = 0; i < list.length; i++) {
            if (list[i] == who) {
                if (activetab == 1 && who == 0) {
                    $(selectlist[list[i]] + '>option[value="0"]').prop('selected', true);
                }
                else if (activetab == 0 && who == 9) {
                    $(selectlist[list[i]] + '>option[value="0"]').prop('selected', true);
                }
            }
            else if (list[i] == 0) {
                $(selectlist[list[i]] + '>option[value="0"]').prop('selected', true);
            }
            else if (list[i] == 9) {
                $(selectlist[list[i]] + '>option[value="0"]').prop('selected', true);
            }

            else {
                $(selectlist[list[i]]).empty();
                $(selectlist[list[i]]).append(
                    $('<option></option>').val('-1').html('--Please Select--')
                );
            }

        }


    }

    function bringdata_(url, id, callback) {
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
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "positionClass": "toast-bottom-right"
                };
                toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ");
            }
        });
    }

    function bringdata(url, callback) {
        $.ajax({
            type: "GET",
            url: url,
            async: false,
            success: function (response) {
                callback(response);
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


    function setdata(select, data, propname) {
        select.empty();
        select.append($('<option></option>').val(0).html('--Please Select--'));
        $.each(data, function (index, value) {
            select.append(
                $('<option></option>').val(value['id']).html(value[propname])
            );
        });

        console.log($("#basicform " + aftersetdata.selector));

        $("#basicform " + aftersetdata.selector).prop('selected', true);
        aftersetdata = '';

    }

    function filldiv() {
        var $div = $('#divisiondropdown');
        var div = divisionstorage['#_'];
        if (div == undefined) {
            bringdata("divisiondata", function (data) {
                if (data.length != 0) divisionstorage['#_'] = data;
                setdata($div, data, 'divisionNameBng');

            });
        }
        else {
            setdata($div, divisionstorage['#_'], 'divisionNameBng');
        }
        $div.on('change', function (event) {
            cleartree(0, 0);
            hide();
            filldis($(this).val());

        });
    }

    function filldis(id) {
        var $dis = $('#districtdropdown');
        var dis = districtstorage['#_' + id];
        if (dis == undefined) {
            bringdata_("/districtlistbydiv", id, function (data) {
                if (data.length != 0) districtstorage['#_' + id] = data;
                setdata($dis, data, 'districtNameBng');

            });
        }
        else {
            setdata($dis, districtstorage['#_' + id], 'districtNameBng');
        }
        $dis.on('change', function (event) {
            var id = $(this).val();
            cleartree(1, 0);
            hide();
            filltha(id);
            fillpost(id);

        });
    }

    function fillupa(id) {
        var $upa = $('#upaziladropdown');
        var upa = upazillastorage['#_' + id];
        if (upa == undefined) {
            bringdata_("/upazillalistbydistrictid", id, function (data) {
                if (data.length != 0) upazillastorage['#_' + id] = data;
                setdata($upa, data, 'upazillaNameBng');

            });
        }
        else {
            setdata($upa, upazillastorage['#_' + id], 'upazillaNameBng');
        }
        $upa.on('change', function () {
            cleartree(4, 0);
            $selectedpart = $("#office_tree_expand_view");
            uncheckradiobutton($("input[name='unimuniradio']:radio", $selectedpart));
            radio2 = undefined;

            $('#muniselectdiv').hide();
            $('#uniselectdiv').hide();
            $('#warddiv').hide();
            $('#addressdiv').hide();

        });

    }

    function filluni(id) {
        var $uni = $('#uniondropdown');
        var uni = unionstorage['#_' + id];
        if (uni == undefined) {
            bringdata_("/getunionlistbyupazillaid", id, function (data) {
                if (data.length != 0) unionstorage['#_' + id] = data;
                setdata($uni, data, 'unionNameBng');

            });
        }
        else {
            setdata($uni, unionstorage['#_' + id], 'unionNameBng');
        }
    }

    function filltha(id) {
        var $tha = $(' #thanadropdown');
        var tha = thanastorage['#_' + id];
        if (tha == undefined) {
            bringdata_("/thanalistbydistrictid", id, function (data) {
                if (data.length != 0) thanastorage['#_' + id] = data;
                setdata($tha, data, 'thanaNameBng');

            });
        }
        else {
            setdata($tha, thanastorage['#_' + id], 'thanaNameBng');
        }
    }

    function fillpost(id) {
        var $post = $(' #postofficedropdown');
        var post = poststorage['#_' + id];
        if (post == undefined) {
            bringdata_("/postofficebydis", id, function (data) {
                if (data.length != 0) poststorage['#_' + id] = data;
                setdata($post, data, 'postOfficeNameBng');

            });
        }
        else {
            setdata($post, poststorage['#_' + id], 'postOfficeNameBng');
        }
    }

    function fillmuni(id) {
        var $muni = $(' #municipalitydropdown');
        var muni = municipalitystorage['#_' + id];
        if (muni == undefined) {
            bringdata_("/municipalitylistbyupazillaid", id, function (data) {
                if (data.length != 0) municipalitystorage['#_' + id] = data;
                setdata($muni, data, 'municipalityNameBng');

            });
        }
        else {
            setdata($muni, municipalitystorage['#_' + id], 'municipalityNameBng');
        }

        $muni.on('change', function (event) {
            var id = $(this).val();
            cleartree(6, 0);
            fillmuniward(id);
        });
    }

    function fillmuniward(id) {
        var $ward = $('#wordno');
        var ward = muniwardstorage['#_' + id];
        if (ward == undefined) {
            bringdata_("/municipalitywardlistbymunicipalityid", id, function (data) {
                if (data.length != 0) muniwardstorage['#_' + id] = data;
                setdata($ward, data, 'wardNameBng');

            });
        }
        else {
            setdata($ward, muniwardstorage['#_' + id], 'wardNameBng');
        }

    }

    function fillcityward(id) {
        var $ward = $('#wordno');

        var ward = citywordstorage['#_' + id];
        if (ward == undefined) {
            bringdata_("wardlistbyid", id, function (data) {
                if (data.length != 0) citywordstorage['#_' + id] = data;
                setdata($ward, data, 'nameBng');

            });
        }
        else {
            setdata($ward, citywordstorage['#_' + id], 'nameBng');
        }
    }

    function fillcity(id) {
        var $city = $('#citydropdown');

        var city = citycorpoarationstorage['#_' + id];
        if (city == undefined) {
            bringdata_("/citycorporationlistbydis", id, function (data) {
                if (data.length != 0) citycorpoarationstorage['#_' + id] = data;
                setdata($city, data, 'nameBng');

            });
        }
        else {
            setdata($city, citycorpoarationstorage['#_' + id], 'nameBng');
        }
        $city.on('change', function (event) {
            var id = $(this).val();
            cleartree(8, 0);
            fillcityward(id);
        });
    }


    function uncheckradiobutton($radio) {
        $radio.prop('checked', false);
    }

    function clearlocal(list) {
        $('#address').val("");
        uncheckradiobutton($("input[name='unimuniradio']:radio"));
        uncheckradiobutton($("input[name='upacityradio']:radio"));

    }

    function clearglobal(list) {
        $('#detailaddress').val("");
    }


    function setlocationasEditInfo(office) {

        var $domain = $('#basicform');
        aftersetdata = {'selector': '#divisiondropdown>option[value="' + office.geoDivisionId + '"]'};
        filldiv();
        aftersetdata = {'selector': '#districtdropdown>option[value="' + office.geoDistrictId + '"]'};
        filldis(office.geoDivisionId);
        aftersetdata = {'selector': '#thanadropdown>option[value="' + office.geoThanaId + '"]'};
        filltha(office.geoDistrictId);
        aftersetdata = {'selector': '#postofficedropdown>option[value="' + office.geoPostOfficeId + '"]'};
        fillpost(office.geoDistrictId);

        if (office.countryId > 0) {//outside country
            $('#tabpart > li:nth-child(1)', $domain).removeClass('active');
            $('#tabpart > li:nth-child(2)', $domain).addClass('active');
            $('#insidecountry', $domain).removeClass('active in');
            $('#outsidecountry', $domain).addClass('active in');
            activetab = 1;

            radio2 = undefined;
            radio1 = undefined;


            $('#upazillaselectdiv').hide();
            $('#muniselectdiv').hide();
            $('#uniselectdiv').hide();
            $('#muniuniselectiondiv').hide();
            $('#addressdiv').hide();

            $('#countryname>option[value="' + office.countryId + '"]', $domain).prop('selected', true);
            $('input[name=detailaddress]', $domain).val(office.officeAddress);
        } else {//inside country
            activetab = 0;
            $('#tabpart > li:nth-child(2)', $domain).removeClass('active');
            $('#tabpart > li:nth-child(1)', $domain).addClass('active');
            $('#outsidecountry', $domain).removeClass('active in');
            $('#insidecountry', $domain).addClass('active in');
            $(' #tabpart > li:nth-child(1)').addClass('active');
            if (office.geoCityCorporationId > 0) {//city
                aftersetdata = {'selector': '#citydropdown>option[value="' + office.geoCityCorporationId + '"]'};
                $("input[name='upacityradio']:radio:nth(1)", $domain).prop('checked', true).trigger('change');
                aftersetdata = {'selector': '#wordno>option[value="' + office.geoCityCorporationWardId + '"]'};
                fillcityward(office.geoCityCorporationId);
            }
            else if (office.geoUpazilaId > 0) {//upazilla
                aftersetdata = {'selector': '#upaziladropdown>option[value="' + office.geoUpazilaId + '"]'};
                $("input[name='upacityradio']:radio:nth(0)", $domain).prop('checked', true).trigger('change');
                if (office.geoUnionId > 0) {//union
                    aftersetdata = {'selector': '#uniondropdown>option[value="' + office.geoUnionId + '"]'};
                    $("input[name='unimuniradio']:radio:nth(0)", $domain).prop('checked', true).trigger('change');
                }
                else if (office.geoMunicipalityId) {//municipality
                    aftersetdata = {'selector': '#municipalitydropdown>option[value="' + office.geoMunicipalityId + '"]'};
                    $("input[name='unimuniradio']:radio:nth(1)", $domain).prop('checked', true).trigger('change');
                    aftersetdata = {'selector': '#wordno>option[value="' + office.geoCityCorporationWardId + '"]'};
                    fillmuniward(office.geoMunicipalityId);


                }
            }
            $('input[name=address]', $domain).val(office.officeAddress);
        }


        $(' #parent-office-id>option[value="' + office.parentOfficeId + '"]').prop('selected', true);
        templateselected = office.officeOriginId;


    }

    function setdataforEditInfo(office) {
        console.log(office);
        bringdata_('/getsingleofffice', office, function (office) {
            console.log(office);
            $(' input[name=office_name_bng]').val(office.officeNameBng);
            $(' input[name=office_name_eng]').val(office.officeNameEng);
            $(' input[name=office_phone]').val(office.officePhone);
            $(' input[name=office_mobile]').val(office.officeMobile);
            $(' input[name=office_fax]').val(office.officeFax);
            $(' input[name=office_email]').val(office.officeEmail);
            $(' input[name=office_web]').val(office.officeWeb);
            $(' input[name=digital_nothi_code]').val(office.digitalNothiCode);
            $(' input[name=ref_code]').val(office.referenceCode);
            $(' input[name=office_code]').val(office.officeCode);


            setlocationasEditInfo(office);
        });


    }


    function addradiobuttonEvent($selectedpart) {
        $("input[name='upacityradio']:radio", $selectedpart).on("change", function () {
            var value = $(this).val();
            radio1 = parseInt(value);
            switch (value) {
                case "0":
                    radio1 = 0;
                    $('#cityselectdiv').hide();
                    $('#warddiv').hide();
                    $('#addressdiv').hide();


                    $('#upazillaselectdiv').show('slow');
                    $('#muniuniselectiondiv').show('slow');

                    if ($(' #districtdropdown').val() != 0) fillupa($(' #districtdropdown').val());
                    break;
                case "1":
                    radio1 = 1;
                    $('#upazillaselectdiv').hide();
                    $('#muniselectdiv').hide();
                    $('#uniselectdiv').hide();
                    uncheckradiobutton($("input[name='unimuniradio']:radio", $selectedpart));
                    radio2 = undefined;
                    $('#warddiv').hide();
                    $('#muniuniselectiondiv').hide();
                    $('#addressdiv').hide();


                    $('#cityselectdiv').show('slow');
                    $('#warddiv').show('slow');
                    $('#addressdiv').show('slow');

                    if ($(' #districtdropdown').val() != 0) fillcity($(' #districtdropdown').val());
                    break;
            }
        });

        $("input[name='unimuniradio']:radio", $selectedpart).on("change", function () {

            var value = $(this).val();
            radio2 = parseInt(value);
            switch (value) {
                case "0":
                    radio2 = 0;
                    $('#muniselectdiv').hide();
                    $('#addressdiv').hide();
                    $('#warddiv').hide();


                    $('#uniselectdiv').show('slow');
                    $('#addressdiv').show('slow');

                    if ($(' #upaziladropdown').val() != 0) filluni($(' #upaziladropdown').val());
                    break;
                case "1":
                    radio2 = 1;
                    $('#uniselectdiv').hide();
                    $('#addressdiv').hide();


                    $('#muniselectdiv').show('slow');
                    $('#warddiv').show('slow');
                    $('#addressdiv').show('slow');
                    if ($(' #upaziladropdown').val() != 0) fillmuni($(' #upaziladropdown').val());
                    break;
            }
        });
    }


    function hide() {
        $selectedpart = $("");
        clearlocal();
        $('#cityselectdiv').hide();
        $('#upazillaselectdiv').hide();
        $('#muniselectdiv').hide();
        $('#uniselectdiv').hide();
        uncheckradiobutton($("input[name='unimuniradio']:radio", $selectedpart));
        radio2 = undefined;
        uncheckradiobutton($("input[name='upacityradio']:radio", $selectedpart));
        radio1 = undefined;
        $('#warddiv').hide();
        $('#muniuniselectiondiv').hide();
        $('#addressdiv').hide();
    }

    function addtabEvent($selectedpart) {
        $("#tabpart a").on('click', function (event) {
            var choose = $(this).data('val');

            if (choose == "1") {
                activetab = 1;
                cleartree(0, 1 - activetab)
                hide();
            }
            else if (choose == "0") {
                activetab = 0;
                cleartree(9, 1 - activetab)
                clearglobal();
            }

            $("#locationtype").val(choose);
        });
    }


    $(document).ready(function () {

        var $selectedpart = $('#basicform');
        addradiobuttonEvent($selectedpart);
        addtabEvent($selectedpart);
        var office = 53;
        setdataforEditInfo(office);
        // $(this).html(editForm.html());
        // $('#formtag',this).text('অফিস সম্পাদনা');
        // beforeSubmit($("#officeform",this));
        // $(this).show('slow');


        $(".radio").removeClass("radio");


    });

    $('#basicform').on('submit', function() {
            if (radio1 == undefined) radio1 = -1;
            if (radio2 == undefined) radio2 = -1;
            var formData = {
                'id':  $('#office_id').val(),
                'office_ministry_id': $(' #office_ministry_id').val(),
                'office_layer_id': $(' #office_layer_id').val(),
                'office_origin_id': $(' #office_origin_id').val(),
                'inoutcountry': activetab,
                'upacitycheck': radio1,
                'unimunicheck': radio2,
                'office_name_bng': $(' input[name=office_name_bng]').val(),
                'office_name_eng': $(' input[name=office_name_eng]').val(),
                'office_phone': $('input[name=office_phone]').val(),
                'office_mobile': $(' input[name=office_mobile]').val(),
                'office_fax': $(' input[name=office_fax]').val(),
                'office_email': $(' input[name=office_email]').val(),
                'office_web': $(' input[name=office_web]').val(),
                'digital_nothi_code': $(' input[name=digital_nothi_code]').val(),
                'ref_code': $(' input[name=ref_code]').val(),
                'office_code': $(' input[name=office_code]').val(),
                'divisionid': $(' #divisiondropdown').val(),
                'districtid': $(' #districtdropdown').val(),
                'thanaid': $(' #thanadropdown').val(),
                'postid': $(' #postofficedropdown').val(),
                'upazilaid': $(' #upaziladropdown').val(),
                'cityid': $(' #citydropdown').val(),
                'unionid': $(' #uniondropdown').val(),
                'municipalityid': $(' #municipalitydropdown').val(),
                'wordno': $(' #wordno').val(),
                'address': $(' #address').val(),
                'countryname': $(' #countryname').val(),
                'detailaddress': $(' #detailaddress').val(),
                'parent_office_id': $(' #parent_office_id').val()
            };
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/editoffice",
                data: formData,
                async: false,
                success: function (response) {

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
        }
    );

</script>

<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
</body>
<!-- END BODY -->
</html>
