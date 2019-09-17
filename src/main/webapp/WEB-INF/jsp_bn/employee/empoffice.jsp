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
    <c:set var="context" value="${pageContext.request.contextPath}"/>
    <link href="${context}/assets/css/common/datatablecustom.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${context}/assets/styles/inbox-details.css"/>
    <%--<link rel="stylesheet" type="text/css" href="${context}/assets/styles/styles.css"/>--%>


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
                                <i class="fa fa-picture"></i> কর্মকর্তা তালিকা
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class=" pull-right" id="addassign" style="margin-bottom: 40px;margin-top: 10px">

                            </div>
                            <div class=" table-scrollable table-responsive">
                                <table class="table  table-striped table-bordered table-hover" id="datatable">


                                    <thead align="center">


                                    <tr>
                                        <th> ছবি</th>
                                        <th> নাম</th>
                                        <th> ইমেইল</th>
                                        <th> মোবাইল</th>
                                        <th> পদ্মর্যাদা</th>
                                        <th> সেকশন</th>
                                        <th> ক্যাডার ?</th>
                                        <th> আই ডি নাম্বার</th>
                                        <th> স্ট্যাটাস</th>
                                        <th style="width: 5px;"></th>
                                        <th style="width: 5px;"></th>
                                        <th style="width: 5px;"></th>

                                    </tr>

                                    </thead>
                                    <tbody>

                                    </tbody>


                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div style="display: none">

                <div id="edit">
                    <form method="post">
                        <input type="hidden" name="id">
                        <input type="hidden" name="name_eng">
                        <input type="hidden" name="name_bng">
                        <input type="hidden" name="father_name_eng">
                        <input type="hidden" name="father_name_bng">
                        <input type="hidden" name="mother_name_eng">
                        <input type="hidden" name="mother_name_bng">
                        <%--<input type="hidden" name="upazillabbscode">--%>
                        <input type="hidden" name="birth_date">
                        <input type="hidden" name="nid">
                        <input type="hidden" name="bcn">
                        <input type="hidden" name="ppn">
                        <input type="hidden" name="gender">
                        <input type="hidden" name="religion">
                        <input type="hidden" name="blood_group">
                        <input type="hidden" name="maritalStatus">
                        <input type="hidden" name="personal_email">
                        <input type="hidden" name="personal_mobile">
                        <input type="hidden" name="alternative_mobile">
                        <input type="hidden" name="is_cadre">
                        <input type="hidden" name="employee_cadre_id">
                        <input type="hidden" name="employee_batch_id">
                        <input type="hidden" name="identity_no">
                        <input type="hidden" name="appointment_memo_no">
                        <input type="hidden" name="joining_date">

                        <button type="submit" name="submit_param" value="submit_value" class="btn btn-icon-only">
                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>


                <div id="history">
                    <form method="post">
                        <input type="hidden" name="id">
                        <input type="hidden" name="name">
                        <button type="submit" name="submit_param" value="submit_value" class="btn btn-icon-only">
                            <i class="fa fa-info"></i>
                        </button>
                    </form>
                </div>
            </div>
            <input type="hidden" id="menuid" value="${menuid}">
            <div id='advancesearch' style="display:none;">
                <div class="inbox-header">
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


                                        <label class="control-label"> আইডি নং <span
                                                class="required" aria-required="true"> * </span></label>

                                        <input type="text" class="form-control" name="empid" id="empid">
                                        </input>
                                    </div>

                                    <div>

                                        <label class="control-label"> মোবাইল নং <span
                                                class="required" aria-required="true"> * </span></label>

                                        <input type="text" class="form-control" name="mobile" id="mobile">
                                        </input>

                                    </div>

                                    <div>

                                        <label class="control-label"> ইমেইল <span
                                                class="required" aria-required="true"> * </span></label>

                                        <input type="email" class="form-control" name="email" id="email">
                                        </input>

                                    </div>

                                    <div class="row" style="margin-top: 40px;">
                                        <div>
                                            <button id="AdvancedSearchCancel" name="AdvancedSearchCancel" type="reset"
                                                    class="btn btn-danger btn-sm pull-left"><span
                                                    class="glyphicon glyphicon-"
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
    <%@ include file="../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../includes/includes.jsp" %>

