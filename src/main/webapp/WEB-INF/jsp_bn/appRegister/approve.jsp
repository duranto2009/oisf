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
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

    <meta charset="utf-8"/>
    <c:set var="context" value="${pageContext.request.contextPath}"/>

    <%@ include file="../includes/head.jsp" %>
    <%--<link href="/assets/layouts/layout2/css/themes/blue.min.css" rel="stylesheet" type="text/css" id="style_color" />--%>
    <link href="../assets/layouts/layout2/css/custom.min.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css"/>
    <link href="${context}/assets/css/common/datatablecustom.css" rel="stylesheet" type="text/css"/>


    <style>
        .modal-dialog {
            width: 30%;
            height: 80%;
        }

        .modal-content {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .modal-body {
            overflow-y: auto;
            flex-grow: 1;
        }

        .checkbox input[type=checkbox], .checkbox-inline input[type=checkbox], .radio input[type=radio], .radio-inline input[type=radio] {
            margin: 0px;
            position: static;
            margin-right: 10px;
        }

    </style>


    <%--<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />--%>
    <%--<link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />--%>
    <%--<link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />--%>
    <%--<link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />--%>
    <%--<link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />--%>
    <%--<!-- END GLOBAL MANDATORY STYLES -->--%>
    <%--<!-- BEGIN PAGE LEVEL PLUGINS -->--%>
    <%--<link href="../assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />--%>
    <%--<link href="../assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />--%>
    <%--<!-- END PAGE LEVEL PLUGINS -->--%>
    <%--<!-- BEGIN THEME GLOBAL STYLES -->--%>
    <%--<link href="../assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />--%>
    <%--<link href="../assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />--%>
    <%--<!-- END THEME GLOBAL STYLES -->--%>
    <%--<!-- BEGIN THEME LAYOUT STYLES -->--%>
    <%--<link href="../assets/layouts/layout4/css/layout.min.css" rel="stylesheet" type="text/css" />--%>
    <%--<link href="../assets/layouts/layout4/css/themes/default.min.css" rel="stylesheet" type="text/css" id="style_color" />--%>
    <%--<link href="../assets/layouts/layout4/css/custom.min.css" rel="stylesheet" type="text/css" />--%>


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
                    <div class="portlet light bordered" id="form_wizard_1">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red bold uppercase"> নিবন্ধন অনুমোদন
                                            <span class="step-title"> </span>
                                        </span>
                            </div>

                        </div>
                        <div class="portlet-body form">
                            <form class="form-horizontal" action="#" id="submit_form" method="POST"
                                  novalidate="novalidate">
                                <div class="form-wizard">
                                    <div class="form-body">
                                        <ul class="nav nav-pills nav-justified steps">
                                            <li class="active">
                                                <a href="#tab1" data-toggle="tab" class="step" aria-expanded="true">
                                                    <span class="number"> 1 </span>
                                                    <span class="desc">
                                                                <i class="fa fa-check"></i> অপেক্ষমান অনুমোদন </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab2" data-toggle="tab" class="step">
                                                    <span class="number"> 2 </span>
                                                    <span class="desc">
                                                                <i class="fa fa-check"></i> মৌলিক সার্ভিস নির্বাচন </span>

                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab5" data-toggle="tab" class="step">
                                                    <span class="number"> 3 </span>
                                                    <span class="desc">
                                                                <i class="fa fa-check"></i>প্রদানক্রীত মৌলিক সার্ভিস নির্বাচন </span>

                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab3" data-toggle="tab" class="step active">
                                                    <span class="number"> 4 </span>
                                                    <span class="desc">
                                                                <i class="fa fa-check"></i> শেয়ারকৃত সার্ভিস নির্বাচন </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab4" data-toggle="tab" class="step">
                                                    <span class="number"> 5 </span>
                                                    <span class="desc">
                                                                <i class="fa fa-check"></i> পদ নির্বাচন </span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div id="bar" class="progress progress-striped" role="progressbar">
                                            <div class="progress-bar progress-bar-success" style="width: 25%;"></div>
                                        </div>
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab1">
                                                <div class="portlet box ">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            <i class="fa fa-picture"></i>অনুমতির জন্য অপেক্ষা করছে
                                                        </div>
                                                        <input id="appid" type="hidden">
                                                        <%--<div class="tools">--%>
                                                        <%--<a href="javascript:;" class="collapse"> </a>--%>
                                                        <%--<a href="#portlet-config" data-toggle="modal"><i class="fa fa-plus"></i> </a>--%>
                                                        <%--&lt;%&ndash;<a href="javascript:;" class="reload"> </a>&ndash;%&gt;--%>
                                                        <%--<a href="javascript:;" class="remove"> </a>--%>
                                                        <%--</div>--%>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <div class=" table-scrollable table-responsive">
                                                            <table class="table  table-striped table-bordered table-hover"
                                                                   id="datatable">

                                                                <thead>
                                                                <th>Id</th>
                                                                <th>অ্যাপ্ নাম</th>
                                                                <th>বাংলা নাম</th>
                                                                <th>ইউ আর এল</th>
                                                                <th>ইমেইল</th>
                                                                <th>মোবাইল নং</th>
                                                                <th>নটিফিকেশন পদ্ধতি</th>
                                                                <th> অনুমোদন করুন</th>
                                                                <th> দূর করুন</th>
                                                                </thead>


                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="tab-pane" id="tab2">
                                                <ul class="pager wizard">
                                                    <li class="previous first" style="display:none;"><a
                                                            href="#">First</a></li>
                                                    <li class="previous"><a href="#">পূর্ববর্তী</a></li>
                                                    <li class="next last" style="display:none;"><a href="#">Last</a>
                                                    </li>
                                                    <li class="next"><a href="#">পরবর্তী</a></li>
                                                </ul>
                                                <h3 class="block">মৌলিক সার্ভিস নির্বাচন</h3>


                                                <div class="form-group" style="height: 475px;">


                                                    <div class=" col-md-offset-1 col-md-10"
                                                         id="jstree" style="height: 475px;overflow-y: scroll;">

                                                    </div>
                                                </div>

                                                <ul class="pager wizard">
                                                    <li class="previous first" style="display:none;"><a
                                                            href="#">First</a></li>
                                                    <li class="previous"><a href="#">পূর্ববর্তী</a></li>
                                                    <li class="next last" style="display:none;"><a href="#">Last</a>
                                                    </li>
                                                    <li class="next"><a href="#">পরবর্তী</a></li>
                                                </ul>


                                            </div>
                                            <div class="tab-pane" id="tab5">
                                                <ul class="pager wizard">
                                                    <li class="previous first" style="display:none;"><a
                                                            href="#">First</a></li>
                                                    <li class="previous"><a href="#">পূর্ববর্তী</a></li>
                                                    <li class="next last" style="display:none;"><a href="#">Last</a>
                                                    </li>
                                                    <li class="next"><a href="#">পরবর্তী</a></li>
                                                </ul>
                                                <h3 class="block">প্রদানক্রীত মৌলিক সার্ভিস </h3>


                                                <div class="form-group" style="height: 475px;">


                                                    <div class=" col-md-offset-1 col-md-10"
                                                         id="jstree4" style="height: 475px;overflow-y: scroll;">

                                                    </div>
                                                </div>

                                                <ul class="pager wizard">
                                                    <li class="previous first" style="display:none;"><a
                                                            href="#">First</a></li>
                                                    <li class="previous"><a href="#">পূর্ববর্তী</a></li>
                                                    <li class="next last" style="display:none;"><a href="#">Last</a>
                                                    </li>
                                                    <li class="next"><a href="#">পরবর্তী</a></li>
                                                </ul>


                                            </div>
                                            <div class="tab-pane" id="tab3">
                                                <ul class="pager wizard">
                                                    <li class="previous first" style="display:none;"><a
                                                            href="#">First</a></li>
                                                    <li class="previous"><a href="#">পূর্ববর্তী</a></li>
                                                    <li class="next last" style="display:none;"><a href="#">Last</a>
                                                    </li>
                                                    <li class="next"><a href="#">পরবর্তী</a></li>
                                                </ul>
                                                <h3 class="block"> শেয়ারকৃত সার্ভিস নির্বাচন </h3>
                                                <div class="form-group" style="height: 475px;">


                                                    <div class=" col-md-offset-1 col-md-10"
                                                         id="jstree2" style="height: 475px;overflow-y: scroll;">

                                                    </div>
                                                </div>


                                                <ul class="pager wizard">
                                                    <li class="previous first" style="display:none;"><a
                                                            href="#">First</a></li>
                                                    <li class="previous"><a href="#">পূর্ববর্তী</a></li>
                                                    <li class="next last" style="display:none;"><a href="#">Last</a>
                                                    </li>
                                                    <li class="next"><a href="#">পরবর্তী</a></li>
                                                </ul>
                                            </div>
                                            <div class="tab-pane" id="tab4">
                                                <ul class="pager wizard">

                                                    <li class="previous first" style="display:none;"><a
                                                            href="#">First</a></li>
                                                    <li class="previous"><a href="#">পূর্ববর্তী</a></li>
                                                    <%--<li class="next last" style="display:none;"><a href="#">Last</a></li>--%>
                                                    <%--<li class="next"><a href="#">পরবর্তী</a></li>--%>
                                                    <%--<li class="finish"><a  href="javascript:;">সাবমিট</a></li>--%>
                                                </ul>

                                                <h3 class="block"> পদ অনুমোদন </h3>

                                                <div id="officestructure" style="height: 475px;overflow-y: scroll;">

                                                </div>

                                                <%----> Form Submit Button Goes Here <----%>
                                                <ul class="pager wizard">

                                                    <li class="previous first" style="display:none;"><a
                                                            href="#">First</a></li>
                                                    <li class="previous"><a href="#">পূর্ববর্তী</a></li>
                                                    <%--<li class="next last" style="display:none;"><a href="#">Last</a></li>--%>
                                                    <%--<li class="next"><a href="#">পরবর্তী</a></li>--%>
                                                    <li class="finish"><a href="javascript:;">সংরক্ষন</a></li>
                                                </ul>


                                            </div>


                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <a href="javascript:;" class="btn default button-previous disabled"
                                                   style="display: none;">
                                                    <i class="fa fa-angle-left"></i> Back </a>
                                                <a href="javascript:;" class="btn green button-submit"
                                                   style="display: none;"> Submit
                                                    <i class="fa fa-check"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>


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


    var exceptionlist = [];

    var modallock = false;

    function showModal(id, url) {

        var counter = Math.random() * 100 + 1;
        for (var i = 0; i < counter; i++) {
        }
        ;
        var counter1 = Math.random() * 100 + 1;
        for (var i = 0; i < counter1; i++) {
        }
        ;

        if (!modallock) {
            modallock = true;

            $.ajax({
                type: "GET",
                url: "<%=request.getContextPath()%>/orgbyoriginorg",
                data: {
                    id: id
                },
                async: true,
                success: function (response) {
                    if (response.length > 0) {
                        var data = [];
                        for (var i = 0; i < response.length; i++) {
                            var checkboxobject = {
                                text: response[i].organogram + ',' + response[i].office,
                                value: response[i].id + '_' + response[i].originid
                            };
                            data.push(checkboxobject);

                        }

                        bootbox.prompt({
                            title: "পদ নির্বাচন করুন",
                            buttons: {
                                confirm: {
                                    label: 'Yes',
                                    className: 'btn-success'
                                },
                                cancel: {
                                    label: 'No',
                                    className: 'btn-danger'
                                }
                            },
                            inputType: 'checkbox',
                            inputOptions: data,
                            callback: function (result) {

                                modallock = false;
                                if (result != null) {

                                    for (var i = 0; i < result.length; i++) {
                                        exceptionlist.push(result[i]);
                                    }
                                    $('.modal.in .modal-dialog').hide();
                                    $(".modal.in .modal-dialog .btn").off("click");

                                } else {
                                    $('.modal.in .modal-dialog').hide();
                                    $(".modal.in .modal-dialog .btn").off("click");
                                }

                            }
                        });
                    }
                    else {
                        alert('There is no Real Organogram');
                    }
                },
                error: function () {
                    alert('Error occured');
                }
            });
        }

    }

    function showDeclineBootBox(id, url, item) {
        bootbox.confirm({
            message: '<p class="text-center">আপনি কি এই ' + item + ' টি বাতিল করতে চান?</p>',
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

                if (result == true) {
                    var data;
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: {
                            id: id
                        },
                        async: false,
                        success: function (response) {
                            if (response == 1) {
                                data = response;
                                $('.modal.in .modal-dialog').hide();
                                $(".modal.in .modal-dialog .btn").off("click");
                                toastr.success(item + "টি সফলভাবে মুছে ফেলা হয়েছে ", "সার্থক");
                                window.location.href = "list";
                                // reload();
                            }
                            else if (response == 2) {
                                toastr.error(" আপনি যে " + item + "টি মুছতে চাইছেন সেটির আরো শাখা /পদ আছে এই " + item + "টি মুছতে হলে এর নিচের সব শাখা/পদ প্রথমে মুছে নিন ", "দুঃখিত");
                            }
                            else {
                                toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ", "দুঃখিত");
                            }
                        },
                        error: function () {
                            toastr.options = {
                                "closeButton": true,
                                "debug": false,
                                "positionClass": "toast-bottom-right"
                            };
                            toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ", "দুঃখিত");
                        }
                    });

                } else {
                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");
                }

            }
        });

    }


    function coreService() {
        // $("#jstree").jstree('create_node', '#', {'id' : 'myId', 'text' : 'My Text'}, 'last');
        $("#jstree").jstree("create", -1, false, "Name", false, true);
        $('#jstree').jstree({

            // 'create_node', '#', {'id' : 'myId', 'text' : 'My Text'},
            // "create", -1, false, "Name", false, true,

            // $("#jstree").jstree('create_node', '#', {'id' : 'myId', 'text' : 'My Text'}, 'last');
            'core': {
                'data': {
                    'method': 'POST',
                    'url': function (node) {

                        return '<%=request.getContextPath()%>/getowners';
                    },
                    'data': function (node) {

                        return {'type': 0, "li_attr": "", "a_attr": ""};

                    }

                },
                'themes': {
                    'responsive': false
                }
            }, 'types': {
                'default': {
                    'icon': 'fa fa-folder icon-state-warning icon-lg'
                },
                'file': {
                    'icon': 'fa fa-file icon-state-warning icon-lg'
                }
            },
            'checkbox': {
                'keep_selected_style': false,
                'three_state': false,
                'cascade': ''
            },
            'plugins': ['types', 'checkbox']
        });

        var OKtoCascadeUp = 0;
        var OKtoCascadeDown = 0;
        var propagtionLevel = 0;
        var propagate = true;


        function CascadeUp(inNode, inCommand) {
            if (OKtoCascadeUp < 1) {
                ParentNode = $('#jstree').jstree('get_parent', inNode);
                $('#jstree').jstree(inCommand, ParentNode);
            }
        }

        function CascadeUpBack(inNode, inCommand) {
            if (propagtionLevel <= 1) {
                ParentNode = $('#jstree').jstree('get_parent', inNode);
                ChildrenNodes = jQuery.makeArray($('#jstree').jstree('get_children_dom', ParentNode));


                for (var i = 0; i < ChildrenNodes.length; i++) {
                    var value = $("#" + ChildrenNodes[i].id).attr('aria-selected');//ChildrenNodes[i].attributes[1].nodeValue;
                    if (value == "true") {
                        propagate = false;
                    }
                }
                if (propagate) {
                    propagtionLevel -= 2;
                    $('#jstree').jstree(inCommand, ParentNode);
                }

            }
        }

        function CascadeDown(inNode, inCommand) {
            if (OKtoCascadeDown < 1) {
                ChildrenNodes = jQuery.makeArray($('#jstree').jstree('get_children_dom', inNode));
                $('#jstree').jstree(inCommand, ChildrenNodes);
            }
        }

        $('#jstree').on("select_node.jstree", function (e, data) {
            $('#jstree').jstree('open_node', data.node);
            OKtoCascadeDown++;
            CascadeUp(data.node, 'select_node');
            OKtoCascadeDown--;
            CascadeDown(data.node, 'open_node');
            CascadeDown(data.node, 'select_node');
        });

        // Deselection Actions
        $('#jstree').on("deselect_node.jstree", function (e, data) {
            $('#jstree').jstree('open_node', data.node); //need this to have it deselect hidden nodes
            propagtionLevel++;
            if (propagtionLevel >= 1) {
                CascadeDown(data.node, 'open_node');
                CascadeDown(data.node, 'deselect_node');
            }
            if (propagate == true) CascadeUpBack(data.node, 'deselect_node');
            propagate = true;
            propagtionLevel = 0;
            // CascadeDown(data.node, 'close_node');
            // $('#jstree').jstree('close_node', data.node); //need this to have it deselect hidden nodes
        });

        $("#form").submit(function () {

            var checked_ids = [];
            checked_ids = $("#jstree").jstree("get_selected");
            $("#jstreeselectednode").val(checked_ids);
        });


        $('#jstree').on('loaded.jstree', function (e, data) {


            // var level = data.node.parents.length;

            // if(level<2){ // var depth = 3;
            //            // data.inst.get_container().find('li').each(function(i) {
            //            //     if(data.inst.get_path($(this)).length<=depth){
            //            //         data.inst.open_node($(this));
            //            //     }
            //            // });
            $('#jstree').jstree('open_node', $('#root'));
            // }

            // Do something here...
            $(this).jstree('select_node', $('#jstree > li'));
        });
    }

    function givenCoreService() {
        // $("#jstree").jstree('create_node', '#', {'id' : 'myId', 'text' : 'My Text'}, 'last');
        $("#jstree4").jstree("create", -1, false, "Name", false, true);
        $('#jstree4').jstree({

            // 'create_node', '#', {'id' : 'myId', 'text' : 'My Text'},
            // "create", -1, false, "Name", false, true,

            // $("#jstree").jstree('create_node', '#', {'id' : 'myId', 'text' : 'My Text'}, 'last');
            'core': {
                'data': {
                    'method': 'POST',
                    'url': function (node) {

                        return '<%=request.getContextPath()%>/asprovider';
                    },
                    'data': function (node) {

                        return {'type': 0, "li_attr": "", "a_attr": ""};

                    }

                },
                'themes': {
                    'responsive': false
                }
            }, 'types': {
                'default': {
                    'icon': 'fa fa-folder icon-state-warning icon-lg'
                },
                'file': {
                    'icon': 'fa fa-file icon-state-warning icon-lg'
                }
            },
            'checkbox': {
                'keep_selected_style': false,
                'three_state': false,
                'cascade': ''
            },
            'plugins': ['types', 'checkbox']
        });

        var OKtoCascadeUp = 0;
        var OKtoCascadeDown = 0;
        var propagtionLevel = 0;
        var propagate = true;


        function CascadeUp(inNode, inCommand) {
            if (OKtoCascadeUp < 1) {
                ParentNode = $('#jstree4').jstree('get_parent', inNode);
                $('#jstree4').jstree(inCommand, ParentNode);
            }
        }

        function CascadeUpBack(inNode, inCommand) {
            if (propagtionLevel <= 1) {
                ParentNode = $('#jstree4').jstree('get_parent', inNode);
                ChildrenNodes = jQuery.makeArray($('#jstree4').jstree('get_children_dom', ParentNode));


                for (var i = 0; i < ChildrenNodes.length; i++) {
                    var value = $("#" + ChildrenNodes[i].id).attr('aria-selected');//ChildrenNodes[i].attributes[1].nodeValue;
                    if (value == "true") {
                        propagate = false;
                    }
                }
                if (propagate) {
                    propagtionLevel -= 2;
                    $('#jstree4').jstree(inCommand, ParentNode);
                }

            }
        }

        function CascadeDown(inNode, inCommand) {
            if (OKtoCascadeDown < 1) {
                ChildrenNodes = jQuery.makeArray($('#jstree4').jstree('get_children_dom', inNode));
                $('#jstree4').jstree(inCommand, ChildrenNodes);
            }
        }

        $('#jstree4').on("select_node.jstree", function (e, data) {
            $('#jstree4').jstree('open_node', data.node);
            OKtoCascadeDown++;
            CascadeUp(data.node, 'select_node');
            OKtoCascadeDown--;
            CascadeDown(data.node, 'open_node');
            CascadeDown(data.node, 'select_node');
        });

        // Deselection Actions
        $('#jstree4').on("deselect_node.jstree", function (e, data) {
            $('#jstree4').jstree('open_node', data.node); //need this to have it deselect hidden nodes
            propagtionLevel++;
            if (propagtionLevel >= 1) {
                CascadeDown(data.node, 'open_node');
                CascadeDown(data.node, 'deselect_node');
            }
            if (propagate == true) CascadeUpBack(data.node, 'deselect_node');
            propagate = true;
            propagtionLevel = 0;
            // CascadeDown(data.node, 'close_node');
            // $('#jstree').jstree('close_node', data.node); //need this to have it deselect hidden nodes
        });

        $("#form").submit(function () {

            var checked_ids = [];
            checked_ids = $("#jstree4").jstree("get_selected");
            $("#jstreeselectednode").val(checked_ids);
        });


        $('#jstree4').on('loaded.jstree', function (e, data) {


            // var level = data.node.parents.length;

            // if(level<2){ // var depth = 3;
            //            // data.inst.get_container().find('li').each(function(i) {
            //            //     if(data.inst.get_path($(this)).length<=depth){
            //            //         data.inst.open_node($(this));
            //            //     }
            //            // });
            $('#jstree4').jstree('open_node', $('#root'));
            // }

            // Do something here...
            $(this).jstree('select_node', $('#jstree4 > li'));
        });
    }

    function sharedService() {
        $('#jstree2').jstree({
            'core': {
                'data': {
                    'method': 'POST',
                    'url': function (node) {

                        return '<%=request.getContextPath()%>/getowners';
                    },
                    'data': function (node) {

                        return {'type': 1, "li_attr": "", "a_attr": ""};

                    }

                },
                'themes': {
                    'responsive': false
                }
            }, 'types': {
                'default': {
                    'icon': 'fa fa-folder icon-state-warning icon-lg'
                },
                'file': {
                    'icon': 'fa fa-file icon-state-warning icon-lg'
                }
            },
            'checkbox': {
                'keep_selected_style': false,
                'three_state': false,
                'cascade': ''
            },
            'plugins': ['types', 'checkbox']
        });

        var OKtoCascadeUp = 0;
        var OKtoCascadeDown = 0;
        var propagtionLevel = 0;
        var propagate = true;


        function CascadeUp(inNode, inCommand) {
            if (OKtoCascadeUp < 1) {
                ParentNode = $('#jstree2').jstree('get_parent', inNode);
                $('#jstree2').jstree(inCommand, ParentNode);
            }
        }

        function CascadeUpBack(inNode, inCommand) {
            if (propagtionLevel <= 1) {
                ParentNode = $('#jstree2').jstree('get_parent', inNode);
                ChildrenNodes = jQuery.makeArray($('#jstree2').jstree('get_children_dom', ParentNode));


                for (var i = 0; i < ChildrenNodes.length; i++) {
                    var value = $("#" + ChildrenNodes[i].id).attr('aria-selected');//ChildrenNodes[i].attributes[1].nodeValue;
                    if (value == "true") {
                        propagate = false;
                    }
                }
                if (propagate) {
                    propagtionLevel -= 2;
                    $('#jstree2').jstree(inCommand, ParentNode);
                }

            }
        }

        function CascadeDown(inNode, inCommand) {
            if (OKtoCascadeDown < 1) {
                ChildrenNodes = jQuery.makeArray($('#jstree2').jstree('get_children_dom', inNode));
                $('#jstree2').jstree(inCommand, ChildrenNodes);
            }
        }

        $('#jstree2').on("select_node.jstree", function (e, data) {
            $('#jstree2').jstree('open_node', data.node);
            OKtoCascadeDown++;
            CascadeUp(data.node, 'select_node');
            OKtoCascadeDown--;
            CascadeDown(data.node, 'open_node');
            CascadeDown(data.node, 'select_node');
        });

        // Deselection Actions
        $('#jstree2').on("deselect_node.jstree", function (e, data) {
            $('#jstree2').jstree('open_node', data.node); //need this to have it deselect hidden nodes
            propagtionLevel++;
            if (propagtionLevel >= 1) {
                CascadeDown(data.node, 'open_node');
                CascadeDown(data.node, 'deselect_node');
            }
            if (propagate == true) CascadeUpBack(data.node, 'deselect_node');
            propagate = true;
            propagtionLevel = 0;
            // CascadeDown(data.node, 'close_node');
            // $('#jstree').jstree('close_node', data.node); //need this to have it deselect hidden nodes
        });

        $("#form").submit(function () {

            var checked_ids = [];
            checked_ids = $("#jstree").jstree("get_selected");
            $("#jstreeselectednode").val(checked_ids);
        });


        $('#jstree2').on('loaded.jstree', function () {
            // Do something here...
            $('#jstree2').jstree('open_node', $('#root'));
            $(this).jstree('select_node', $('#jstree2 > li'));
        });
    }

    function officeStructure() {
        $('#officestructure').jstree({
            'core': {
                'data': {
                    'method': 'POST',
                    'url': function (node) {
                        var str = node.id;
                        var res = str.split("-");
                        if (res[0] == "#") {
                            return '<%=request.getContextPath()%>/jministrylistdata';
                        }
                        else if (res[0] == "ministry") {
                            return '<%=request.getContextPath()%>/jofficeoriginlistdatabyministryid';
                        }
                        else if (res[0] == "origin") {
                            return '<%=request.getContextPath()%>/joriginunitbyoriginid';
                        }
                        else if (res[0] == "originunit") {
                            return '<%=request.getContextPath()%>/joriginorgbyoriginunit';
                        }

                    },
                    'data': function (node) {

                        var str = node.id;
                        var index = str.indexOf("#");
                        if (index != 0) {
                            var res = str.split("-");
                            return {'id': parseInt(res[1])};
                        }
                    }

                }
            },
            'checkbox': {
                'keep_selected_style': true
            },
            'plugins': ['checkbox']
        });
    }

    function tabController() {

        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            var target = $(e.target).attr("href");// activated tab

            if (target == '#tab2') {
                coreService();
            }
            else if (target == '#tab3') {
                sharedService();
            }
            else if (target == '#tab5') {
                givenCoreService();
            }
            else if (target == '#tab4') {
                officeStructure();
            }

        });


    }

    $(document).ready(function () {

        tabController();
        $('#datatable tbody').on('click', 'button', function () {
            var data = table.row($(this).parents('tr')).data();
            alert(data[0]);
        });

        var example_table = $('#datatable').DataTable({


            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "সব"]],

            "language": {
                "decimal": "১",
                "search": "খুঁজুন :",
                "emptyTable": "সিস্টেম খুজে পাওয়া যায় নাই",
                "info": "মোট _TOTAL_ টি সিস্টেমের এর মধ্যে _START_ থেকে _END_ পর্যন্ত দেখানো হচ্ছে",
                "infoEmpty": "সিস্টেম খুজে পাওয়া যায় নাই",
                "zeroRecords": "সিস্টেম খুজে পাওয়া যায় নাই",
                "paginate": {
                    "first": "প্রথম",
                    "last": "শেষ",
                    "next": "পরে",
                    "previous": "আগে"
                },
                "lengthMenu": "_MENU_ রেকর্ডস",

            },

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


                        return '' +
                            '<input type="hidden" name="id" value="' + full.id + '">' +
                            // '<div class="form-actions">'+


                            // '<ul class="pager wizard">'+
                            //     '<li class="previous first" style="display:none;"><a href="#">First</a></li>' +
                            // '<li class="previous"><a href="#">Previous</a></li>'+
                            //     '<li class="next last" style="display:none;"><a href="#">Last</a></li>'+
                            '<input type="button" class="btn button-next btn-outline green" onclick="hello(' + full.id + ')" name="next" value="অনুমোদন" id=' + full.id + ' >' +
                            '' +

                            // '<li class="next"><a href="#">Next</a></li>'+


                            // '</ul>'+


                            // ' <a href="javascript:;" class="btn btn-outline green button-next"> Approve' +


                            // '   </a> ' +
                            //   '</div>' +
                            '';
                    }
                },
                {
                    "mRender": function (data, type, full) {

                        <%--return '<form method="post" action="${context}/deleteapp">' +--%>
                        <%--'<input type="hidden" name="id" value="' + full.id + '">' +--%>
                        <%--'<button type="submit" "name="submit_param" value="submit_value" class="btn btn-outline link-button btn-danger"' +--%>
                        <%--// ' onclick="return bootbox.confirm(\'Are you sure you want to delete this item?\')">' +--%>
                        <%--' onclick=showModal(\' + full.id + \',\"/deleteapp\")>\'' +--%>
                        <%--"Decline" +--%>
                        <%--'</button>' +--%>
                        <%--'</form>';--%>


                        // return '<button type="submit" "name="submit_param" value="submit_value" class="btn btn-outline link-button btn-danger"' +
                        //     // ' onclick="return bootbox.confirm(\'Are you sure you want to delete this item?\')">' +
                        //     ' onclick=showModal(\' + full.id + \',\"/deleteapp\")>\'' +
                        //     "Decline" +
                        //     '</button>' ;
                        return '<button class="btn btn-outline link-button btn-danger"  onclick=showDeclineBootBox(' + full.id + ',\"/declineapp\","ই-সার্ভিস")>' +
                            ' বাতিল ' +
                            '</button>';

                    }
                }


            ],
        });

        $('#form_wizard_1').bootstrapWizard({
            onNext: function (tab, navigation, index) {
                // alert('next');
            },
            onTabShow: function (tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index + 1;
                var $percent = ($current / $total) * 100;
                $('#form_wizard_1 .progress-bar').css({width: $percent + '%'});
            },

        });


        function coreServiceData() {
            var checked_ids = [];
            var origincoreserviceid = [];
            checked_ids = $("#jstree").jstree("get_selected");
            for (var i = 0; i < checked_ids.length; i++) {
                var s = checked_ids[i].split('_');
                if (s[0] == 'service') origincoreserviceid.push(parseInt(s[1]));
            }
            return origincoreserviceid;
        }


        function coreServiceProviderData() {
            var checked_ids = [];
            var providercoreserviceid = [];
            checked_ids = $("#jstree4").jstree("get_selected");
            for (var i = 0; i < checked_ids.length; i++) {
                var s = checked_ids[i].split('_');
                if (s[0] == 'owner') providercoreserviceid.push(parseInt(s[1]));
            }
            return providercoreserviceid;
        }



        function shareServiceData() {
            var checked_ids = [];
            var originalsharedserviceid = [];
            checked_ids = $("#jstree2").jstree("get_selected");
            for (var i = 0; i < checked_ids.length; i++) {
                var s = checked_ids[i].split('_');
                if (s[0] == 'service') originalsharedserviceid.push(parseInt(s[1]));
            }
            return originalsharedserviceid;
        }

        function orgnoagramData() {
            var checked_ids = [];
            var originaloriginunitid = [];
            checked_ids = $("#officestructure").jstree("get_selected");

            var mapping = [];
            for (var i = 0; i < exceptionlist.length; i++) {
                var sc = exceptionlist[i].split('_');
                mapping['#_' + sc[1]] = 1;
            }

            for (var i = 0; i < checked_ids.length; i++) {
                var s = checked_ids[i].split('-');
                if (s[0] == 'originorg') {

                    if (mapping['#_' + s[1]] == undefined) originaloriginunitid.push(parseInt(s[1]));
                }
            }
            return originaloriginunitid;
        }


        $('#form_wizard_1 .finish').click(function () {

            // alert('Finished!, Starting over!');
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-bottom-right"
            };
            toastr.success("অনুমোদন  সম্পন্ন  হচ্ছে।  একটু অপেক্ষা করুন।");
            console.log("--end of ftoaster called --");

            var data = {
                appid: $("#appid").val(),
                coreservice: coreServiceData(),
                shareservice: shareServiceData(),
                providercoreservice:coreServiceProviderData(),
                originorg: orgnoagramData(),
                exception: exceptionlist
            };
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/systempermissionassign",
                data: JSON.stringify(data),
                contentType: 'application/json',
                async: true,
                success: function (response) {
                    exceptionlist = [];
                    location.reload();
                },
                error: function () {

                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" অনুমোদন ব্যর্থ  হয়েছে।  আবার চেষ্টা করুন।");
                    location.reload();
                    // console.log("--end of ftoaster called --");

                }
            });

            $('#rootwizard').find("a[href*='tab1']").trigger('click');
        });


        // $('#form_wizard_1').bootstrapWizard({'nextSelector': '.button-next'});
        // $("#form_wizard_1").find(".button-next").show();
        // var s=


    });

    function hello(id) {
        $("#appid").val(id);
        $('#tab2a').attr('data-toggle', "tab");
        //$('#tab2').addClass('active');
        var x = 0;
        // alert('hello'+id);
        $("#form_wizard_1").find(".button-next").show();
        // $('#form_wizard_1').bootstrapWizard({'nextSelector': '.button-next'});
        var wizard = $('#form_wizard_1').bootstrapWizard();
        wizard.bootstrapWizard('next');
        // $('#secondli').addClass('active');
        // $('#firstli').removeClass('active');


    }

    // #submit_form > div > div.form-body > ul > li > a
    $("#submit_form > div > div.form-body > ul > li > a").on("click", function (e) {
        if ($(this).addClass("disabled")) {
            e.preventDefault();
            return false;
        }
    });


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
<script src="${context}/assets/admin/pages/scripts/table-advanced.js"></script>


<script src="${context}/assets/pages/scripts/form-wizard.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"
        type="text/javascript"></script>


<%--working herre...    --%>


<%--<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>--%>


<script src="../assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="../assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<%--<script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>--%>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="../assets/pages/scripts/form-wizard.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<%--<script src="../assets/layouts/layout4/scripts/layout.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/layouts/layout4/scripts/demo.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>--%>


<%--<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>--%>


<%--<script src="/assets/layouts/layout2/scripts/layout.min.js" type="text/javascript"></script>--%>
<%--<script src="/assets/layouts/layout2/scripts/demo.min.js" type="text/javascript"></script>--%>
<%--<script src="/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>--%>
<%--<script src="/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>--%>
<%--<bonyy></bonyy>--%>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>

<%--<script type="text/javascript"src="${context}/assets/js/common/modalcontrol.js"></script>--%>


</body>
<!-- END BODY -->
</html>

</html>