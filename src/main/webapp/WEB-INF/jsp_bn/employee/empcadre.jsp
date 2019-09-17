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

    <%@ include file="../includes/head.jsp" %>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <link href="${context}/assets/css/common/datatablecustom.css" rel="stylesheet" type="text/css"/>
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

        <div class="page-content">


            <div class="card">
                <div class="card-block">
                    <div class="portlet box " >
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-picture"></i>   ক্যাডার   তালিকা
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class=" pull-right" id="addassign" style="margin-bottom: 40px;margin-top: 10px">

                                <button type="button" class="btn " style="margin-right: 30px; background-color: #adadce"><a href="/empcadreadd"> ক্যাডার সংযুক্ত করুন  </a>
                                </button>
                            </div>

                            <div class=" table-scrollable table-responsive">
                                <table class="table  table-striped table-bordered table-hover" id="datatable">


                                    <thead align="center">


                                    <tr>
                                        <th>  নাম  (ইংরেজিতে)   </th>
                                        <th> নাম  (বাংলাতে)    </th>

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
        </div>
        <input type="hidden" id="menuid" value="${menuid}">

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
    $(document).ready(function() {


        //ServerSide Pagination using sql query
        var table = $('#datatable').dataTable({
            "bServerSide" : true,
            "sDom": '<"row" <"col-md-6 col-sm-12"l><"col-md-6 col-sm-12"f>><"table-scrollable"t><"row" <"col-md-5 col-sm-12"i><"col-md-7 col-sm-12"p>>',
            "sPaginationType": "full_numbers",
            "sEcho":1,
            "sAjaxSource" : "<%=request.getContextPath()%>/cadrepage",
            "iDisplayLength": 10,
            //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
            "iDisplayStart": 0,

            "aoColumns"   :[
                {"mData": "cadreNameEng"},
                {"mData": "cadreNameBng"},
                {
                    "mRender": function(data, type, full) {


                        return '<form method="post" action="${context}/editempcadre">'+
                            '<input type="hidden" name="id" value="'+full.id+'">'+
                            '<input type="hidden" name="cadreNameEng" value="'+full.cadreNameEng+'">'+
                            '<input type="hidden" name="cadreNameBng" value="'+full.cadreNameBng+'">'+
                            '<button type="submit" name="submit_param" value="submit_value" class="btn btn-icon-only">'+
                            '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>'+
                            '</button>'+
                            '</form>';
                    }

                },
                {
                    "mRender": function(data, type, full) {
                        // return '<a href=<%=request.getContextPath()%>/upazilapage/'+full.id+'>' + "Edit" + '</a>';

                        return '<form method="post" action="${context}/empcadredelete">'+
                            '<input type="hidden" name="id" value="'+full.id+'">'+
                            '<button class="btn btn-icon-only" style="background-color: black;color: white">'+
                            '<i class="fa fa-trash-o fa-lg"></i>'+
                            '</button>'+
                            '</form>';
                    }
                },

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
<script type="text/javascript" src="${context}/assets/admin/pages/scripts/table-advanced.js"></script>
<script src="${context}/assets/admin/pages/scripts/table-advanced.js"></script>
</body>

</html>
