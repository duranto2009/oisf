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

    <%@ include file="../../includes/head.jsp" %>
    <c:set var="context" value="${pageContext.request.contextPath}" />
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

            <div class="card">
                <div class="portlet-body form">


                    <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN PORTLET-->
                            <div class="portlet box bordered">
                                <div class="portlet-title ">
                                    <div class="caption">
                                        <span class="caption-subject">ইতিহাস</span>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div>

                                        <input id="historyid" type="hidden" value="${id}"/>
                                        <input id="divisionname" type="hidden" value="${name}"/>
                                        <div class="portlet light " style="margin: 50px;">
                                            <div class="portlet-body" id="intro">

                                            </div>
                                        </div>
                                        <div class="portlet light bordered" style="margin: 50px; background-color: #e8ecec">
                                            <div class="portlet-body" id="childdetail">
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
        <input type="hidden" id="menuid" value="${menuid}">
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
    function childDetail(data) {
        var list =[];//{ id:Array[genericDTO]}
        for(var i =0;i<data.length;i++){
            var obj = data[i];
            var temp = list['#_'+obj.divisionId];
            if(temp == undefined){
                var sublist = new Array();
                sublist.push(obj);
                list['#_'+obj.divisionId] = sublist;
            }
            else{
                temp.push(obj);
            }

        }
        var divisionChildDetail =
            ' বিভাগটিতে নতুন করে <br/>' +
            '<ul style=margin-left:5px;>';
        var len = list.length;
        var k=0;

        for(var key in list){
            var l = list[key];

            if(l[0].divisionStatus == 1 ) divisionChildDetail += '<li> <a href="${context}/divisionhistory?id='+l[0].divisionId+'&&name='+l[0].divisionName+'">'+l[0].divisionName+'</a> বিভাগের<ul>';
            else divisionChildDetail += '<li> '+l[0].divisionName+' বিভাগের<ul>';

            for(var i=0;i<l.length;i++) {
                divisionChildDetail +='<li><a href="${context}/districthistory?id='+l[i].districtId+'&&name='+l[i].districtName+'">'+l[i].districtName+'</a></li>';
            }
            if((len-2)!=k++)divisionChildDetail +='জেলা </ul></li>';
            else divisionChildDetail +='জেলা এবং </ul></li>';
        }
        divisionChildDetail +=" </ul> অন্তর্ভুক্ত করা হয়েছে।";
        return divisionChildDetail;
    }
    $(document).ready(function () {

        $.ajax({
            type:"GET",
            url : "${context}/historydivision",
            data : {
                id: $("#historyid").val()
            },
            async: false,
            success : function(response) {
                var intro = '<h3>'+$("#divisionname").val()+' একটি বিভাগ। </h3>';
                var detail;
                if(response.length !=0) {
                    detail = childDetail(response);
                }
                else detail = "এখন পর্যন্ত নতুন করে কোন জেলা নির্দিষ্ট করা হয় নাই।";

                $("#intro").append(intro);
                $("#childdetail").append(detail);
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
</script>


</body>

</html>