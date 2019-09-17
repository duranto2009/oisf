<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

<head>
    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../includes/head.jsp"%>
    <!-- BEGIN PAGE STYLES -->
    <link rel="stylesheet" type="text/css" href="${context}/assets/admin/pages/css/tasks.css" />
    <!-- END PAGE STYLES -->
    <link href="${context}/assets/css/style.css" rel="stylesheet" type="text/css"/>



</head>

<body class="page-sidebar-page-sidebar-closed-hide-logo page-header-fixed page-footer-fixed">
<form action="" method="post" id="oisfForm" target="_blank">
    <input type="hidden" name="token" value="" id="token">
</form>
<!-- BEGIN HEADER -->
<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
    <%@ include file="../includes/header.jsp"%>
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
            <%@ include file="../includes/menu.jsp"%>

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
                                    <span class="caption-subject font-dark sbold uppercase">  মডিউল  এডিট  করুন</span>
                                </div>

                            </div>
                            <div class="portlet-body">
                                <form method="post" action="/editmodule"  class="form-horizontal"
                                      role="form" novalidate="novalidate" id="form_b">
                                    <div class="form-body">

                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            ফর্ম সাবমিট এ সমস্যা রয়েছে।দয়া করে যাচাই করুন.
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            সাকসেসফুল !
                                        </div>

                                        <input type="hidden" name="id" value="${id}">


                                        <div class="form-group">
                                            <label class=" col-md-3 control-label" >মডিউল নাম ইংরেজিতে<span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <i class="fa fa-angle-double-right tooltips "
                                                       data-original-title="please write a Name"
                                                       data-container="body"></i>

                                                    <input type="text" data-required="1" class="form-control"
                                                           value="${name}"
                                                           name="name">

                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label">মডিউল নাম বাংলা <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <i class="fa fa-angle-double-right tooltips "
                                                       data-original-title="please write a Name"
                                                       data-container="body"></i>

                                                    <input type="text" data-required="1" class="form-control"
                                                           value="${nameBng}"
                                                           name="nameBng">

                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label"> ইউ আর এল <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <i class="fa fa-angle-double-right tooltips "
                                                       data-original-title="please write url"
                                                       data-container="body"></i>

                                                    <input type="url" data-required="1" class="form-control"
                                                           placeholder="ইউ আর এল"
                                                           name="url" value="${url}/">

                                                </div>
                                            </div>

                                        </div>

                                        <input type="hidden" name="moduleId" value="${id}">
                                        <input type="hidden" name="moduleUrl" value="${url}">
                                        <input type="hidden" name="moduleName" value="${name}">
                                        <input type="hidden" name="refererurl" value="${refererurl}">


                                        <%--<div class="form-group">--%>
                                            <%--<label class="col-md-3 control-label">Parent Name</label>--%>
                                            <%--<div class="col-md-6">--%>
                                                <%--<select class="form-control" name="pardata" id="pardropdown">--%>
                                                    <%--<option value="-1">...</option>--%>
                                                    <%--<c:forEach var="par" items="${parent}">--%>
                                                        <%--<option value="${par.getId()}">--%>
                                                                <%--${par.getNameBng()}--%>
                                                        <%--</option>--%>
                                                    <%--</c:forEach>--%>
                                                <%--</select>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>



                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn green">জমা দিন</button>
                                                <button type="button"   onclick= "location.href='${refererurl}'" class="btn btn-circle grey-salsa btn-outline">বাতিল করুন</button>
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
        </div>


        <!-- END CONTENT -->
    </div>
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../includes/footer.jsp"%>
</div>
<!-- END FOOTER -->
<%@ include file="../includes/includes.jsp"%>
<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>



<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>



<%--validation--%>
<script>

    var FormValidation = function () {
        var e = function () {
                var e = $("#form_b"),
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

                        },
                        name:{
                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedEngname: true,
                        },
                        nameBng:{
                            required: true,
                            minlength: 3,
                            maxlength: 1000,
                            checkSpacedBngname: true,
                        },
                        url:{
                            required: true,
                            url: !0
                        }


                    }, messages: {

                        officeoriginnamebng: {
                            required: "বাংলায় অরিজিন নেম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        officeoriginlevel:{
                            required: "ইংরেজিতে লেভেল দিন",
                            number:" সুধুমাত্র নম্বর গ্রহণযোগ্য",
                            minlength: "কমপক্ষে ১ টি অক্ষর দিন",
                            maxlength: "৩ টি অক্ষর এর কম দিন"
                        },
                        officeoriginsequence:{
                            number:" সুধুমাত্র নম্বর গ্রহণযোগ্য",
                            minlength: "কমপক্ষে ১ টি অক্ষর দিন",
                            maxlength: "৩ টি অক্ষর এর কম দিন"
                        },
                        officeoriginnameeng: {
                            required: "ইংরেজিতে অরিজিন নেম দিন",
                            number:"নম্বর ইংরেজিতে দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        ministrydata: {
                            required: "মিনিস্ট্রি নির্বাচন করুন",
                            valueNotEquals:"মিনিস্ট্রি নির্বাচন করুন"
                        },
                        superiordata: {
                            required: "সুপিরিওর নির্বাচন করুন",
                            valueNotEquals:"সুপিরিওর নির্বাচন করুন"
                        },
                        layerdata: {
                            required: " লেয়ার নির্বাচন করুন",
                            valueNotEquals:"লেয়ার নির্বাচন করুন"
                        },
                        name:{
                            required: "ইংরেজিতে  মডিউলের নাম দিন",
                            minlength: "কমপক্ষে ১ টি অক্ষর দিন",
                            maxlength: "৩ টি অক্ষর এর কম দিন"
                        },
                        nameBng:{
                            required: "বাংলায়  মডিউলের নাম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        url:{

                        }


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
                        i.show(), r.hide(), e.submit(),submitForm()

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
            return this.optional(element) || (!/[^\u0980-\u09ff0-9,.;?!/\s]/.test(value));

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


    function submitForm(){
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "positionClass": "toast-bottom-right",
            "fadeOut" : 3000
        };
        toastr.success(" ফরম  সাবমিট সম্পন্ন  হচ্ছে।");
        console.log("it is not working --- ");
    }


    $(document).ready(function () {

        FormValidation.init();
    });



</script>

<!-- END PAGE LEVEL PLUGINS -->


</body>




</html>