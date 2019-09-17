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
                                <i class="fa fa-picture"></i>Employee List
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class=" table-scrollable table-responsive">
                                <table class="table  table-striped table-bordered table-hover" id="sample_1">


                                    <thead align="center">


                                    <tr>
                                        <th>Photo </th>
                                        <th>Name </th>
                                        <%--<th> Father Name </th>--%>
                                        <%--<th>Mother Name </th>--%>
                                        <%--<th> Date of Birth </th>--%>
                                        <%--<th> NID </th>--%>
                                        <th> EMail </th>
                                        <th> Mobile </th>
                                        <th> Designation </th>
                                        <th> Section </th>
                                        <th> Is aCadre</th>
                                        <th>Id No</th>
                                        <th> Status </th>
                                        <th> edit </th>
                                        <th> delete </th>

                                    </tr>

                                    </thead>


                                </table>
                            </div>
                        </div>
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
    <%@ include file="../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../includes/includes.jsp" %>

<script>
    $(document).ready(function() {


        //ServerSide Pagination using sql query
        var table = $('#sample_1').dataTable({
            "bServerSide" : true,
            "sPaginationType": "full_numbers",
            "sEcho":1,
            "sAjaxSource" : "<%=request.getContextPath()%>/emppage",
            "iDisplayLength": 10,
            //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
            "iDisplayStart": 0,

            "aoColumns"   :[
                {
                  "mRender" : function (data, type, full) {
                      return '<img src="${context}/' +full.imageFileName+ '" alt="Profile Photo" height="64px" width="64px">';
                  }
                },
                {"mData": "nameBng"},
//                {"mData": "fatherNameBng"},
//                {"mData": "motherNameBng"},
//                {"mData": "dateOfBirth"},
//                {"mData": "nid"},
                {"mData": "personalEmail"},
                {"mData": "personalMobile"},
                {"mData": "designation"},
                {"mData": "section"},
                {"mData": "isCadre"},
                {"mData": "identityNo"},
                {"mData": "status"},
                {
                    "mRender": function(data, type, full) {


                        return '<form method="post" action="${context}/editemp">'+
                            '<input type="hidden" name="id" value="'+full.id+'">'+
                            '<input type="hidden" name="thananameeng" value="'+full.nameEng+'">'+
                            '<input type="hidden" name="thananamebng" value="'+full.nameBng+'">'+
                            '<input type="hidden" name="bbscode" value="'+full.fatherNameEng+'">'+
                            '<input type="hidden" name="divisionbbscode" value="'+full.fatherNameBng+'">'+
                            '<input type="hidden" name="districtbbscode" value="'+full.motherNameEng+'">'+
                            '<input type="hidden" name="divId" value="'+full.motherNameBng+'">'+
                            '<input type="hidden" name="disId" value="'+full.dateOfBirth+'">'+
                            '<button type="submit" name="submit_param" value="submit_value" class="link-button">'+
                            "Edit"+
                            '</button>'+
                            '</form>';
                    }

                },
                {
                    "mRender": function(data, type, full) {
                        // return '<a href=<%=request.getContextPath()%>/upazilapage/'+full.id+'>' + "Edit" + '</a>';

                        return '<form method="post" action="${context}/deleteemp">'+
                            '<input type="hidden" name="id" value="'+full.id+'">'+
                            '<button type="submit" name="submit_param" value="submit_value" class="link-button btn-danger">'+
                            "Delete"+
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