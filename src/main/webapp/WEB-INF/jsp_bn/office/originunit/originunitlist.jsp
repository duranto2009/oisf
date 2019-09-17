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
    <title>Office Information and Service Framework (OISF)</title>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../../includes/head.jsp" %>
    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css"/>
    <link href="${context}/assets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css"/>

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
            <div class="card">
                <div class="portlet box ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-picture"></i> মৌলিক দপ্তর শাখা ব্যবস্থাপনা
                        </div>
                    </div>


                    <div class="portlet-body">

                        <div class="row">
                            <div class="col-md-4 form-group form-horizontal">
                                <label class="control-label"> মন্ত্রণালয়</label>
                                <select id="ministrydropdown" class="form-control select2" name="officeMinistryId">
                                    <option value="-1">--বাছাই করুন--</option>
                                    <c:forEach var="ministry" items="${ministry}">
                                        <option value="${ministry.getId()}">
                                                ${ministry.getNameBng()}
                                        </option>
                                    </c:forEach>

                                </select>
                            </div>
                            <div class="col-md-4 form-group form-horizontal">
                                <label class="control-label">দপ্তরের স্তর</label>
                                <select id="layerdropdown" class="form-control select2" name="officeLayerId">
                                    <option value="">--বাছাই করুন--</option>
                                </select>
                            </div>
                            <div class="col-md-4 form-group form-horizontal">
                                <label class="control-label">দপ্তর / অধিদপ্তরের ধরন</label>
                                <select id="origindropdown" class="form-control select2" name="officeOriginId">
                                    <option value="">--বাছাই করুন--</option>
                                </select>
                            </div>
                        </div>
                        <div id="unit_tree_div" class="row" style="display:block;">
                            <div class="col-md-6">
                                <div class="portlet light no-shadow">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class=""></i>শাখা কাঠামো
                                        </div>
                                    </div>
                                    <div class="portlet-body">
                                        <div id="jstree"></div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-6" id="unit_tree_expand_view" style="display: block;">

                            </div>


                        </div>
                    </div>
                </div>
            </div>

            <input type="hidden" id="menuid" value="${menuid}">
            <div id="editform" style="display: none">
                <div class="portlet light no-shadow">
                    <div class="portlet-title">
                        <div class="caption"><i class=""></i>শাখা সম্পাদন</div>
                    </div>
                    <div class="portlet-body form"><br><br>
                        <form id="OfficeOriginUnitEditForm" accept-charset="utf-8" method="post" role="form"
                              novalidate="novalidate">
                            <div class="form-body">

                                <div class="alert alert-danger display-hide">
                                    <button class="close" data-close="alert"></button>
                                    ফর্ম সাবমিট এ সমস্যা রয়েছে।দয়া করে যাচাই করুন.
                                </div>
                                <div class="alert alert-success display-hide">
                                    <button class="close" data-close="alert"></button>
                                    সাকসেসফুল !
                                </div>


                                <input type="hidden" name="id" id="id">
                                <div class="form-horizontal">

                                    <!-- Start : Import Office Unit Category View From Cell -->
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">উর্ধ্বতন শাখা</label>

                                        <div class="col-sm-7">
                                            <div class="input select">
                                                <select id="parent-unit-id" class="form-control" name="parent_unit_id">

                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">শাখার ধরণ</label>

                                        <div class="col-sm-7">
                                            <div class="input text">
                                                <input type="text" id="office-unit-category-e" class="form-control"
                                                       list="office_unit_category_list-e" name="office_unit_category">
                                            </div>
                                            <datalist id="office_unit_category_list-e">
                                                <option value="দপ্তর">দপ্তর</option>
                                                <option value="শাখা">শাখা</option>
                                                <option value="অনুবিভাগ">অনুবিভাগ</option>
                                                <option value="অধিশাখা">অধিশাখা</option>
                                            </datalist>
                                        </div>
                                    </div>
                                    <!-- End : Import Office Unit Category View From Cell -->

                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">নাম</label>

                                        <div class="col-sm-7">
                                            <div class="input text"><input type="text" id="unit-name-bng-e"
                                                                           class="form-control" name="unit_name_bng">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">নাম (ইংরেজি)</label>

                                        <div class="col-sm-7">
                                            <div class="input text"><input type="text" id="unit-name-eng-e"
                                                                           class="form-control" name="unit_name_eng">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">শাখার লেভেল</label>

                                        <div class="col-sm-7">
                                            <div class="input text"><input type="text" id="unit-level-e"
                                                                           class="form-control" name="unit_level"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-9">
                                        <button class="btn" style="background-color: #8dc542" onclick="editNode()"
                                                type="button">
                                            সংরক্ষণ
                                        </button>
                                        <button class="btn default btnClose" onclick="cancel()" type="button">বাতিল
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div id="addform" style="display: none">
                <div class="portlet light no-shadow">
                    <div class="portlet-title">
                        <div class="caption"><i class=""></i>নতুন শাখা</div>
                    </div>
                    <div class="portlet-body form"><br><br>
                        <form id="OfficeOriginUnitAddForm" accept-charset="utf-8" method="post" role="form"
                              novalidate="novalidate">

                            <div class="form-body">
                                <div class="alert alert-danger display-hide">
                                    <button class="close" data-close="alert"></button>
                                    ফর্ম সাবমিট এ সমস্যা রয়েছে।দয়া করে যাচাই করুন.
                                </div>
                                <div class="alert alert-success display-hide">
                                    <button class="close" data-close="alert"></button>
                                    সাকসেসফুল !
                                </div>
                                <input type="hidden" id="parent_unit_id" name="parent_unit_id">
                                <input type="hidden" id="office_ministry_id" name="office_ministry_id">
                                <input type="hidden" id="office_layer_id" name="office_layer_id">
                                <input type="hidden" id="office_origin_id" name="office_origin_id">
                                <div class="form-horizontal">

                                    <!-- Start : Import Office Unit Category View From Cell -->
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">শাখার ধরণ</label>

                                        <div class="col-sm-7">
                                            <div class="input text">
                                                <input type="text" value="" id="office-unit-category-a"
                                                       class="form-control" list="office_unit_category_list-a"
                                                       name="office_unit_category">
                                            </div>
                                            <datalist id="office_unit_category_list-a">
                                                <option value="দপ্তর">দপ্তর</option>
                                                <option value="শাখা">শাখা</option>
                                                <option value="অনুবিভাগ">অনুবিভাগ</option>
                                                <option value="অধিশাখা">অধিশাখা</option>
                                            </datalist>
                                        </div>
                                    </div>
                                    <!-- End : Import Office Unit Category View From Cell -->

                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">নাম</label>

                                        <div class="col-sm-7">
                                            <div class="input text">
                                                <input type="text" id="unit-name-bng-a"
                                                                           class="form-control" name="unit_name_bng" required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">নাম (ইংরেজি)</label>

                                        <div class="col-sm-7">
                                            <div class="input text"><input type="text" id="unit-name-eng-a"
                                                                           class="form-control" name="unit_name_eng">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-5 control-label">শাখার লেভেল</label>

                                        <div class="col-sm-7">
                                            <div class="input text"><input type="text" id="unit-level-a"
                                                                           class="form-control" name="unit_level"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-9">
                                        <button class="btn" style="background-color: #8dc542" onclick="addNode()"
                                                type="button">
                                            সংরক্ষণ
                                        </button>
                                        <button class="btn default btnClose" onclick="cancel()" type="button">বাতিল
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
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


