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
    <c:set var="context" value="${pageContext.request.contextPath}" />

    <%@ include file="../includes/head.jsp" %>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed">
<!-- BEGIN HEADER -->
<div class="page-header -i navbar navbar-fixed-top">
    <%@ include file="../includes/header.jsp" %>
</div>
<!-- END HEADER -->

<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->

    <div class="page-sidebar-wrapper"style="margin-top: 20px">
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
                                <i class="fa fa-picture"></i>Wating For Approval </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse"> </a>
                                <a href="#portlet-config" data-toggle="modal"><i class="fa fa-plus"></i> </a>
                                <%--<a href="javascript:;" class="reload"> </a>--%>
                                <a href="javascript:;" class="remove"> </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class=" table-scrollable table-responsive">
                                <table class="table  table-striped table-bordered table-hover" id="datatable">

                                    <thead>
                                    <th>Id</th>
                                    <th>App Name</th>
                                    <th>Bangla Name</th>
                                    <th>Url</th>
                                    <th>Email</th>
                                    <th>Mobile No</th>
                                    <th>Notification Mechanism</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
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
    $(document).ready(function () {

        $('#datatable tbody').on('click', 'button', function () {
            var data = table.row($(this).parents('tr')).data();
            alert(data[0]);
        });

        var example_table = $('#datatable').DataTable({
            'ajax': {
                url: '<%=request.getContextPath()%>/approvelist',
                processing: true,
                dataSrc: '',
                sEcho: 1
            },
            'columns': [
                {data: 'id', bVisible: false},
                {data: 'name'},
                {data: 'nameBng'},
                {data: 'link'},
                {data: 'appDomainEmail'},
                {data: 'mobileNo'},
                {data: 'notificationFlag'},
                {
                    "mRender": function (data, type, full) {


                        return '<form method="post" action="${context}/approveapp">' +
                            '<input type="hidden" name="id" value="' + full.id + '">' +
                            '<button type="submit" name="submit_param" value="submit_value" class="link-button btn-success">' +
                            "Approve" +
                            '</button>' +
                            '</form>';
                    }
                },
                {
                    "mRender": function (data, type, full) {

                        return '<form method="post" action="${context}/deleteapp">' +
                            '<input type="hidden" name="id" value="' + full.id + '">' +
                            '<button type="submit" "name="submit_param" value="submit_value" class="link-button btn-danger"' +
                            ' onclick="return bootbox.confirm(\'Are you sure you want to delete this item?\')">' +
                            "Decline" +
                            '</button>' +
                            '</form>';
                    }
                }



            ],
        })
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
<!-- END BODY -->
</html>

</html>