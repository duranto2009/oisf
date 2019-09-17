<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>

<head>
    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <c:set var="context" value="${pageContext.request.contextPath}"/>
    <%@ include file="../../includes/head.jsp" %>

</head>

<body class="page-sidebar-page-sidebar-closed-hide-logo page-header-fixed page-footer-fixed">
<form action="" method="post" id="oisfForm" target="_blank">
    <input type="hidden" name="token" value="" id="token">
</form>
<!-- BEGIN HEADER -->
<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
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
        <div class="page-sidebar md-shadow-z-2-i  navbar-collapse collapse">
            <%@ include file="../../includes/menu.jsp" %>

        </div>

    </div>

    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <div class="card">
                <div class="portlet-body form">


                    <div class="row">
                        <div class="col-md-12">
                            <div class="portlet box bordered ">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-settings font-dark"></i>
                                        <span class="caption-subject font-dark sbold"> মৌলিক দপ্তর তৈরি </span>
                                    </div>

                                </div>
                                <div class="portlet-body">
                                    <form method="post" action="${context}/addorigin" class="form-horizontal"
                                          id="target" role="form" novalidate="novalidate" >
                                        <div class="form-body">


                                            <div class="alert alert-danger display-hide">
                                                <button class="close" data-close="alert"></button>
                                                ফর্ম সাবমিট এ সমস্যা রয়েছে।দয়া করে যাচাই করুন.
                                            </div>
                                            <div class="alert alert-success display-hide">
                                                <button class="close" data-close="alert"></button>
                                                সাকসেসফুল !
                                            </div>


                                            <div class="form-group">
                                                <label class=" col-md-3 control-label"> নাম(ইংরেজিতে)<span
                                                        class="required" aria-required="true"> * </span></label>

                                                <div class="col-md-6">
                                                    <div class="input-icon">

                                                        <i class="fa fa-angle-double-right tooltips "
                                                           data-original-title="please write a Name"
                                                           data-container="body"></i>

                                                        <input type="text" data-required="1" class="form-control"
                                                               placeholder=" মৌলিক দপ্তরের নাম ইংরেজিতে"
                                                               name="officeoriginnameeng">

                                                    </div>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label class=" col-md-3 control-label"> নাম(বাংলা) <span
                                                        class="required" aria-required="true"> * </span></label>

                                                <div class="col-md-6">
                                                    <div class="input-icon">

                                                        <i class="fa fa-angle-double-right tooltips "
                                                           data-original-title="please write a Name"
                                                           data-container="body"></i>

                                                        <input type="text" data-required="1" class="form-control"
                                                               placeholder=" মৌলিক দপ্তরের নাম বাংলাতে"
                                                               name="officeoriginnamebng">

                                                    </div>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label class=" col-md-3 control-label"> মৌলিক দপ্তরের স্তর <span
                                                        class="required" aria-required="true"> * </span></label>

                                                <div class="col-md-6">
                                                    <div class="input-icon">

                                                        <i class="fa fa-angle-double-right tooltips "
                                                           data-original-title="please write a Name"
                                                           data-container="body"></i>

                                                        <input type="text" data-required="1" class="form-control"
                                                               placeholder=" মৌলিক দপ্তরের স্তর "
                                                               name="officeoriginlevel">

                                                    </div>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label class=" col-md-3 control-label"> মৌলিক দপ্তরের ক্রম <span
                                                        class="required" aria-required="true"> * </span></label>

                                                <div class="col-md-6">
                                                    <div class="input-icon">

                                                        <i class="fa fa-angle-double-right tooltips "
                                                           data-original-title="please write Office Type"
                                                           data-container="body"></i>

                                                        <input type="text" data-required="1" class="form-control"
                                                               placeholder=" মৌলিক দপ্তরের ক্রম "
                                                               name="officeoriginsequence">

                                                    </div>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label class=" col-md-3 control-label"> মন্ত্রণালয় <span
                                                        class="required" aria-required="true"> * </span></label>

                                                <div class="col-md-6">
                                                    <select class="form-control" name="ministrydata"
                                                            id="ministrydropdown">
                                                        <option value="-1">--নির্বাচন করুন--</option>
                                                        <c:forEach var="ministry" items="${ministry}">
                                                            <option value="${ministry.getId()}">
                                                                    ${ministry.getNameBng()}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                            </div>

                                            <div class="form-group">
                                                <label class=" col-md-3 control-label"> দপ্তরের স্তর <span
                                                        class="required" aria-required="true"> * </span></label>

                                                <div class="col-md-6">
                                                    <select class="form-control" name="layerdata" id="layerdropdown">

                                                    </select>
                                                </div>

                                            </div>


                                            <div class="form-group">
                                                <label class=" col-md-3 control-label"> সুপিরিয়র দপ্তর <span
                                                        class="required" aria-required="true"> * </span></label>

                                                <div class="col-md-6">
                                                    <select class="form-control" name="superiordata"
                                                            id="superiordropdown">

                                                    </select>
                                                </div>

                                            </div>


                                        </div>
                                        <div class="form-actions">
                                            <div class="row">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <button type="submit" class="btn green"> জমা দিন</button>
                                                    <button type="button"
                                                            onclick="location.href='<%=request.getContextPath()%>/officeministrylistview'"
                                                            class="btn btn-circle grey-salsa btn-outline"> বাতিল
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
            </div>
            <input type="hidden" id="menuid" value="${menuid}">
        </div>


        <!-- END CONTENT -->
    </div>
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../../includes/includes.jsp" %>
<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/appregistration/validation.js" type="text/javascript"></script>

