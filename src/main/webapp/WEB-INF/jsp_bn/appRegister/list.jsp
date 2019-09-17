<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

    <meta charset="utf-8"/>

    <c:set var="context" value="${pageContext.request.contextPath}"/>
    <%@ include file="../includes/head.jsp" %>
    <%--<link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>--%>
    <%--<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap.min.css"/>--%>
    <%--<link type="text/css" rel="stylesheet" href=" https://cdn.datatables.net/responsive/2.2.1/css/responsive.bootstrap.min.css"/>--%>
    <link href="${context}/assets/css/common/datatablecustom.css" rel="stylesheet" type="text/css"/>

    <style>

        .modal-body {
            position: relative;
            padding: 30px!important;
        }


    </style>
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
                    <div class="portlet box ">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-picture"></i>নিবন্ধিত সিস্টেমের তালিকা
                            </div>

                        </div>
                        <div class="portlet-body" >

                            <div class=" pull-right" id="addassign" style="margin-bottom: 40px;margin-top: 10px">

                                <button type="button" class="btn "
                                        style="margin-right: 30px; background-color: #adadce"><a
                                        href="/appregistration"> নতুন নিবন্ধন </a>
                                </button>
                            </div>
                            <div class=" table-scrollable table-responsive">
                                <table role="grid" style="border: 2px" class="table table-responsive   table-hover"
                                       id="datatable">


                                    <thead>
                                    <%--<th>Id</th>--%>
                                    <th>বিস্তারিত</th>
                                    <th  >ইংরেজি নাম</th>
                                    <th>বাংলা নাম</th>
                                    <th>ইউ আর এল</th>
                                    <th>রিডিরেক্ট ইউ আর এল</th>
                                    <th>ডিফল্ট পেজ ইউ আর এল</th>
                                    <th>লগ আউট আর এল</th>
                                    <th>ইমেইল</th>
                                    <th>মোবাইল নং</th>
                                    <th>নটিফিকেশন পদ্ধতি</th>
                                    <%--<th> সংশোধন করুন</th>--%>
                                    <%--<th> ডিলিট করুন</th>--%>
                                    <%--<th> মডিউল তালিকা</th>--%>
                                    <%--<th>পারমিশন সংশোধন</th>--%>
                                    <%--<th>পাবলিশ</th>--%>
                                    <th style="width: 5px;"></th>
                                    <th style="width: 5px;"></th>
                                    <th style="width: 5px;"></th>
                                    <th style="width: 5px;"></th>
                                    <th style="width: 5px;"></th>
                                    <th style="width: 5px;"></th>
                                    <%--<th></th>--%>
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


<%--<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
<%--<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
<%--<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>--%>
<%--<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>--%>
<%--<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js"></script>--%>
<%--<script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.1/js/responsive.bootstrap.min.js"></script>--%>


<%--<script type="text/javascript" src="${context}/assets/global/plugins/select2/select2.min.js"></script>--%>


<script type="text/javascript" src="${context}/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${context}/assets/admin/pages/scripts/table-advanced.js"></script>


