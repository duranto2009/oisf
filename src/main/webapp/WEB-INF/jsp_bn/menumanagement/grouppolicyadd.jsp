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
    <title>OISF</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../includes/head.jsp"%>


    <link href="${context}/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="${context}/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <%--<link href="${context}/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />--%>
    <link href="${context}/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />

    <link href="${context}/assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
    <link href="${context}/assets/global/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css" />
    <!-- Include the plugin's CSS and JS: -->
    <link rel="stylesheet" href="${context}/assets/css/bootstrap-multiselect.css" type="text/css"/>

    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css" />

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
        <%@ include file="../includes/header.jsp"%>
    </div>

    <div class="clearfix"> </div>

    <div class="page-container">

        <div class="page-sidebar-wrapper" style="margin-top: 20px">

            <div class="page-sidebar md-shadow-z-2-i  navbar-collapse collapse">
                <%@ include file="../includes/menu.jsp"%>
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
                                            <span class="caption-subject"> গ্রুপ পলিছি সন ফরম</span>
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
                                        <form method="post"  id = "form" action="${context}/grouppolicyadd">
                                            <div class=" form-body">




                                                <div class="form-group col-md-12">
                                                    <label class="col-md-3 control-label" style="margin-left: -30px;"> নাম (ইংরেজিতে)</label>
                                                    <div class="col-md-6">
                                                        <div class="input-icon">

                                                            <i class="fa fa-angle-double-right tooltips "
                                                               data-original-title="please write a Name"
                                                               data-container="body"></i>

                                                            <input type="text" data-required="1" class="form-control"
                                                                   placeholder=" মেনুর নাম ইংরেজিতে"
                                                                   name="menunameeng">

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group col-md-12">
                                                    <label class="col-md-3 control-label" style="margin-left: -30px;"> নাম বাংলাতে)</label>
                                                    <div class="col-md-6">
                                                        <div class="input-icon">

                                                            <i class="fa fa-angle-double-right tooltips "
                                                               data-original-title="please write a Name"
                                                               data-container="body"></i>

                                                            <input type="text" data-required="1" class="form-control"
                                                                   placeholder=" মেনুর নাম বাংলাতে"
                                                                   name="menunamebng">

                                                        </div>
                                                    </div>
                                                </div>


                                                <%--<div class="form-group col-md-12">--%>
                                                <%--<label class="col-md-3 control-label" style="margin-left: -30px;">Office Layer Name</label>--%>
                                                <%--<div class="col-md-6">--%>
                                                <%--<select class="form-control" name="layerdata" id="layerdropdown">--%>

                                                <%--</select>--%>
                                                <%--</div>--%>
                                                <%--</div>--%>
                                                <%--<div class="form-group col-md-12">--%>
                                                <%--<label class="col-md-3 control-label" style="margin-left: -30px;">Division Name</label>--%>
                                                <%--<div class="col-md-6">--%>
                                                <%--<select class="form-control" name="divdata" id="divisiondropdown">--%>
                                                <%--<option value="-1">...</option>--%>
                                                <%--<c:forEach var="data" items="${division}">--%>
                                                <%--<option value="${data.getId()}" data-bbs = "${data.getBbsCode()}">--%>
                                                <%--${data.getDivisionNameBng()}--%>
                                                <%--</option>--%>
                                                <%--</c:forEach>--%>
                                                <%--</select>--%>
                                                <%--</div>--%>
                                                <%--</div>--%>
                                                <%--<div class="form-group col-md-12">--%>
                                                <%--<label class="col-md-3 control-label" style="margin-left: -30px;">District Name</label>--%>
                                                <%--<div class="col-md-6">--%>
                                                <%--<select class="form-control" name="disdata" id="districtdropdown">--%>

                                                <%--</select>--%>
                                                <%--</div>--%>
                                                <%--</div>--%>
                                                <%--<div class="form-group col-md-12">--%>
                                                <%--<label class="col-md-3 control-label" style="margin-left: -30px;">Office Name</label>--%>
                                                <%--<div class="col-md-6">--%>
                                                <%--<select class="form-control" name="officedata" id="officedropdown">--%>

                                                <%--</select>--%>
                                                <%--</div>--%>
                                                <%--</div>--%>
                                                <%--<div class="form-group col-md-12">--%>
                                                <%--<label class="col-md-3 control-label" style="margin-left: -30px;">Office Unit Name</label>--%>
                                                <%--<div class="col-md-6">--%>
                                                <%--<select class="form-control" name="unitdata" id="unitdropdown">--%>

                                                <%--</select>--%>
                                                <%--</div>--%>
                                                <%--</div>--%>
                                                <%--<div class="form-group col-md-12">--%>
                                                <%--<label class="col-md-3 control-label" style="margin-left: -30px;">Office Organogram Name</label>--%>
                                                <%--<div class="col-md-6">--%>
                                                <%--<select class="form-control" name="organogramdata" id="organogramdropdown">--%>

                                                <%--</select>--%>
                                                <%--</div>--%>
                                                <%--</div>--%>
                                                <%----%>




                                                <div class="form-group">

                                                    <label for="multiple" class="control-label"> অ্যাপ  বাছাই করুন </label>

                                                    <select name="appid[]" id="multiple" class="form-control select2-multiple" multiple>
                                                        <c:forEach var="app" items="${app}">
                                                            <option value="${app.getId()}">
                                                                    ${app.getNameBng()}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>


                                                <input type="hidden" name="insertedmenu[]" id ="insertedMenu"/>
                                                <input type="hidden" name="insertedapp[]" id ="insertedApp"/>

                                                <div class="form-group col-md-12" style="margin-top: 40px">

                                                    <label class="control-label col-md-12" style="width: auto">  মেনু বাছাই করুন </label>

                                                </div>
                                                <div class="form-group" style="height: 475px;">


                                                    <div class=" col-md-offset-1 col-md-10" id="jstree" style="height: 475px;overflow-y: scroll;">

                                                    </div>
                                                </div>

                                            </div>


                                            <div class="form-actions">
                                                <div class="row">
                                                    <div class=" col-md-3" style="margin-left: 40%">
                                                        <button type="submit" class="btn green">  জমা দিন</button>
                                                        <button type="button" class="btn btn-circle grey-salsa btn-outline"> বাতিল  করুন</button>

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
        <%@ include file="../includes/footer.jsp"%>
    </div>

