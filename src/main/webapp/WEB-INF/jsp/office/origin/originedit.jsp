<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>

<head>
    <meta charset="utf-8"/>
    <title> Office Information and Service Framework (OISF) </title>
    <c:set var="context" value="${pageContext.request.contextPath}" />
    <%@ include file="../../includes/head.jsp"%>

</head>

<body class="page-sidebar-page-sidebar-closed-hide-logo page-header-fixed page-footer-fixed">
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
                                       <span class="caption-subject font-dark sbold">Office Origin Edit</span>
                                   </div>

                               </div>
                               <div class="portlet-body">
                                   <form method="post" action="${context}/editorigin"  class="form-horizontal" id ="target"
                                         role="form" novalidate="novalidate" id="form_b">
                                       <div class="form-body">

                                           <div class="alert alert-danger display-hide">
                                               <button class="close" data-close="alert"></button>
                                               You have some form errors. Please check below.
                                           </div>
                                           <div class="alert alert-success display-hide">
                                               <button class="close" data-close="alert"></button>
                                               Your form validation is successful!
                                           </div>

                                           <input type="hidden" name="id" value="${origin.getId()}">

                                           <div class="form-group">
                                               <label class=" col-md-3 control-label" > Name English <span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <div class="input-icon">

                                                       <i class="fa fa-angle-double-right tooltips "
                                                          data-original-title="please write a Name"
                                                          data-container="body"></i>

                                                       <input type="text" data-required="1" class="form-control"
                                                              placeholder="Office Origin Name"
                                                              name="officeoriginnameeng" value="${origin.getOfficeNameEng()}">

                                                   </div>
                                               </div>

                                           </div>

                                           <div class="form-group">
                                               <label class=" col-md-3 control-label"> Name Bangla <span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <div class="input-icon">

                                                       <i class="fa fa-angle-double-right tooltips "
                                                          data-original-title="please write a Name"
                                                          data-container="body"></i>

                                                       <input type="text" data-required="1" class="form-control"
                                                              placeholder="Office Origin Name Bangla"
                                                              name="officeoriginnamebng" value="${origin.getOfficeNameBng()}">

                                                   </div>
                                               </div>

                                           </div>

                                           <div class="form-group">
                                               <label class=" col-md-3 control-label"> Office Origin Lavel  <span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <div class="input-icon">

                                                       <i class="fa fa-angle-double-right tooltips "
                                                          data-original-title="please write a Name"
                                                          data-container="body"></i>

                                                       <input type="text" data-required="1" class="form-control"
                                                              placeholder="Office Origin Lavel"
                                                              name="officeoriginlevel" value="${origin.getOfficeLevel()}">

                                                   </div>
                                               </div>

                                           </div>

                                           <div class="form-group">
                                               <label class=" col-md-3 control-label"> Office Origin Sequence<span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <div class="input-icon">

                                                       <i class="fa fa-angle-double-right tooltips "
                                                          data-original-title="please write Office Type"
                                                          data-container="body"></i>

                                                       <input type="text" data-required="1" class="form-control"
                                                              placeholder="Office Origin Sequence"
                                                              name="officeoriginsequence" value="${origin.getOfficeSequence()}">

                                                   </div>
                                               </div>

                                           </div>

                                           <div class="form-group">
                                               <label class=" col-md-3 control-label"> Ministry <span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <select class="form-control" name="ministrydata" id="ministrydropdown">
                                                       <option value="-1">...</option>

                                                       <c:forEach var="ministry" items="${ministry}">
                                                           <c:choose>
                                                               <c:when test="${origin.getOfficeMinistryId() == ministry.getId()}">
                                                                   <option value="${ministry.getId()}"  selected="selected">
                                                                           ${ministry.getNameBng()}
                                                                   </option>
                                                               </c:when>
                                                               <c:otherwise>

                                                                   <option value="${ministry.getId()}">
                                                                           ${ministry.getNameBng()}
                                                                   </option>
                                                               </c:otherwise>

                                                           </c:choose>
                                                       </c:forEach>

                                                   </select>
                                               </div>

                                           </div>

                                           <div class="form-group">
                                               <label class=" col-md-3 control-label"> Office Layer <span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <select class="form-control" name="layerdata" id="layerdropdown">
                                                       <c:forEach var="layer" items="${layer}">
                                                           <c:choose>
                                                               <c:when test="${origin.getOfficeLayerId() == layer.getId()}">
                                                                   <option value="${layer.getId()}"  selected="selected">
                                                                           ${layer.getLayerNameBng()}
                                                                   </option>
                                                               </c:when>
                                                               <c:otherwise>

                                                                   <option value="${layer.getId()}">
                                                                           ${layer.getLayerNameBng()}
                                                                   </option>
                                                               </c:otherwise>

                                                           </c:choose>
                                                       </c:forEach>
                                                   </select>
                                               </div>

                                           </div>

                                           <div class="form-group">
                                               <label class=" col-md-3 control-label"> Superior Office <span
                                                       class="required" aria-required="true"> * </span></label>

                                               <div class="col-md-6">
                                                   <select class="form-control" name="superiordata" id="superiordropdown">
                                                       <option value="0">#</option>
                                                       <c:forEach var="origins" items="${origins}">
                                                           <c:choose>
                                                               <c:when test="${origin.getParentOfficeId() == origins.getId()}">
                                                                   <option value="${origins.getId()}"  selected="selected">
                                                                           ${origins.getOfficeNameBng()}
                                                                   </option>
                                                               </c:when>
                                                               <c:otherwise>

                                                                   <option value="${origins.getId()}">
                                                                           ${origins.getOfficeNameBng()}
                                                                   </option>
                                                               </c:otherwise>

                                                           </c:choose>
                                                       </c:forEach>
                                                   </select>
                                               </div>

                                           </div>



                                       </div>
                                       <div class="form-actions">
                                           <div class="row">
                                               <div class="col-md-offset-3 col-md-9">
                                                   <button type="submit" class="btn green">Submit</button>
                                                   <button type="button"  onclick= "location.href='<%=request.getContextPath()%>/officeministrylistview'" class="btn btn-circle grey-salsa btn-outline">Cancel</button>
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
<!-- END FOOTER -->
<%@ include file="../../includes/includes.jsp" %>
<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<script src="${context}/assets/js/appregistration/validation.js" type="text/javascript"></script>

<script> $(document).ready(function() {

    $('#ministrydropdown').change(function() {
        var data = "";
        $.ajax({
            type:"GET",
            url : "<%=request.getContextPath()%>/layersbyministries",
            data : {
                id: $(this).val()
            },
            async: false,
            success : function(response) {
                data = response;
                var select = $('#layerdropdown');
                select.empty();
                select.append($('<option></option>').val(-1).html('...'));
                $.each(data, function(index, value) {
                    select.append(
                        $('<option></option>').val(value.id).html(value.layerNameBng)
                    );
                });
                return response;
            },
            error: function() {
                 toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ");
            }
        });


    });

    $('#layerdropdown').change(function() {
        var data = "";
        $.ajax({
            type:"GET",
            url : "<%=request.getContextPath()%>/originbyministry",
            data : {
                ministryid:$("#ministrydropdown").val()
            },
            async: false,
            success : function(response) {
                data = response;
                var select = $('#superiordropdown');
                select.empty();
                select.append($('<option></option>').val(-1).prop('disabled','disabled').html('...'));
                $.each(data, function(index, value) {
                    select.append(
                        $('<option></option>').val(value.id).html(value.officeNameBng)
                    );
                });
                return response;
            },
            error: function() {
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