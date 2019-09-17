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
    <title>Office Information and Service Framework (OISF)</title>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../../includes/head.jsp" %>
    <link href="${context}/assets/css/common/datatablecustom.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${context}/assets/styles/inbox-details.css"/>
    <%--<link rel="stylesheet" type="text/css" href="${context}/assets/styles/styles.css"/>--%>
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
                                <i class="fa fa-picture"></i>Office Origin List
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
                                        <th> Origin Name </th>
                                        <th> Origin Name(Bangla) </th>
                                        <th> Office Lavel </th>
                                        <th> Office Sequence </th>
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
                        <input type="hidden" name="officeoriginnameeng">
                        <input type="hidden" name="officeoriginnamebng">
                        <input type="hidden" name="officeoriginlevel">
                        <input type="hidden" name="officeoriginsequence">
                        <input type="hidden" name="officeoriginsuperior">
                        <input type="hidden" name="ministrydata">
                        <input type="hidden" name="layerdata">
                        <button type="submit" name="submit_param" value="submit_value" class="btn btn-icon-only">
                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
                <div id="detail">
                    <form  method="post">
                        <input type="hidden" name="id">
                        <input type="hidden" name="officeoriginnameeng">
                        <input type="hidden" name="officeoriginnamebng">
                        <input type="hidden" name="officeoriginlevel">
                        <input type="hidden" name="officeoriginsequence">
                        <input type="hidden" name="officeoriginsuperior">
                        <input type="hidden" name="ministrydata">
                        <input type="hidden" name="layerdata">
                        <button type="submit" name="submit_param" value="submit_value" class="btn btn-icon-only">
                            <i class="fa fa-info" style="color: black"></i>
                        </button>
                    </form>
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

    var example_table ;
    function reload() {
        example_table.ajax.reload();
    }
    function datatableInit(edi,del,his) {
        var evisible = false, dvisible = false, hvisible=false;
        if(edi!=undefined)evisible = true;
        if(del!=undefined)dvisible = true;
        if(his!=undefined)hvisible = true;



        example_table = $('#datatable').DataTable({
            "bServerSide" : false,
            "sPaginationType": "full_numbers",
            "sDom": '<"row" <"col-md-6 col-sm-12"l><"col-md-6 col-sm-12"f>><"table-scrollable"t><"row" <"col-md-5 col-sm-12"i><"col-md-7 col-sm-12"p>>',
            "sEcho": 1,
            "language":{
                "decimal":        "১",
                "emptyTable":     "মৌলিক দপ্তর খুজে পাওয়া যায় নাই",
                "info":           " মোট _TOTAL_ মৌলিক দপ্তরের মধ্যে _START_ থেকে _END_ পর্যন্ত দেখানো হচ্ছে",
                "infoEmpty":      "মৌলিক দপ্তর খুজে পাওয়া যায় নাই",
                "infoFiltered":   "(filtered from _MAX_ total entries)",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "_MENU_",
                "loadingRecords": "Loading...",
                "processing":     "Processing...",
                "search":         "Search:",
                "zeroRecords":    "মৌলিক দপ্তর খুজে পাওয়া যায় নাই",
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
            "sAjaxSource" : "<%=request.getContextPath()%>/originpagedata",
            "iDisplayLength": 10,
            "iDisplayStart": 0,
            "aoColumns"   :[
                {   "mData": 'officeNameEng',
                    "bSortable": false
                },
                {   "mData":'officeNameBng',
                    "bSortable": false
                },
                {   "mData":'officeLevel',
                    "bSortable": false
                },
                {   "mData":'officeSequence',
                    "bSortable": false
                },
                {
                    "mRender": function(data, type, full) {

                        var editdiv = $("#edit").clone();
                        var editbtn = $('form',editdiv);
                        editbtn.attr('action', "<%=request.getContextPath()%>/originedit");
                        $('input[name="id"]',editbtn).val(full.id);
                        $('input[name="officeoriginnameeng"]',editbtn).val(full.officeNameEng);
                        $('input[name="officeoriginnamebng"]',editbtn).val(full.officeNameBng);
                        $('input[name="officeoriginlevel"]',editbtn).val(full.officeLevel);
                        $('input[name="officeoriginsequence"]',editbtn).val(full.officeSequence);
                        $('input[name="officeoriginsuperior"]',editbtn).val(full.parentOfficeId);
                        $('input[name="ministrydata"]',editbtn).val(full.officeMinistryId);
                        $('input[name="layerdata"]',editbtn).val(full.officeLayerId);
                        return editdiv.html();
                    },
                    "bVisible":evisible,
                    "bSortable": false


                },
                {
                    "mRender": function(data, type, full) {
                        return '<button class="btn btn-icon-only" style="background-color: black;color: white" onclick=showModal('+full.id+',\"/origindelete\")>'+
                            ' <i class="fa fa-trash-o fa-lg"></i>'+
                            '</button>';
                    },
                    "bVisible":dvisible,
                    "bSortable": false
                },
                {
                    "mRender": function(data, type, full) {

                        var detaildiv = $("#detail").clone();
                        var detailbtn = $('form',detaildiv);
                        detailbtn.attr('action', "<%=request.getContextPath()%>/origindetail");
                        $('input[name="id"]',detailbtn).val(full.id);
                        $('input[name="officeoriginnameeng"]',detailbtn).val(full.officeNameEng);
                        $('input[name="officeoriginnamebng"]',detailbtn).val(full.officeNameBng);
                        $('input[name="officeoriginlevel"]',detailbtn).val(full.officeLevel);
                        $('input[name="officeoriginsequence"]',detailbtn).val(full.officeSequence);
                        $('input[name="officeoriginsuperior"]',detailbtn).val(full.parentOfficeId);
                        $('input[name="ministrydata"]',detailbtn).val(full.officeMinistryId);
                        $('input[name="layerdata"]',detailbtn).val(full.officeLayerId);
                        return detaildiv.html();
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
                if (list[2] == 1) addassign.append('<button type="button" class="btn " style="margin-right: 30px; background-color: #adadce"><a href="${context}/originadd">Add Office Origin</a></button>');
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
<script type="text/javascript" src="${context}/assets/admin/pages/scripts/table-advanced.js"></script>
<script src="${context}/assets/admin/pages/scripts/table-advanced.js"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript"src="${context}/assets/js/common/modalcontrol.js"></script>
</body>

</html>