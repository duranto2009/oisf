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

        .officechair {
            background-image: url(../assets/img/officechair.png) !important;
            background-size: 100%;
            height: 30px !important;
        }

        .realofficechair {
            background-image: url(../assets/img/realofficechair.png) !important;
            background-size: 100%;
            height: 30px !important;
        }

        .employee {
            background-image: url(../assets/img/employee.png) !important;
            background-size: 100%;
            height: 30px !important;
        }

        .realemployee {
            background-image: url(../assets/img/realemployee.png) !important;
            background-size: 100%;
            height: 30px !important;
        }

        .modal-dialog {
            margin: 0px !important;
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
                           <i class="fa fa-picture"></i>দপ্তরের পদ  ব্যবস্থাপনা
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
                               <label class="control-label">দপ্তরের স্তর</label>
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

                           <div class="portlet light col-md-6 no-shadow" style="width: 49%">
                               <div class="portlet-title" style="position: relative">
                                   <div class="caption">
                                       <img src="../assets/img/brance.png" style="  margin-right:10px;  height: 30px;   width: 30px;">মৌলিক পদ তালিকা
                                   </div>
                                   <div class="tools">
                                       <button type="button" id="officeOrgTransfer" class="btn btn-xs btn-success" style="position: absolute;right: 0px;" onclick="transferOrganogram()"><i
                                               class="fa fa-arrow-right"></i></button>
                                   </div>
                               </div>
                               <div class="portlet-body">
                                   <div id="origin_organogram_tree_panel">

                                   </div>
                               </div>
                           </div>
                           <div class="portlet light col-md-6 no-shadow" style="width: 49%">
                               <div class="portlet-title" style="position: relative">
                                   <div class="caption">
                                       <img src="../assets/img/brance.png" style=" margin-right:10px;   height: 30px;   width: 30px;">দপ্তরের পদের তালিকা
                                   </div>
                                   <button type="button" id="officeunitremoval" class="btn btn-xs btn-danger" style="position: absolute;right: 0px;" onclick="deleteOrganogram()"><i
                                           class="fa fa-trash"></i></button>
                               </div>
                               <div class="portlet-body">
                                   <div id="office_organogram_tree_panel">

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

    var officeunitorganogramstorage=[];
    var originorgtoorgidmapping =[];

    var officeoriginunitstorage =[];
    var originunittounitmapping =[];

    var originorganogramstorage =[];
    var superiorunittounitidmappinginorigin =[];

    var flag=0;

    function tranferDataFilter(idlist) {
        var list = [];
        for(var i=0;i<idlist.length;i++){
            var id_formatted;
            var officeoriginbyid = originorganogramstorage['#_'+idlist[i]];
            var officeoriginunit = officeoriginunitstorage['#_'+officeoriginbyid.officeOriginUnitId];
            var officeunit = originunittounitmapping['#_'+officeoriginunit.id];
            if(officeunit == undefined){
                //alert("There is no correspondint unit")

                flag=1;
            }
            else {
                if (originorgtoorgidmapping['#_' + idlist[i]] == undefined) {
                    id_formatted = idlist[i] + ':' + officeoriginbyid.superiorDesignationId + ':' + officeoriginunit.id + ':' + officeoriginunit.parentUnitId + ':?:?:' + officeunit.id + ':' + officeunit.parentUnitId;
                    list.push(id_formatted);
                }
                else if (!$('#office_organogram_tree_panel').jstree(true).get_node(originorgtoorgidmapping['#_' + idlist[i]].id + '_org')) {
                    id_formatted = idlist[i] + ':' + officeoriginbyid.superiorDesignationId + ':' + officeoriginunit.id + ':' + officeoriginunit.parentUnitId + ':?:?:' + officeunit.id + ':' + officeunit.parentUnitId;
                    list.push(id_formatted);
                }
            }
        }
        return list;
    }

    function transferOrganogram(){
        var id_taglist = captureDataFromOriginTree();
        var idlist =[];
        var splited;
        for(var i=0;i<id_taglist.length;i++){
            splited = id_taglist[i].split('_');
            if(splited[1]=='org'){
                idlist.push(parseInt(splited[0]));
            }
        }
        var list = tranferDataFilter(idlist);
        if(list.length !=0){
            $.ajax({
                type: "POST",
                url: '/transferorganogram',
                data: {
                    id: list,
                    officeid:$('#officedropdown').val()
                },
                async: false,
                success: function (response) {
                    //data = response;
                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");

                    if(response > 0)
                    {
                        toastr.success("নতুন পদ যুক্ত করা হয়েছে");
                        fetchData($("#officedropdown").val());
                    }
                    else  toastr.error("নতুন পদ যুক্ত করা সম্ভব হয়নি");
                },
                error: function () {
                    toastr.error("নতুন পদ যুক্ত করা সম্ভব হয়নি");
                }
            });
        }
        else{
            //alert('No Transfer Needed');
            if(flag==1)
            {
                toastr.error("কোন অনুরূপ শাখা খুঁজে পাওয়া যায়নি");
                flag=0;
            }
            else toastr.error("পদ যুক্ত করার প্রয়োজন নাই");
            //flag=0;
        }
    }

    function deleteOrganogram(){
        var id_taglist = captureDataFromRealTree();
        var idlist =[];
        var splited;
        for(var i=0;i<id_taglist.length;i++){
            splited = id_taglist[i].split('_');
            if(splited[1]=='org'){
                idlist.push(parseInt(splited[0]));
            }
        }
        if(idlist.length !=0){
            showModal(idlist,'/deleteorganogramlist');
        }
        else{
            //alert("Not yet selected");
            toastr.error("পদ নির্বাচন করুন");
        }
    }


    function captureDataFromOriginTree() {
        var checked_ids = [];
        checked_ids = $("#origin_organogram_tree_panel").jstree("get_selected");
        return checked_ids;
    }


    function captureDataFromRealTree() {
        var checked_ids = [];
        checked_ids = $("#office_organogram_tree_panel").jstree("get_selected");
        return checked_ids;
    }





    function childList(parentId,data,valuename) {
        var  childs =[];
        var temp ;
        for(var i=0; i<data.length; i++){
            temp = data[i];
            if(temp[valuename] == parentId)childs.push(data[i]);
        }
        return childs;
    }

    function childOrgList(parentId,data) {
        var  childs =[];
        for(var i=0; i<data.length; i++){
            if(data[i].superiorDesignationId == parentId)childs.push(data[i]);
        }
        return childs;
    }

    function orgbyunitid(unitid,data,valuename) {
        var  childs =[];
        var temp;
        for(var i=0; i<data.length; i++){
            temp = data[i];
            if(temp[valuename] == unitid)childs.push(data[i]);
        }
        return childs;
    }

    function filterOrg() {
        var $original = $("#unit_tree_expand_view");
        var selected = $('#superior_unit_id',$original).val();
        var $superiorDesId = $('#superior_designation_id',$original);
        $superiorDesId.empty();
        $superiorDesId.append($('<option></option>').val(0).html('--বাছাই করুন---'));
        var data = orgbyunitid(selected,organogramlist,'officeOriginUnitId');
        $.each(data, function(index, value) {
            $superiorDesId.append(
                $('<option></option>').val(value.id).html(value.designationBng)
            );
        });
    }
    function organogram(parentid, data, id) {
        var orgforjstree = '[';
        var childs = childOrgList(parentid,data);
        for(var i=0;i<childs.length;i++){
            orgforjstree += '{ "id" : "'+childs[i].id+'_org",';
            var checkChild = childOrgList(childs[i].id,data);
            if(checkChild.length ==0)orgforjstree += '  "text" : "'+childs[i].designationBng+'<a  title=\'এই স্তরটি বাতিল করুন\' class=\'red equ\'  onclick=showModal(\''+childs[i].id+'\',\'/deleteoriginunitorganogram\')><i class=\'fa fa fa-minus-circle\'></i></a>",';
            else orgforjstree += '  "text" : "'+childs[i].designationBng+'",';
            orgforjstree += '  "icon" : "icon icon-arrow-right",';
            orgforjstree += '  "li_attr" : {"dl" : "'+childs[i].designationLevel+'","ds" : "'+childs[i].designationSequence+'","maxlevel" : "'+childs.length+'","bng" : "'+childs[i].designationBng+'","eng" : "'+childs[i].designationEng+'","edit" : "1","id" : "'+childs[i].id+'","sdi" : "'+childs[i].superiorDesignationId+'","sui" : "'+childs[i].superiorUnitId+'","ooui" : "'+childs[i].officeOriginUnitId+'","snb" : "'+childs[i].shortNameBng+'","sne" : "'+childs[i].shortNameEng+'"},';
            orgforjstree += '  "children" : '+organogram(childs[i].id,data,id)+'},';
        }
        orgforjstree += '{  "text" : "<a  title=\'এই স্তরটি বাতিল করুন\' class=\'red equ\'><i class=\'icon icon-plus\'></i></a>",';
        orgforjstree += '  "icon" : "employee",';
        orgforjstree += '  "li_attr" : {"ooui" : "'+id+'"},';
        orgforjstree += '  "children" : []}';


        orgforjstree += ']';
        return orgforjstree;
    }
    function organogram(data, id) {
        data.sort(function (a,b) {
            return a.designationSequence - b.designationSequence;
        });
        var orgforjstree = '[';
        for(var i=0;i<data.length;i++){
            orgforjstree += '{ "id" : "'+data[i].id+'_org",';
            orgforjstree += '  "text" : "'+data[i].designationBng+'",';
            orgforjstree += '  "icon" : "employee",';
            orgforjstree += '  "li_attr" : {"dl" : "'+data[i].designationLevel+'","ds" : "'+data[i].designationSequence+'","maxlevel" : "'+data.length+'","bng" : "'+data[i].designationBng+'","eng" : "'+data[i].designationEng+'","edit" : "1","id" : "'+data[i].id+'","sdi" : "'+data[i].superiorDesignationId+'","sui" : "'+data[i].superiorUnitId+'","ooui" : "'+data[i].officeOriginUnitId+'","snb" : "'+data[i].shortNameBng+'","sne" : "'+data[i].shortNameEng+'"},';
            orgforjstree += (i!=data.length-1)?'  "children" : []},':'  "children" : []}';
        }



        orgforjstree += ']';
        return orgforjstree;
    }
    function officeStructure(id, units, organograms) {
        var jsonforjstree = '[' ;
        var childs= childList(id,units,'parentUnitId');
        var org ='';
        if(id!=0) {
            var orgs = orgbyunitid(id, organograms,'officeOriginUnitId');
            org = '{ "id" : "' + id + '_orgs",';
            org += '  "text" : "পদ",';
            org += '  "icon" : "officechair",';
            org += (childs.length !=0)?'  "children" : ' + organogram(orgs ,id) + '},': '  "children" : ' + organogram(orgs, id) + '}';
        }
        jsonforjstree +=org;
        for(var i=0;i<childs.length;i++){
            jsonforjstree += '{ "id" : "'+childs[i].id+'_unit",';
            var checkChild = childList(childs[i].id,data,'parentUnitId');
            jsonforjstree += '  "text" : "'+childs[i].unitNameBng+'",';
            jsonforjstree += '  "icon" : "originuniticon",';
            jsonforjstree += (i!=childs.length-1)?'  "children" : '+officeStructure(childs[i].id,units,organograms)+'},': '  "children" : '+officeStructure(childs[i].id,units,organograms)+'}';
        }
        jsonforjstree += ']';
        return jsonforjstree;
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
        checked_ids = $("#origin_organogram_tree_panel").jstree("get_selected");
        return checked_ids;
    }


    function captureDataFromRealTree() {
        var checked_ids = [];
        checked_ids = $("#office_organogram_tree_panel").jstree("get_selected");
        return checked_ids;
    }


    function createJSTrees1(jsonData) {
        $('#origin_organogram_tree_panel').jstree('destroy');
        $('#origin_organogram_tree_panel').jstree({
            'core' : {
                'data' : jsonData,
                'dblclick_toggle' : false
            },
            'checkbox' : {
                'keep_selected_style': false,
                'three_state': false,
                'cascade': ''
            },
            'plugins': ['themes', 'json_data', 'ui', 'checkbox']
        });
        $('#origin_organogram_tree_panel').on('ready.jstree', function() {
//            $('#origin_organogram_tree_panel').jstree("refresh");
//            $("#origin_organogram_tree_panel").jstree("open_all");
        });

        $('#origin_organogram_tree_panel').on("select_node.jstree", function (e, data) {
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
        $('#origin_organogram_tree_panel').on("deselect_node.jstree", function (e, data) {
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
//        $('#origin_organogram_tree_panel').on("select_node.jstree", function (e, data) {
//            $('#origin_organogram_tree_panel').jstree('open_node', data.node);
//            ParentNode = $('#origin_organogram_tree_panel').jstree('get_parent', data.node);
//            $('#origin_organogram_tree_panel').jstree('select_node', ParentNode);
//        });
//
//        // Deselection Actions
//        $('#origin_organogram_tree_panel').on("deselect_node.jstree", function (e, data) {
//            $('#origin_organogram_tree_panel').jstree('open_node', data.node); //need this to have it deselect hidden nodes
//            ChildrenNodes = jQuery.makeArray($('#origin_organogram_tree_panel').jstree('get_children_dom', data.node));
//            $('#origin_organogram_tree_panel').jstree('deselect_node', ChildrenNodes);
////            $('#origin_organogram_tree_panel').jstree('close_node', data.node);
//        });


    }


    function createJSTrees2(jsonData) {
        $('#office_organogram_tree_panel').jstree('destroy');
        $('#office_organogram_tree_panel').jstree({
            'core' : {
                'data' : jsonData,
                'dblclick_toggle' : false
            },
            'plugins': ['themes', 'json_data', 'ui', 'checkbox']
        });
        $('#office_organogram_tree_panel').on('ready.jstree', function() {
//            $('#origin_unit_tree_panel').jstree("refresh");
//            $("#office_organogram_tree_panel").jstree("open_all");
        });

    }

    function realOrganogram(data, id) {
        data.sort(function (a,b) {
            return a.designationSequence - b.designationSequence;
        });
        var orgforjstree = '[';
        for(var i=0;i<data.length;i++){
            orgforjstree += '{ "id" : "'+data[i].id+'_org",';
            orgforjstree += '  "text" : "'+data[i].designationBng+'",';
            orgforjstree += '  "icon" : "realemployee",';
//            orgforjstree += '  "li_attr" : {"dl" : "'+data[i].designationLevel+'","ds" : "'+data[i].designationSequence+'","maxlevel" : "'+data.length+'","bng" : "'+data[i].designationBng+'","eng" : "'+data[i].designationEng+'","edit" : "1","id" : "'+data[i].id+'","sdi" : "'+data[i].superiorDesignationId+'","sui" : "'+data[i].superiorUnitId+'","ooui" : "'+data[i].officeOriginUnitId+'","snb" : "'+data[i].shortNameBng+'","sne" : "'+data[i].shortNameEng+'"},';
            orgforjstree += (i!=data.length-1)?'  "children" : []},':'  "children" : []}';
        }



        orgforjstree += ']';
        return orgforjstree;
    }


    function realOfficeOrganogramStructure(id,units, organograms) {
        var jsonforjstree = '[' ;
        var childs= childList(id,units,'parentUnitId');
        var org ='';
        if(id!=0) {
            var orgs = orgbyunitid(id, organograms,'officeUnitId');
            org = '{ "id" : "' + id + '_orgs",';
            org += '  "text" : "পদ",';
            org += '  "icon" : "realofficechair",';
            org += (childs.length !=0)?'  "children" : ' + realOrganogram(orgs ,id) + '},': '  "children" : ' + realOrganogram(orgs, id) + '}';
        }
        jsonforjstree +=org;
        for(var i=0;i<childs.length;i++){
            jsonforjstree += '{ "id" : "'+childs[i].id+'_unit",';
            jsonforjstree += '  "text" : "'+childs[i].unitNameBng+'",';
            jsonforjstree += '  "icon" : "uniticon",';
            jsonforjstree += (i!=childs.length-1)?'  "children" : '+realOfficeOrganogramStructure(childs[i].id,units,organograms)+'},': '  "children" : '+realOfficeOrganogramStructure(childs[i].id,units,organograms)+'}';
        }
        jsonforjstree += ']';
        return jsonforjstree;
    }

    function showModal(id, url) {
        bootbox.confirm({
            message: '<p class="text-center">আপনি কি এই শাখাগুলো বাতিল করতে চান?</p>',
            title: "পদ বাতিল",
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
                        url: url,
                        data: {
                            id: id
                        },
                        async: false,
                        success: function (response) {
                            //data = response;
                            $('.modal.in .modal-dialog').hide();
                            $(".modal.in .modal-dialog .btn").off("click");

//                            if(response > 0)
//                            {
//                                toastr.success("পদ বাতিল করা হয়েছে");
//                                fetchData($("#officedropdown").val());
//                            }
//                            else  toastr.error("পদ বাতিল করা সম্ভব হয়নি");

                            if(response ==1)
                            {
                                fetchData($("#officedropdown").val());
                                toastr.success("পদগুলো সফলভাবে মুছে ফেলা হয়েছে ","সার্থক");

                            }
                            else if(response ==2)
                            {
                                toastr.error(" আপনি যে পদগুলো মুছতে চাইছেন সেটির আরো শাখা /পদ আছে এই পদগুলো  মুছতে হলে এর নিচের সব শাখা/পদ প্রথমে মুছে নিন ","দুঃখিত");
                            }
                            else
                            {
                                toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ","দুঃখিত");
                            }
                        },
                        error: function () {
                            $('.modal.in .modal-dialog').hide();
                            $(".modal.in .modal-dialog .btn").off("click");
//                            toastr.error("পদ বাতিল করা সম্ভব হয়নি");
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

//         officeunitorganogramstorage=[];
//         originorgtoorgidmapping =[];
//
//         officeoriginunitstorage =[];
//         originunittounitmapping =[];
//
//         originorganogramstorage =[];
//         superiorunittounitidmappinginorigin =[];


         previousState = [];
         previousMenuList = [];
         previousAppList =[];
         OKtoCascadeUp = 0;
         OKtoCascadeDown = 0;
         propagtionLevel = 0;
         propagate = true;
         state = 1;


        $.ajax({
            type:"GET",
            url : "<%=request.getContextPath()%>/originunitsbyorigin",
            data : {
                id: $("#origindropdown").val()
            },
            async: false,
            success : function(response) {//unit list
                response.sort(function (a,b) {
                    return a.unitLevel - b.unitLevel;
                });

                var unitidlist =[];
                for(var i =0; i<response.length;i++){
                    unitidlist.push(response[i].id);
                    officeoriginunitstorage['#_'+response[i].id]=response[i];
                }

                $.ajax({
                    type:"GET",
                    url:"<%=request.getContextPath()%>/originunitorganogramsbyoriginunits",
                    data:{
                        ids:unitidlist
                    },
                    async:true,
                    success:function (secresponse) {//organogram list
                        secresponse.sort(function (a,b) {
                            return a.designationSequence - b.designationSequence;
                        });
                        for(var i=0;i<secresponse.length;i++){
                            originorganogramstorage["#_"+secresponse[i].id] = secresponse[i];
                        }

                        var oStructure = officeStructure(0,response,secresponse);
                        var myJsonString = JSON.parse(oStructure);
                        createJSTrees1(myJsonString);

                    },
                    error:function () {
                        alert('second response error');
                    }

                });
            },
            error: function() {

            }
        });




        $.ajax({
            type:"GET",
            url : "<%=request.getContextPath()%>/officeunitbyoffice",
            data : {
                id: value
            },
            async: true,
            success : function(response) {//unit list
                response.sort(function (a,b) {
                    return a.unitLevel - b.unitLevel;
                });

                officeunitstorage =[];
                officeunitstorage=response;
                for(var i=0;i<response.length;i++){
                    originunittounitmapping['#_'+response[i].officeOriginUnitId] = response[i];
                }

                $.ajax({
                    type:"GET",
                    url:"<%=request.getContextPath()%>/officeunitorganogrambyoffice",
                    data:{
                        id:value
                    },
                    async:false,
                    success:function (secresponse) {//organogram list

                        secresponse.sort(function (a,b) {
                            return a.designationSequence - b.designationSequence;
                        });


                        officeunitorganogramstorage = [];
                        officeunitorganogramstorage = secresponse;

                        for(var i=0;i<secresponse.length;i++){
                        originorgtoorgidmapping['#_'+secresponse[i].refOriginUnitOrgId] = secresponse[i];
                        }


                        var oStructure = realOfficeOrganogramStructure(0,response,secresponse);
                        var myJsonString = JSON.parse(oStructure);
                        createJSTrees2(myJsonString);

                    },
                    error:function () {
                        alert('second response error');
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
                    $('#office_organogram_tree_panel').jstree('destroy');
                    $('#origin_organogram_tree_panel').jstree('destroy');
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
                    $('#office_organogram_tree_panel').jstree('destroy');
                    $('#origin_organogram_tree_panel').jstree('destroy');
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
                    $('#office_organogram_tree_panel').jstree('destroy');
                    $('#origin_organogram_tree_panel').jstree('destroy');
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
