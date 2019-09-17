<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



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
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../../includes/head.jsp" %>
    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css" />

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
               <div class="portlet box " >
                   <div class="portlet-title">
                       <div class="caption">
                           <i class="fa fa-picture"></i>Organogram Management
                       </div>
                   </div>


                   <div class="portlet-body">

                       <div class="row">
                           <div class="col-md-4 form-group form-horizontal">
                               <label class="control-label">মন্ত্রণালয়</label>
                               <select id="ministrydropdown" class="form-control select2" name="officeMinistryId">
                                   <option value="-1">...</option>
                                   <c:forEach var="ministry" items="${ministry}">
                                       <option value="${ministry.getId()}">
                                               ${ministry.getNameBng()}
                                       </option>
                                   </c:forEach>

                               </select>
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
                       <div id="unit_tree_div" class="row" style="display:block;">
                           <div class="col-md-6">
                               <div class="portlet light no-shadow">
                                   <div class="portlet-title">
                                       <div class="caption">
                                           <i class=""></i>পদ কাঠামো
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
                   </div>
               </div>
           </div>

            <input type="hidden" id="menuid" value="${menuid}">
            <div id="editform" style="display: none">
                <div class="portlet light no-shadow">
                    <div class="portlet-title">
                        <div class="caption"><i class=""></i>পদ সম্পাদন</div>
                    </div>
                    <div class="portlet-body form"><br><br>


                        <form id="OfficeOriginUnitOrganogramEditForm" accept-charset="utf-8" method="post">
                            <input type="hidden"  name="id" id="id">
                            <div class="form-horizontal">

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">উর্ধ্বতন শাখা</label>

                                    <div class="col-sm-7">
                                        <select id="superior_unit_id" class="form-control" name="superior_unit_id" onchange="filterOrg()">
                                            <option value="0">---বাছাই করুন---</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">উর্ধ্বতন পদ</label>

                                    <div class="col-sm-7">
                                        <select id="superior_designation_id" class="form-control" name="superior_designation_id">
                                            <option value="0">---বাছাই করুন---</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">নাম</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="designation_bng" class="form-control"  name="designation_bng">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">নাম (ইংরেজি)</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="designation_eng" class="form-control"  name="designation_eng">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">সংক্ষিপ্ত নাম</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="short_name_bng" class="form-control" name="short_name_bng">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">সংক্ষিপ্ত  নাম (ইংরেজি)</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="short_name_eng" class="form-control" name="short_name_eng">
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-5 control-label">পদের স্তর</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="designation_level" class="form-control"  name="designation_level">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">পদের ক্রম</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="designation_sequence" class="form-control"  name="designation_sequence">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-9">
                                        <button class="btn" style="background-color: #8dc542" onclick="editNode()" type="button">
                                            সংরক্ষণ
                                        </button>
                                        <button class="btn default btnClose" onclick="cancel()" type="button">বাতিল</button>
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
                        <div class="caption"><i class=""></i>নতুন পদ</div>
                    </div>
                    <div class="portlet-body form"><br><br>
                        <form id="OfficeOriginUnitOrganogramAddForm" accept-charset="utf-8" method="post">
                            <input type="hidden"  id="office_origin_unit_id" name="office_origin_unit_id">
                            <div class="form-horizontal">

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">উর্ধ্বতন শাখা</label>

                                    <div class="col-sm-7">
                                        <select id="superior_unit_id" class="form-control" name="superior_unit_id" onchange="filterOrg()">
                                            <option value="0">---বাছাই করুন---</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">উর্ধ্বতন পদ</label>

                                    <div class="col-sm-7">
                                        <select id="superior_designation_id" class="form-control" name="superior_designation_id">
                                            <option value="0">---বাছাই করুন---</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">নাম</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="designation_bng" class="form-control" name="designation_bng">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">নাম (ইংরেজি)</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="designation_eng" class="form-control" name="designation_eng">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">সংক্ষিপ্ত নাম</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="short_name_bng" class="form-control" name="short_name_bng">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">সংক্ষিপ্ত নাম (ইংরেজি)</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="short_name_eng" class="form-control" name="short_name_eng">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">পদের স্তর</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="designation_level" class="form-control" name="designation_level">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">পদের ক্রম</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="designation_sequence" class="form-control" name="designation_sequence">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-9">
                                        <button class="btn" style="background-color: #8dc542" onclick="addNode()" type="button">
                                            সংরক্ষণ
                                        </button>
                                        <button class="btn default btnClose" onclick="cancel()" type="button">বাতিল</button>
                                    </div>
                                </div>
                            </div>
                        </form>
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


