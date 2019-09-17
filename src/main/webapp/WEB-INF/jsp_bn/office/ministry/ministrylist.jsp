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
    <%@ include file="../../includes/head.jsp" %>
    <link href="${context}/assets/css/common/datatablecustom.css" rel="stylesheet" type="text/css"/>
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

            <div class="card" >
                <div class="card-block">
                    <div class="portlet box " >
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-picture"></i> মন্ত্রণালয় তালিকা
                            </div>


                        </div>


                        <div class="portlet-body">
                            <div class=" pull-right" id="addassign" style="margin-bottom: 40px;margin-top: 10px">

                            </div>

                            <div class=" table-scrollable table-responsive">
                                <table class="table  table-striped  table-hover" id="datatable">

                                    <thead>

                                    <th > মন্ত্রণালয়  নাম(ইংরেজিতে)</th>
                                    <th >মন্ত্রণালয়  নাম (বাংলাতে) </th>
                                    <th >মন্ত্রণালয়  সংক্ষিপ্ত নাম (ইংরেজিতে)</th>
                                    <th > রেফারেন্স কোড</th>
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
                        <input type="hidden" name="officetype">
                        <input type="hidden" name="officeministrynameeng">
                        <input type="hidden" name="officeministrynamebng">
                        <input type="hidden" name="officeministryengshort">
                        <input type="hidden" name="referencecode">
                        <input type="hidden" name="status">
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
    <%@ include file="../../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../../includes/includes.jsp" %>

<script>
    var example_table;
    var msg = 'মন্ত্রণালয়';
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
                "emptyTable":     "মন্ত্রণালয় খুজে পাওয়া যায় নাই",
                "info":           " মোট _TOTAL_ মন্ত্রণালয়ের মধ্যে _START_ থেকে _END_ পর্যন্ত দেখানো হচ্ছে",
                "infoEmpty":      "মন্ত্রণালয় খুজে পাওয়া যায় নাই",
                "infoFiltered":   "(filtered from _MAX_ total entries)",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "_MENU_",
                "loadingRecords": "Loading...",
                "processing":     "Processing...",
                "search":         " খুঁজুন",
                "zeroRecords":    "মন্ত্রণালয় খুজে পাওয়া যায় নাই",
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
            "sAjaxSource" : "<%=request.getContextPath()%>/ministrypagedata",
            "iDisplayLength": 10,
            "iDisplayStart": 0,
            "aoColumns"   :[
                {   "mData": 'nameEng',
                    "bSortable": false
                },
                {   "mData":'nameBng',
                    "bSortable": false
                },
                {   "mData":'nameEngShort',
                    "bSortable": false
                },
                {   "mData":'referenceCode',
                    "bSortable": false
                },
                {
                    "mRender": function(data, type, full) {

                        var editdiv = $("#edit").clone();
                        var editbtn = $('form',editdiv);
                        editbtn.attr('action', "<%=request.getContextPath()%>/ministryedit");
                        $('input[name="id"]',editbtn).val(full.id);
                        $('input[name="officetype"]',editbtn).val(full.officeType);
                        $('input[name="officeministrynameeng"]',editbtn).val(full.nameEng);
                        $('input[name="officeministrynamebng"]',editbtn).val(full.nameBng);
                        $('input[name="officeministryengshort"]',editbtn).val(full.nameEngShort);
                        $('input[name="referencecode"]',editbtn).val(full.referenceCode);
                        $('input[name="status"]',editbtn).val(full.status);
                        return editdiv.html();
                    },
                    "bVisible":evisible,
                    "bSortable": false



                },
                {
                    "mRender": function(data, type, full) {
                        return '<button class="btn btn-icon-only" style="background-color: black;color: white" onclick=showModal('+full.id+',\"/ministrydelete\",msg.trim())>'+
                            ' <i class="fa fa-trash-o fa-lg"></i>'+
                            '</button>';
                    },
                    "bVisible":dvisible,
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

                        var link = '<button class="btn btn-icon-only"><a href="${context}/ministryhistory?id='+full.id+'&&name='+full.nameBng+'"><i class="fa fa-info" style="color: black"></i></a></button>';
                        return link;
                    },
                    "bVisible":hvisible,
                    "bSortable": false
                }


            ],
            "autoWidth":false
        });
    }
    $(document).ready(function () {

        $.ajax({
            type:"POST",
            url : "${context}/permission",
            data : {
                menuid: $("#menuid").val()
            },
            async: false,
            success : function(response) {
                var addassign = $("#addassign");
                var list = [];
                for(var i=0;i<response.length;i++){
                    var x = response[i].menuType;
//                    if(x.indexOf("add")>=0)list["add"]={ispresent:1,nameeng:response[i].nameEng,namebng:response[i].nameBng,url:response[i].url};
//                    else  if(x.indexOf("assign")>=0)list["assign"]={ispresent:1,nameeng:response[i].nameEng,namebng:response[i].nameBng,url:response[i].url};
//                    else  if(x.indexOf("edit")>=0)list["edit"]={ispresent:1,nameeng:response[i].nameEng,namebng:response[i].nameBng,url:response[i].url};
//                    else  if(x.indexOf("delete")>=0)list["delete"]={ispresent:1,nameeng:response[i].nameEng,namebng:response[i].nameBng,url:response[i].url};
//                    else  if(x.indexOf("history")>=0)list["history"]={ispresent:1,nameeng:response[i].nameEng,namebng:response[i].nameBng,url:response[i].url};

                    list[x]=1;
                }
                if(list[2]==1)addassign.append('<button type="button" class="btn " style="margin-right: 30px; background-color: #adadce"><a href="${context}/ministryadd">নতুন মন্ত্রণালয় তৈরি</a></button>');
                datatableInit(list[3],list[4],list[6]);
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
<!-- END BODY -->
</html>