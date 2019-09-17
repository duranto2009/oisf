<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <%@ include file="../../includes/head.jsp"%>
    <c:set var="context" value="${pageContext.request.contextPath}" />

    <link href="${context}/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="${context}/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <%--<link href="${context}/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />--%>
    <link href="${context}/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />

    <link href="${context}/assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
    <link href="${context}/assets/global/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css" />
    <!-- Include the plugin's CSS and JS: -->
    <link rel="stylesheet" href="${context}/assets/css/bootstrap-multiselect.css" type="text/css"/>

    <style type="text/css">
        .minheigth{
            width: 300px;
            min-height:200px ;
        }
        .select2-container--bootstrap .select2-selection--multiple{
            background-color: #fff;
        }
        .ms-container .ms-selectable .ms-list{
            height: 400px;
            background-image: url("${context}/assets/img/plaster_clean_20130409_1304934176.jpg");

            background-color: white;
            background-size: 100% 100%;
        }

        .ms-container .ms-selection .ms-list{
            height: 400px;
            background-image: url("${context}/assets/img/plaster_clean_20130409_1304934176.jpg");
            background-color: white;
            background-size: 100% 100%;
        }
        .ms-container{
            height: 400px;
            width: 100%;
        }

        .mc-container{
            width: 100%;
        }



        .portlet.box>.portlet-body {
            background-image: url("${context}/assets/img/grey-linen-texture-background_1053-253.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }
        .radius{
            border-radius: 10px!important;
        }



    </style>

</head>



<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed">

    <div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
        <%@ include file="../../includes/header.jsp"%>
    </div>

    <div class="clearfix"> </div>

    <div class="page-container">

        <div class="page-sidebar-wrapper">

            <div class="page-sidebar md-shadow-z-2-i  navbar-collapse collapse">
                <%@ include file="../../includes/menu.jsp"%>
            </div>

        </div>

        <div class="page-content-wrapper">
            <!-- BEGIN CONTENT BODY -->
            <div class="page-content">
                <!-- BEGIN PAGE HEADER-->
                <!-- BEGIN THEME PANEL -->

                <!-- END THEME PANEL -->
                <!-- BEGIN PAGE BAR -->

                <!-- END PAGE BAR -->
                <!-- BEGIN PAGE TITLE-->

                <!-- END PAGE TITLE-->
                <!-- END PAGE HEADER-->

                <div class="card">
                    <div class="portlet-body form">



                        <div class="row">
                            <div class="col-md-12">
                                <!-- BEGIN PORTLET-->
                                <div class="portlet box bordered">
                                    <div class="portlet-title ">
                                        <div class="caption">
                                            <span class="caption-subject">Redistribution Form</span>
                                        </div>
                                        <%--<div class="actions">--%>
                                        <%--<a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">--%>
                                        <%--<i class="icon-cloud-upload"></i>--%>
                                        <%--</a>--%>
                                        <%--<a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">--%>
                                        <%--<i class="icon-wrench"></i>--%>
                                        <%--</a>--%>
                                        <%--<a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">--%>
                                        <%--<i class="icon-trash"></i>--%>
                                        <%--</a>--%>
                                        <%--</div>--%>
                                    </div>
                                    <div class="portlet-body">
                                        <form method="post" action="${context}/assignupazillamunicipality">
                                            <div class=" form-body">


                                                <div class="form-group col-md-12">
                                                    <label class="col-md-3 control-label" style="margin-left: -30px;">Division Name</label>
                                                    <div class="col-md-6">
                                                        <select class="form-control" name="divdata" id="divisiondropdown">
                                                            <option value="-1">...</option>
                                                            <c:forEach var="data" items="${division}">
                                                                <option value="${data.getId()}" data-bbs = "${data.getBbsCode()}">
                                                                        ${data.getDivisionNameBng()}
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-12">
                                                    <label class="col-md-3 control-label" style="margin-left: -30px;">District Name</label>
                                                    <div class="col-md-6">
                                                        <select class="form-control" name="disdata" id="districtdropdown">

                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-12">
                                                    <label class="col-md-3 control-label" style="margin-left: -30px;">Target Name</label>
                                                    <div class="col-md-6">
                                                        <select class="form-control" name="upadata" id="upazilladropdown">

                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">

                                                    <label for="multiple" class="control-label">Select Upazilla</label>

                                                    <select name="parentid[]" id="multiple"  class="form-control select2-multiple"  multiple>

                                                    </select>
                                                </div>

                                                <div class="form-group row">
                                                    <div style="position:relative;margin-left: 47.5%;">
                                                        <button type="button"  style="width: 10%" class="btn  radius blue-hoki" id="multiselectfetch" onclick="fetchall()">Go</button>
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-12">

                                                    <label class="control-label col-md-12" style="width: auto">Select Source</label>

                                                </div>
                                                <div class="form-group" style="height: 475px">


                                                    <div class=" col-md-offset-1 col-md-10">
                                                        <select multiple="multiple" class="multi-select" id="my_multi_select2" name="childid[]">


                                                        </select>
                                                    </div>
                                                </div>

                                            </div>


                                            <div class="form-actions">
                                                <div class="row">
                                                    <div class=" col-md-3" style="margin-left: 40%">
                                                        <button type="submit" class="btn green">Submit</button>
                                                        <button type="button" class="btn btn-circle grey-salsa btn-outline">Cancel</button>

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

    </div>
    <!-- END CONTAINER -->

    <div class="page-footer">
        <%@ include file="../../includes/footer.jsp"%>
    </div>
    <%@ include file="../../includes/includes.jsp" %>
</body>


<script>

    function fetchall() {
        var values = $('#multiple').val();
        var selected =[];
        $("#multiple option:selected").each(function () {
            var $this = $(this);
            if ($this.length) {
                var selText = $this.text();
                selected.push(selText);
            }
        });

        $.ajax({
            type:"POST",
            url :"${context}/getmunicipalitylistbyupazillaids",
            data : {
                id: values
            },
            async: false,
            success : function(response) {
                data = response;

                var select = $('#my_multi_select2');
                for(i=0;i<selected.length;i++) {
                    $('<optGroup/>').attr('label', selected[i]).appendTo(select);

                    $.each(data, function (index, value) {
                        if (value.geoUpazilaId == values[i]) {
                            select.find('optGroup').last().append($('<option></option>').val("i:"+value.id+":"+7).html(value.municipalityNameBng));
                        }
                    });

                }
                $('#my_multi_select2').multiselect('refresh');
                return data;
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

    function fetchSibling(parentid) {
        var url =null;
        url = "${context}/upazillalistbydistrictid";

        $.ajax({
            type:"POST",
            url : url,
            data : {
                id: parentid
            },
            async: false,
            success : function(response) {
                data = response;

                var select = $('#multiple');
                select.empty();
                $.each(data, function(index, value) {
                    select.append(
                        $('<option></option>').val(value.id).html(value.upazillaNameBng).attr('bbs',value.bbsCode)
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
    }

    $(document).ready(function () {
        var geotype = $("#geotype").val();
        $('#divisiondropdown').change(function() {
            var data = "";
            $.ajax({
                type:"GET",
                url : "${context}/districtlistbydiv",
                data : {
                    id: $(this).val()
                },
                async: false,
                success : function(response) {
                    data = response;
                    var select = $('#districtdropdown');
                    select.empty();
                    select.append($('<option></option>').val(-1).html('...'));
                    $.each(data, function(index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.districtNameBng).attr('bbs',value.bbsCode)
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

        $('#districtdropdown').change(function() {
            var data = "";
            $.ajax({
                type:"POST",
                url : "${context}/upazillalistbydistrictid",
                data : {
                    id: $(this).val()
                },
                async: false,
                success : function(response) {
                    data = response;
                    var select = $('#upazilladropdown');
                    select.empty();
                    select.append($('<option></option>').val(-1).html('...'));
                    $.each(data, function(index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.upazillaNameBng).attr('bbs',value.bbsCode)
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

            $("#upazilladropdown").change(function () {
                fetchSibling($("#districtdropdown").val());
            });




        });


    });
</script>
<!--[if lt IE 9]>
<script src="${context}/assets/global/plugins/respond.min.js"></script>
<script src="${context}/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->

<script src="${context}/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${context}/assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>

<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${context}/assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js" type="text/javascript"></script>

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${context}/assets/pages/scripts/components-multi-select.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootstrap-multiselect.js"></script>


<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/common/validation.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->

</body>

</html>