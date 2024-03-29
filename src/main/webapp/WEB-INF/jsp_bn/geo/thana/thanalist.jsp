<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <%@ include file="../../includes/head.jsp" %>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <link href="<%=request.getContextPath()%>/assets/css/common/datatablecustom.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="/assets/styles/inbox-details.css"/>
    <link rel="stylesheet" type="text/css" href="/assets/styles/styles.css"/>
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

        <div class="page-content">

            <div class="card">
                <div class="card-block">
                    <div class="portlet box " >
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-picture"></i> থানা  তালিকা
                            </div>
                            <%--<div class="tools  hidden-print  " >--%>
                            <%--<a  href="<%=request.getContextPath()%>/divisionadd" title="" data-original-title="Division Add" >--%>
                            <%--<i class="fa fa-plus-square-o fa-2x"aria-hidden="true" ></i> </a>--%>
                            <%--<a title="" class="btn-print" data-original-title="Division Print">--%>
                            <%--<i class="fa fa-print fa-2x"></i> </a>--%>
                            <%--&lt;%&ndash;<a title="" style="color:white; font-size: 16px" href="/office_employees/index?print=1" data-original-title="দপ্তর কর্মকর্তা তালিকা এক্সপোর্ট">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<i class="fa fa-file-excel-o fa-2x"></i>  </a>&ndash;%&gt;--%>
                            <%--</div>--%>

                        </div>
                        <div class="portlet-body">
                            <div class=" pull-right" id="addassign" style="margin-bottom: 40px;margin-top: 10px">

                            </div>
                            <div class="table-scrollable table-responsive">
                                <table class="table  table-striped table-hover" id="datatable">


                                    <thead>


                                    <tr>
                                        <th>  থানার নাম  ( ইংরেজিতে)  </th>
                                        <th>  থানার নাম  (বাংলাতে )  </th>
                                        <th>  বি বি এস কোড </th>
                                        <th style="width: 5px;"></th>
                                        <th style="width: 5px;"></th>
                                        <th style="width: 5px;"></th>

                                    </tr>

                                    </thead>


                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div style="display: none">

                <div id="edit">
                    <form  method="post">
                        <input type="hidden" name="id">
                        <input type="hidden" name="thananameeng">
                        <input type="hidden" name="thananamebng">
                        <input type="hidden" name="bbscode">
                        <input type="hidden" name="divisionbbscode">
                        <input type="hidden" name="districtbbscode">
                        <input type="hidden" name="divId">
                        <input type="hidden" name="disId">
                        <button type="submit" name="submit_param" value="submit_value" class="btn btn-icon-only">
                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>




                <div id="history">
                    <form  method="post">
                        <input type="hidden" name="id">
                        <input type="hidden" name="name">
                        <button type="submit" name="submit_param" value="submit_value" class="btn btn-icon-only">
                            <i class="fa fa-info"></i>
                        </button>
                    </form>
                </div>
            </div>

            <input type="hidden" id="menuid" value="${menuid}">


            <div id='advancesearch' style="display: none;">
                <div class="inbox-header" >
                    <form id="file-search" class="form-inline" action="javascript:;">
                        <div class="input-group" style="width: auto !important;display:flex;width: 20%; float:right">
                            <input id="searchFileMessage" type="text" class="form-control" styles="heigth = 100%"
                                   placeholder=" খুঁজুন ...">
                            <div class="dropdown dropdown-lg">
                                <button id="advancesearchoption"
                                        style="padding-bottom: 4px;height: 34px; border-radius:0px; box-shadow:none;"
                                        type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                        aria-expanded="true"><span class="md-click-circle md-click-animate"></span><span
                                        class="caret" style="margin-bottom:5px;"></span></button>
                                <div class="dropdown-menu dropdown-menu-right advanced-file-search" role="menu"
                                     style="background-color: #fffffe;margin-top: 2px; border: 1px solid lightgray!important; box-shadow: none!important;width: 387px;">
                                    <div>


                                        <label class="control-label">বিভাগ<span
                                                class="required" aria-required="true"> * </span></label>

                                        <select class="form-control" name="divdata" id="divisiondropdown">
                                        </select>
                                    </div>

                                    <div>

                                        <label class="control-label">জেলা<span
                                                class="required" aria-required="true"> * </span></label>

                                        <select class="form-control" name="disdata" id="districtdropdown">
                                        </select>

                                    </div>

                                    <div class="row" style="margin-top: 40px;">
                                        <div >
                                            <button id="AdvancedSearchCancel" name="AdvancedSearchCancel" type="reset"
                                                    class="btn btn-danger btn-sm pull-left"><span class="glyphicon glyphicon-"
                                                                                                  aria-hidden="true"></span>বাতিল
                                            </button>
                                            <button id="AdvancedSearchSubmit" name="AdvancedSearchSubmit" type="button"
                                                    class="btn btn-primary btn-sm pull-right"><span
                                                    class="glyphicon glyphicon-search" aria-hidden="true"></span>অনুসন্ধান
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
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
    var example_table ;
    var msg="থানা"
    function reload() {
        example_table.ajax.reload();
    }
    function datatableInit(edi,del,his) {
        var evisible = false, dvisible = false, hvisible=false;
        if(edi!=undefined)evisible = true;
        if(del!=undefined)dvisible = true;
        if(his!=undefined)hvisible = true;



        example_table = $('#datatable').DataTable({
            "bServerSide" : true,
            "sPaginationType": "full_numbers",
            "sDom": '<"row" <"col-md-6 col-sm-12"l><"col-md-6 col-sm-12"<"toolbar">>><"table-scrollable"t><"row" <"col-md-5 col-sm-12"i><"col-md-7 col-sm-12"p>>',
            "sEcho": 1,
            "language":{
                "decimal":        "১",
                "emptyTable":     "থানা খুজে পাওয়া যায় নাই",
                "info":           " মোট _TOTAL_ থানার মধ্যে _START_ থেকে _END_ পর্যন্ত দেখানো হচ্ছে",
                "infoEmpty":      "থানা খুজে পাওয়া যায় নাই",
                "infoFiltered":   "(filtered from _MAX_ total entries)",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "_MENU_",
                "loadingRecords": "Loading...",
                "processing":     "Processing...",
                "search":         "Search:",
                "zeroRecords":    "থানা খুজে পাওয়া যায় নাই",
                "paginate": {
                    "first":      "প্রথম",
                    "last":       "শেষ",
                    "next":       "পরে",
                    "previous":   "আগে"
                },
                "aria": {
                    "sortAscending":  ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                }
            },
            "sAjaxSource" : "<%=request.getContextPath()%>/thanapagedata",
            "iDisplayLength": 10,
            "iDisplayStart": 0,
            "aoColumns"   :[
                {   "mData": 'thanaNameEng',
                    "bSortable": false
                },
                {   "mData":'thanaNameBng',
                    "bSortable": false
                },
                {   "mData":'bbsCode',
                    "bSortable": false
                },
                {
                    "mRender": function(data, type, full) {

                        var editdiv = $("#edit").clone();
                        var editbtn = $('form',editdiv);
                        editbtn.attr('action', "${context}/thanaedit");
                        $('input[name="id"]',editbtn).val(full.id);
                        $('input[name="thananameeng"]',editbtn).val(full.thanaNameEng);
                        $('input[name="thananamebng"]',editbtn).val(full.thanaNameBng);
                        $('input[name="bbscode"]',editbtn).val(full.bbsCode);
                        $('input[name="divisionbbscode"]',editbtn).val(full.divisionBbsCode);
                        $('input[name="districtbbscode"]',editbtn).val(full.districtBbsCode);
                        $('input[name="divId"]',editbtn).val(full.geoDivisionId);
                        $('input[name="disId"]',editbtn).val(full.geoDistrictId);
                        return editdiv.html();
                    },
                    "bVisible":evisible,
                    "bSortable": false


                },
                {
                    "mRender": function(data, type, full) {
                        return '<button class="btn btn-icon-only" style="background-color: black;color: white" onclick=showModal('+full.id+',\"/thanadelete\",msg.trim())>'+
                            ' <i class="fa fa-trash-o fa-lg"></i>'+
                            '</button>';
                    },
                    "bVisible":dvisible,
                    "bSortable": false
                },
                {
                    "mRender": function(data, type, full) {
                        var link = '<a href="/thanahistory?id='+full.id+'&&name='+full.thanaNameBng+'"><button class="btn btn-icon-only"><i class="fa fa-info" style="color: black"></i></button></a>';
                        return link;
                    },
                    "bVisible":hvisible,
                    "bSortable": false
                }


            ],
            "autoWidth":false
        });
    }

    $(document).ready(function() {





        $.ajax({
            type: "POST",
            url: "${context}/permission",
            data: {
                menuid: $("#menuid").val()
            },
            async: false,
            success: function (response) {
                var addassign = $("#addassign");
                var list = [];
                for (var i = 0; i < response.length; i++) {
                    var x = response[i].menuType;
                    list[x] = 1;
                }
                if (list[2] == 1) addassign.append('<button type="button" class="btn " style="margin-right: 30px; background-color: #adadce"><a href="/thanaadd"> থানা সংযুক্ত করুন  </a></button>');
//                if (list[5] == 1) addassign.append('<button type="button" class="btn " style="margin-right: 30px; background-color: #b5b1b1"><a href="/thanaassign">Assign Uni/Muni</a></button>');
                datatableInit(list[3], list[4], list[6]);
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

        var $advanceSearch = $('#advancesearch').clone(true,true);
        $advanceSearch.css('display','block');

        $("div.toolbar").html($advanceSearch);

        $('.dropdown-menu.advanced-file-search').click(function (event) {
            event.stopPropagation();
        });

        $('#AdvancedSearchSubmit').click(function () {
            //  if($('#divisiondropdown').val()!=-1){
            var searchKey = $('#divisiondropdown').val() + ";" + $('#districtdropdown').val() + ";";
            $('#datatable').dataTable().fnFilter(searchKey);
            $('div.dropdown.dropdown-lg').removeClass("open");
            // $('#districtdropdown').empty();
            // $('#thanadropdown').empty();


        });

        $('#AdvancedSearchCancel').click(function () {
            $('div.dropdown.dropdown-lg').removeClass("open");
        });

        $('#searchFileMessage').keyup(function () {
            var searchKey = $(this).val() + ";";
            $('#datatable').dataTable().fnFilter(searchKey);
            $('div.dropdown.dropdown-lg').removeClass("open");

        });

        $('#advancesearchoption').click(function () {
            $('#searchFileMessage').val("");
            //table.fnFilter(";");
            if ($('#divisiondropdown option').size() > 2) {
                return;
            }
            else {
                var data = "";
                $.ajax({
                    type: "GET",
                    url: "${context}/divisiondata",
                    data: {},
                    async: false,
                    success: function (response) {
                        data = response;
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

                var select = $('#divisiondropdown');
                select.empty();
                select.append($('<option></option>').val(-1).html('...'));
                $.each(data, function (index, value) {
                    select.append(
                        $('<option></option>').val(value.id).html(value.divisionNameBng).attr('bbs', value.bbsCode)
                    );
                });
            }
        });
        $('#divisiondropdown').change(function () {
            var data = "";
            $.ajax({
                type: "GET",
                url: "${context}/districtlistbydiv",
                data: {
                    id: $(this).val()
                },
                async: false,
                success: function (response) {
                    data = response;
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

            var select = $('#districtdropdown');
            select.empty();
            select.append($('<option></option>').val(-1).html('...'));
            $.each(data, function (index, value) {
                select.append(
                    $('<option></option>').val(value.id).html(value.districtNameBng).attr('bbs', value.bbsCode)
                );
            });

            var selected = $(this).find('option:selected');
            var extra = selected.data('bbs');
            $('input[name = divisionbbscode]').val(extra);

        });

        //working
        <%--var example_table = $('#sample_1').DataTable({--%>
        <%--'ajax': {--%>
        <%--url    : '<%=request.getContextPath()%>/getOffice_LayerShow',--%>
        <%--dataSrc: ''--%>
        <%--},--%>
        <%--'columns': [--%>
        <%--{ data: 'id' },--%>
        <%--{ data: 'office_ministry_id' },--%>
        <%--{ data: 'layer_name_bng' },--%>
        <%--{ data: 'layer_level' },--%>
        <%--{ data: 'layer_sequence' }--%>
        <%--]--%>
        <%--});--%>
        <%--example_table.ajax.reload()--%>
        <%--});--%>

        //working
        <%--var table = $('#sample_1').dataTable({--%>
        <%--'processing':true,--%>
        <%--'serverside':true,--%>
        <%--'ajax': {--%>
        <%--url: '<%=request.getContextPath()%>/getOffice_LayerShow',--%>
        <%--dataSrc: ''--%>
        <%--},--%>
//            'columns': [
//                {data: 'id'},
//                {data: 'office_ministry_id'},
//                {data: 'layer_name_bng'},
//                {data: 'layer_level'},
//                {data: 'layer_sequence'}
//            ]
        <%--});--%>

        //ServerSide Pagination using sql query
        var table = $('#sample_1').dataTable({
            "bServerSide" : true,
            "sPaginationType": "full_numbers",
            "sEcho":1,
            "sAjaxSource" : "<%=request.getContextPath()%>/thanapage",
            "iDisplayLength": 10,
            //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
            "iDisplayStart": 0,
            "aoColumns"   :[
                {"mData": "id"},
                {"mData": "thanaNameEng"},
                {"mData": "thanaNameBng"},
                {"mData": "bbsCode"},
                {"mData": "districtBbsCode"},
                {"mData": "status"},
                {
                    "mRender": function(data, type, full) {
                        // return '<a href=<%=request.getContextPath()%>/upazilapage/'+full.id+'>' + "Edit" + '</a>';

                        return '<form method="post" action="<%=request.getContextPath()%>/editthanaview">'+
                            '<input type="hidden" name="id" value="'+full.id+'">'+
                            '<input type="hidden" name="thananameeng" value="'+full.thanaNameEng+'">'+
                            '<input type="hidden" name="thananamebng" value="'+full.thanaNameBng+'">'+
                            '<input type="hidden" name="bbscode" value="'+full.bbsCode+'">'+
                            '<input type="hidden" name="divisionbbscode" value="'+full.divisionBbsCode+'">'+
                            '<input type="hidden" name="districtbbscode" value="'+full.districtBbsCode+'">'+
                            '<input type="hidden" name="divId" value="'+full.geoDivisionId+'">'+
                            '<input type="hidden" name="disId" value="'+full.geoDistrictId+'">'+
                            '<button type="submit" name="submit_param" value="submit_value" class="link-button">'+
                            "Edit"+
                            '</button>'+
                            '</form>';
                    }

                },
                {
                    "mRender": function(data, type, full) {
                        // return '<a href=<%=request.getContextPath()%>/upazilapage/'+full.id+'>' + "Edit" + '</a>';

                        return '<form method="post" action="<%=request.getContextPath()%>/deletethana">'+
                            '<input type="hidden" name="id" value="'+full.id+'">'+
                            '<button type="submit" name="submit_param" value="submit_value" class="link-button">'+
                            "Delete"+
                            '</button>'+
                            '</form>';
                    }
                },
                {
                    "mRender": function(data, type, full) {
                        // return '<a href=<%=request.getContextPath()%>/upazilapage/'+full.id+'>' + "Edit" + '</a>';

                        return '<form method="post" action="<%=request.getContextPath()%>/thanahistory">'+
                            '<input type="hidden" name="id" value="'+full.id+'">'+
                            '<input type="hidden" name="name" value="'+full.thanaNameBng+'">'+
                            '<button type="submit" name="submit_param" value="submit_value" class="link-button">'+
                            "History"+
                            '</button>'+
                            '</form>';
                    }
                }
            ]



        });

        <%--var table = $('#sample_1').dataTable({--%>
        <%--"bServerSide" : true,--%>
        <%--"ajax" : {--%>
        <%--"url" :"<%=request.getContextPath()%>/listPageablebyPagable",--%>
        <%--"type":"POST",--%>
        <%--"data":function(d) {--%>
        <%--var table = $('#sample_1').DataTable()--%>
        <%--d.page = (table != undefined)?table.page.info().page:0--%>
        <%--d.size = (table != undefined)?table.page.info().length:5--%>
        <%--d.sort = d.columns[d.order[0].column].data + ',' + d.order[0].dir--%>
        <%--}--%>
        <%--},--%>
        <%--"sAjaxDataProp": "",--%>
        <%--"iDisplayLength": 10,--%>
        <%--//We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)--%>
        <%--"iDisplayStart": 0,--%>
        <%--"aoColumns"   :[--%>
        <%--{"mData": "id"},--%>
        <%--{"mData": "office_ministry_id"},--%>
        <%--{"mData": "layer_name_bng"},--%>
        <%--{"mData": "layer_level"},--%>
        <%--{"mData": "layer_sequence"}--%>
        <%--]--%>


        <%--});--%>
    });


</script>


<script type="text/javascript" src="${context}/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="/assets/admin/pages/scripts/table-advanced.js"></script>
<script src="${context}/assets/admin/pages/scripts/table-advanced.js"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript"src="${context}/assets/js/common/modalcontrol.js"></script>
</body>

</html>