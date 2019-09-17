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
    <link rel="stylesheet" type="text/css" href="${context}/assets/styles/inbox-details.css"/>
    <%--<link rel="stylesheet" type="text/css" href="${context}/assets/styles/styles.css"/>--%>
    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css"/>
    <c:set var="context" value="${pageContext.request.contextPath}" />

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
                                       <input id="districtname" type="hidden" value="${name}"/>
                                       <div class="portlet light " style="margin: 50px;">
                                           <div class="portlet-body" id="intro">
                                               <%--${label}--%>
                                           </div>
                                       </div>
                                       <div class="portlet light bordered" style="margin: 50px; background-color: #e8ecec">
                                           <div class="portlet-body" id="currentchain">
                                               <%--${currentchain}--%>
                                           </div>
                                       </div>
                                       <div class="row" style="margin: 50px;">
                                           <div class="col-md-12">


                                               <div class="col-md-5 portlet light bordered "
                                                    style="background-color: #e8ecec;">

                                                   <div class="portlet-body" id="childdetail">
                                                       <%--${childdetail}--%>
                                                   </div>
                                               </div>
                                               <div class="col-md-offset-2 col-md-5 portlet light"
                                                    style="background-color: white;">

                                                   <div class="portlet-body">

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

    function currentChain(data) {
        var presentCondition ='বর্তমান অবস্থা : <br/><br/> সিটি কর্পোরেশনটি <a href="${context}/districthistory?id='+data.districtId+'&&name='+data.districtName+'">'+data.districtName+'</a>'+
            ' জেলার অধীনে আছে এবং <a href="${context}/divisionhistory?id='+data.divisionId+'&&name='+data.divisionName+'">'+data.divisionName+'</a>'+
            ' বিভাগের অন্তর্ভুক্ত।';
        return presentCondition;
    }

    function childDetail(data) {
        var fromWhomCityBuildUp = 'সিটি কর্পোরেশনটিতে নতুন করে <br/><ul style=margin-left:5px;>';
        var muni = false;
        for(var i =0;i<data.length;i++){
            if(data[i].sourceType == 6){
                if(data[i].unionName!='null')fromWhomCityBuildUp +='<li><a href="${context}/unionhistory?id='+data[i].unionId+'&&name='+data[i].unionName+'">'+data[i].unionName+'</a></li>';
            }
            else{
              muni =true;
            }
        }
        if(muni) fromWhomCityBuildUp +='</ul>ইউনিয়ন এবং <br/><ul style=margin-left:5px;>';
        else fromWhomCityBuildUp +='</ul>ইউনিয়ন>';

        for(var i =0;i<data.length;i++){
            if(data[i].sourceType == 7){
                if(data[i].municipalityName!='null')fromWhomCityBuildUp +='<li><a href="${context}/municipalityhistory?id='+data[i].municipalityId+'&&name='+data[i].municipalityName+'">'+data[i].municipalityName+'</a></li>';
            }

        }
        if(muni)fromWhomCityBuildUp +="</ul>পৌরসভা ";
        fromWhomCityBuildUp +=' অন্তর্ভুক্ত করা হয়েছে।';

        return fromWhomCityBuildUp;

    }


    $(document).ready(function () {

        $.ajax({
            type:"GET",
            url : "${context}/historycitycorporation",
            data : {
                id: $("#historyid").val()
            },
            async: false,
            success : function(response) {
                var intro = '<h3>'+$("#districtname").val()+' একটি  সিটি কর্পোরেশন। </h3>';

                var currentdetail = response.cc;
                var childdetail = response.cd;

                var cc = currentChain(currentdetail);
                var cd;
                if(childdetail.length!=0)cd=childDetail(childdetail);
                else cd = "কোন ইউনিয়ন অথবা পৌরসভা পরবর্তীতে অন্তর্ভুক্ত করা হয়নি";
                $("#intro").append(intro);
                $("#currentchain").append(cc);
                $("#childdetail").append(cd);



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