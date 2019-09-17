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
    <link href="${context}/assets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css" />

    <style>
        .jstree-anchor {
            /*enable wrapping*/
            white-space: normal !important;
            /*ensure lower nodes move down*/
            height: auto !important;
            /*offset icon width*/
            padding-right: 24px;
        }


        .originuniticon {
            background-image: url(../assets/img/originofficebrance.png) !important;
            background-size: 100%;
            height: 30px !important;
        }

        .uniticon {
            background-image: url(../assets/img/officeuniticon.png) !important;
            background-size: 100%;
            height: 30px !important;
        }

        .modal-dialog {
            margin: 0px !important;
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
               <div class="portlet box ">
                   <div class="portlet-title">
                       <div class="caption">
                           <i class="fa fa-picture"></i>দপ্তর শাখা ব্যবস্থাপনা
                       </div>
                   </div>


                   <div class="portlet-body">
                       <div class="row">
                           <div class="col-md-4 form-group form-horizontal">
                               <label class="control-label">মন্ত্রণালয় <span class="required"> * </span></label>
                               <div class="input select">

                                   <select class="form-control" name="ministrydata" id="ministrydropdown">
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
                               <label class="control-label">দপ্তর স্তর</label>
                               <select id="layerdropdown" class="form-control select2" name="officeLayerId">
                                   <option value="">--বাছাই করুন--</option>
                               </select>
                           </div>
                           <div class="col-md-4 form-group form-horizontal">
                               <label class="control-label">দপ্তর / অধিদপ্তরের ধরন</label>
                               <select id="origindropdown" class="form-control select2" name="officeOriginId">
                                   <option value="">--বাছাই করুন--</option>
                               </select>
                           </div>
                       </div>
                       <div class="row">
                           <div class="col-md-4 form-group form-horizontal">
                               <label class="control-label"> দপ্তর </label>
                               <div class="input select">
                                   <select id="officedropdown" class="form-control" name="officeId">

                                   </select>
                               </div>
                           </div>
                       </div>
                       <div style="display: flex;justify-content: space-between;align-items: flex-start">

                           <div class="portlet light no-shadow" style="width: 49%">
                               <div class="portlet-title" style="position: relative">
                                   <div class="caption">
                                       <img src="../assets/img/brance.png" style=" margin-right:10px;   height: 30px;   width: 30px;">মৌলিক শাখার তালিকা
                                   </div>
                                   <button type="button" id="officeunitadder" class="btn btn-xs btn-success" style="position: absolute;right: 0px;" onclick="transferUnit()"><i
                                           class="fa fa-arrow-right"></i></button>
                               </div>
                               <div class="portlet-body">
                                   <div id="origin_unit_tree_panel">

                                   </div>
                               </div>
                           </div>

                           <div class="portlet light  no-shadow" style="width: 49%">
                               <div class="portlet-title" style="position: relative">
                                   <div class="caption">
                                       <img src="../assets/img/brance.png" style="   margin-right:10px;  height: 30px;   width: 30px;">
                                       দপ্তর শাখার তালিকা
                                   </div>
                                   <button type="button" id="officeunitremoval" class="btn btn-xs btn-danger" style="position: absolute;right: 0px;" onclick="deleteUnit()"><i
                                           class="fa fa-trash"></i></button>
                               </div>
                               <div class="portlet-body">
                                   <div id="office_unit_tree_panel">

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


    var originunitstorage =[];
    var unitstorage=[];
    var originidinunitstorage=[];

    
    function tranferDataFilter(idlist) {
        var list = [];
        for(var i=0;i<idlist.length;i++){
            if(originidinunitstorage['#_'+idlist[i]]==undefined)list.push(idlist[i]);
            else if(!$('#office_unit_tree_panel').jstree(true).get_node(originidinunitstorage['#_'+idlist[i]].id))list.push(idlist[i]);
        }
        return list;
    }
    
    function transferUnit(){
        var idlist = captureDataFromOriginTree();
        var list = tranferDataFilter(idlist);
        if(list.length !=0){
            $.ajax({
                type: "POST",
                url: '/transferunit',
                data: {
                    id: list,
                    officeid:$('#officedropdown').val()
                },
                async: false,
                success: function (response) {
                    data = response;
                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");

                    if(response > 0)
                    {
                        toastr.success("নতুন শাখা যুক্ত করা হয়েছে");
                        fetchData($("#officedropdown").val());
                    }
                    else  toastr.error("নতুন শাখা যুক্ত করা সম্ভব হয়নি");

                },
                error: function () {

                    toastr.error("নতুন শাখা যুক্ত করা সম্ভব হয়নি");
                }
            });
        }
        else{
           // alert('No Transfer Needed');
            toastr.error("শাখা যুক্ত করার প্রয়োজন নাই");

        }
    }
    
    function deleteUnit(){
        var idlist = captureDataFromRealTree();
        if(idlist.length !=0){
            showModal(idlist,'/deleteunitlist');
        }
        else{
            //alert("Not yet selected");
            toastr.error("শাখা নির্বাচন করুন");
        }
    }




    var previousState = [];
    var previousMenuList = [];
    var previousAppList =[];
    var OKtoCascadeUp = 0;
    var OKtoCascadeDown = 0;
    var propagtionLevel = 0;
    var propagate = true;
    var state = 1;


    function CascadeUp(jstree,inNode, inCommand) {
        if (OKtoCascadeUp < 1) {
            ParentNode = jstree.jstree('get_parent', inNode);
            if(ParentNode !='#' && state ==1) previousMenuList["#_"+ParentNode] = 1;
            jstree.jstree(inCommand, ParentNode);
        }
    }

    function CascadeUpBack(jstree,inNode, inCommand) {
        if (propagtionLevel <= 1) {
            ParentNode = jstree.jstree('get_parent', inNode);
            ChildrenNodes = jQuery.makeArray(jstree.jstree('get_children_dom', ParentNode));


            for(var i=0;i<ChildrenNodes.length;i++)
            {

                var value = $("#"+ChildrenNodes[i].id).attr('aria-selected');
                if(value == "true"){
                    propagate = false;
                }
            }
            if(propagate){
                propagtionLevel -=2;
                jstree.jstree(inCommand, ParentNode);
            }

        }
    }

    function CascadeDown(jstree,inNode, inCommand) {
        if (OKtoCascadeDown < 1) {
            ChildrenNodes = jQuery.makeArray(jstree.jstree('get_children_dom', inNode));
            if(ChildrenNodes.length !=0) jstree.jstree(inCommand, ChildrenNodes);
        }
    }




    
    
    function captureDataFromOriginTree() {
        var checked_ids = [];
        checked_ids = $("#origin_unit_tree_panel").jstree("get_selected");
        return checked_ids;
    }
    
    
    function captureDataFromRealTree() {
        var checked_ids = [];
        checked_ids = $("#office_unit_tree_panel").jstree("get_selected");
        return checked_ids;
    }






    function childList1(parentId,data) {
        var  childs =[];
        for(var i=0; i<data.length; i++){
            if(data[i].parentUnitId == parentId)childs.push(data[i]);
        }
        return childs;
    }

    function layerStructure1(id, data) {
        var jsonforjstree = '[' ;
        var childs= childList1(id,data);
        for(var i=0;i<childs.length;i++){
            jsonforjstree += '{ "id" : "'+childs[i].id+'",';
            var checkChild = childList1(childs[i].id,data);
//            if(checkChild.length ==0)jsonforjstree += '  "text" : "'+childs[i].unitNameBng+'<a  title=\'এই স্তরটি বাতিল করুন\' class=\'red equ\'  onclick=showModal(\''+childs[i].id+'\',\'/deleteoriginunit\')><i class=\'fa fa fa-minus-circle\'></i></a>",';
            /*else*/ jsonforjstree += '  "text" : "'+childs[i].unitNameBng.trim()+'",';
            jsonforjstree += '  "icon" : "originuniticon",';
            jsonforjstree += '  "li_attr" : {"ul" : "'+childs[i].unitLevel+'","ouc" : "'+childs[i].officeUnitCategory.trim()+'","maxlevel" : "'+childs.length+'","bng" : "'+childs[i].unitNameBng.trim()+'","eng" : "'+childs[i].unitNameEng.trim()+'"},';
//            jsonforjstree += '  "children" : '+layerStructure1(childs[i].id,data)+'},';
            jsonforjstree += (childs.length - 1 == i) ? '"children" : ' + layerStructure1(childs[i].id, data) + '}' : '  "children" : ' + layerStructure1(childs[i].id, data) + '},';
        }

        jsonforjstree += ']';
        return jsonforjstree;
    }


    function createJSTrees1(jsonData) {
        $('#origin_unit_tree_panel').jstree('destroy');
        $('#origin_unit_tree_panel').jstree({
            'core' : {
                'data' : jsonData
            },
            'checkbox' : {
                'keep_selected_style': false,
                'three_state': false,
                'cascade': ''
            },
            'plugins': ['themes', 'json_data', 'ui', 'checkbox']
        });
        $('#origin_unit_tree_panel').on('ready.jstree', function() {
//            $('#origin_unit_tree_panel').jstree("refresh");
            $("#origin_unit_tree_panel").jstree("open_all");
        });

        $('#origin_unit_tree_panel').on("select_node.jstree", function (e, data) {
            $('this').jstree('open_node', data.node);
            OKtoCascadeDown++;
            CascadeUp($(this),data.node, 'select_node');
            OKtoCascadeDown--;
            if(OKtoCascadeDown<1)
            {
                CascadeDown($(this),data.node, 'open_node');
                CascadeDown($(this),data.node, 'select_node');
            }
        });

        // Deselection Actions
        $('#origin_unit_tree_panel').on("deselect_node.jstree", function (e, data) {
            $(this).jstree('open_node', data.node); //need this to have it deselect hidden nodes
            propagtionLevel ++;
            if(propagtionLevel >=1) {
                CascadeDown($(this),data.node, 'open_node');
                CascadeDown($(this),data.node, 'deselect_node');
            }
            if(propagate == true)CascadeUpBack($(this),data.node, 'deselect_node');
            propagate = true;
            propagtionLevel = 0;
            // CascadeDown(data.node, 'close_node');
            // $('#jstree').jstree('close_node', data.node); //need this to have it deselect hidden nodes
        });


//        // Selection Actions
//        $('#origin_unit_tree_panel').on("select_node.jstree", function (e, data) {
//            $('#origin_unit_tree_panel').jstree('open_node', data.node);
//            ParentNode = $('#origin_unit_tree_panel').jstree('get_parent', data.node);
//            $('#origin_unit_tree_panel').jstree('select_node', ParentNode);
//        });
//
//        // Deselection Actions
//        $('#origin_unit_tree_panel').on("deselect_node.jstree", function (e, data) {
//            $('#origin_unit_tree_panel').jstree('open_node', data.node); //need this to have it deselect hidden nodes
//            ChildrenNodes = jQuery.makeArray($('#origin_unit_tree_panel').jstree('get_children_dom', data.node));
//            $('#origin_unit_tree_panel').jstree('deselect_node', ChildrenNodes);
////            $('#origin_unit_tree_panel').jstree('close_node', data.node);
//        });


    }


    function childList2(parentId,data) {
        var  childs =[];
        for(var i=0; i<data.length; i++){
            if(data[i].parentUnitId == parentId)childs.push(data[i]);
        }
        return childs;
    }

    function layerStructure2(id, data) {


        var jsonforjstree = '[' ;
        var childs= childList2(id,data);
        for(var i=0;i<childs.length;i++){
            jsonforjstree += '{ "id" : "'+childs[i].id+'",';
            var checkChild = childList2(childs[i].Id,data);
//            if(checkChild.length ==0)jsonforjstree += '  "text" : "'+childs[i].unitNameBng+'<a  title=\'এই স্তরটি বাতিল করুন\' class=\'red equ\'  onclick=showModal(\''+childs[i].id+'\',\'/deleteoriginunit\')><i class=\'fa fa fa-minus-circle\'></i></a>",';
            /*else*/ jsonforjstree += '  "text" : "'+childs[i].unitNameBng.trim()+'",';
            jsonforjstree += '  "icon" : "uniticon",';
            jsonforjstree += '  "li_attr" : {"ul" : "'+childs[i].unitLevel+'","ouc" : "'+childs[i].officeUnitCategory.trim()+'","maxlevel" : "'+childs.length+'","bng" : "'+childs[i].unitNameBng.trim()+'","eng" : "'+childs[i].unitNameEng.trim()+'"},';
//            jsonforjstree += '  "children" : '+layerStructure1(childs[i].id,data)+'},';
            jsonforjstree += (childs.length - 1 == i) ? '"children" : ' + layerStructure2(childs[i].id, data) + '}' : '  "children" : ' + layerStructure2(childs[i].id, data) + '},';
        }

        jsonforjstree += ']';
        return jsonforjstree;
    }


    function createJSTrees2(jsonData) {
        $('#office_unit_tree_panel').jstree('destroy');
        $('#office_unit_tree_panel').jstree({
            'core' : {
                'data' : jsonData
            },
            'plugins': ['themes', 'json_data', 'ui', 'checkbox']
        });
        $('#office_unit_tree_panel').on('ready.jstree', function() {
//            $('#origin_unit_tree_panel').jstree("refresh");
            $("#office_unit_tree_panel").jstree("open_all");
        });

    }
    function showModal(id, url) {
        bootbox.confirm({
            message: '<p class="text-center">আপনি কি এই শাখাগুলো বাতিল করতে চান?</p>',
            title: "শাখা বাতিল",
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
                        type: "GET",
                        url: url,
                        data: {
                            id: id
                        },
                        async: false,
                        success: function (response) {
                           // data = response;
                            $('.modal.in .modal-dialog').hide();
                            $(".modal.in .modal-dialog .btn").off("click");

//                            if(response > 0)
//                            {
//                                toastr.success("শাখা বাতিল করা হয়েছে");
//
//                            }
//                            else  toastr.error("শাখা বাতিল করা সম্ভব হয়নি");

                            if(response ==1)
                            {
                                fetchData($("#officedropdown").val());
                                toastr.success("শাখাগুলো সফলভাবে মুছে ফেলা হয়েছে ","সার্থক");

                            }
                            else if(response ==2)
                            {
                                toastr.error(" আপনি যে শাখাগুলো মুছতে চাইছেন সেটির আরো শাখা /পদ আছে এই শাখাগুলো  মুছতে হলে এর নিচের সব শাখা/পদ প্রথমে মুছে নিন ","দুঃখিত");
                            }
                            else
                            {
                                toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ","দুঃখিত");
                            }
                        },
                        error: function () {

                            $('.modal.in .modal-dialog').hide();
                            $(".modal.in .modal-dialog .btn").off("click");
                            toastr.options = {
                                "closeButton": true,
                                "debug": false,
                                "positionClass": "toast-bottom-right"
                            };
                            toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ","দুঃখিত");
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

         previousState = [];
         previousMenuList = [];
         previousAppList =[];
         OKtoCascadeUp = 0;
         OKtoCascadeDown = 0;
         propagtionLevel = 0;
         propagate = true;
         state = 1;

        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/originunitsbyorigin",
            data: {
                id: $("#origindropdown").val()
            },
            async: false,
            success: function (response) {
                response.sort(function (a,b) {
                    return a.unitLevel - b.unitLevel;
                });

                originunitstorage = response;
                var lStructure = layerStructure1(0, response);
                var myJsonString = JSON.parse(lStructure);
                createJSTrees1(myJsonString);
                
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
            url: "<%=request.getContextPath()%>/officeunitbyoffice",
            data: {
                id: value
            },
            async: false,
            success: function (response) {
                response.sort(function (a,b) {
                    return a.unitLevel - b.unitLevel;
                });
                originidinunitstorage = [];
                for(var i=0;i<response.length;i++){
                    originidinunitstorage['#_'+response[i].officeOriginUnitId] = response[i];
                }
                unitstorage = response;
                var lStructure = layerStructure2(0, response);
                console.log(lStructure);
                var myJsonString = JSON.parse(lStructure);
                createJSTrees2(myJsonString);
                
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
        $('#ministrydropdown').change(function() {
            var data = "";
            $.ajax({
                type:"GET",
                url : "<%=request.getContextPath()%>/layersbyministries",
                data : {
                    id: $(this).val()
                },
                async: false,
                success : function(response) {
                    data = response;
                    var select = $('#layerdropdown');
                    select.empty();
                    select.append($('<option></option>').val(-1).html('--বাছাই করুন---'));
                    $.each(data, function(index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.layerNameBng)
                        );
                    });

                    $('#origindropdown').empty();
                    $('#officedropdown').empty();
                    $('#origin_unit_tree_panel').jstree('destroy');
                    $('#office_unit_tree_panel').jstree('destroy');
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

        $('#layerdropdown').change(function() {
            var data = "";
            $.ajax({
                type:"GET",
                url : "<%=request.getContextPath()%>/originsbylayer",
                data : {
                    id: $(this).val()
                },
                async: false,
                success : function(response) {
                    data = response;
                    var select = $('#origindropdown');
                    select.empty();
                    select.append($('<option></option>').val(-1).html('--বাছাই করুন---'));
                    $.each(data, function(index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.officeNameBng)
                        );
                    });
                    $('#officedropdown').empty();
                    $('#origin_unit_tree_panel').jstree('destroy');
                    $('#office_unit_tree_panel').jstree('destroy');

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

        $('#origindropdown').change(function() {

            var data = "";
            $.ajax({
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
                    select.append($('<option></option>').val(-1).html('--বাছাই করুন---'));
                    $.each(data, function(index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.officeNameBng)
                        );
                    });

                    $('#origin_unit_tree_panel').jstree('destroy');
                    $('#office_unit_tree_panel').jstree('destroy');
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

        $('#officedropdown').change(function () {
            fetchData($(this).val());
        });

    });

</script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
</body>
<!-- END BODY -->
</html>
