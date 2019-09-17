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

    <link href="${context}/assets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css" />
    <link href="${context}/assets/global/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" type="text/css" />
    <link href="${context}/assets/admin/pages/css/profile.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css"/>
    <link href="${context}/assets/styles/style.css" rel="stylesheet" type="text/css"/>


    <style type="text/css">

        .no-shadow {
            box-shadow: unset !important;
        }
        .portlet > .portlet-title {
            border-bottom: 1px solid #eee !important;
            margin-bottom: 10px;
        }
        .portlet.light {
            background-color: transparent;
        }
        .profile-sidebar {
            width: 220px;
        }
        .profile-desc-link {
            text-align: left;
            padding-left: 20px;
        }
        .width200 {
            width: 200px;
            display: inline-block;

        }
        #profile_block {
            display:none;
        }
        #tblOfficeUnitOrganograms td {
            word-wrap: break-word;
        }
        #tblOfficeUnitOrganograms td.text-left {
            text-align: left;
        }
        .unitName {
            font-weight: bold;
        }
        .modal-footer .btn + .btn {
            margin: 5px;
        }
        .red {
            color: red;
        }
        .alert-success{
            background-color: #adadce;
        }
        .green-haze.btn{
            background-color: #6e4082;
        }
    </style>




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
    <div class="page-sidebar-wrapper" style="margin-top: 20px;">
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
            <div class="card">
                <div class="card-block">
                    <div class="portlet-body form">


                        <div class="row">
                            <div class="col-md-12">
                                <div class="portlet box">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-users" style="color: white"></i>কর্মকর্তা ব্যবস্থাপনা
                                        </div>
                                    </div>

                                    <div class="portlet-body form">
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h3 class="form-section">কর্মকর্তার আইডি ব্যবহার করে খোঁজ করুন</h3>
                                                    <form action="#" class="alert alert-success alert-borderless">
                                                        <div class="input-group">
                                                            <div class="input-cont">
                                                                <div class="input text">
                                                                    <input type="text" id="employee-identity-no" placeholder="" class="form-control" list="employee_identity_no_list" name="employee_identity_no">
                                                                </div>
                                                                <datalist id="employee_identity_no_list">
                                                                    <!-- Loop between users those are unassigned to any office and list it up here as -->
                                                                    <!-- option value="20000002"></option -->
                                                                </datalist>
                                                            </div>
                                                            <span class="input-group-btn">
                                                    <button id="btn_employee_search" type="button" class="btn green-haze" style="height: 34px">
                                                        খোঁজ করুন &nbsp; <i class="icon-arrow-right icon"></i>
                                                    </button>
                                                </span>
                                                        </div>
                                                    </form>

                                                </div>
                                            </div>
                                            <div class="row" id="profile_block" >
                                                <div class="col-md-12">
                                                    <div class="profile-sidebar">
                                                        <!-- PORTLET MAIN -->
                                                        <div class="portlet light profile-sidebar-portlet bordered no-shadow">
                                                            <!-- SIDEBAR USERPIC -->
                                                            <div class="profile-userpic">
                                                                <img alt="" class="img-responsive" src="${context}/assets/img/profile/default.jpg" style="height: 120px !important;width: 120px"> </div>
                                                            <!-- END SIDEBAR USERPIC -->
                                                            <!-- SIDEBAR USER TITLE -->
                                                            <div class="profile-usertitle">
                                                                <div class="profile-usertitle-name"> --- </div>
                                                                <div class="profile-usertitle-job"> --- </div>
                                                                <div class="margin-top-20 profile-desc-link">
                                                                    <i class="fa fa-phone"></i>
                                                                    +৮৮০১৭১১৬৮০৯৩৩
                                                                </div>

                                                                <div class="margin-top-20 profile-desc-link margin-bottom-20">
                                                                    <i class="fa fa-envelope"></i>
                                                                    abc@gmail.com
                                                                </div>

                                                            </div>
                                                            <!-- END SIDEBAR USER TITLE -->
                                                        </div>
                                                        <!-- END PORTLET MAIN -->
                                                    </div>
                                                    <div class="profile-content">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="portlet bordered light no-shadow">
                                                                    <div class="portlet-title">
                                                                        <div class="caption">
                                                                            <i class="fa fa-picture"></i>বর্তমান নিযুক্তিসমূহ
                                                                        </div>
                                                                    </div>
                                                                    <div class="portlet-body">
                                                                        <div class="table-scrollable">
                                                                            <table class="table table-bordered table-hover" id="tblCurrentPosts">
                                                                                <thead>
                                                                                <tr>
                                                                                    <th> # </th>
                                                                                    <th> দপ্তর  </th>
                                                                                    <th> পদ  </th>
                                                                                    <th> যোগদানের তারিখ  </th>
                                                                                    <th> কার্যক্রম </th>
                                                                                </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                <tr><td colspan='5'>দুঃক্ষিত! কোনো তথ্য পাওয়া যায়নি</td></tr>
                                                                                </tbody>
                                                                                <input type="hidden" id="hdnEmployeeRecordId" value="0" />
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" id="new_assignment_block">
                                                <div class="col-md-12">
                                                    <div class="portlet bordered light no-shadow">
                                                        <div class="portlet-title">
                                                            <div class="caption">
                                                                <i class="fa fa-picture"></i>নতুন নিয়োগ
                                                            </div>
                                                        </div>
                                                        <div class="portlet-body">
                                                            <div class="row">
                                                                <div class="col-md-4 form-group form-horizontal">
                                                                    <label class="control-label">মন্ত্রণালয় <span class="required"> * </span></label>
                                                                    <div class="input select">
                                                                        <select id="ministrydropdown" placeholder="মন্ত্রণালয়" class="form-control" name="office_ministry_id" autocomplete="off">
                                                                            <option value="-1">--বাছাই করুন---</option>
                                                                            <c:forEach var="ministry" items="${ministry}">
                                                                                <option value="${ministry.getId()}">
                                                                                        ${ministry.getNameBng()}
                                                                                </option>
                                                                            </c:forEach>

                                                                        </select>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-4 form-group form-horizontal">
                                                                    <label class="control-label">দপ্তরের স্তর <span class="required"> * </span></label>
                                                                    <div class="input select">
                                                                        <select id="layerdropdown" placeholder="দপ্তরের স্তর  " class="form-control" name="office_layer_id">

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 form-group form-horizontal">
                                                                    <label class="control-label">দপ্তর / অধিদপ্তর ধরন <span class="required"> * </span></label>
                                                                    <div class="input select">
                                                                        <select id="origindropdown" placeholder="দপ্তর / অধিদপ্তর " class="form-control" name="office_origin_id">

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-4 form-group form-horizontal">
                                                                    <label class="control-label"> দপ্তর </label>
                                                                    <div class="input select">
                                                                        <select id="officedropdown" class="form-control" name="office_id">

                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div id="unit_tree_div" class="row" style="display:block;">
                                                                <div class="col-md-6">
                                                                    <div class="portlet light no-shadow">
                                                                        <div class="portlet-title">
                                                                            <div class="caption">
                                                                                <i class=""></i>শাখা কাঠামো
                                                                            </div>
                                                                        </div>
                                                                        <div class="portlet-body">
                                                                            <div id="jstree"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>



                                                                <div class="col-md-6" id="unit_tree_expand_view" style="display: block;">

                                                                </div>




                                                            </div>
                                                            <div class="table-scrollable">
                                                                <div id="block_loading" style="display: none">
                                                                    <img  src="../assets/global/img/loading.gif" alt="loading" />
                                                                </div>
                                                                <h2>দপ্তরের শাখার সাংগঠনিক কাঠামো</h2>
                                                                <table class="table table-bordered table-hover" id="tblOfficeUnitOrganograms">
                                                                    <tbody>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>

                </div>

                    <input type="hidden" id="menuid" value="${menuid}">
                </div>
            </div>
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


    <script src="${context}/assets/global/plugins/bootstrap-toastr/toastr.min.js"></script>
    <script src="${context}/assets/admin/pages/scripts/ui-toastr.js"></script>
    <script src="${context}/assets/js/utils.js"></script>
    <script type="text/javascript" src="${context}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>


    <script>
        jQuery(document).ready(function() {

            toastr.options = {
                "closeButton": false,
                "debug": false,
                "positionClass": "toast-bottom-right",
                "onclick": null,
                "showDuration": "1000",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
        });
    </script>


    <script src="${context}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>

    <script>
        var office_id = 0; // Server Side add the office ID here
        var roleId = 1;
        var formData={};

        var officeunitorganogramstorage=[];
        var originorgtoorgidmapping =[];

        var officeoriginunitstorage =[];
        var originunittounitmapping =[];

        var originorganogramstorage =[];
        var superiorunittounitidmappinginorigin =[];


        function orgbyunitid(unitid,data) {
            var  childs =[];
            var temp;
            for(var i=0; i<data.length; i++){
                temp = data[i];
                if(temp['officeUnitId'] == unitid)childs.push(data[i]);
            }
            return childs;
        }

        $(document).ready(function(){
            $("#btn_employee_search").click(function(){
                // e.preventDefault();
                // e.stopPropagation();

                if ($("#employee-identity-no").val().trim().length != 12) {
                    toastr.error("ব্যবহারকারীর ইউজারনেম ১২ অংকের সংখ্যা", "দুঃখিত ");
                    return false;
                }
                $("#profile_block").slideUp("slow", function(){
                    //$("#profile_block").slideDown("slow");
                    $("#hdnEmployeeRecordId").val("0");
                    loadAssignedTable();

                });
            });


            $('#ministrydropdown').change(function () {
                var data = "";
                $.ajax({
                    type: "GET",
                    url: "<%=request.getContextPath()%>/layersbyministries",
                    data: {
                        id: $(this).val()
                    },
                    async: false,
                    success: function (response) {
                        data = response;
                        var select = $('#layerdropdown');
                        select.empty();
                        select.append($('<option></option>').val(-1).html('--বাছাই করুন--'));
                        $.each(data, function (index, value) {
                            select.append(
                                $('<option></option>').val(value.id).html(value.layerNameBng)
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


            });


            $('#layerdropdown').change(function () {

                var data = "";
                $.ajax({
                    type: "GET",
                    url: "<%=request.getContextPath()%>/originsbylayer",
                    data: {
                        id: $(this).val()
                    },
                    async: false,
                    success: function (response) {
                        data = response;
                        var select = $('#origindropdown');
                        select.empty();
                        select.append($('<option></option>').val(-1).html('--বাছাই করুন--'));
                        $.each(data, function (index, value) {
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

            });


            $('#origindropdown').change(function() {

                var data = "";
                $.ajax ({
                    type:"GET",
                        url : "<%=request.getContextPath()%>/officebyministrylayerorigin",
                        data : {
                        ministry: $('#ministrydropdown').val(),
                            layer :$('#layerdropdown').val(),
                            origin :$(this).val()
                    },
                    async: false,
                        success : function(response) {
                        data = response;
                        var select = $('#officedropdown');
                        select.empty();
                        select.append($('<option></option>').val(-1).html('--বাছাই করুন--'));
                        $.each(data, function(index, value) {
                            select.append(
                                $('<option></option>').val(value.id).html(value.officeNameBng)
                            );
                        });
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

            });


            $("#officedropdown").on('change',function(e){
                   office_id=$(this).val();

                   $("#block_loading").show();
                   LoadOfficeUnitOrganograms(office_id);
            });







        });



        function loadAssignedTable() {
            $.ajax({
                type: "POST",
                url : "${context}/getEmployeeInfoByUsername",
                data :{
                    username : $("#employee-identity-no").val()
                },
                success: function (response) {
                    var jsondata = response.employeeDTO;
                    var jsondata_office = response.employeeOfficesDTOs;
                    if (jsondata) {
                        if (jsondata.imageFileName != "" && jsondata.imageFileName != null) {
                            $(".profile-userpic img").attr("src", "../" + jsondata.imageFileName);
                        }
                        else $(".profile-userpic img").attr("src", "../"+ "assets/img/profile/default.jpg");


                        $(".profile-usertitle-name").html(jsondata.nameBng);
                        $(".profile-usertitle-job").html($("#employee-identity-no").val().getDigitBanglaFromEnglish());

                        $(".profile-desc-link").eq(0).html('<i class="fa fa-phone"></i>' + jsondata.personalMobile.getDigitBanglaFromEnglish());
                        //$(".profile-desc-link").eq(1).html('<i class="fa fa-fax"></i>' + jsondata.personalMobile);
                        $(".profile-desc-link").eq(1).html('<i class="fa fa-envelope"></i>' + jsondata.personalEmail);
                        //$(".profile-desc-link").eq(3).html('<i class="fa fa-globe"></i>' + jsondata.personalEmail);

                        $("#hdnEmployeeRecordId").val(jsondata.id);

                        // $("#profile_block").slideDown("slow");
                        // if (jsondata_office.employeeOffices){
                            if (jsondata_office.length > 0) {
                                $("#tblCurrentPosts tbody").html("");
                                var tbodyStr = "";
                                $(jsondata_office).each(function(index, node){
                                    tbodyStr += "<tr>";
                                    tbodyStr += "<td>" + ((index+1) + " ").getDigitBanglaFromEnglish() + "</td>";
                                    tbodyStr += "<td>" + node.offices.officeNameBng + "</td>";
                                    tbodyStr += "<td>" + node.designation + " (" + node.officeUnits.unitNameBng + ")</td>";
                                    tbodyStr += '<td  id="date_joining_date_' + node.id +'">' + node.joiningDate + '</td>';
                                    if (office_id == node.officeId || roleId == 1) {
                                        tbodyStr += '<td><input class="date-picker-r" placeholder="দপ্তরে শেষ তারিখ" id="date_release_date_'+ node.id +'" />&nbsp;<a onclick="releaseEmployee(' + node.id + ')" class="btn-xs btn-danger" id=""><i class="fa fa-trash"></i></a></td>';
                                    } else {
                                        tbodyStr += '<td>&nbsp;</td>';
                                    }
                                    tbodyStr += "</tr>"
                                });
                                $("#tblCurrentPosts tbody").html(tbodyStr);
                                $('.date-picker-r').datepicker({
                                    rtl: false,
                                    format: "yyyy-mm-dd",
                                    orientation: "auto",
                                    todayHighlight:true,
                                    autoclose: true
                                });
                                $("#profile_block").slideDown("slow");
                            } else {
                                $("#profile_block").slideDown("slow");
                                $("#tblCurrentPosts tbody").html("<tr><td colspan='5'>দুঃক্ষিত! কোনো তথ্য পাওয়া যায়নি</td></tr>");
                            }
                        } else {
                            toastr.error("কোনো তথ্য পাওয়া যায়নি", "দুঃখিত ");
                            return false;
                        }
                    // } else {
                    //     toastr.error("কোনো তথ্য পাওয়া যায়নি", "দুঃখিত ");
                    //     return false;
                    // }
                }
            });
        }


        function LoadOfficeUnitOrganograms(office_id) {

            $.ajax({
                type:"GET",
                url : "<%=request.getContextPath()%>/officeUnitAndOrganogramWithDesignation",
                data : {
                    office_id: office_id
                },
                async: true,
                success : function(units) {//unit list
                    $("#block_loading").hide();

                        if (units.length > 0) {
                            $("#tblOfficeUnitOrganograms tbody").html("");
                            var tbodyStr = "";
                            var organogramsbyunit= [];
                            $(units).each(function(index, unit){
                                tbodyStr += "<tr>";
                                tbodyStr += "<td colspan='3' class='text-left unitName'>" + unit.unitName + "</td>";
                                tbodyStr += "</tr>"


                                if (unit.employeeOrgDTO.length > 0) {

                                    $(unit.employeeOrgDTO).each(function(index, post){
                                        tbodyStr += "<tr>";

                                        if(post.isEmpty)
                                        {
                                            tbodyStr +="<td width='5%'> <input type='checkbox' class='chkUnitOrg' data-id=" + post.orgId +" /> </td>";
                                            tbodyStr += "<td width='30%' class='text-left'>" + post.designationName + "</td>";
                                            tbodyStr += "<td  class='text-left'> <select style='display:none;' class='width200' id='incharge_label_"+post.orgId +"'>" +
                                                "<option selected='selected' value=''>--বাছাই--</option>" +
                                                " <option value='1'>ভারপ্রাপ্ত</option>" +
                                                "<option value='2'>চলতি দায়িত্ব</option> " +
                                                "<option value='3'>অতিরিক্ত দায়িত্ </option> " +
                                                "<option value='4'>প্রতিকল্প</option> " +
                                                "</select>&nbsp;" +
                                                " <input style='display:none;' placeholder='দপ্তরে শুরুর তারিখ ' class='date-picker-r width200' type='text' name='joining_date' data-date-format='yyyy-mm-dd' id='joining_date_"+post.orgId +"'/>" +
                                                " <button style='display:none;' class='btn btn-sm green' id='btn_" +post.orgId + "' onclick='assignDesignation(" +office_id + ","+ unit.unitId + "," + post.orgId + ",\"" + post.designationName + "\"," + post.designationLevel + "," +post.designationSequence  + ")' type='button'><i class='fa fa-save'></i></button>" +
                                                "</td" ;

                                        }
                                        else
                                        {
                                            tbodyStr +="<td width='5%'> <input type='checkbox' disabled='disabled' class='chkUnitOrg' data-id=" + post.orgId +" /> </td>";
                                            tbodyStr += "<td width='30%' class='text-left red'>" + post.designationName + "</td>";
                                            tbodyStr += "<td class='text-left '>" + post.employeeName + "</td>";
                                        }

                                        tbodyStr += "</tr>"

                                    });

                                } else {

                                    tbodyStr += "<tr><td colspan='3' class='red'>দুঃক্ষিত! কোনো তথ্য পাওয়া যায়নি</td></tr>";
                                }

                            });

                            $("#tblOfficeUnitOrganograms tbody").html(tbodyStr);

                        } else {

                            $("#tblOfficeUnitOrganograms tbody").html("<tr><td colspan='3' class='red' >দুঃক্ষিত! কোনো তথ্য পাওয়া যায়নি</td></tr>");
                        }


                    $('.date-picker-r').datepicker({
                        rtl: false,
                        format: "yyyy-mm-dd",
                        orientation: "auto",
                        todayHighlight:true,
                        autoclose: true
                    });


                    $(".chkUnitOrg").click(function(e){
                        var orgId = $(this).attr("data-id");
                        if ($(this).is(":checked")) {
                            $("#incharge_label_" + orgId).show();
                            $("#joining_date_" + orgId).show();
                            $("#btn_" + orgId).show();
                        } else {
                            $("#incharge_label_" + orgId).hide();
                            $("#joining_date_" + orgId).hide();
                            $("#btn_" + orgId).hide();
                        }
                    });


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
        }



        function assignDesignation(officeId,unitId,officeUnitOrganogramId,designationName,designationLevel,designationSequence) {
            if ($("#joining_date_" + officeUnitOrganogramId).val().trim().length < 10) {
                toastr.error("অফিস শুরুর তারিখ বাছাই করা হয়নি");
                return false;
            }
            if ($("#hdnEmployeeRecordId").val() == "0") {
                toastr.error("ব্যবহারকারীর আইডি পাওয়া যায়নি, প্রথমে ব্যবহারকারী বাছাই করুন");
                return false;
            }
            var inchargeLabel = $("#incharge_label_" + officeUnitOrganogramId).val();
            var joining_date = $("#joining_date_" + officeUnitOrganogramId).val();
            var employeeRecordId = $("#hdnEmployeeRecordId").val();
            $.ajax({
                type: "POST",
                url : "<%=request.getContextPath()%>/assignEmployee",
                data: {
                    officeId: officeId,
                    unitId: unitId,
                    officeUnitOrganogramId : officeUnitOrganogramId,
                    designationName: designationName,
                    designationLevel: designationLevel,
                    designationSequence: designationSequence,
                    employeeRecordId: employeeRecordId,
                    inchargeLabel : inchargeLabel,
                    joining_date: joining_date
                },
                success: function (response) {
                    if (response == "success" || response > 0) {
                        toastr.success("নতুন নিযুক্তিটি সার্থকভাবে সংরক্ষিত হয়েছে");
                        loadAssignedTable();
                        LoadOfficeUnitOrganograms(office_id);
                    } else {
                        toastr.error("নতুন নিযুক্তিটি সংরক্ষণ করা সম্ভব হয়নি");
                    }
                }
            });
        }

        function releaseEmployee(id) {
            if ($("#date_release_date_" + id).val().trim().length < 10) {
                toastr.error("শেষ অফিস তারিখ বাছাই করা হয়নি");
                return false;
            }


            var joining_date=$("#date_joining_date_" + id).text();
            var release_date=$("#date_release_date_" + id).val();

            if (Date.parse(release_date) < Date.parse(joining_date)) {
                toastr.error("অফিস শেষ তারিখ যোগদানের তারিখ অপেক্ষা আগে","দুঃখিত");
                return false;
            }
            bootbox.dialog({
                message: "আপনি কি নিশ্চিত যে এই পদটি খালি করতে চাচ্ছেন?",
                title: "নিশ্চিত করুন",
                buttons: {
                    success: {
                        label: "হ্যাঁ",
                        className: "btn-success",
                        callback: function() {
                            $.ajax({
                                type: "POST",
                                url : "<%=request.getContextPath()%>/releaseEmployee",
                                data: {
                                    id : id,
                                    release_date: $("#date_release_date_" + id).val()
                                },
                                success: function (response) {
                                    if (response == "Success" || response >0) {
                                        loadAssignedTable();
                                        LoadOfficeUnitOrganograms(office_id);
                                        toastr.success("পদটি উন্মুক্ত করা হয়েছে");
                                    } else {
                                        toastr.error("পদটি উন্মুক্ত করা যায়নি");
                                    }
                                }
                            });
                        }
                    },
                    danger: {
                        label: "না",
                        className: "btn-danger",
                        callback: function() {
                            //
                        }
                    }
                }
            });

        }

    </script>


</body>


</html>