<script>

    var example_table;

    function reload() {
        example_table.ajax.reload();
    }


    function datatableInit(edi, del, his) {
        var evisible = false, dvisible = false, hvisible = false;
        if (edi != undefined) evisible = true;
        if (del != undefined) dvisible = true;
        if (his != undefined) hvisible = true;
        //ServerSide Pagination using sql query
        example_table = $('#datatable').dataTable({
            "bServerSide": true,
            "sPaginationType": "full_numbers",
            "sDom": '<"row" <"col-md-6 col-sm-12"l><"col-md-6 col-sm-12"<"toolbar">>><"table-scrollable"t><"row" <"col-md-5 col-sm-12"i><"col-md-7 col-sm-12"p>>',
            "sEcho": 1,
            "language": {
                "decimal": "১",
                "emptyTable": "কর্মকর্তা খুজে পাওয়া যায় নাই",
                "info": " মোট _TOTAL_ জন কর্মকর্তা এর মধ্যে  _START_ থেকে _END_ পর্যন্ত দেখানো হচ্ছে",
                "infoEmpty": "কর্মকর্তা খুজে পাওয়া যায় নাই",
                "infoFiltered": "(filtered from _MAX_ total entries)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "_MENU_",
                "loadingRecords": "Loading...",
                "processing": "Processing...",
                "search": "খুঁজুন",
                "zeroRecords": "কর্মকর্তা খুজে পাওয়া যায় নাই",
                "paginate": {
                    "first": "প্রথম",
                    "last": "শেষ",
                    "next": "পরে",
                    "previous": "আগে"
                },
                "aria": {
                    "sortAscending": ": activate to sort column ascending",
                    "sortDescending": ": activate to sort column descending"
                }
            },
            "sAjaxSource": "<%=request.getContextPath()%>/empofficepage",
            "iDisplayLength": 10,
            //We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
            "iDisplayStart": 0,

            "aoColumns": [
                {
                    "mRender": function (data, type, full) {
                        return '<img src="${context}/' + full.imageFileName + '" alt="Profile Photo" height="64px" width="64px">';
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
                    "mRender": function (data, type, full) {


                        var editdiv = $("#edit").clone();
                        var editbtn = $('form', editdiv);
                        editbtn.attr('action', "${context}/editemp");
                        $('input[name="id"]', editbtn).val(full.id);
                        $('input[name="name_eng"]', editbtn).val(full.nameEng);
                        $('input[name="name_bng"]', editbtn).val(full.nameBng);
                        $('input[name="father_name_eng"]', editbtn).val(full.fatherNameEng);
                        $('input[name="father_name_bng"]', editbtn).val(full.fatherNameBng);
                        $('input[name="mother_name_eng"]', editbtn).val(full.motherNameEng);
                        $('input[name="mother_name_bng"]', editbtn).val(full.motherNameBng);
                        $('input[name="birth_date"]', editbtn).val(full.dateOfBirth);
                        $('input[name="nid"]', editbtn).val(full.nid);

                        $('input[name="bcn"]', editbtn).val(full.bcn);
                        $('input[name="ppn"]', editbtn).val(full.ppn);
                        $('input[name="gender"]', editbtn).val(full.gender);
                        $('input[name="religion"]', editbtn).val(full.religion);
                        $('input[name="blood_group"]', editbtn).val(full.bloodGroup);
                        $('input[name="maritalStatus"]', editbtn).val(full.maritalStatus);
                        $('input[name="personal_email"]', editbtn).val(full.personalEmail);
                        $('input[name="personal_mobile"]', editbtn).val(full.personalMobile);
                        $('input[name="alternative_mobile"]', editbtn).val(full.alternativeMobile);
                        $('input[name="is_cadre"]', editbtn).val(full.isCadre);

                        $('input[name="employee_cadre_id"]', editbtn).val(full.employeeCadreId);
                        $('input[name="employee_batch_id"]', editbtn).val(full.employeeBatchId);
                        $('input[name="identity_no"]', editbtn).val(full.identityNo);
                        $('input[name="appointment_memo_no"]', editbtn).val(full.appointmentMemoNo);
                        $('input[name="joining_date"]', editbtn).val(full.joiningDate);

                        // $('input[name="is_cadre"]', editbtn).val(full.isCadre);
                        return editdiv.html();


                    },
                    "bVisible": evisible,
                    "bSortable": false

                },
                {
                    "mRender": function (data, type, full) {
                        // return '<a href=<%=request.getContextPath()%>/upazilapage/'+full.id+'>' + "Edit" + '</a>';


                        return '<button class="btn btn-icon-only" style="background-color: black;color: white" onclick=showModal(' + full.id + ',\"/deleteemp\")>' +
                            ' <i class="fa fa-trash-o fa-lg"></i>' +
                            '</button>';


                        <%--return '<form method="post" action="${context}/deleteemp">'+--%>
                        <%--'<input type="hidden" name="id" value="'+full.id+'">'+--%>
                        <%--'<button type="submit" name="submit_param" value="submit_value" class="link-button btn-danger">'+--%>
                        <%--"Delete"+--%>
                        <%--'</button>'+--%>
                        <%--'</form>';--%>
                    },
                    "bVisible": dvisible,
                    "bSortable": false
                },
                {
                    "mRender": function (data, type, full) {

                        var link = '<a href="${context}/emphistory?id=' + full.id + '&&name=' + full.nameBng + '"><button class="btn btn-icon-only"><i class="fa fa-info" style="color: black"></i></button></a>';
                        return link;
                    },
                    "bVisible": hvisible,
                    "bSortable": false
                }

            ],
            // "autoWidth":false


        });
    }


    $('.dropdown-menu.advanced-file-search').click(function (event) {
        event.stopPropagation();
    });

    $('#AdvancedSearchSubmit').click(function () {
        var empid = $('#empid').val();
        var email = $('#email').val();
        var mobile = $('#mobile').val();
        if(empid == "") {
            empid = " ";
        }
        if(email == "" ) {
            email = " ";
        }
        if(mobile == "") {
            mobile = " ";
        }

        $('#empid').empty();
        $('#email').empty();
        $('#mobile').empty();

        var searchKey = empid + ";" + mobile + ";" + email;
        $('#datatable').dataTable().fnFilter(searchKey);
        $('div.dropdown.dropdown-lg').removeClass("open");


    });

    $(document).ready(function () {

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
                if (list[2] == 1) addassign.append('<button type="button" class="btn " style="margin-right: 30px; background-color: #adadce"><a href="${context}/empadd"> এমপ্লয়ি অ্যাড করুন </a></button>');
//                if (list[5] == 1) addassign.append('<button type="button" class="btn " style="margin-right: 30px; background-color: #b5b1b1"><a href="/unionassign">Assign Uni/Muni</a></button>');
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


        //datatableInit(true, true, true);

        var $advanceSearch = $('#advancesearch').clone(true,true);
        $advanceSearch.css('display','block');

        $("div.toolbar").html($advanceSearch);


        $('.dropdown-menu.advanced-file-search').click(function (event) {
            event.stopPropagation();
        });

        // $('#AdvancedSearchSubmit').click(function () {
        //     //  if($('#divisiondropdown').val()!=-1){
        //     var searchKey = $('#divisiondropdown').val() + ";" + $('#districtdropdown').val() + ";" + $('#upazilladropdown').val();
        //     $('#datatable').dataTable().fnFilter(searchKey);
        //     $('div.dropdown.dropdown-lg').removeClass("open");
        //     // $('#districtdropdown').empty();
        //     // $('#upazilladropdown').empty();
        //
        //
        // });

        $('#searchFileMessage').keyup(function () {
            var searchKey = $(this).val() + ";";
            $('#datatable').dataTable().fnFilter(searchKey);
            $('div.dropdown.dropdown-lg').removeClass("open");

        });

        // $('#advancesearchoption').click(function () {
        //     $('#searchFileMessage').val("");
        //     //table.fnFilter(";");
        //     if ($('#divisiondropdown option').size() > 2) {
        //         return;
        //     }
        // });

    })
    ;


</script>


<script type="text/javascript" src="${context}/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${context}/assets/admin/pages/scripts/table-advanced.js"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript" src="${context}/static/assets/js/common/modalcontrol.js"></script>
</body>

</html>