<%--<script src="${context}/assets/global/plugins/bootstrap-toastr/toastr.min.js"></script>--%>
<%--<script src="${context}/assets/admin/pages/scripts/ui-toastr.js"></script>--%>

<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>


<script>

    var FormValidation = function () {
        var e = function () {
                var e = $("#unit_tree_expand_view #OfficeOriginUnitAddForm"),
                    r = $(".alert-danger", e),
                    i = $(".alert-success", e);

                e.validate({
                    errorElement: "span", errorClass: "help-block help-block-error",
                    focusInvalid: !1, ignore: "", messages: {
                        select_multi: {
                            maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                            minlength: jQuery.validator.format("At least {0} items must be selected")
                        }
                    }, rules: {

                        unit_level: {
                            required: !0,
                            number: !0,
                            minlength: 1,
                            maxlength: 3
                        },
                        officeoriginsequence: {
                            number: !0,
                            minlength: 1,
                            maxlength: 3
                        },

                        unit_name_bng: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedBngname: true,

                        },

                        unit_name_eng: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedEngname: true,

                        },

                        office_unit_category: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedBngname: true,

                        }


                    }, messages: {

                        unit_name_bng: {
                            required: "বাংলায় মৌলিক দপ্তরের নাম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        unit_name_eng: {
                            required: "ইংরেজিতে মৌলিক দপ্তরের নাম দিন",
                            number: "নম্বর ইংরেজিতে দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        ministrydata: {
                            required: "মন্ত্রণালয় নির্বাচন করুন",
                            valueNotEquals: "মন্ত্রণালয় নির্বাচন করুন"
                        },


                    },
                    invalidHandler: function (e, t) {
                        i.hide(), r.show(), App.scrollTo(r, -200)
                    },
                    highlight: function (e) {
                        $(e).closest(".form-group").addClass("has-error")
                    },
                    unhighlight: function (e) {
                        $(e).closest(".form-group").removeClass("has-error")
                    },
                    success: function (e) {
                        e.closest(".form-group").removeClass("has-error")

                    },
                    submitHandler: function (e) {
                        i.show(), r.hide(), e.submit()

                    }
                });
            },

            t = function () {
                jQuery().wysihtml5 && $(".wysihtml5").size() > 0 && $(".wysihtml5").wysihtml5({stylesheets: ["../assets/global/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]})
            };
        $.validator.addMethod('checkEngname', function (value, element) {
            return this.optional(element) || (/^[a-zA-Z]*$/.test(value));

        }, " No space or Number or  Special Charecter or  Bangla  character is allowed");

        $.validator.addMethod('checkBngname', function (value, element) {
            return this.optional(element) || (!/\s/g.test(value) && !/[^\u0980-\u09ff]/.test(value));

        }, " No space or Number or  No  Special Charecter or  English character is allowed");


        $.validator.addMethod('checkSpacedEngname', function (value, element) {
            return this.optional(element) || (/^[a-zA-Z,.;?;\s]*$/.test(value));


        }, "বাংলা অক্ষর গ্রহণযোগ্য নয়। ");


        $.validator.addMethod('checkSpacedBngname', function (value, element) {
            return this.optional(element) || (!/[^\u0980-\u09ff,.;?!/\s]/.test(value));

        }, " ইংরেজি অক্ষর গ্রহণযোগ্য নয়।");

        $.validator.addMethod("valueNotEquals", function (value, element, arg) {
            return arg !== value;
        }, "প্রদত্ত মান গ্রহণযোগ্য নয়");


        return {
            init: function () {
                t(), e()
            }
        }
    }();

    var FormEditValidation = function () {
        var e = function () {
                var e = $("#unit_tree_expand_view #OfficeOriginUnitEditForm"),
                    r = $(".alert-danger", e),
                    i = $(".alert-success", e);

                e.validate({
                    errorElement: "span", errorClass: "help-block help-block-error",
                    focusInvalid: !1, ignore: "", messages: {
                        select_multi: {
                            maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                            minlength: jQuery.validator.format("At least {0} items must be selected")
                        }
                    }, rules: {

                        unit_level: {
                            required: !0,
                            number: !0,
                            minlength: 1,
                            maxlength: 3
                        },
                        officeoriginsequence: {
                            number: !0,
                            minlength: 1,
                            maxlength: 3
                        },

                        unit_name_bng: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedBngname: true,

                        },

                        unit_name_eng: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedEngname: true,

                        },

                        office_unit_category: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedBngname: true,

                        }


                    }, messages: {

                        unit_name_bng: {
                            required: "বাংলায় মৌলিক দপ্তরের নাম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        unit_name_eng: {
                            required: "ইংরেজিতে মৌলিক দপ্তরের নাম দিন",
                            number: "নম্বর ইংরেজিতে দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        ministrydata: {
                            required: "মন্ত্রণালয় নির্বাচন করুন",
                            valueNotEquals: "মন্ত্রণালয় নির্বাচন করুন"
                        },


                    },
                    invalidHandler: function (e, t) {
                        i.hide(), r.show(), App.scrollTo(r, -200)
                    },
                    highlight: function (e) {
                        $(e).closest(".form-group").addClass("has-error")
                    },
                    unhighlight: function (e) {
                        $(e).closest(".form-group").removeClass("has-error")
                    },
                    success: function (e) {
                        e.closest(".form-group").removeClass("has-error")

                    },
                    submitHandler: function (e) {
                        i.show(), r.hide(), e.submit()

                    }
                });
            },

            t = function () {
                jQuery().wysihtml5 && $(".wysihtml5").size() > 0 && $(".wysihtml5").wysihtml5({stylesheets: ["../assets/global/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]})
            };
        $.validator.addMethod('checkEngname', function (value, element) {
            return this.optional(element) || (/^[a-zA-Z]*$/.test(value));

        }, " No space or Number or  Special Charecter or  Bangla  character is allowed");

        $.validator.addMethod('checkBngname', function (value, element) {
            return this.optional(element) || (!/\s/g.test(value) && !/[^\u0980-\u09ff]/.test(value));

        }, " No space or Number or  No  Special Charecter or  English character is allowed");


        $.validator.addMethod('checkSpacedEngname', function (value, element) {
            return this.optional(element) || (/^[a-zA-Z0-9,.;?;\s]*$/.test(value));


        }, "বাংলা অক্ষর গ্রহণযোগ্য নয়। ");


        $.validator.addMethod('checkSpacedBngname', function (value, element) {
            return this.optional(element) || (!/[^\u0980-\u09ff,.;?!/\s]/.test(value));

        }, " ইংরেজি অক্ষর গ্রহণযোগ্য নয়।");

        $.validator.addMethod("valueNotEquals", function (value, element, arg) {
            return arg !== value;
        }, "প্রদত্ত মান গ্রহণযোগ্য নয়");


        return {
            init: function () {
                t(), e()
            }
        }
    }();

    function cancel() {
        $("#unit_tree_expand_view").html("");
        $("#unit_tree_expand_view").hide();
    }

    function addNode() {
        FormValidation.init();
        var formData = {
            'ministryid': $('#unit_tree_expand_view input[name=office_ministry_id]').val(),
            'layerid': $('#unit_tree_expand_view input[name=office_layer_id]').val(),
            'originid': $('#unit_tree_expand_view input[name=office_origin_id]').val(),
            'officecategory': $('#unit_tree_expand_view input[name=office_unit_category]').val(),
            'originunitbng': $('#unit_tree_expand_view input[name=unit_name_bng]').val(),
            'originuniteng': $('#unit_tree_expand_view input[name=unit_name_eng]').val(),
            'unitlevel': $('#unit_tree_expand_view input[name=unit_level]').val(),
            'parentunitid': $('#unit_tree_expand_view input[name=parent_unit_id]').val()
        };

        if ($('#unit_tree_expand_view #OfficeOriginUnitAddForm').valid()) {
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/addoriginunit",
                data: formData,
                async: false,
                success: function (response) {
                    if (response > 0 || response == "success") {
                        toastr.success("নতুন নিযুক্তিটি সার্থকভাবে সংরক্ষিত হয়েছে");
                        cancel();
                        fetchData($("#origindropdown").val());
                    }
                    else toastr.error("নতুন নিযুক্তিটি সংরক্ষণ করা সম্ভব হয়নি");

                },
                error: function () {

                    toastr.error("নতুন নিযুক্তিটি সংরক্ষণ করা সম্ভব হয়নি");
                }
            });
        }
    }

    function editNode() {

        FormEditValidation.init();
        var formData = {
            'id': $('#unit_tree_expand_view input[name=id]').val(),
            'officecategory': $('#unit_tree_expand_view input[name=office_unit_category]').val(),
            'originunitbng': $('#unit_tree_expand_view input[name=unit_name_bng]').val(),
            'originuniteng': $('#unit_tree_expand_view input[name=unit_name_eng]').val(),
            'unitlevel': $('#unit_tree_expand_view input[name=unit_level]').val(),
            'parentunitid': $('#unit_tree_expand_view #parent-unit-id').val()
        };
        if ($('#unit_tree_expand_view #OfficeOriginUnitEditForm').valid()) {
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/editoriginunit",
                data: formData,
                async: false,
                success: function (response) {
                    if (response > 0 || response == "success") {
                        toastr.success("নিযুক্তিটি সার্থকভাবে সম্পাদন এবং সংরক্ষিত হয়েছে");
                        cancel();
                        fetchData($("#origindropdown").val());
                    }
                    else toastr.error("নিযুক্তিটি সম্পাদন করা সম্ভব হয়নি");
                },
                error: function () {

                    toastr.error("নিযুক্তিটি সম্পাদন করা সম্ভব হয়নি");
                }
            });
        }
    }

    function childList(parentId, data) {
        var childs = [];
        for (var i = 0; i < data.length; i++) {
            if (data[i].parentUnitId == parentId) childs.push(data[i]);
        }
        return childs;
    }

    function layerStructure(id, data) {
        var jsonforjstree = '[';
        var childs = childList(id, data);
        for (var i = 0; i < childs.length; i++) {
            jsonforjstree += '{ "id" : "' + childs[i].id + '",';
            var checkChild = childList(childs[i].id, data);
            if (checkChild.length == 0) jsonforjstree += '  "text" : "' + childs[i].unitNameBng.trim() + '<a  title=\'এই শাখাটি বাতিল করুন\' class=\'red equ\'  onclick=showModal(\'' + childs[i].id + '\',\'/deleteoriginunit\')><i class=\'fa fa fa-minus-circle\'></i></a>",';
            else jsonforjstree += '  "text" : "' + childs[i].unitNameBng.trim() + '",';
            jsonforjstree += '  "icon" : "icon icon-arrow-right",';
            jsonforjstree += '  "li_attr" : {"ul" : "' + childs[i].unitLevel + '","ouc" : "' + childs[i].officeUnitCategory.trim() + '","maxlevel" : "' + childs.length + '","bng" : "' + childs[i].unitNameBng.trim() + '","eng" : "' + childs[i].unitNameEng.trim() + '"},';
            jsonforjstree += '  "children" : ' + layerStructure(childs[i].id, data) + '},';
        }
        //jsonforjstree += '{ "id" : "300000",';
        jsonforjstree += '{  "text" : "<a  title=\'নতুন শাখা যুক্ত করুন\' class=\'red equ\'><i class=\'icon icon-plus\'></i></a>",';
        jsonforjstree += '  "icon" : "icon icon-arrow-right",';
        jsonforjstree += '  "li_attr" : {"maxlevel" : "' + childs.length + '"},';
        jsonforjstree += '  "children" : []}';


        jsonforjstree += ']';
        return jsonforjstree;
    }


    function createJSTrees(jsonData) {
        $('#jstree').jstree('destroy');
        $('#jstree').jstree({
            'core': {
                'data': jsonData
            }
        });
        $('#jstree').jstree("refresh");
//        $('#jstree').on('ready.jstree', function() {
////            $('#origin_unit_tree_panel').jstree("refresh");
//            $("#jstree").jstree("open_all");
//        });
        $('#jstree').on("select_node.jstree", function (e, data) {
//            $('#jstree').jstree('open_node', data.node);
            FormValidation.init();
            FormEditValidation.init();
            if (data.node.original.hasOwnProperty("id")) {
                $("#unit_tree_expand_view").hide('slow', function () {
                    var editForm = $("#editform").clone(true,true);
                    editForm.css('display', 'block');
                    FormEditValidation.init();
                    $("#unit_tree_expand_view").html(editForm.html());
                    var selectedpart = $("#unit_tree_expand_view");
                    $('#parent-unit-id > option[value=' + data.node.parent + ']', selectedpart).attr('selected', true);
                    $('#office-unit-category-e', selectedpart).val(data.node.li_attr.ouc);
                    $('#unit-name-bng-e', selectedpart).val(data.node.li_attr.bng);
                    $('#unit-name-eng-e', selectedpart).val(data.node.li_attr.eng);
                    $('#unit-level-e', selectedpart).val(data.node.li_attr.ul);
                    $('#id', selectedpart).val(data.node.original.id);
                    $("#unit_tree_expand_view").show('slow');
                });


            }
            else {
                $("#unit_tree_expand_view").hide('slow', function () {
                    var addForm = $("#addform").clone(true,true);
                    addForm.css('display', 'block');
                    FormValidation.init();
                    $("#unit_tree_expand_view").html(addForm.html());
                    var selectedpart = $("#unit_tree_expand_view");
                    var parent = data.node.parent;
                    if (parent == '#') $('#parent_unit_id', selectedpart).val(0);
                    else $('#parent_unit_id', selectedpart).val(parent);
                    $('#office_ministry_id', selectedpart).val($("#ministrydropdown").val());
                    $('#office_layer_id', selectedpart).val($("#layerdropdown").val());
                    $('#office_origin_id', selectedpart).val($("#origindropdown").val());
                    $("#unit_tree_expand_view").show('slow');
                });
            }

        });
    }

    function showModal(id, url) {
        bootbox.confirm({
            message: '<p class="text-center">আপনি কি এই শাখাটি বাতিল করতে চান?</p>',
            title: "শাখা বাতিল",
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
                            data = response;
                            $('.modal.in .modal-dialog').hide();
                            $(".modal.in .modal-dialog .btn").off("click");
                            cancel();

                            if(response ==1)
                            {
                                fetchData($("#origindropdown").val());
                                toastr.success("শাখাটি সফলভাবে মুছে ফেলা হয়েছে ","সার্থক");

                            }
                            else if(response ==2)
                            {
                                toastr.error(" আপনি যে শাখাটি মুছতে চাইছেন সেটির আরো শাখা /পদ আছে এই শাখাটি টি মুছতে হলে এর নিচের সব শাখা/পদ প্রথমে মুছে নিন ","দুঃখিত");
                            }
                            else
                            {
                                toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ","দুঃখিত");
                            }


//                            if (response == 1) {
//                                fetchData($("#origindropdown").val());
//                                toastr.success("শাখাটি বাতিল করা হয়েছে");
//                            }
//                            else if (response == 2) alert("This unit is used to build real office unit so you can not delete it . Thank You.");
//                            else toastr.error("শাখাটি বাতিল করা যায়নি");
                        },
                        error: function () {

                            $('.modal.in .modal-dialog').hide();
                            $(".modal.in .modal-dialog .btn").off("click");
                            toastr.options = {
                                "closeButton": true,
                                "debug": false,
                                "positionClass": "toast-bottom-right"
                            };
                            toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ","দুঃখিত");
                        }
                    });

                } else {
                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");
                }

            }
        });
    }

    function fetchData(value) {

        if(value == -1 || value == 0 || value == undefined){
            $('#jstree').jstree('destroy');
            return;
        }

        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/originunitsbyorigin",
            data: {
                id: value
            },
            async: false,
            success: function (response) {
                response.sort(function (a, b) {
                    return a.unitLevel - b.unitLevel;
                });

                var lStructure = layerStructure(0, response);
                var myJsonString = JSON.parse(lStructure);
                createJSTrees(myJsonString);
                var select = $('#parent-unit-id');
                select.empty();
                select.append($('<option></option>').val(0).html('--বাছাই করুন--'));
                $.each(response, function (index, value) {
                    select.append(
                        $('<option></option>').val(value.id).html(value.unitNameBng)
                    );
                });
                return response;
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
    }

    $(document).ready(function () {


        $('#ministrydropdown').change(function () {
            var data = "";
            $.ajax({
                type: "GET",
                url: "<%=request.getContextPath()%>/layersbyministries",
                data: {
                    id: $(this).val()
                },
                async: false,
                success: function (response) {
                    data = response;
                    var select = $('#layerdropdown');
                    select.empty();
                    select.append($('<option></option>').val(-1).html('--বাছাই করুন--'));
                    $.each(data, function (index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.layerNameBng)
                        );
                    });
                    $('#origindropdown').empty();
                    $('#jstree').jstree('destroy');
                    cancel();

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


        });

        $('#layerdropdown').change(function () {
            var data = "";
            $.ajax({
                type: "GET",
                url: "<%=request.getContextPath()%>/originsbylayer",
                data: {
                    id: $(this).val()
                },
                async: false,
                success: function (response) {
                    data = response;
                    var select = $('#origindropdown');
                    select.empty();
                    select.append($('<option></option>').val(-1).html('--বাছাই করুন--'));
                    $.each(data, function (index, value) {
                        select.append(
                            $('<option></option>').val(value.id).html(value.officeNameBng)
                        );
                    });
                    $('#jstree').jstree('destroy');
                    cancel();
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


        });

        $('#origindropdown').change(function () {
            var id = $(this).val();
            fetchData(id);

        });


    });

</script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
</body>
<!-- END BODY -->
</html>
