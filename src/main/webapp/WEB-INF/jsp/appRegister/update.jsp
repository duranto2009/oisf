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

            <div class="col-md-12">
                <div class="portlet box bordered " >
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="icon-settings font-dark"></i>
                            <span class="caption-subject font-dark sbold uppercase">Application Update Form</span>
                        </div>

                    </div>
                    <div class="portlet-body form">
                        <form:form method="post" action="${context}/appupdate" class="form-horizontal" role="form" >
                            <div class="form-body">

                                <div>
                                    <input type="hidden" name="id" value="${data.getId()}">
                                </div>


                                <div class="form-group">
                                    <label class="col-md-3 control-label left">Application Name</label>
                                    <div class="col-md-9">
                                        <div class="input-icon">
                                            <i class="fa fa-angle-double-right tooltips "
                                               data-original-title="please write a Name"
                                               data-container="body"></i>

                                            <input type="text" class="form-control" placeholder="App name"
                                                   name="appname" value="${data.getName()}"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label left">Bangla Name</label>
                                    <div class="col-md-9">
                                        <div class="input-icon">
                                            <i class="fa fa-angle-double-right tooltips "
                                               data-original-title="please write a Name"
                                               data-container="body"></i>

                                            <input type="text" class="form-control" placeholder="App name"
                                                   name="appnamebng" value="${data.getNameBng()}"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Application URL</label>
                                    <div class="col-md-9">
                                        <div class="input-icon">
                                            <i class="fa fa-external-link tooltips"
                                               data-original-title="please write a valid Web address"
                                               data-container="body"></i>
                                            <input type="text" class="form-control" placeholder="Url" name="link" value="${data.getLink()}"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" col-md-3 control-label">Redirect URL <span class="required" aria-required="true"> * </span></label>
                                    <div class="col-md-6">
                                        <div class="input-icon">
                                            <i class="fa fa-external-link tooltips" data-original-title="please write a valid url" data-container="body"></i>
                                            <input type="text" class="form-control" placeholder="redirect url" name="redirect_url" value="${data.getRedirect()}">
                                        </div>
                                    </div>
                                </div>

                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-3 control-label">Allowed IP</label>--%>
                                    <%--<div class="col-md-9">--%>
                                        <%--<div class="input-icon">--%>
                                            <%--<i class="fa fa-th-list" aria-hidden="true"></i>--%>
                                            <%--<input type="text" class="form-control" placeholder="Allowed IP" name="ip" value="${data.getAllowedIP()}">--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <div class="form-group">
                                    <label class=" col-md-3 control-label">IDP Postback URL <span class="required" aria-required="true"> * </span></label>
                                    <div class="col-md-6">
                                        <div class="input-icon">
                                            <i class="fa fa-external-link tooltips" data-original-title="please write a valid url" data-container="body"></i>
                                            <input type="text" class="form-control" placeholder="IDP Postback URL" name="idp_url" value="${data.getIdpPostbackUrl()}">
                                        </div>
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-md-3 control-label">Mobile No</label>
                                    <div class="col-md-9">
                                        <div class="input-icon">
                                            <i class="fa fa-mobile tooltips"
                                               data-original-title="please write a 13 digit mobile no"
                                               data-container="body"></i>
                                            <input type="number" class="form-control" placeholder="Mobile No"
                                                   name="mobile" value="${data.getMobileNo()}"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 control-label">Email Address</label>
                                    <div class="col-md-9">
                                        <div class="input-group">
                                                        <span class="input-group-addon">
                                                            <i class="fa fa-envelope"></i>
                                                        </span>
                                            <input type="text" class="form-control" placeholder="Email Address"
                                                   name="email" value="${data.getAppDomainEmail()}"></div>
                                    </div>
                                </div>

                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-3 control-label">Status</label>--%>
                                    <%--<div class="col-md-9">--%>
                                        <%--<select class="form-control" name="status">--%>
                                            <%--<option value="1" <c:if test="${data.getStatus()==1}"> <c:out--%>
                                                    <%--value="selected=selected"/></c:if>>Active--%>
                                            <%--</option>--%>
                                                <%--&lt;%&ndash;<option value="1">Active</option>&ndash;%&gt;--%>
                                            <%--<option value="0" <c:if test="${data.getStatus()==0}"> <c:out--%>
                                                    <%--value="selected=selected"/></c:if>> In Active--%>
                                            <%--</option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-3 control-label">Is Framework</label>--%>
                                    <%--<div class="col-md-9">--%>
                                        <%--<select class="form-control" name="type">--%>
                                            <%--<option value="0" <c:if test="${data.getIs_framework()==0}"> <c:out value="selected=selected"/></c:if>>--%>
                                                <%--No--%>
                                            <%--</option>--%>
                                            <%--<option value="1" <c:if test="${data.getIs_framework()==1}"> <c:out value="selected=selected"/></c:if>>--%>
                                                <%--Yes--%>
                                            <%--</option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Notification Mechanism</label>
                                    <div class="col-md-9">
                                        <select class="form-control" name="mechanism">
                                            <option value="0" <c:if test="${data.getNotificationFlag()==0}"> <c:out
                                                    value="selected=selected"/></c:if>>Email
                                            </option>
                                            <option value="1" <c:if test="${data.getNotificationFlag()==1}"> <c:out
                                                    value="selected=selected"/></c:if>>SMS
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <%--<div class="form-group">--%>
                                    <%--<label class="col-md-3 control-label">Dashboard Item Share</label>--%>
                                    <%--<div class="col-md-9">--%>
                                        <%--<select class="form-control" name="dashflag">--%>
                                            <%--<option value="1"<c:if test="${data.getDashShareFlag()==1}"> <c:out--%>
                                                    <%--value="selected=selected"/></c:if>>Yes--%>
                                            <%--</option>--%>
                                            <%--<option value="0"<c:if test="${data.getDashShareFlag()==0}"> <c:out--%>
                                                    <%--value="selected=selected"/></c:if>>No--%>
                                            <%--</option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>



                                <div class="form-group ">
                                    <label class="control-label col-md-3">Application Icon</label>
                                    <div class="col-md-9">
                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                            <div class="fileinput-preview thumbnail" data-trigger="fileinput"
                                                 style="width: 200px; height: 150px; line-height: 150px;">


                                                <img alt="Photo" class="img-responsive" src="${data.getLogoUrl()}">
                                            </div>
                                            <div>
                                                                <span class="btn red btn-outline btn-file">
                                                                    <span class="fileinput-new"> Select image </span>
                                                                    <span class="fileinput-exists"> Change </span>
                                                                    <input type="hidden" value="" name="...">
                                                                    <input type="file" name="file" > </span>
                                                <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> Remove </a>
                                            </div>
                                        </div>

                                    </div>
                                </div>





                            </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button type="submit" class="btn green">Submit</button>
                                        <button type="button" class="btn default">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>

            <!-- BEGIN PAGE HEADER-->


            <!-- END PAGE HEADER-->

            <!-- Everything is here -->

            <!-- END LOGIN FORM -->
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
</body>
<!-- END BODY -->
</html>