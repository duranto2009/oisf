<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!--
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.6
Version: 4.5.4
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>

    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../includes/head.jsp" %>


    <link href="${context}/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
    <link href="${context}/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <%--<link href="${context}/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css"/>--%>
    <link href="${context}/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>

    <link href="${context}/assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet"
          type="text/css"/>
    <link href="${context}/assets/global/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css"/>
    <!-- Include the plugin's CSS and JS: -->
    <link rel="stylesheet" href="${context}/assets/css/bootstrap-multiselect.css" type="text/css"/>

    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css"/>

    <style type="text/css">
        .minheigth {
            width: 300px;
            min-height: 200px;
        }

        .select2-container--bootstrap .select2-selection--multiple {
            background-color: #fff;
        }

        .ms-container .ms-selectable .ms-list {
            height: 400px;
            background-image: url("${context}/assets/img/plaster_clean_20130409_1304934176.jpg");

            background-color: white;
            background-size: 100% 100%;
        }

        .ms-container .ms-selection .ms-list {
            height: 400px;
            background-image: url("${context}/assets/img/plaster_clean_20130409_1304934176.jpg");
            background-color: white;
            background-size: 100% 100%;
        }

        .ms-container {
            height: 400px;
            width: 100%;
        }

        .mc-container {
            width: 100%;
        }

        .portlet.box > .portlet-body {
            background-image: url("${context}/assets/img/grey-linen-texture-background_1053-253.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        .radius {
            border-radius: 10px !important;
        }


    </style>

</head>


<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed">

    <div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
        <%@ include file="../includes/header.jsp" %>
    </div>

    <div class="clearfix"></div>

    <div class="page-container">

        <div class="page-sidebar-wrapper" style="margin-top: 20px">

            <div class="page-sidebar md-shadow-z-2-i  navbar-collapse collapse">
                <%@ include file="../includes/menu.jsp" %>
            </div>

        </div>

        <div class="page-content-wrapper">
            <!-- BEGIN CONTENT BODY -->
            <div class="page-content">
                <div class="card">
                    <div class="portlet-body form">


                        <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN PORTLET-->
                                <div class="portlet box bordered">
                                    <div class="portlet-title ">
                                        <div class="caption">
                                            <span class="caption-subject"> পুনর্বিতরন ফরম</span>
                                        </div>

                                    </div>
                                    <div class="portlet-body">
                                        <form method="post" id="form" action="/groupassign">
                                            <div class=" form-body">
                                                <div class="form-group col-md-12">
                                                    <label class="col-md-3 control-label" style="margin-left: -30px;"> মন্ত্রণালয়</label>
                                                    <div class="col-md-6">
                                                        <select class="form-control" name="ministrydata"
                                                                id="ministrydropdown">
                                                            <option value="-1">...</option>
                                                            <c:forEach var="ministry" items="${ministry}">
                                                                <option value="${ministry.getId()}">
                                                                        ${ministry.getNameBng()}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-12">
                                                    <label class="col-md-3 control-label" style="margin-left: -30px;"> দপ্তরের স্তর</label>
                                                    <div class="col-md-6">
                                                        <select class="form-control" name="layerdata" id="layerdropdown">

                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="form-group col-md-12">
                                                    <label class="col-md-3 control-label" style="margin-left: -30px;"> মৌলিক দপ্তরের নাম</label>
                                                    <div class="col-md-6">
                                                        <select class="form-control" name="officedata"
                                                                id="originofficedropdown">

                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-12">
                                                    <label class="col-md-3 control-label" style="margin-left: -30px;"> মৌলিক দপ্তরের শাখার নাম</label>
                                                    <div class="col-md-6">
                                                        <select class="form-control" name="unitdata"
                                                                id="originunitdropdown">

                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-12">
                                                    <label class="col-md-3 control-label" style="margin-left: -30px;"> মৌলিক দপ্তরের পদের নাম</label>
                                                    <div class="col-md-6">
                                                        <select class="form-control" name="organogramdata"
                                                                id="originorganogramdropdown">

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">

                                                    <label for="multiple" class="control-label"> গ্রুপ বাছাই করুন</label>

                                                    <select name="groupid[]" id="multiple"
                                                            class="form-control select2-multiple" multiple>
                                                        <c:forEach var="group" items="${groups}">
                                                            <option value="${group.getId()}">
                                                                    ${group.getNameBng()}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>


                                                <input type="hidden" name="insertedgroup[]" id="insertedGroup"/>
                                                <input type="hidden" name="deletedgroup[]" id="deletedGroup"/>


                                            </div>


                                            <div class="form-actions">
                                                <div class="row">
                                                    <div class=" col-md-3" style="margin-left: 40%">
                                                        <button type="submit" class="btn green"> জমা দিন</button>
                                                        <button type="button" class="btn btn-circle grey-salsa btn-outline">
                                                            বাতিল করুন
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

            </div>
            <!-- END CONTENT BODY -->
        </div>
        <input type="hidden" id="menuid" value="${menuid}">
    </div>
    <!-- END CONTAINER -->

    <div class="page-footer">
        <%@ include file="../includes/footer.jsp" %>
    </div>

</body>


<script>

    $(document).ready(function () {
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
                    select.append($('<option></option>').val(-1).html('...'));
                    $.each(data, function (index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.layerNameBng)
                        );
                    });
                    return response;
                },
                error: function () {
                               toastr.error(" সমস্যা হয়েছে , আবার চেষ্টা করুন  ।");
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
                    var select = $('#originofficedropdown');
                    select.empty();
                    select.append($('<option></option>').val(-1).html('...'));
                    $.each(data, function (index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.officeNameBng)
                        );
                    });
                    return response;
                },
                error: function () {
                               toastr.error(" সমস্যা হয়েছে , আবার চেষ্টা করুন  ।");
                }
            });

        });


        $("#originofficedropdown").change(function () {
            var data = "";
            $.ajax({
                type: "GET",
                url: "<%=request.getContextPath()%>/originunitsbyorigin",
                data: {
                    id: $(this).val()
                },
                async: false,
                success: function (response) {
                    data = response;
                    var select = $('#originunitdropdown');
                    select.empty();
                    select.append($('<option></option>').val(-1).html('...'));
                    $.each(data, function (index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.unitNameBng)
                        );
                    });
                    return response;
                },
                error: function () {
                               toastr.error(" সমস্যা হয়েছে , আবার চেষ্টা করুন  ।");
                }
            });
        });
        $("#originunitdropdown").change(function () {
            var data = "";
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/getofficeoriginunitorganogramlistbyofficeoriginunitid",
                data: {
                    id: $(this).val()
                },
                async: false,
                success: function (response) {
                    data = response;
                    var select = $('#originorganogramdropdown');
                    select.empty();
                    select.append($('<option></option>').val(-1).html('...'));
                    $.each(data, function (index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.designationBng)
                        );
                    });
                    return response;
                },
                error: function () {
                               toastr.error(" সমস্যা হয়েছে , আবার চেষ্টা করুন  ।");
                }
            });
        });


        var previousState = [];
        var previousGroupList = [];
        var state = 1;

        $('#originorganogramdropdown').change(function () {
            previousMenuList = [];

            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/selectedgroup",
                data: {
                    desigid: $('#originorganogramdropdown').val()
                },
                async: false,
                success: function (response) {
                    var $select = $('#multiple');
                    $select.val(response).trigger('change');
                    for (var i = 0; i < response.length; i++) {
                        previousGroupList["#_" + response[i]] = 1;
                    }
                },
                error: function () {
                               toastr.error(" সমস্যা হয়েছে , আবার চেষ্টা করুন  ।");
                }
            });


        });


        $("#form").submit(function () {

            var  deletedGroupList = [], insertedGroupList = [];


            var selectedGroup = [];
            selectedGroup = $('#multiple').val();
            if (selectedGroup != null) {
                for (var i = 0; i < selectedGroup.length; i++) {
                    if (previousGroupList["#_" + selectedGroup[i]] == undefined) insertedGroupList.push(selectedGroup[i]);
                    else if (previousGroupList["#_" + selectedGroup[i]] == 1) previousGroupList["#_" + selectedGroup[i]] = 0;
                }

                for (var k in previousGroupList) {
                    var x = k.split("_");
                    if (previousGroupList[k] == 1) deletedGroupList.push(x[1]);
                }
            }

            $('#insertedGroup').val(insertedGroupList);
            $('#deletedGroup').val(deletedGroupList);

        });


    });
</script>

<%@ include file="../includes/includes.jsp" %>
<!--[if lt IE 9]>
<script src="${context}/assets/global/plugins/respond.min.js"></script>
<script src="${context}/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->

<script src="${context}/assets/global/plugins/select2/js/select2.full.js" type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${context}/assets/pages/scripts/components-select2.js" type="text/javascript"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${context}/assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js" type="text/javascript"></script>

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${context}/assets/pages/scripts/components-multi-select.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootstrap-multiselect.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->

</body>

</html>