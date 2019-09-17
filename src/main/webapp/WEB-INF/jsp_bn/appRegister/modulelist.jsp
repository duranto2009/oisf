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
                <div class="card">
                <div class="card-block">
                    <div class="portlet box " >
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-picture"></i> মডিউল  তালিকা
                            </div>

                        </div>
                        <div class="portlet-body">
                            <form action="/addmodule" method="post">
                                <input type="hidden" name="id" value="${id} ">
                                <input type="hidden" name="name" value="${name}">
                                <input type="hidden" name="url" value="${url}">
                            <div class=" pull-right" id="addassign" style="margin-bottom: 40px;margin-top: 10px">

                                <%--<button type="submit" name="submit_param" value="submit_value" class="link-button btn-green">--%>
                               <%--<i class="fa fa-info" style="color: black"> মডিউল  সংযুক্ত করুন</i>--%>
                                <%--</button>--%>

                                    <button type="submit" class="btn " style="margin-right: 30px; background-color: #adadce"> মডিউল  সংযুক্ত করুন </button></div>
                            </form>


                            <div class=" table-scrollable table-responsive">
                                <table class="table  table-striped table-bordered table-hover" id="datatable">
                                    <input type="hidden" id="id" value = "${id}">

                                    <thead>
                                        <th>Id</th>
                                        <th> মডিউল নাম (ইংরেজিতে)</th>
                                        <th> মডিউল নাম  (বাংলাতে)</th>
                                        <th>ইউ আর এল</th>
                                        <%--<th>ইমেইল</th>--%>
                                        <%--<th>মোবাইল নং</th>--%>
                                        <%--<th>নটিফিকেশন পদ্ধতি</th>--%>
                                        <th> সংশোধন করুন</th>
                                        <th> দূর করুন</th>
                                        <%--<th> মডিউল তালিকা</th>--%>
                                    </thead>



                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- BEGIN PAGE CONTENT INNER -->
            <!-- BEGIN DASHBOARD STATS -->

            <!-- END DASHBOARD STATS -->
            <!-- END PAGE CONTENT INNER -->
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
<%@ include file="../includes/includes.jsp" %>
<script>
    var example_table;
    $(document).ready(function () {

        $('#datatable tbody').on('click', 'button', function () {
            var data = table.row($(this).parents('tr')).data();
            alert(data[0]);
        });

         example_table = $('#datatable').DataTable({

            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "সব"]],

            "language":{
                "decimal":        "১",
                "search":         "খুঁজুন :",
                "emptyTable":     " মডিউল খুজে পাওয়া যায় নাই",
                "info":           " মোট _TOTAL_ মডিউল এর মধ্যে _START_ থেকে _END_ পর্যন্ত দেখানো হচ্ছে",
                "zeroRecords":    "মডিউল খুজে পাওয়া যায় নাই",
                "paginate": {
                    "first":      "প্রথম",
                    "last":       "শেষ",
                    "next":       "পরে",
                    "previous":   "আগে"
                },
                "lengthMenu":     "_MENU_ রেকর্ডস",



            },




            'ajax': {
                url: '${context}/modulelistdata',
                method:"GET",
                data:{
                  id:${id},
                },

                processing: true,
                dataSrc: '',
                sEcho: 1
            },
            'columns': [
                {data: 'id', bVisible: false},
                {data: 'nameEng'},
                {data: 'nameBng'},
                {data: 'url'},
                {
                    "mRender": function (data, type, full) {


                        return '<form method="get" action="${context}/editmoduleform">' +
                            '<input type="hidden" name="id" value="' + full.id + '">' +
                            '<input type="hidden" name="name" value="' + full.nameEng + '">' +
                            '<input type="hidden" name="nameBng" value="' + full.nameBng + '">' +
                            '<input type="hidden" name="url" value="' + full.url + '">' +
                            '<button type="submit" name="submit_param" value="submit_value" class="btn btn-icon-only">' +
                            "<i class=\"fa fa-pencil-square-o\" aria-hidden=\"true\"></i>" +
                            '</button>' +
                            '</form>';
                    }
                },
                {
                    "mRender": function (data, type, full) {

                        <%--return '<form method="post" action="${context}/deletemodule">' +--%>
                            <%--'<input type="hidden" name="id" value="' + full.id + '">' +--%>
                            <%--'<button type="submit" "name="submit_param" value="submit_value" class="btn btn-icon-only"' +--%>
                            <%--' onclick="return bootbox.confirm(\'Are you sure you want to delete this item?\')">' +--%>
                            <%--'<i class="fa fa-trash-o fa-lg"></i>' +--%>
                            <%--'</button>' +--%>
                            <%--'</form>';--%>
                        return '<button class="btn btn-icon-only"  onclick=showDeclineBootBox(' + full.id + ',\"${context}/deletemodule\","মডিউল")>' +
                            ' <i class="fa fa-trash-o fa-lg"></i> ' +
                            '</button>';
                    }
                },
                <%--{--%>
                    <%--"mRender": function (data, type, full) {--%>

                        <%--return '<form method="post" action="${context}/addmodule">' +--%>
                            <%--'<input type="hidden" name="id" value="' + full.id + '">' +--%>
                            <%--'<input type="hidden" name="name" value="'+full.name+'">'+--%>
                            <%--'<input type="hidden" name="url" value="'+full.link+'">'+--%>
                            <%--'<button type="submit" "name="submit_param" value="submit_value" class="link-button btn-green">' +--%>
                            <%--'<i class="fa fa-info" style="color: black"></i>' +--%>
                            <%--'</button>' +--%>
                            <%--'</form>';--%>
                    <%--}--%>
                <%--}--%>





            ],
        })
    });

    function showDeclineBootBox(id,url,item) {
        bootbox.confirm({
            message: '<p class="text-center">আপনি কি এই '+ item +' টি বাতিল করতে চান?</p>',
            title: item + " বাতিল",
            buttons: {
                confirm: {
                    label: 'হ্যাঁ',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'না',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if(result == true){
                    var data;
                    $.ajax({
                        type:"POST",
                        url : url,
                        data : {
                            id: id
                        },
                        async: false,
                        success : function(response) {
                            if(response ==1)
                            {
                                data = response;
                                $('.modal.in .modal-dialog').hide();
                                $(".modal.in .modal-dialog .btn").off("click");
                                toastr.success(item +"টি সফলভাবে মুছে ফেলা হয়েছে ","সার্থক");
                                // window.location.href="list";
                                reload();
                            }
                            else if(response ==2)
                            {
                                toastr.error(" আপনি যে " + item + "টি মুছতে চাইছেন সেটির আরো শাখা /পদ আছে এই " + item + "টি মুছতে হলে এর নিচের সব শাখা/পদ প্রথমে মুছে নিন ","দুঃখিত");
                            }
                            else
                            {
                                toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ","দুঃখিত");
                            }
                        },
                        error: function() {
                            toastr.options = {
                                "closeButton": true,
                                "debug": false,
                                "positionClass": "toast-bottom-right"
                            };
                            toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ","দুঃখিত");
                        }
                    });

                }else{
                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");
                }

            }
        });

    }
    function reload(){
        example_table.ajax.reload();
    }

</script>
<!-- END FOOTER -->


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

<%--bootbox--%>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
</body>
<!-- END BODY -->
</html>
