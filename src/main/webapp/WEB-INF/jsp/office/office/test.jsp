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
    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css"/>

    <style type="text/css">
        .portlet {
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
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

            <div class="portlet-body form">


                <div class="row">
                    <div class="col-md-12">
                        <!-- BEGIN PORTLET-->
                        <div class="portlet box bordered">
                            <div class="portlet-title ">
                                <div class="caption">
                                    <span class="caption-subject">Redistribution Form</span>
                                </div>
                                <%--<div class="actions">--%>
                                <%--<a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">--%>
                                <%--<i class="icon-cloud-upload"></i>--%>
                                <%--</a>--%>
                                <%--<a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">--%>
                                <%--<i class="icon-wrench"></i>--%>
                                <%--</a>--%>
                                <%--<a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">--%>
                                <%--<i class="icon-trash"></i>--%>
                                <%--</a>--%>
                                <%--</div>--%>
                            </div>
                            <div class="portlet-body">
                                <div>


                                <div class="portlet light " style="margin: 50px;">
                                    <div class="portlet-body">
                                        ${label}
                                    </div>
                                </div>
                                <div class="portlet light bordered" style="margin: 50px; background-color: #e8ecec">
                                    <div class="portlet-body">
                                        ${currentchain}
                                    </div>
                                </div>
                                <div class="row" style="margin: 50px;">
                                    <div class="col-md-12">


                                        <div class="col-md-5 portlet light bordered "
                                             style="background-color: #e8ecec;">

                                            <div class="portlet-body">
                                                ${fromwhom}
                                            </div>
                                        </div>
                                        <div class="col-md-offset-2 col-md-5 portlet light"
                                             style="background-color: white;">

                                            <div class="portlet-body">

                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="portlet light bordered " style="margin: 50px; background-color: #e8ecec;">
                                    <div class="portlet-body">
                                        <%--<h3></h3>--%>
                                        <%--<blockquote>--%>
                                        <%--<p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante. Duis mollis, est non commodo luctus, nisi erat porttitor ligula integer posuere erat a ante. </p>--%>
                                        <%--</blockquote>--%>
                                        <%--<blockquote>--%>
                                        <%--<p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante. </p>--%>
                                        <%--<small>Someone famous--%>
                                        <%--<cite title="Source Title">Source Title</cite>--%>
                                        <%--</small>--%>
                                        <%--</blockquote>--%>
                                        <%--<div class="clearfix">--%>
                                        <%--<blockquote class="pull-right">--%>
                                        <%--<p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante. </p>--%>
                                        <%--<small>Someone famous--%>
                                        <%--<cite title="Source Title">Source Title</cite>--%>
                                        <%--</small>--%>
                                        <%--</blockquote>--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                    </div>
                                </div>
                                </div>


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

        $('#helloworld').click(function () {
            bootbox.confirm({
                message: "I am a custom dialog",
                title: "Custom title",
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
                callback: function (result) {
                    $('.modal.in .modal-dialog').hide();
                }
            });
        });
        //$.jstree.defaults.core.themes.variant = "large";

//        $('#jstree').jstree({
//            "core" : {
//                "themes" : {
//                    "variant" : "large"
//                },
//                "multiple" : true,
//                "animation" : 500,
//                'check_callback' : function (operation, node, node_parent, node_position, more) {
//                    // operation can be 'create_node', 'rename_node', 'delete_node', 'move_node', 'copy_node' or 'edit'
//                    // in case of 'rename_node' node_position is filled with the new node name
//                    return operation === 'rename_node' ? true : false;
//                },
//                'data' : [
//                    {
//                        'id':'1',
//                        'text':'Simple root node1'
//                    },
//                    {
//                        'id':'2',
//                        'text' : 'Root node 2',
//                        'state' : {
//                            'opened' : true,
//                            'selected' : false
//                        },
//                        'children' : [
//                            {'id':'3',
//                                'text' : 'Root node 3',
//                                'state' : {
//                                    'opened' : true,
//                                    'selected' : false
//                                },
//                                'children' : [
//                                    { 'text' : 'Child 1' },
//                                    'Child 2'
//                                ]},
//                            'Child 2'
//                        ]
//                    },
//
//                ]
//            },
//            "checkbox" : {
//                "keep_selected_style" : true
//            },
//            "plugins" : [ "wholerow", "checkbox" ]
//        });
//        $('#jstree').on("changed.jstree", function (e, data) {
//            console.log(data.selected);
//        });
//        // 8 interact with the tree - either way is OK
//        $('button').on('click', function () {
//            $('#jstree').jstree(true).select_node('child_node_1');
//            $('#jstree').jstree('select_node', 'child_node_1');
//            $.jstree.reference('#jstree').select_node('child_node_1');
//        });


        //     $('#jstree').jstree({
        //         'core' : {
        //             'data': {
        //                 'method':'POST',
        //                 'url': function (node) {
        //                     return node.id === '#' ?
        //                         '<%=request.getContextPath()%>/getofficeunitlistforjstreebyofficeid' :
        //                         '<%=request.getContextPath()%>/getofficeunitlistforjstreebyofficeid';
        //                },
        //                'data': function (node) {
        //                    return node.id === '#'? {'id':53,"li_attr":"","a_attr":""}:{'id': node.id,"li_attr":"","a_attr":""};
        //                }
        //            }
        //       }
        //       });


        $('#using_json_3').jstree({
            'core': {
                'data': {
                    'method': 'POST',
                    'url': function (node) {
                        var str = node.id;
                        var res = str.split("-");
                        if (res[0] == "#") {
                            return '<%=request.getContextPath()%>/cityeroot';
                        }
                        else if (res[0] == "root") {
                            return '<%=request.getContextPath()%>/gethistoryid';
                        }
                        else if (res[0] == "city") {
                            return '<%=request.getContextPath()%>/gethistorydetails1';
                        }
                        else if (res[0] == "dis") {
                            return '<%=request.getContextPath()%>/gethistorydetails2';
                        }

                    },
                    'data': function (node) {

                        var str = node.id;
                        var index = str.indexOf("#");
                        if (index != 0) {
                            var res = str.split("-");
                            return {
                                'id': parseInt(res[2]),
                                "parenttype": parseInt(res[3]),
                                "li_attr": "",
                                "a_attr": ""
                            };
                        }
                        else return {'id':${cityid}, "parenttype": 3, "li_attr": "${name}", "a_attr": ""};
                    }

                }
            },
            'checkbox': {
                'keep_selected_style': true
            },
            'plugins': ['checkbox']
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
<script type="text/javascript" src="${context}/assets/pages/scripts/ui-bootbox.min.js"></script>

</body>

</html>