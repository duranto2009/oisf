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
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../../includes/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${context}/assets/styles/inbox-details.css"/>
    <%--<link rel="stylesheet" type="text/css" href="${context}/assets/styles/styles.css"/>--%>
    <style type="text/css">
        .minheight{
            min-height: 300px;
        }
        .modal-header{
            background-color: #00aa00;
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

        <div class="page-content">

            <form id="productionForm" name="productionForm" method="POST" style="display:none;">
                <input type="text">
                <button type="submit"></button>
            </form>
            <div class="card">
                <div class="card-block">
                    <div class="portlet box " >
                        <div style="display: inline" class="portlet-title">
                            <div style="display: inline" class="caption">
                                <i class="fa fa-picture"></i>Union List
                            </div>


                        </div>
                        <div class="portlet-body">
                            <div class=" table-scrollable table-responsive">
                                <table class="table  table-striped table-bordered table-hover" id="sample_1">


                                    <thead align="center">


                                    <tr>
                                        <th> id</th>
                                        <th> name_eng</th>
                                        <th> name_bng</th>
                                        <th> name_eng_short</th>
                                        <th> reference_code</th>
                                        <th> edit</th>
                                        <th> delete</th>

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
    <%@ include file="../../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../../includes/includes.jsp" %>

<script>


    $(document).ready(function () {




        //ServerSide Pagination using sql query
        var table = $('#sample_1').dataTable({
            "bServerSide": true,
            "sDom": '<"toolbar">l<"minheight"t><"row"<"col-lg-6 col-md-6 float-left"i><"col-lg-6 col-md-6 float-right"p>>',
            "sPaginationType": "full_numbers",
            "sEcho": 1,
            // "ajax": {
            //     "url": "<%=request.getContextPath()%>/officeministrypage",
            //     "type": "POST",
            //     "data": {
            //         "para":"para"
            //     }
            // },
            "sAjaxSource": "<%=request.getContextPath()%>/officeministrypage",
            "iDisplayLength": 10,
            //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
            "iDisplayStart": 0,
            "aoColumns": [
                {"mData": "id"},
                {"mData": "nameEng"},
                {"mData": "nameBng"},
                {"mData": "nameEngShort"},
                {"mData": "referenceCode"},
                {
                    "mRender": function (data, type, full) {
                        // return '<a href=<%=request.getContextPath()%>/officeministrypage/'+full.id+'>' + "Edit" + '</a>';

                        return '<form method="post" action="<%=request.getContextPath()%>/editofficeministryview">' +
                            '<input type="hidden" name="id" value="' + full.id + '">' +
                            '<input type="hidden" name="officetype" value="' + full.officeType + '">' +
                            '<input type="hidden" name="officeministrynameeng" value="' + full.nameEng + '">' +
                            '<input type="hidden" name="officeministrynamebng" value="' + full.nameBng + '">' +
                            '<input type="hidden" name="officeministryengshort" value="' + full.nameEngShort + '">' +
                            '<input type="hidden" name="referencecode" value="' + full.referenceCode + '">' +
                            '<input type="hidden" name="activestatus" value="' + full.activeStatus + '">' +
                            '<button type="submit" name="submit_param" value="submit_value" class="link-button">' +
                            "Edit" +
                            '</button>' +
                            '</form>';
                    }

                },
                {
                    "mRender": function (data, type, full) {

                        return '<button class="btn btn-icon-only btn-danger" onclick=showModal('+full.id+',\"/deleteofficeministry\")>'+
                            '<i class="fa fa-times"></i>'+
                            '</button>';
                    }
                }
            ]


        });

        // $("div.toolbar").html('<div style="display:flex;width: 20%; float:right" > <input type="password" style="flex:1"> <button class="fa fa-arrow-down" id="advancesearch" type="submit"></button></div>');


        $("div.toolbar").html('<div class="inbox-header">\
                                 <form id="file-search" class="pull-right form-inline" action="javascript:;">\
                                    <div class="input-group" style="width: auto !important;display:flex;width: 20%; float:right">\
                                        <input id="searchFileMessage" type="text" class="form-control" styles="heigth = 100%" placeholder="Search...">\
                                        <div class="dropdown dropdown-lg">\
                                            <button id = "advancesearchoption" style="padding-bottom: 4px;height: 33px" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="true" ><span class="md-click-circle md-click-animate" style="height: 36px; width: 36px; top: -3px; left: 2px;"></span><span class="caret"></span></button>\
                                            <div class="dropdown-menu dropdown-menu-right advanced-file-search" role="menu" style="background-color: #fffffe;margin-top: 2px;">\
                                                <table>\
                                                    <thead>\
                                                        <th></th>\
                                                        <th></th>\
                                                    </thead>\
                                                    <tbody>\
                                                        <tr>\
                                                            <td>\
                                                                <label class="control-label">Union Name<span\
                                                                class="required" aria-required="true"> * </span></label>\
                                                            </td>\
                                                            <td style="padding-left:10px;padding-bottom:10px">\
                                                                <div class="">\
                                                                    <div class="input-icon">\
                                                                        <i class="fa fa-angle-double-right tooltips "\
                                                                            data-original-title="please write Union Name"\
                                                                            data-container="body"></i>\
                                                                            <input style="padding-left:25px" type="text" data-required="1" class="form-control"\
                                                                                    name="officeministryname">\
                                                                    </div>\
                                                                </div>\
                                                            </td>\
                                                        </tr>\
                                                        <tr>\
                                                            <td>\
                                                                <label class="control-label">Union BBS Code<span\
                                                                    class="required" aria-required="true"> * </span></label>\
                                                            </td>\
                                                            <td style="padding-left:10px;padding-bottom:10px">\
                                                                <div class="">\
                                                                    <div class="input-icon">\
                                                                        <i class="fa fa-angle-double-right tooltips "\
                                                                            data-original-title="please write Union BBS Code"\
                                                                            data-container="body"></i>\
                                                                            <input style="padding-left:25px" type="text" data-required="1" class="form-control"\
                                                                                    name="officeministryreferencecode">\
                                                                    </div>\
                                                                </div>\
                                                            </td>\
                                                        </tr>\
                                                    </tbody>\
                                                </table>\
                                                <div class="row" style="padding: 5px 0px;">\
                                                    <div class="form-group pull-right col-xs-4">\
                                                        <button id="AdvancedSearchCancel" name="AdvancedSearchCancel" type="reset" class="btn btn-danger btn-sm pull-left"><span class="glyphicon glyphicon-" aria-hidden="true"></span>বাতিল</button>\
                                                        <button id="AdvancedSearchSubmit" name="AdvancedSearchSubmit" type="button" class="btn btn-primary btn-sm pull-right"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>অনুসন্ধান</button>\
                                                    </div>\
                                                </div>\
                                            </div>\
                                        </div>\
                                    </div>\
                                 </form>\
                               </div>');
        //$('#search-inp').onclick(function(){
        // table.search($(this).val());
        //   table.fnFilter(1);
        // });


        $('.dropdown-menu.advanced-file-search').click(function (event) {
            event.stopPropagation();
        });

        $('#AdvancedSearchSubmit').click(function () {
            //  if($('#divisiondropdown').val()!=-1){
            var searchKey = $('input[name = officeministryname]').val()+";"+$('input[name = officeministryreferencecode]').val()+";";
            table.fnFilter(searchKey);



            //}


        });

        $('#searchFileMessage').keyup(function () {
            var searchKey = $(this).val()+";";
            table.fnFilter(searchKey);
            $('div.dropdown.dropdown-lg').removeClass("open");

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