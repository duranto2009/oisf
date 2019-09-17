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
                            <i class="fa fa-picture"></i>Ministry List
                        </div>
                    </div>


                    <div class="portlet-body">

                        <div class="row">
                            <div class="col-md-4 form-group form-horizontal">
                                <label class="control-label">অফিস মন্ত্রণালয়</label>
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
                                <label class="control-label">অফিস স্তর</label>
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
                    </div>
                </div>

            </div>


            <input type="hidden" id="menuid" value="${menuid}">
            <div id="editform" style="display: none">
                <div class="portlet light no-shadow">
                    <div class="portlet-title">
                        <div class="caption"><i class=""></i>শাখা সম্পাদন</div>
                    </div>
                    <div class="portlet-body form"><br><br>
                        <form id="OfficeOriginUnitEditForm" accept-charset="utf-8" method="post">
                            <input type="hidden"  name="id"  id="id">
                            <div class="form-horizontal">

                                <!-- Start : Import Office Unit Category View From Cell -->
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">উর্ধ্বতন শাখা</label>

                                    <div class="col-sm-7">
                                        <div class="input select">
                                            <select id="parent-unit-id" class="form-control" name="parent_unit_id">

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">শাখার ধরণ</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" id="office-unit-category-e" class="form-control" list="office_unit_category_list-e" name="office_unit_category">
                                        </div>
                                        <datalist id="office_unit_category_list-e">
                                            <option value="দপ্তর">দপ্তর</option>
                                            <option value="শাখা">শাখা</option>
                                            <option value="অনুবিভাগ">অনুবিভাগ</option>
                                            <option value="অধিশাখা">অধিশাখা</option>
                                        </datalist>
                                    </div>
                                </div>
                                <!-- End : Import Office Unit Category View From Cell -->

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">নাম</label>

                                    <div class="col-sm-7">
                                        <div class="input text"><input type="text"  id="unit-name-bng-e" class="form-control" name="unit_name_bng"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">নাম (ইংরেজি)</label>

                                    <div class="col-sm-7">
                                        <div class="input text"><input type="text" id="unit-name-eng-e"  class="form-control" name="unit_name_eng"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">শাখার লেভেল</label>

                                    <div class="col-sm-7">
                                        <div class="input text"><input type="text" id="unit-level-e"  class="form-control" name="unit_level"></div>
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
                        <div class="caption"><i class=""></i>নতুন শাখা</div>
                    </div>
                    <div class="portlet-body form"><br><br>
                        <form id="OfficeOriginUnitAddForm" accept-charset="utf-8" method="post">
                            <input type="hidden"  id="parent_unit_id" name="parent_unit_id">
                            <input type="hidden" id="office_ministry_id" name="office_ministry_id">
                            <input type="hidden"  id="office_layer_id" name="office_layer_id">
                            <input type="hidden"  id="office_origin_id" name="office_origin_id">
                            <div class="form-horizontal">

                                <!-- Start : Import Office Unit Category View From Cell -->
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">শাখার ধরণ</label>

                                    <div class="col-sm-7">
                                        <div class="input text">
                                            <input type="text" value="" id="office-unit-category-a" class="form-control" list="office_unit_category_list-a" name="office_unit_category">
                                        </div>
                                        <datalist id="office_unit_category_list-a">
                                            <option value="দপ্তর">দপ্তর</option>
                                            <option value="শাখা">শাখা</option>
                                            <option value="অনুবিভাগ">অনুবিভাগ</option>
                                            <option value="অধিশাখা">অধিশাখা</option>
                                        </datalist>
                                    </div>
                                </div>
                                <!-- End : Import Office Unit Category View From Cell -->

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">নাম</label>

                                    <div class="col-sm-7">
                                        <div class="input text"><input type="text" id="unit-name-bng-a" class="form-control" name="unit_name_bng"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-5 control-label">নাম (ইংরেজি)</label>

                                    <div class="col-sm-7">
                                        <div class="input text"><input type="text" id="unit-name-eng-a" class="form-control" name="unit_name_eng"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">শাখার লেভেল</label>

                                    <div class="col-sm-7">
                                        <div class="input text"><input type="text" id="unit-level-a"  class="form-control" name="unit_level"></div>
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

    function cancel() {
        $("#unit_tree_expand_view").html("");
        $("#unit_tree_expand_view").hide();
    }
    function addNode() {
        var formData = {
            'ministryid'               : $('#unit_tree_expand_view input[name=office_ministry_id]').val(),
            'layerid'             : $('#unit_tree_expand_view input[name=office_layer_id]').val(),
            'originid'            : $('#unit_tree_expand_view input[name=office_origin_id]').val(),
            'officecategory'            : $('#unit_tree_expand_view input[name=office_unit_category]').val(),
            'originunitbng'            : $('#unit_tree_expand_view input[name=unit_name_bng]').val(),
            'originuniteng'            : $('#unit_tree_expand_view input[name=unit_name_eng]').val(),
            'unitlevel'            : $('#unit_tree_expand_view input[name=unit_level]').val(),
            'parentunitid'            : $('#unit_tree_expand_view input[name=parent_unit_id]').val()
        };

        $.ajax({
            type:"POST",
            url : "<%=request.getContextPath()%>/addoriginunit",
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
            'officecategory'            : $('#unit_tree_expand_view input[name=office_unit_category]').val(),
            'originunitbng'            : $('#unit_tree_expand_view input[name=unit_name_bng]').val(),
            'originuniteng'            : $('#unit_tree_expand_view input[name=unit_name_eng]').val(),
            'unitlevel'            : $('#unit_tree_expand_view input[name=unit_level]').val(),
            'parentunitid'            : $('#unit_tree_expand_view #parent-unit-id').val()
        };
        $.ajax({
            type:"POST",
            url : "<%=request.getContextPath()%>/editoriginunit",
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

    function layerStructure(id, data) {
        var jsonforjstree = '[' ;
        var childs= childList(id,data);
        for(var i=0;i<childs.length;i++){
            jsonforjstree += '{ "id" : "'+childs[i].id+'",';
            var checkChild = childList(childs[i].id,data);
            if(checkChild.length ==0)jsonforjstree += '  "text" : "'+childs[i].unitNameBng.trim()+'<a  title=\'এই স্তরটি বাতিল করুন\' class=\'red equ\'  onclick=showModal(\''+childs[i].id+'\',\'/deleteoriginunit\')><i class=\'fa fa fa-minus-circle\'></i></a>",';
            else jsonforjstree += '  "text" : "'+childs[i].unitNameBng.trim()+'",';
            jsonforjstree += '  "icon" : "icon icon-arrow-right",';
            jsonforjstree += '  "li_attr" : {"ul" : "'+childs[i].unitLevel+'","ouc" : "'+childs[i].officeUnitCategory.trim()+'","maxlevel" : "'+childs.length+'","bng" : "'+childs[i].unitNameBng.trim()+'","eng" : "'+childs[i].unitNameEng.trim()+'"},';
            jsonforjstree += '  "children" : '+layerStructure(childs[i].id,data)+'},';
        }
        //jsonforjstree += '{ "id" : "300000",';
        jsonforjstree += '{  "text" : "<a  title=\'এই স্তরটি বাতিল করুন\' class=\'red equ\'><i class=\'icon icon-plus\'></i></a>",';
        jsonforjstree += '  "icon" : "icon icon-arrow-right",';
        jsonforjstree += '  "li_attr" : {"maxlevel" : "'+childs.length+'"},';
        jsonforjstree += '  "children" : []}';


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
                 $("#unit_tree_expand_view").hide('slow',function () {
                     var editForm = $("#editform").clone();
                     editForm.css('display','block');
                     $("#unit_tree_expand_view").html(editForm.html());
                     var selectedpart = $("#unit_tree_expand_view");
                     $('#parent-unit-id > option[value='+data.node.parent+']',selectedpart).attr('selected',true);
                     $('#office-unit-category-e',selectedpart).val(data.node.li_attr.ouc);
                     $('#unit-name-bng-e',selectedpart).val(data.node.li_attr.bng);
                     $('#unit-name-eng-e',selectedpart).val(data.node.li_attr.eng);
                     $('#unit-level-e',selectedpart).val(data.node.li_attr.ul);
                     $('#id',selectedpart).val(data.node.original.id);
                     $("#unit_tree_expand_view").show('slow');
                 });



              }
              else {
                  $("#unit_tree_expand_view").hide('slow',function () {
                      var addForm = $("#addform").clone();
                      addForm.css('display','block');
                      $("#unit_tree_expand_view").html(addForm.html());
                      var selectedpart = $("#unit_tree_expand_view");
                      var parent = data.node.parent;
                      if(parent == '#')$('#parent_unit_id',selectedpart).val(0);
                      else $('#parent_unit_id',selectedpart).val(parent);
                      $('#office_ministry_id',selectedpart).val($("#ministrydropdown").val());
                      $('#office_layer_id',selectedpart).val($("#layerdropdown").val());
                      $('#office_origin_id',selectedpart).val($("#origindropdown").val());
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

        $.ajax({
            type:"GET",
            url : "<%=request.getContextPath()%>/originunitsbyorigin",
            data : {
                id: value
            },
            async: false,
            success : function(response) {
                response.sort(function (a,b) {
                    return a.unitLevel - b.unitLevel;
                });

                var lStructure = layerStructure(0,response);
                var myJsonString = JSON.parse(lStructure);
                createJSTrees(myJsonString);
                var select = $('#parent-unit-id');
                select.empty();
                select.append($('<option></option>').val(0).html('...'));
                $.each(response, function(index, value) {
                    select.append(
                        $('<option></option>').val(value.id).html(value.unitNameBng)
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
