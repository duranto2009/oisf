<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

<head>
    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../../includes/head.jsp"%>

</head>

<body class=" page-sidebar-page-sidebar-closed-hide-logo page-header-fixed page-footer-fixed">
<form action="" method="post" id="oisfForm" target="_blank">
    <input type="hidden" name="token" value="" id="token">
</form>
<!-- BEGIN HEADER -->
<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">
    <%@ include file="../../includes/header.jsp"%>
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
            <%@ include file="../../includes/menu.jsp"%>

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
                                    <span class="caption-subject font-dark sbold uppercase"> অফিস মন্ত্রণালয় সম্পাদন</span>
                                </div>

                            </div>
                            <div class="portlet-body">
                                <form method="post" action="${context}/editministry"  class="form-horizontal" id ="target"
                                      role="form" novalidate="novalidate" >
                                    <div class="form-body">


                                        <div class="alert alert-danger display-hide">
                                            <button class="close" data-close="alert"></button>
                                            ফর্ম সাবমিট এ সমস্যা রয়েছে।দয়া করে যাচাই করুন।
                                        </div>
                                        <div class="alert alert-success display-hide">
                                            <button class="close" data-close="alert"></button>
                                            সফলভাবে মন্ত্রণালয়টি সম্পাদন করা হয়েছে !
                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label"> ধরণ<span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <i class="fa fa-angle-double-right tooltips "
                                                       data-original-title=" অফিসের ধরণ লিখুন"
                                                       data-container="body"></i>


                                                    <select name="officetype" class="form-control" >
                                                        <c:choose>
                                                            <c:when test="${officeministry.getOfficeType() == 1}">
                                                                <option value="1"  selected="selected">
                                                                    মন্ত্রণালয়
                                                                </option>
                                                                <option value="2" >
                                                                    বিভাগ
                                                                </option>
                                                            </c:when>
                                                            <c:otherwise>

                                                                <option value="1">
                                                                    মন্ত্রণালয়
                                                                </option>
                                                                <option value="2"  selected="selected">
                                                                    বিভাগ
                                                                </option>
                                                            </c:otherwise>

                                                        </c:choose>
                                                    </select>

                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label" >  নাম ইংরেজিতে <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <i class="fa fa-angle-double-right tooltips "
                                                       data-original-title="please write a Name"
                                                       data-container="body"></i>

                                                    <input type="text" data-required="1" class="form-control"
                                                           placeholder=" মন্ত্রণালয় নাম ইংরেজিতে"
                                                           name="officeministrynameeng" value="${officeministry.getNameEng()}">

                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label">  নাম বাংলাতে <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <i class="fa fa-angle-double-right tooltips "
                                                       data-original-title="please write a Name"
                                                       data-container="body"></i>

                                                    <input type="text" data-required="1" class="form-control"
                                                           placeholder=" অফিস মন্ত্রণালয় নাম বাংলাতে"
                                                           name="officeministrynamebng" value="${officeministry.getNameBng()}">

                                                </div>
                                            </div>

                                        </div>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label">  সংক্ষিপ্ত নাম <span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <i class="fa fa-angle-double-right tooltips "
                                                       data-original-title="please write a Name"
                                                       data-container="body"></i>

                                                    <input type="text" data-required="1" class="form-control"
                                                           placeholder="OfficeMinistry Short Name"
                                                           name="officeministryengshort" value="${officeministry.getNameEngShort()}">

                                                </div>
                                            </div>

                                        </div>

                                        <%--<div class="form-group">--%>
                                            <%--<label class=" col-md-3 control-label">  অফিসের ধরণ<span--%>
                                                    <%--class="required" aria-required="true"> * </span></label>--%>

                                            <%--<div class="col-md-6">--%>
                                                <%--<div class="input-icon">--%>

                                                    <%--<i class="fa fa-angle-double-right tooltips "--%>
                                                       <%--data-original-title="please write Office Type"--%>
                                                       <%--data-container="body"></i>--%>

                                                    <%--<input type="text" data-required="1" class="form-control"--%>
                                                           <%--placeholder="Office Type"--%>
                                                           <%--name="officetype" value="${officeministry.getOfficeType()}">--%>

                                                <%--</div>--%>
                                            <%--</div>--%>

                                        <%--</div>--%>

                                        <div class="form-group">
                                            <label class=" col-md-3 control-label">  রেফারেন্স কোড<span
                                                    class="required" aria-required="true"> * </span></label>

                                            <div class="col-md-6">
                                                <div class="input-icon">

                                                    <i class="fa fa-angle-double-right tooltips "
                                                       data-original-title="please write Reference Code"
                                                       data-container="body"></i>

                                                    <input type="text" data-required="1" class="form-control"
                                                           placeholder="Reference Code"
                                                           name="referencecode" value="${officeministry.getReferenceCode()}">

                                                </div>
                                            </div>

                                        </div>

                                        <%--<div class="form-group">--%>
                                            <%--<label class=" col-md-3 control-label">  সচল   স্ট্যাটাস কোড<span--%>
                                                    <%--class="required" aria-required="true"> * </span></label>--%>

                                            <%--<div class="col-md-6">--%>
                                                <%--<div class="input-icon">--%>

                                                    <%--<i class="fa fa-angle-double-right tooltips "--%>
                                                       <%--data-original-title="please write Active Status Code"--%>
                                                       <%--data-container="body"></i>--%>

                                                    <%--<input type="text" data-required="1" class="form-control"--%>
                                                           <%--placeholder="Active Status Code"--%>
                                                           <%--name="status" value="${officeministry.getStatus()}">--%>

                                                <%--</div>--%>
                                            <%--</div>--%>

                                        <%--</div>--%>

                                        <input type="hidden" data-required="1" class="form-control"

                                               name="id" value="${officeministry.getId()}">



                                        <%--<div class="form-group">--%>
                                        <%--<label class="col-md-3 control-label">Status</label>--%>
                                        <%--<div class="col-md-6">--%>
                                        <%--<select class="form-control" name="status">--%>
                                        <%--<option value="1">Active</option>--%>
                                        <%--<option value="0">In Active</option>--%>
                                        <%--</select>--%>
                                        <%--</div>--%>
                                        <%--</div>--%>


                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <button type="submit" class="btn green"> জমা দিন</button>
                                                <button type="button"  onclick = "location.href='<%=request.getContextPath()%>/ministrylist?menuid=${sessionScope.ministrymenuid}'" class="btn btn-circle grey-salsa btn-outline"> বাতিল</button>
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

        </div>



        <!-- END CONTENT -->
    </div>
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../../includes/footer.jsp"%>
</div>
<%@ include file="../../includes/includes.jsp"%>
<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/appregistration/validation.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->


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

                        officetype: {
                            required: !0,
                            number: !0,
                            minlength: 1,
                            maxlength: 3
                        },
                        referencecode: {
                            required: !0,
                            number: !0,
                            minlength: 1,
                            maxlength: 3
                        },
                        status: {
                            required: !0,
                            number: !0,
                            minlength: 1,
                            maxlength: 3
                        },
                        officeministryengshort: {
                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedEngname: true,
                        },

                        officeministrynamebng: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedBngname: true,

                        },

                        officeministrynameeng: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedEngname: true,

                        }


                    }, messages: {

                        officeministrynamebng: {
                            required: "বাংলায় মন্ত্রণালয়ের নাম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        officeministrynameeng: {
                            required: "ইংরেজিতে মন্ত্রণালয়ের নাম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        officeministryengshort: {
                            required: "ইংরেজিতে মন্ত্রণালয়ের সংক্ষিপ্ত নাম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        officetype: {
                            required: "মন্ত্রণালয়ের ধরণ নির্বাচন করুন",
                            number: "শুধুমাত্র ইংরেজি নম্বর গ্রহণযোগ্য"
                        },
                        referencecode: {
                            required: "রেফারেন্স কোড অবশ্য পূরণীয়",
                            number: "শুধুমাত্র ইংরেজি নম্বর গ্রহণযোগ্য"
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
    $(document).ready(function() {
        FormValidation.init();


});
</script>

</body>




</html>