<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript" src="${context}/assets/js/common/modalcontrol.js"></script>
<script>

    function showDetailsModal(id,nameApp,appNameBng,appUrl,defaultPageUrl,logoutUrl,email,mobile,notification) {


        bootbox.alert({
            title: "<div style='color: Black'>বিস্তারিত তথ্য</div> ",
            size: "large",
            onEscape:true,
            backdrop:true,
            // buttons: {
            //     confirm: {
            //         label: 'হ্যাঁ',
            //         className: 'btn-success'
            //     },
            //     cancel: {
            //         label: 'না',
            //         className: 'btn-danger'
            //     }
            // },
            // class:toggle,
            message: '<table class=" table text-center">' +
            '<tr>' +
            '<td >ইংরেজি নাম</td>' +
            '<td >'+decodeURIComponent(nameApp)+'</td>' +
            '</tr> ' +
            '<tr>' +
            '<td >বাংলা নাম</td>' +
            '<td >'+decodeURIComponent(appNameBng)+'</td>' +
            '</tr> ' +
            '<tr>' +
            '<td >ইউ আর এল</td>' +
            '<td >'+decodeURIComponent(appUrl)+'</td>' +
            '</tr> ' +
            '<tr>' +
            '<td >ডিফল্ট পেজ ইউ আর এল</td>' +
            '<td >'+decodeURIComponent(defaultPageUrl)+'</td>' +
            '</tr> ' +
            '<tr>' +
            '<td >লগ আউট ইউ আর এল</td>' +
            '<td >'+decodeURIComponent(logoutUrl)+'</td>' +
            '</tr> ' +
            '<tr>' +
            '<td >ই মেইল</td>' +
            '<td >'+decodeURIComponent(email)+'</td>' +
            '</tr> ' +
            '<tr>' +
            '<td >মোবাইল নং</td>' +
            '<td >'+decodeURIComponent(mobile)+'</td>' +
            '</tr> ' +
            '<tr>' +
            '<td >নটিফিকেশন পদ্ধতি</td>' +
            '<td >'+decodeURIComponent(notification)+'</td>' +
            '</tr> ' +
            '</table>',

            callback: function (result) {
               // bootbox.hideAll();
                //$('#datatable').ajax.reload();
                $('.modal.in .modal-dialog').hide();
                $(".modal.in .modal-dialog .btn").off("click");
            }


        });
    }


    function showPublishModal(id) {

        var selected;
        $.ajax({
            type: "POST",
            url: "${context}/ispublished",
            data: {
                id: id
            },
            async: false,
            success: function (response) {
                selected = response;
//              showSettingsModal(response);

            },
            error: function () {
                toastr.options = {"closeButton": true, "debug": false, "positionClass": "toast-bottom-right"};
                toastr.error(" পাওয়া যায়নি। আবার চেষ্টা করুন");
            }
        });

        bootbox.prompt({

            title: "<div style='color: Black'>সিস্টেম পাবলিশ সম্পাদনা</div> ",
            size: "medium",
            value:selected,
            // class:toggle,
            inputType: "checkbox",
            inputOptions: [
                           {text: 'পাবলিশ ', value: 1, name: 'yes'},
                           {text: 'আনপাবলিশ', value:0, name: 'no'}
                           ],
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times "></i> বাতিল',
                    className: 'btn-danger'
                },
                confirm: {
                    label: '<i class="fa fa-check "></i> নিশ্চিত',
                    className: 'btn-success'
                }
            },
            callback: function (result) {
                showResult(id,result);
            }
        });

        function showResult(id,result) {
            if (typeof result !== "undefined" && result !== null) {
                if (result.length > 1 || result.length == 0) {
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" Please Choose At Most 1 Options.");
                }
                else {
                    var des;
                    if(result[0]==1){
                        des="পাবলিশ"
                    }
                    else{
                        des="আনপাবলিশ"
                    }
                    $.ajax({
                        type: "POST",
                        url: "${context}/publish",
                        data: {
                            id: id,
                            publish: result[0]
                        },
                        async: false,

                        success: function (response) {

                            toastr.options = {
                                "closeButton": true,
                                "debug": false,
                                "positionClass": "toast-bottom-right"
                            };
                            toastr.success(" সিস্টেম সার্থকভাবে "+des+ " সম্পন্ন হয়েছে");
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


                    // location.reload(true);
                }
            }
        }
    }

    $(document).ready(function () {






        // $('#datatable tbody').on('click', 'button', function () {
        //     var data = table.row($(this).parents('tr')).data();
        //     alert(data[0]);
        // });
        // $('#datatable tbody').on('click', 'tr', function () {
        //     var data = table.row(this).data();
        //     alert('You clicked on ' + data[0] + '\'s row');
        // });

        var example_table = $('#datatable').DataTable({

            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "সব"]],

            "language": {
                "decimal": "১",
                "search": "খুঁজুন :",
                "emptyTable": "সিস্টেম খুজে পাওয়া যায় নাই",
                "info": " মোট _TOTAL_ টি সিস্টেমের এর মধ্যে _START_ থেকে _END_ পর্যন্ত দেখানো হচ্ছে",
                "zeroRecords": "সিস্টেম খুজে পাওয়া যায় নাই",
                "paginate": {
                    "first": "প্রথম",
                    "last": "শেষ",
                    "next": "পরে",
                    "previous": "আগে"
                },
                "lengthMenu": "_MENU_ টি রেকর্ডস পর্যন্ত দেখানো হচ্ছে",


            },
            // responsive: {
            //     details: {
            //         display: $.fn.dataTable.Responsive.display.modal({
            //             header: function (row) {
            //                 var data = row.data();
            //                 return ' বিস্তারিত তথ্য';
            //             }
            //         }),
            //         renderer: $.fn.dataTable.Responsive.renderer.tableAll({
            //             tableClass: 'table'
            //         })
            //     }
            // },


            'ajax': {
                url: '${context}/applist',
                processing: true,
                dataSrc: '',
                sEcho: 1
            },
            'columns': [

                {
                    "mRender": function (data, type, full) {

                        var nameApp=""+full.name;
                        var nameAppBng=""+full.nameBng;
                        var appUrl=""+full.link;
                        var defaultPageUrl=""+full.defaultPageURL;
                        var logoutUrl=""+full.logoutURL;
                        var email=""+full.appDomainEmail;
                        var mobile=""+full.mobileNo;
                        var notification=""+full.notificationFlag;


                        return '<button class="btn btn-icon-only grey" ' +
                            ' onclick=showDetailsModal('
                            + full.id
                            + ',\"'+ encodeURIComponent(nameApp)+'\"'
                            + ',\"'+ encodeURIComponent(nameAppBng)+'\"'
                            + ',\"'+ encodeURIComponent(appUrl)+'\"'
                            + ',\"'+ encodeURIComponent(defaultPageUrl)+'\"'
                            + ',\"'+ encodeURIComponent(logoutUrl)+'\"'
                            + ',\"'+ encodeURIComponent(email)+'\"'
                            + ',\"'+ encodeURIComponent(mobile)+'\"'
                            + ',\"'+ encodeURIComponent(notification)
                            +'\")>'+
                            '<i class="fa fa-arrows-alt" style="color: black"></i>' +
                            '</button>';

                        // return '';
                    }
                    // , bVisible: false
                },

                {data: 'name'},
                {data: 'nameBng'},
                {data: 'link'
                    // , bVisible: false
                },
                {data: 'redirect', bVisible: false},
                {data: 'defaultPageURL', bVisible: false},
                {data: 'logoutURL', bVisible: false},
                {data: 'appDomainEmail'},
                {data: 'mobileNo' , bVisible: false},
                {data: 'notificationFlag',bVisible: false},
                {
                    "mRender": function (data, type, full) {


                        return '<form action="${context}/editapp">' +
                            '<input type="hidden" name="id" value="' + full.id + '">' +
                            '<button type="submit" name="submit_param" value="submit_value" class="btn btn-icon-only yellow" data-toggle="tooltip" data-placement="top" title="তথ্য সংশোধন">' +
                            "<i class=\"fa fa-pencil-square-o\" aria-hidden=\"true\"></i>" +
                            '</button>' +
                            '</form>';
                    },
                    // bVisible: false
                },
                {
                    "mRender": function (data, type, full) {

                        <%--return '<form method="post" action="${context}/deleteapp">' +--%>
                        <%--'<input type="hidden" name="id" value="' + full.id + '">' +--%>
                        <%--'<button type="submit" "name="submit_param" value="submit_value" class="btn btn-icon-only"' +--%>
                        <%--' onclick="return bootbox.confirm(\'Are you sure you want to delete this item?\')">' +শোধন
                        <%--'<i class="fa fa-trash-o fa-lg"></i>' +-
                        <%--'</button>' +--%>
                        <%--'</form>';--%>

                        return '<button class="btn btn-icon-only  btn-danger" data-toggle="tooltip" data-placement="top" title=" সিস্টেম রিমুভ" ' +
                            ' onclick=showModal(' + full.id + ',\"/deleteapp\","ই-সার্ভিস")>' +
                            '<i class="fa fa-trash-o fa-lg"></i>' +
                            '</button>';
                    },
                    // bVisible: false
                },
                {
                    "mRender": function (data, type, full) {

                        return '<form method="get" action="${context}/servicelist">' +
                            '<input type="hidden" name="id" value="' + full.id + '">' +
                            '<input type="hidden" name="name" value="' + full.name + '">' +
                            '<input type="hidden" name="url" value="' + full.link + '">' +
                            '<button type="submit" data-toggle="tooltip" data-placement="top" title="সার্ভিসের তালিকা" ' +
                            ' "name="submit_param" value="submit_value" class="btn btn-icon-only">' +
                            '<i class="fa fa-th-list" style="color: black"></i>' +
                            '</button>' +
                            '</form>';
                    }
                },
                {
                    "mRender": function (data, type, full) {

                        return '<form method="get" action="${context}/modulelist">' +
                            '<input type="hidden" name="id" value="' + full.id + '">' +
                            '<input type="hidden" name="name" value="' + full.name + '">' +
                            '<input type="hidden" name="url" value="' + full.link + '">' +
                            '<button type="submit" data-toggle="tooltip" data-placement="top" title="মডিউল তালিকা" ' +
                            '"name="submit_param" value="submit_value" class="btn btn-icon-only">' +
                            '<i class="fa fa-info" style="color: black"></i>' +
                            '</button>' +
                            '</form>';
                    }
                },
                {
                    "mRender": function (data, type, full) {

                        return '<form method="get" action="${context}/systempermissioneditpage">' +
                            '<input type="hidden" name="id" value="' + full.id + '">' +
                            '<input type="hidden" name="name" value="' + full.name + '">' +
                            '<button data-toggle="tooltip" data-placement="top" title="পারমিশন সম্পাদনা" type="submit" "name="submit_param" value="submit_value" class="btn btn-icon-only blue">' +
                            '<i class="fa fa-users" style="color: black"></i>' +
                            '</button>' +
                            '</form>';
                    }
                },

                {
                    "mRender": function (data, type, full) {

                        return '<button class="btn btn-icon-only green" data-toggle="tooltip" data-placement="top" title="সিস্টেম পাবলিশ সম্পাদনা"  onclick=showPublishModal(' + full.id + ')>' +
                            '<i class="fa fa-openid" style="color: black"></i>' +
                            '</button>';

                        <%--return '<form method="get" action="${context}/publish">' +--%>
                        <%--'<input type="hidden" name="id" value="' + full.id + '">' +--%>
                        <%--'<input type="hidden" name="name" value="'+full.nameBng+'">'+--%>
                        <%--'<button type="submit" "name="submit_param" value="submit_value" class="btn btn-icon-only green">' +--%>
                        <%--'<i class="fa fa-openid" style="color: black"></i>' +--%>
                        <%--'</button>' +--%>
                        <%--'</form>';--%>
                    }
                    // , bVisible: false
                },



            ],
        });

        if($(window).width() > 500) {
            // alert(' width greater than 500 ');
            $('#datatable').addClass('collapsed');
            // $('#body').removeClass('limit400');
        }
    });

    function reload() {
        // example_table.ajax.reload();
        // alert("hoitese kisu ekta");
        // if(example_table!=undefined)example_table.ajax.reload();
        window.location.href = "/list";
    }


</script>

<!-- END FOOTER -->



</body>
<!-- END BODY -->
</html>