<script>

    var previousselectedunit='';
    var unitlist,organogramlist;


    function cancel() {
        $("#unit_tree_expand_view").html("");
        $("#unit_tree_expand_view").hide();
    }
    function addNode() {

        var formData = {
            'officeoriginunitid'               : $('#unit_tree_expand_view input[name=office_origin_unit_id]').val(),
            'superiorunitid'             : $('#unit_tree_expand_view #superior_unit_id').val(),
            'superiordesignationid'            : $('#unit_tree_expand_view #superior_designation_id').val(),
            'designationeng'            : $('#unit_tree_expand_view input[name=designation_eng]').val(),
            'designationbng'            : $('#unit_tree_expand_view input[name=designation_bng]').val(),
            'shortnameeng'            : $('#unit_tree_expand_view input[name=short_name_eng]').val(),
            'shortnamebng'            : $('#unit_tree_expand_view input[name=short_name_bng]').val(),
            'designationlevel'            : $('#unit_tree_expand_view input[name=designation_level]').val(),
            'designationsequence'            : $('#unit_tree_expand_view input[name=designation_sequence]').val()
        };

        $.ajax({
            type:"POST",
            url : "<%=request.getContextPath()%>/addoriginunitorganogram",
            data : formData,
            async: false,
            success : function(response) {
                cancel();
                fetchData($("#origindropdown").val())
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
    function editNode() {
        var formData = {
            'id'               : $('#unit_tree_expand_view input[name=id]').val(),
            'superiorunitid'             : $('#unit_tree_expand_view #superior_unit_id').val(),
            'superiordesignationid'            : $('#unit_tree_expand_view #superior_designation_id').val(),
            'designationeng'            : $('#unit_tree_expand_view input[name=designation_eng]').val(),
            'designationbng'            : $('#unit_tree_expand_view input[name=designation_bng]').val(),
            'shortnameeng'            : $('#unit_tree_expand_view input[name=short_name_eng]').val(),
            'shortnamebng'            : $('#unit_tree_expand_view input[name=short_name_bng]').val(),
            'designationlevel'            : $('#unit_tree_expand_view input[name=designation_level]').val(),
            'designationsequence'            : $('#unit_tree_expand_view input[name=designation_sequence]').val()
        };
        $.ajax({
            type:"POST",
            url : "<%=request.getContextPath()%>/editoriginunitorganogram",
            data : formData,
            async: false,
            success : function(response) {

                cancel();
                fetchData($("#origindropdown").val())
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
    function childList(parentId,data) {
        var  childs =[];
        for(var i=0; i<data.length; i++){
            if(data[i].parentUnitId == parentId)childs.push(data[i]);
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

    function orgbyunitid(unitid,data) {
        var  childs =[];
        for(var i=0; i<data.length; i++){
            if(data[i].officeOriginUnitId == unitid)childs.push(data[i]);
        }
        return childs;
    }

    function filterOrg() {
        var $original = $("#unit_tree_expand_view");
        var selected = $('#superior_unit_id',$original).val();
        var $superiorDesId = $('#superior_designation_id',$original);
        $superiorDesId.empty();
        $superiorDesId.append($('<option></option>').val(0).html('...'));
        var data = orgbyunitid(selected,organogramlist);
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
        orgforjstree += '  "icon" : "icon icon-arrow-right",';
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
            orgforjstree += '  "text" : "'+data[i].designationBng+'<a  title=\'এই স্তরটি বাতিল করুন\' class=\'red equ\'  onclick=showModal(\''+data[i].id+'\',\'/deleteoriginunitorganogram\')><i class=\'fa fa fa-minus-circle\'></i></a>",';
            orgforjstree += '  "icon" : "icon icon-arrow-right",';
            orgforjstree += '  "li_attr" : {"dl" : "'+data[i].designationLevel+'","ds" : "'+data[i].designationSequence+'","maxlevel" : "'+data.length+'","bng" : "'+data[i].designationBng+'","eng" : "'+data[i].designationEng+'","edit" : "1","id" : "'+data[i].id+'","sdi" : "'+data[i].superiorDesignationId+'","sui" : "'+data[i].superiorUnitId+'","ooui" : "'+data[i].officeOriginUnitId+'","snb" : "'+data[i].shortNameBng+'","sne" : "'+data[i].shortNameEng+'"},';
            orgforjstree += '  "children" : []},';
        }
        orgforjstree += '{  "text" : "<a  title=\'এই স্তরটি বাতিল করুন\' class=\'red equ\'><i class=\'icon icon-plus\'></i></a>",';
        orgforjstree += '  "icon" : "icon icon-arrow-right",';
        orgforjstree += '  "li_attr" : {"ooui" : "'+id+'"},';
        orgforjstree += '  "children" : []}';


        orgforjstree += ']';
        return orgforjstree;
    }
    function officeStructure(id, units, organograms) {
        var jsonforjstree = '[' ;
        var childs= childList(id,units);
        var org ='';
        if(id!=0) {
            var orgs = orgbyunitid(id, organograms);
            org = '{ "id" : "' + id + '_orgs",';
            org += '  "text" : "পদ",';
            org += '  "icon" : "icon icon-arrow-right",';
            if(childs.length !=0)org += '  "children" : ' + organogram(orgs ,id) + '},';
            else org += '  "children" : ' + organogram(orgs, id) + '}';
        }
        jsonforjstree +=org;
        for(var i=0;i<childs.length;i++){
            jsonforjstree += '{ "id" : "'+childs[i].id+'_unit",';
            var checkChild = childList(childs[i].id,data);
            jsonforjstree += '  "text" : "'+childs[i].unitNameBng+'",';
            jsonforjstree += '  "icon" : "icon icon-arrow-right",';
            if(i!=childs.length-1)jsonforjstree += '  "children" : '+officeStructure(childs[i].id,units,organograms)+'},';
            else jsonforjstree += '  "children" : '+officeStructure(childs[i].id,units,organograms)+'}';
        }
        jsonforjstree += ']';
        return jsonforjstree;
    }


    function createJSTrees(jsonData) {
        $('#jstree').jstree('destroy');
        $('#jstree').jstree({
            'core' : {
                'data' : jsonData
            }
        });
        $('#jstree').jstree("refresh");
        $('#jstree').on("select_node.jstree", function (e, data) {
//            $('#jstree').jstree('open_node', data.node);
            if(data.node.original.hasOwnProperty("id")){
                if(data.node.original.hasOwnProperty('li_attr')&&data.node.original.li_attr.hasOwnProperty('edit')){
                    $("#unit_tree_expand_view").hide('slow',function () {

                        var parent  = data.node.parents;
                        var expected ='';
                        for(var i=0;i<parent.length;i++){
                            if(parent[i].indexOf("_orgs")>=0){
                                expected = parent[i+1];
                                break;
                            }
                        }
                        if(previousselectedunit!='')$(previousselectedunit).css('color','black');
                        previousselectedunit = "#"+expected+"_anchor";
                        $(previousselectedunit).css('color','red');
                        var editForm = $("#editform").clone();
                        editForm.css('display','block');
                        var $superiorUnitId = $('#superior_unit_id',editForm);
                        $superiorUnitId.empty();
                        $superiorUnitId.append($('<option></option>').val(0).html('...'));
                        $.each(unitlist, function(index, value) {
                            $superiorUnitId.append(
                                $('<option></option>').val(value.id).html(value.unitNameBng)
                            );
                        });

                        var $superiorDesId = $('#superior_designation_id',editForm);
                        $superiorDesId.empty();
                        $superiorDesId.append($('<option></option>').val(0).html('...'));
                        $.each(organogramlist, function(index, value) {

                            $superiorDesId.append(
                                $('<option></option>').val(value.id).html(value.designationBng)
                            );
                        });

                        $("#unit_tree_expand_view").html(editForm.html());
                        var selectedpart = $("#unit_tree_expand_view");
                        $('#office_origin_unit_id',selectedpart).val(data.node.li_attr.ooui);
                        $('#superior_unit_id > option[value='+data.node.li_attr.sui+']',selectedpart).attr('selected',true);
                        $('#superior_designation_id > option[value='+data.node.li_attr.sdi+']',selectedpart).attr('selected',true);
                        $('#designation_bng',selectedpart).val(data.node.li_attr.bng);
                        $('#designation_eng',selectedpart).val(data.node.li_attr.eng);
                        $('#short_name_bng',selectedpart).val(data.node.li_attr.snb);
                        $('#short_name_eng',selectedpart).val(data.node.li_attr.sne);
                        $('#designation_level',selectedpart).val(data.node.li_attr.dl);
                        $('#designation_sequence',selectedpart).val(data.node.li_attr.ds);
                        $('#id',selectedpart).val(data.node.li_attr.id);
                        $("#unit_tree_expand_view").show('slow');
                    });
                }
                else{
                    $("#unit_tree_expand_view").hide('slow');
                }




            }
            else {
                $("#unit_tree_expand_view").hide('slow',function () {
                    var addForm = $("#addform").clone();
                    addForm.css('display','block');
                    var $superiorUnitId = $('#superior_unit_id',addForm);
                    $superiorUnitId.empty();
                    $superiorUnitId.append($('<option></option>').val(0).html('...'));
                    $.each(unitlist, function(index, value) {
                        $superiorUnitId.append(
                            $('<option></option>').val(value.id).html(value.unitNameBng)
                        );
                    });

                    var $superiorDesId = $('#superior_designation_id',addForm);
                    $superiorDesId.empty();
                    $superiorDesId.append($('<option></option>').val(0).html('...'));
                    $.each(organogramlist, function(index, value) {
                        $superiorDesId.append(
                            $('<option></option>').val(value.id).html(value.designationBng)
                        );
                    });
                    $("#unit_tree_expand_view").html(addForm.html());
                    var selectedpart = $("#unit_tree_expand_view");

                    $('#office_origin_unit_id',selectedpart).val(data.node.li_attr.ooui);

                    $("#unit_tree_expand_view").show('slow');
                });
            }

        });
    }
    function showModal(id,url) {
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

    function fetchData( value) {

         previousselectedunit='';
         unitlist = undefined;
         organogramlist = undefined;

        $.ajax({
            type:"GET",
            url : "<%=request.getContextPath()%>/originunitsbyorigin",
            data : {
                id: value
            },
            async: false,
            success : function(response) {//unit list
                response.sort(function (a,b) {
                    return a.unitLevel - b.unitLevel;
                });

                var unitidlist =[];
                for(var i =0; i<response.length;i++){
                    unitidlist.push(response[i].id);
                }
                $.ajax({
                    type:"GET",
                    url:"<%=request.getContextPath()%>/originunitorganogramsbyoriginunits",
                    data:{
                        ids:unitidlist
                    },
                    async:false,
                    success:function (secresponse) {//organogram list
                        unitlist = response;
                        organogramlist = secresponse;
                        var oStructure = officeStructure(0,response,secresponse);
                        console.log(oStructure);
                        var myJsonString = JSON.parse(oStructure);
                        createJSTrees(myJsonString);
                        var select = $('#parent-unit-id');
                        select.empty();
                        select.append($('<option></option>').val(0).html('...'));
                        $.each(response, function(index, value) {
                            select.append(
                                $('<option></option>').val(value.id).html(value.unitNameBng)
                            );
                        });

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
                    select.append($('<option></option>').val(-1).html('...'));
                    $.each(data, function(index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.layerNameBng)
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
                    select.append($('<option></option>').val(-1).html('...'));
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

        $('#origindropdown').change(function() {
            var id = $(this).val();
            fetchData(id);

        });


    });

</script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
</body>
<!-- END BODY -->
</html>
