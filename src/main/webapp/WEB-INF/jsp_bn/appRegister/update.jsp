<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
    <link href="${context}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />

    <%@ include file="../includes/head.jsp" %>
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
                <div class="row">

            <div class="col-md-12">
                <div class="portlet box bordered ">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-settings font-dark"></i>
                            <span class="caption-subject font-dark sbold uppercase">অ্যাপ্লিকেশন সংশোধন ফর্ম</span>
                        </div>

                    </div>
                    <div class="portlet-body form">
                        <form:form method="post" enctype="multipart/form-data" action="${context}/appupdate"
                                   class="form-horizontal"  role="form" id="form_b" novalidate="novalidate">
                            <div class="form-body">

                                <div class="alert alert-danger display-hide">
                                    <button class="close" data-close="alert"></button> You have some form errors. Please check below. </div>
                                <div class="alert alert-success display-hide">
                                    <button class="close" data-close="alert"></button> Your form validation is successful! </div>

                                <div>
                                    <input type="hidden" name="id" value="${data.getId()}">
                                    <input type="hidden" id="file-changed" name="file_changed" value="0">
                                </div>


                                <div class="form-group">
                                    <label class="col-md-3 control-label left"> অ্যাপ্লিকেশন নাম ( ইংরেজিতে )</label>
                                    <div class="col-md-9">
                                        <div class="input-icon">
                                            <i class="fa fa-angle-double-right tooltips "
                                               data-original-title="please write a Name"
                                               data-container="body"></i>

                                            <input type="text" class="form-control" placeholder="App Names"
                                                   name="appname" value="${data.getName()}"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label left"> অ্যাপ্লিকেশন নাম ( বাংলায় )</label>
                                    <div class="col-md-9">
                                        <div class="input-icon">
                                            <i class="fa fa-angle-double-right tooltips "
                                               data-original-title="please write a Name"
                                               data-container="body"></i>

                                            <input type="text" class="form-control" placeholder="অ্যাপ্ নাম"
                                                   name="appnamebng" value="${data.getNameBng()}"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">অ্যাপ্লিকেশন ইউ আর এল</label>
                                    <div class="col-md-9">
                                        <div class="input-icon">
                                            <i class="fa fa-external-link tooltips"
                                               data-original-title="please write a valid Web address"
                                               data-container="body"></i>
                                            <input type="text" class="form-control" placeholder="ইউ আর এল" name="link" value="${data.getLink()}"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" col-md-3 control-label">রিডিরেক্ট ইউ আর এল <span class="required" aria-required="true"> * </span></label>
                                    <div class="col-md-6">
                                        <div class="input-icon">
                                            <i class="fa fa-external-link tooltips" data-original-title="please write a valid url" data-container="body"></i>
                                            <input type="text" class="form-control" placeholder="রিডিরেক্ট ইউ আর এল" name="redirect_url" value="${data.getRedirect()}">
                                        </div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class=" col-md-3 control-label">ডিফল্ট পেজ ইউ আর এল <span class="required" aria-required="true"> * </span></label>
                                    <div class="col-md-6">
                                        <div class="input-icon">
                                            <i class="fa fa-external-link tooltips" data-original-title="please write a valid url" data-container="body"></i>
                                            <input type="text" class="form-control" placeholder="ডিফল্ট পেজ ইউ আর এল" name="default_page_url" id="default_page_url" value="${data.getDefaultPageURL()}">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" col-md-3 control-label">লগ আউট ইউ আর এল <span class="required" aria-required="true"> * </span></label>
                                    <div class="col-md-6">
                                        <div class="input-icon">
                                            <i class="fa fa-external-link tooltips" data-original-title="please write a valid url" data-container="body"></i>
                                            <input type="text" class="form-control" placeholder="লগ আউট ইউ আর এল" name="logout_url" id="logout_url" value="${data.getLogoutURL()}">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">মোবাইল নং</label>
                                    <div class="col-md-9">
                                        <div class="input-icon">
                                            <i class="fa fa-mobile tooltips"
                                               data-original-title="please write a 13 digit mobile no"
                                               data-container="body"></i>
                                            <input type="number" class="form-control" placeholder="মোবাইল নং"
                                                   name="mobile" value="${data.getMobileNo()}"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">ইমেইল</label>
                                    <div class="col-md-9">
                                        <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <i class="fa fa-envelope"></i>
                                                        </span>
                                            <input type="text" class="form-control" placeholder="ইমেইল"
                                                   name="email" value="${data.getAppDomainEmail()}"></div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-3 control-label">নটিফিকেশন পদ্ধতি</label>
                                    <div class="col-md-9">
                                        <select class="form-control" name="mechanism">
                                            <option value="0" <c:if test="${data.getNotificationFlag()==sms}"> <c:out
                                                    value="selected=selected"/></c:if>>ইমেইল
                                            </option>
                                            <option value="1" <c:if test="${data.getNotificationFlag()==email}"> <c:out
                                                    value="selected=selected"/></c:if>>এস এম এস
                                            </option>
                                        </select>
                                    </div>
                                </div>


                                <div class="form-group ">
                                    <label class="control-label col-md-3">অ্যাপ্লিকেশন আইকন</label>
                                    <div class="col-md-9">
                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                            <div class="fileinput-preview thumbnail" data-trigger="fileinput"
                                                 style="width: 200px; height: 150px; line-height: 150px;">


                                                <img alt="Photo"   class="img-responsive" src="${data.getLogoUrl()}">
                                            </div>
                                            <div>
                                                                <span class="btn red btn-outline btn-file">
                                                                    <span class="fileinput-new" > ছবি বাছাই করুন </span>
                                                                    <span class="fileinput-exists" > পরিবর্তন করুন </span>
                                                                    <input type="hidden" value="" name="...">
                                                                    <input type="file" id="file" name="file" > </span>
                                                <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> দূর করুন </a>
                                            </div>
                                        </div>

                                    </div>
                                </div>





                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button type="submit" class="btn green">সংরক্ষন</button>
                                        <%--<button type="button" class="btn default">বাতিল করুন</button>--%>
                                        <a type="button" href="<%=request.getContextPath()%>/list" class="btn grey-salsa btn-outline">বাতিল করুন</a>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
                </div>

            <!-- BEGIN PAGE HEADER-->


            <!-- END PAGE HEADER-->

            <!-- Everything is here -->

            <!-- END LOGIN FORM -->
                <input type="hidden" id="menuid" value="${menuid}">
        </div>
        </div>
        <!--End of Everything -->
    </div>
    <!-- END MAIN CONTENT -->
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

<%--added by forhad--%>
<script src="${context}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>


<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>



<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/common/validation.js" type="text/javascript"></script>


<script>

    $(document).ready(function () {
        // $("#file").live("change", function () {
        //     alert("hola");
        // });
        $('#file').bind('change', function (e) { //dynamic property binding
            $('#file-changed').val(1);
        });
    });


</script>
</body>
<!-- END BODY -->
</html>