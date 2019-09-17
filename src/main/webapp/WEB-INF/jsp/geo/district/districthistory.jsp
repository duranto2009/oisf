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
                                       <span class="caption-subject">History</span>
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

                                       <div class="portlet light bordered "
                                            style="margin: 50px; background-color: #e8ecec;">
                                           <div class="portlet-body" id="parentdetail">
                                               <%--${parentdetail}--%>
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
        var presentCondition ='বর্তমান অবস্থা : <br/><br/> জেলাটি <a href="${context}/divisionhistory?id='+data.divisionId+'&&name='+data.divisionName+'">'+data.divisionName+'</a>';
        presentCondition += ' বিভাগের অন্তর্ভুক্ত।';
        return presentCondition;
    }

    function childDetail(data) {
        var upalist =[];
        var thalist =[];
        var upacount =0;
        var thacount =0
        for(var i=0;i<data.length;i++){
            var obj = data[i];
           if(obj.typeName == "3"){
               var temp = upalist['#_'+obj.districtId];
               if(temp == undefined){
                   var sublist = new Array();
                   sublist.push(obj);
                   upacount++;
                   upalist['#_'+obj.districtId] = sublist;
               }
               else{
                   temp.push(obj);
               }
           }
           else{
               var temp = thalist['#_'+obj.districtId];
               if(temp == undefined){
                   var sublist = new Array();
                   sublist.push(obj);
                   thacount++;
                   thalist['#_'+obj.districtId] = sublist;
               }
               else{
                   temp.push(obj);
               }
           }
        }

        var fromWhomDistrictBuildUp ='জেলাটিতে নতুন করে  <br/><ul style=margin-left:5px;>';
        var len = upacount;
        var k=0;
        for (var key in upalist)
        {
            var l = upalist[key];
            fromWhomDistrictBuildUp += '<li> <a href="${context}/divisionhistory?id='+l[0].divisionId+'&&name='+l[0].divisionName+'">'+l[0].divisionName+'</a> বিভাগের '+' <a href="${context}/districthistory?id='+l[0].districtId+'&&name='+l[0].districtName+'">'+l[0].districtName+'</a> জেলার <ul>';
            for(var i=0;i<l.length;i++) {
            fromWhomDistrictBuildUp +='<li><a href="${context}/upazillahistory?id='+l[i].upazilaId+'&&name='+l[i].upazilaName+'">'+l[i].upazilaName+'</a></li>';
        }
            if((len-2)!=k++)fromWhomDistrictBuildUp +='উপজেলা </ul></li>';
            else fromWhomDistrictBuildUp +='উপজেলা এবং </ul></li>';

        }
        len = thacount;
        k=0;
        for (var key in thalist)
        {
            var l = thalist[key];
            fromWhomDistrictBuildUp += '<li> <a href="${context}/divisionhistory?id='+l[0].divisionId+'&&name='+l[0].divisionName+'">'+l[0].divisionName+'</a> বিভাগের '+' <a href="${context}/districthistory?id='+l[0].districtId+'&&name='+l[0].districtName+'">'+l[0].districtName+'</a> জেলার <ul>';
            for(var i=0;i<l.length;i++) {
                fromWhomDistrictBuildUp +='<li><a href="${context}/thanahistory?id='+l[i].thanaId+'&&name='+l[i].thanaName+'">'+l[i].thanaName+'</a></li>';
            }
            if((len-2)!=k++)fromWhomDistrictBuildUp +='থানা </ul></li>';
            else fromWhomDistrictBuildUp +='থানা এবং </ul></li>';

        }
        fromWhomDistrictBuildUp +=' </ul> অন্তর্ভুক্ত করা হয়েছে।';
        return fromWhomDistrictBuildUp;

    }


    function makeSentence(previous, current) {
        var binarySentence = [];
        var exactSentence = current.fromDate+' থেকে '+current.toDate+' পর্যন্ত ';
        if(previous.divisionName == current.districtName)binarySentence.push(1);
        else binarySentence.push(0);

        if(previous.districtName == current.districtName)binarySentence.push(1);
        else binarySentence.push(0);


        if(binarySentence[0]==0)exactSentence += '<a href="${context}/divisionhistory?id='+current.divisionId+'&&name='+current.divisionName+'">'+current.divisionName+'</a> বিভাগের অধীনে ';
        if(binarySentence[1]==0)exactSentence += current.districtName+" নামে ";
        exactSentence += "ছিল। ";

        return exactSentence;
    }

    function parentDetail(currentchain,data){
        var parentDetail ='পূর্বে জেলাটি ';
        var currentinfo = currentchain;
        var previousinfo = undefined;
        var len = data.length;
        for(var i=0;i<len;i++){
            previousinfo = data[i];
            if(i==len-1)parentDetail += makeSentence(currentinfo,previousinfo);
            else  parentDetail += makeSentence(currentinfo,previousinfo)+'<br/> এটার আগে  ';
            currentinfo = previousinfo;
        }
        return parentDetail;
    }

    $(document).ready(function () {

        $.ajax({
            type:"GET",
            url : "${context}/historydistrict",
            data : {
                id: $("#historyid").val()
            },
            async: false,
            success : function(response) {
                    var intro = '<h3>'+$("#districtname").val()+' একটি জেলা। </h3>';

                    var currentdetail = response.cc;
                    var childdetail = response.cd;
                    var parentdetail = response.pd;

                    var cc = currentChain(currentdetail);
                    var cd;
                    if(childdetail.length!=0)cd=childDetail(childdetail);
                    else cd = "এখন পর্যন্ত নতুন করে কোন উপাজেলা অথবা থানা নির্দিষ্ট করা হয় নাই।";
                    var pd;
                    if(parentdetail.length!=0)pd= parentDetail(currentdetail,parentdetail);
                    else pd =  "পূর্বে জেলাটি অন্য কোন বিভাগের অধীনে ছিল না।";
                    $("#intro").append(intro);
                    $("#currentchain").append(cc);
                    $("#childdetail").append(cd);
                    $("#parentdetail").append(pd);



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