<script>
    var FormValidation = function () {
        var e = function () {
                var e = $("#target"),
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

                        officeoriginlevel: {
                            required: !0,
                            number: !0,
                            minlength: 1,
                            maxlength:3
                        },
                        officeoriginsequence:{
                            number: !0,
                            minlength: 1,
                            maxlength:3
                        },
                        ministrydata: {
                            required: !0,
                            valueNotEquals: "-1"
                        },
                        superiordata:{
                            required: !0,
                            valueNotEquals: "-1"
                        },
                        layerdata:{
                            required: !0,
                            valueNotEquals: "-1"
                        },
                        select_multi: {
                            required: !0, minlength: 1,
                            maxlength: 3
                        },

                        officeoriginnamebng: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedBngname: true,

                        },

                        officeoriginnameeng: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedEngname: true,

                        }


                    }, messages: {

                        officeoriginnamebng: {
                            required: "বাংলায় মৌলিক দপ্তরের নাম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        officeoriginlevel:{
                            required: "ইংরেজিতে লেভেল দিন",
                            number:" শুধুমাত্র ইংরেজিতে নম্বর গ্রহণযোগ্য",
                            minlength: "কমপক্ষে ১ টি অক্ষর দিন",
                            maxlength: "৩ টি অক্ষর এর কম দিন"
                        },
                        officeoriginsequence:{
                            number:" শুধুমাত্র ইংরেজিতে নম্বর গ্রহণযোগ্য",
                            minlength: "কমপক্ষে ১ টি অক্ষর দিন",
                            maxlength: "৩ টি অক্ষর এর কম দিন"
                        },
                        officeoriginnameeng: {
                            required: "ইংরেজিতে মৌলিক দপ্তরের নাম দিন",
                            number:"নম্বর ইংরেজিতে দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        ministrydata: {
                            required: "মন্ত্রণালয় নির্বাচন করুন",
                            valueNotEquals:"মন্ত্রণালয় নির্বাচন করুন"
                        },
                        superiordata: {
                            required: "সুপিরিওর নির্বাচন করুন",
                            valueNotEquals:"সুপিরিওর নির্বাচন করুন"
                        },
                        layerdata: {
                            required: " লেয়ার নির্বাচন করুন",
                            valueNotEquals:"লেয়ার নির্বাচন করুন"
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

        $.validator.addMethod("valueNotEquals", function(value, element, arg){
            return arg !== value;
        }, "প্রদত্ত মান গ্রহণযোগ্য নয়");


        return {
            init: function () {
                t(), e()
            }
        }
    }();

    $(document).ready(function () {

        FormValidation.init();


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
                select.append($('<option></option>').val(-1).html('--নির্বাচন করুন--'));
                $.each(data, function (index, value) {
                    select.append(
                        $('<option></option>').val(value.id).html(value.layerNameBng)
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


    });

    $('#layerdropdown').change(function () {
        var data = "";
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/originbyministry",
            data: {
                ministryid: $("#ministrydropdown").val()
            },
            async: false,
            success: function (response) {
                data = response;
                var select = $('#superiordropdown');
                select.empty();
                select.append($('<option></option>').val(0).html('#'));
                $.each(data, function (index, value) {
                    select.append(
                        $('<option></option>').val(value.id).html(value.officeNameBng)
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


    });

});
</script>

</body>


</html>