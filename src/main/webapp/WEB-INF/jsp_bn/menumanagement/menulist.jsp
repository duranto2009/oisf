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

    <%@ include file="../includes/head.jsp" %>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <link href="<%=request.getContextPath()%>${context}/assets/css/common/datatablecustom.css" rel="stylesheet" type="text/css"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed">
<!-- BEGIN HEADER -->
<div class="page-header -i navbar navbar-fixed-top">
    <%@ include file="../includes/header.jsp" %>
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
            <%@ include file="../includes/menu.jsp" %>
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- START MAIN CONTENT -->
        <div class="page-content">

            <div class="card" >
                <div class="card-block">
                    <div class="portlet box " >
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-picture"></i> মেনু তালিকা
                            </div>
                            <%--<div class="tools  hidden-print  " >--%>
                                <%--<a  href="<%=request.getContextPath()%>/addmenu" title="" data-original-title="Menu Add" >--%>
                                    <%--<i class="fa fa-plus-square-o fa-2x"aria-hidden="true" ></i> </a>--%>
                                <%--<a title="" class="btn-print" data-original-title="Division Print">--%>
                                    <%--<i class="fa fa-print fa-2x"></i> </a>--%>
                                <%--&lt;%&ndash;<a title="" style="color:white; font-size: 16px" href="/office_employees/index?print=1" data-original-title="দপ্তর কর্মকর্তা তালিকা এক্সপোর্ট">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<i class="fa fa-file-excel-o fa-2x"></i>  </a>&ndash;%&gt;--%>
                            <%--</div>--%>

                        </div>


                        <div class="portlet-body">
                            <div class=" pull-right" id="addassign" style="margin-bottom: 40px;margin-top: 10px">
                                <button type="button" class="btn " style="margin-right: 30px; background-color: #adadce"><a href="<%=request.getContextPath()%>/addmenu"> মেনু সংযুক্ত করুন</a></button>

                            </div>

                            <div class=" table-scrollable table-responsive">
                                    <table class="table  table-striped  table-hover" id="datatable">

                                        <thead>

                                        <th > মেনুর নাম (ইংরেজিতে)</th>
                                        <th >মেনুর নাম ( বাংলাতে)</th>
                                        <th > ইউ আর এল</th>
                                        <th style="width: 5px;"></th>
                                        <th style="width: 5px;"></th>
                                        <th style="width: 5px;"></th>


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
                        <input type="hidden" name="menunameeng">
                        <input type="hidden" name="menunamebng">
                        <%--<input type="hidden" name="bbscode">--%>
                        <%--<input type="hidden" name="status">--%>
                        <input type="hidden" name="url">
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




        </div>
    </div>
    <!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../includes/includes.jsp" %>

<script>
    var example_table;
    function reload() {
        example_table.ajax.reload();
    }
    function datatableInit() {
//        var evisible = false, dvisible = false, hvisible=false;
//        if(edi!=undefined)evisible = true;
//        if(del!=undefined)dvisible = true;
//        if(his!=undefined)hvisible = true;



        example_table = $('#datatable').DataTable({
            "bServerSide" : false,
            "sPaginationType": "full_numbers",
            "sDom": '<"row" <"col-md-6 col-sm-12"l><"col-md-6 col-sm-12"f>><"table-scrollable"t><"row" <"col-md-5 col-sm-12"i><"col-md-7 col-sm-12"p>>',
            "sEcho": 1,
            "language":{
                "decimal":        "১",
                "emptyTable":     "মেন্যু খুজে পাওয়া যায় নাই",
                "info":           " মোট _TOTAL_ মেন্যুর মধ্যে _START_ থেকে _END_ পর্যন্ত দেখানো হচ্ছে",
                "infoEmpty":      "বিভাগ খুজে পাওয়া যায় নাই",
                "infoFiltered":   "(filtered from _MAX_ total entries)",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "_MENU_",
                "loadingRecords": "Loading...",
                "processing":     "Processing...",
                "search":         " সার্চ ",
                "zeroRecords":    "মেন্যু খুজে পাওয়া যায় নাই",
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
            "sAjaxSource" : "<%=request.getContextPath()%>/menulistdata",
            "iDisplayLength": 10,
            "iDisplayStart": 0,
            "aoColumns"   :[
                {   "mData": 'nameEng',
                    "bSortable": false
                },
                {   "mData":'nameBng',
                    "bSortable": false
                },
                {   "mData":'url',
                    "bSortable": false
                },


                {
                    "mRender": function(data, type, full) {

                        var editdiv = $("#edit").clone();
                        var editbtn = $('form',editdiv);
                        editbtn.attr('action', "<%=request.getContextPath()%>/menuedit");
                        $('input[name="id"]',editbtn).val(full.id);
                        $('input[name="menunameeng"]',editbtn).val(full.nameEng);
                        $('input[name="menunamebng"]',editbtn).val(full.nameBng);
                        $('input[name="url"]',editbtn).val(full.url);

                        return editdiv.html();
                    },
                    "bVisible":true,
                    "bSortable": false



                },
                {
                    "mRender": function(data, type, full) {
                        return '<button class="btn btn-icon-only" style="background-color: black;color: white" onclick=showModal('+full.id+',\"/#\")>'+
                            ' <i class="fa fa-trash-o fa-lg"></i>'+
                            '</button>';
                    },
                    "bVisible":true,
                    "bSortable": false
                },
                {
                    "mRender": function(data, type, full) {

                        <%--var historydiv = $("#history").clone();--%>
                        <%--var historybtn = $('form',historydiv);--%>
                        <%--historybtn.attr('action', "<%=request.getContextPath()%>/divisionhistory");--%>
                        <%--$('input[name="id"]',historybtn).val(full.id);--%>
                        <%--$('input[name="name"]',historybtn).val(full.divisionNameBng);--%>

                        <%--return historydiv.html();--%>

                        var link = '<button class="btn btn-icon-only"><a href="${context}/#?id='+full.id+'&&name='+full.divisionNameBng+'"><i class="fa fa-info" style="color: black"></i></a></button>';
                        return link;
                    },
                    "bVisible":true,
                    "bSortable": false
                }





            ],
            "autoWidth":false
        });
    }
    $(document).ready(function () {
        datatableInit();
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
<script type="text/javascript" src="/global/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript"src="${context}/assets/js/common/modalcontrol.js"></script>

</body>
<!-- END BODY -->
</html>