</body>


<script>



    $(document).ready(function () {
        var geotype = $("#geotype").val();


        var previousState = [];
        var previousMenuList = [];
        var previousAppList =[];
        var state = 1;

        $('#jstree').jstree({
            'core' : {
                'data': {
                    'method':'POST',
                    'url': function (node) {

                        return   '<%=request.getContextPath()%>/menutree';
                    },
                    'data': function (node) {

                        return {'id': 1, "li_attr": "", "a_attr": ""};

                    }

                },
                'themes' : {
                    'responsive': false
                }
            },'types' : {
                'default' : {
                    'icon' : 'fa fa-folder icon-state-warning icon-lg'
                },
                'file' : {
                    'icon' : 'fa fa-file icon-state-warning icon-lg'
                }
            },
            'checkbox' : {
                'keep_selected_style': false,
                'three_state': false,
                'cascade': ''
            },
            'plugins' : [ 'types','checkbox' ]
        });

        var OKtoCascadeUp = 0;
        var OKtoCascadeDown = 0;
        var propagtionLevel = 0;
        var propagate = true;


        function CascadeUp(inNode, inCommand) {
            if (OKtoCascadeUp < 1) {
                ParentNode = $('#jstree').jstree('get_parent', inNode);
                if(ParentNode !='#' && state ==1) previousMenuList["#_"+ParentNode] = 1;
                $('#jstree').jstree(inCommand, ParentNode);
            }
        }

        function CascadeUpBack(inNode, inCommand) {
            if (propagtionLevel <= 1) {
                ParentNode = $('#jstree').jstree('get_parent', inNode);
                ChildrenNodes = jQuery.makeArray($('#jstree').jstree('get_children_dom', ParentNode));


                for(var i=0;i<ChildrenNodes.length;i++)
                {
                    var value = $("#"+ChildrenNodes[i].id).attr('aria-selected');//ChildrenNodes[i].attributes[1].nodeValue;
                    if(value == "true"){
                        propagate = false;
                    }
                }
                if(propagate){
                    propagtionLevel -=2;
                    $('#jstree').jstree(inCommand, ParentNode);
                }

            }
        }

        function CascadeDown(inNode, inCommand) {
            if (OKtoCascadeDown < 1) {
                ChildrenNodes = jQuery.makeArray($('#jstree').jstree('get_children_dom', inNode));
                if(ChildrenNodes.length !=0) $('#jstree').jstree(inCommand, ChildrenNodes);
            }
        }
        $('#jstree').on("select_node.jstree", function (e, data) {
            $('#jstree').jstree('open_node', data.node);
            OKtoCascadeDown++;
            CascadeUp(data.node, 'select_node');
            OKtoCascadeDown--;
            if(OKtoCascadeDown<1)
            {
                CascadeDown(data.node, 'open_node');
                CascadeDown(data.node, 'select_node');
            }
        });

        // Deselection Actions
        $('#jstree').on("deselect_node.jstree", function (e, data) {
            $('#jstree').jstree('open_node', data.node); //need this to have it deselect hidden nodes
            propagtionLevel ++;
            if(propagtionLevel >=1) {
                CascadeDown(data.node, 'open_node');
                CascadeDown(data.node, 'deselect_node');
            }
            if(propagate == true)CascadeUpBack(data.node, 'deselect_node');
            propagate = true;
            propagtionLevel = 0;
            // CascadeDown(data.node, 'close_node');
            // $('#jstree').jstree('close_node', data.node); //need this to have it deselect hidden nodes
        });





        $("#form").submit(function () {

            var deletedMenuList =[],insertedMenuList =[],deletedAppList = [],insertedAppList =[];
            var checked_ids = [];
            checked_ids = $("#jstree").jstree("get_selected");
            for(var i=0;i<checked_ids.length;i++){
                insertedMenuList.push(checked_ids[i]);
            }



            var selectedApp = [];
            selectedApp = $('#multiple').val();
            if(selectedApp != null) {
                for (var i = 0; i < selectedApp.length; i++) {
                     insertedAppList.push(selectedApp[i]);
                }


            }

            $('#insertedMenu').val(insertedMenuList);

            $('#insertedApp').val(insertedAppList);






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