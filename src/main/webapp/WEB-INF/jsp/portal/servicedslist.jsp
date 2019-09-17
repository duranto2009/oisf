<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.ico"/>
    <title>OISF Portal</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/assets/css/portal/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <%--<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">--%>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">

    <!-- Plugin CSS <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"> -->



    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/assets/css/portal/creative.min.css" rel="stylesheet">
    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css" rel="stylesheet">--%>
    <link href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/common/datatablecustom.css" rel="stylesheet" type="text/css"/>
    <link href="/assets/css/portal/customportlet.css" rel="stylesheet">
    <%--<style>--%>


        <%--@import url(http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900);--%>
        <%--@import url(http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700);--%>

        <%--.roboto {--%>
            <%--font-family: "Roboto";--%>
        <%--}--%>
        <%--.roboto-c {--%>
            <%--font-family: "Roboto Condensed";--%>
        <%--}--%>


        <%--.fw-100 { font-weight: 100; }--%>
        <%--.fw-300 { font-weight: 300; }--%>
        <%--.fw-400 { font-weight: 400; }--%>
        <%--.fw-500 { font-weight: 500; }--%>
        <%--.fw-700 { font-weight: 700; }--%>
        <%--.fw-900 { font-weight: 900; }--%>


        <%--header div img {--%>
            <%--width: 100%;--%>
            <%--height: 100%;--%>
        <%--}--%>

        <%--.container {--%>
            <%--max-width: 1160px;--%>
        <%--}--%>
        <%--header {--%>
            <%--position: absolute;--%>
            <%--top: 8%;--%>
            <%--width: 100%;--%>
            <%--height: 150px;--%>
        <%--}--%>

        <%--#mainNav {--%>
            <%--height: 8%;--%>
            <%--position: fixed;--%>
            <%--background-color: #fff;--%>
            <%--max-height: 100px;--%>
        <%--}--%>

        <%--.carousel-item {--%>
            <%--height: 100%;--%>
            <%--background: no-repeat center center scroll;--%>
            <%---webkit-background-size: cover;--%>
            <%---moz-background-size: cover;--%>
            <%---o-background-size: cover;--%>
            <%--background-size: cover;--%>
        <%--}--%>

        <%--#person img {--%>
            <%--display: block;--%>
            <%--position: relative;--%>
            <%--margin: auto;--%>
            <%--top: 0;--%>
            <%--left: 0;--%>
            <%--right: 0;--%>
            <%--bottom: 0;--%>
        <%--}--%>

        <%--.imageoverlaped {--%>
            <%--margin: 0px;--%>
            <%--position: absolute;--%>
            <%--bottom: 0px;--%>
            <%--z-index: 1000;--%>
            <%--background-color: transparent;--%>
            <%--color: black;--%>
            <%--font-weight: bold;--%>
        <%--}--%>

        <%--.tag {--%>
            <%--width: 95%;--%>
            <%--height: 22%;--%>
            <%--margin-left: 5%;--%>
            <%--margin-right: 5%;--%>
            <%--float: left;--%>
            <%--position: absolute;--%>
            <%--left: 0px;--%>
            <%--bottom: 0px;--%>
            <%--z-index: 1000;--%>
            <%--background-color: transparent;--%>
            <%--padding: 5px;--%>
            <%--color: black;--%>
            <%--font-weight: bold;--%>
        <%--}--%>

        <%--.middlecontainer {--%>
            <%--display: flex;--%>
            <%--justify-content: center;--%>
            <%--background: transparent;--%>
            <%--margin-bottom: 20px;--%>
        <%--}--%>

        <%--.middle {--%>
            <%--background: transparent;--%>
            <%--align-self: center;--%>
            <%--padding: 0rem;--%>
        <%--}--%>

        <%--* {--%>
            <%--font-family: 'Roboto Condensed', sans-serif;--%>
        <%--}--%>

        <%--a {--%>
            <%--color: black !important;--%>
        <%--}--%>

        <%--section {--%>
            <%--padding: 2rem !important;--%>
        <%--}--%>

        <%--#contact {--%>
            <%--padding: 0px !important;--%>
            <%--padding-top: 5px !important;--%>
        <%--}--%>

        <%--#person {--%>
            <%--padding: 10px !important;--%>
        <%--}--%>

        <%--#standard {--%>
            <%--padding-bottom: 20px !important;--%>
            <%--padding-top: 50px !important;--%>
            <%--background-color: #F1F5F8;--%>
        <%--}--%>

        <%--#service {--%>
            <%--padding-top: 50px !important;--%>
        <%--}--%>

        <%--#about {--%>
            <%--background-color: #F1F5F8 !important;--%>
            <%--color: black !important;--%>
        <%--}--%>

        <%--.light {--%>
            <%--border-color: black !important;--%>
        <%--}--%>

        <%--#about > div > div > div.col-md-4.text-center > h2, #about > div > div > div.col-md-4.text-center > p {--%>
            <%--color: black !important;--%>
        <%--}--%>


        <%--#standrardcontent > div > div > div > div > h4 > a {--%>
            <%--color: #02BDD5 !important;--%>
        <%--}--%>

        <%--.btn-light {--%>
            <%--background-color: #02BDD5 !important;--%>
        <%--}--%>

        <%--/*h1,*/--%>
        <%--/*h2,*/--%>
        <%--/*h3,*/--%>
        <%--/*h4,*/--%>
        <%--/*h5,*/--%>
        <%--/*h6 {*/--%>
        <%--/*font-family: 'Roboto Condensed', sans-serif !important;*/--%>
        <%--/*border: none !important;*/--%>
        <%--/*font-weight: lighter !important;*/--%>
        <%--/*}*/--%>

        <%--.navelecolorbottom{--%>
            <%--/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#1e5799+0,207cca+37,7db9e8+39 */--%>
            <%--background: #692D91; /* Old browsers */--%>
            <%--background: -moz-linear-gradient(top, #692D91 20%, #B4B2D7 0%, #B4B2D7 29%); /* FF3.6-15 */--%>
            <%--background: -webkit-linear-gradient(top, #692D91 20%,#B4B2D7 0%,#B4B2D7 29%); /* Chrome10-25,Safari5.1-6 */--%>
            <%--background: linear-gradient(to bottom, #692D91 20%,#B4B2D7 0%,#B4B2D7 29%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */--%>
            <%--filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#692D91', endColorstr='#B4B2D7',GradientType=0 ); /* IE6-9 */--%>
        <%--}--%>
        <%--p {--%>
            <%--color: #404040;--%>
            <%--/*font-weight: 300!important;*/--%>
            <%--font-size: 15px;--%>
            <%--margin: 0px;--%>
        <%--}--%>

        <%--li {--%>
            <%--color: #404040;--%>
        <%--}--%>
        <%--li a{--%>
            <%--color: #404040 !important;--%>
        <%--}--%>
        <%--#service p {--%>
            <%--margin: 0 !important;--%>
            <%--padding: 0 !important;--%>

        <%--}--%>


        <%--#standrardcontent > .row {--%>
            <%--margin-top: 50px;--%>
        <%--}--%>

        <%--.servicecontent {--%>
            <%--margin-top: 50px;--%>
        <%--}--%>

        <%--b, strong {--%>
            <%--font-weight: lighter;--%>
        <%--}--%>

        <%--#mainNav .navbar-nav>li.nav-item>a.nav-link.active, #mainNav .navbar-nav>li.nav-item>a.nav-link:focus.active{--%>
            <%--color: #404040!important;--%>
        <%--}--%>
        <%--@media (min-width: 800px) {--%>
            <%--#aboutrow {--%>
                <%--display: flex;--%>
                <%--justify-content: space-between;--%>
                <%--height: 100%;--%>
            <%--}--%>

            <%--#abouttext {--%>
                <%--width: 45%;--%>

            <%--}--%>

            <%--#slider {--%>
                <%--width: 44.4%;--%>
            <%--}--%>
        <%--}--%>

        <%--@media (max-width: 800px) {--%>
            <%--h1,--%>
            <%--h2,--%>
            <%--h3,--%>
            <%--h4,--%>
            <%--h5,--%>
            <%--h6 {--%>
                <%--font-family: 'Roboto Condensed', sans-serif !important;--%>
                <%--color: #404040;--%>
                <%--border: none !important;--%>
                <%--font-weight: lighter !important;--%>
                <%--font-size: 20px;--%>
            <%--}--%>

            <%--#aboutrow {--%>
                <%--display: block;--%>
                <%--height: 100%;--%>
            <%--}--%>

            <%--#abouttext {--%>
                <%--display: block;--%>

            <%--}--%>

            <%--#slider {--%>
                <%--display: block;--%>
                <%--height: 200px;--%>
            <%--}--%>
        <%--}--%>

        <%--@media (max-width: 576px) {--%>
            <%--#standrardcontent > div > div {--%>
                <%--margin-bottom: 30px;--%>
            <%--}--%>
        <%--}--%>


        <%--@media (min-height: 500px){--%>
            <%--:root{--%>
                <%----scale:5;--%>
            <%--}--%>
        <%--}--%>
        <%--@media (min-height: 800px) {--%>
            <%--:root{--%>
                <%----scale:5;--%>
            <%--}--%>
        <%--}--%>
        <%--@media (min-height: 1000px) {--%>

        <%--}--%>

    <%--</style>--%>

    <style>
        .first{
            margin-top: 55px!important;
            margin-bottom: 2%

        }
        .second{
            margin-top: 55px!important;
        }
        .third{
            margin-top: 0px!important;
        }
        .fourth{
            margin-top: 25px!important;
            background-color: #F6F6F6;
        }
        /*p{*/
            /*margin-left: 15px!important;*/
        /*}*/
        pre{
            color: green!important;
            font-weight: 800!important;
            margin-left: -15px!important;

        }
        .urllink {
            color: green !important;
            font-weight: 600 !important;
        }

        .mar{
            padding-top: 8px!important;
        }

    </style>

</head>

<body id="page-top">

<c:if test="${urlnames.type==1}">
    <c:set var="urltitle" value="Shared"></c:set>
    <c:set var="bool" value="1"></c:set>
</c:if>
<c:if test="${urlnames.type==0}">
    <c:set var="urltitle" value="Core"></c:set>
    <c:set var="bool" value="0"></c:set>
</c:if>

<!-- Navigation -->
<%@ include file="../includes/portletheader.jsp" %>
<div id="container " class="first">
    <div class="container second" >
        <%--<pre style="font-size: 20px">Home > <a class="urllink" href="<%=request.getContextPath()%>/portal">Service Portal</a> > <a class="urllink" href="/portal/datastandard"> Data Standards </a> > <c:if test="${bool==0}"><a class="urllink" href="/portal/coreislist">  ${urltitle} Services</a></c:if><c:if test="${bool==1}"><a class="urllink" href="/portal/sharedislist"> ${urltitle} Services</a></c:if> > ${urlnames.nameEng} </pre>--%>
        <%--<pre style="font-size: 20px">Home > <a class="urllink" href="<%=request.getContextPath()%>/portal">Service Portal</a> > <a class="urllink" href="/portal/intstandard"> Integration Standards </a> > <c:if test="${bool==0}"><a class="urllink" href="/portal/coreislist">  ${urltitle} Services</a></c:if><c:if test="${bool==1}"><a class="urllink" href="/portal/sharedislist"> ${urltitle} Services</a></c:if> > ${urlnames.nameEng} </pre>--%>
        <pre style="font-size: 20px">Home > <a class="urllink" href="<%=request.getContextPath()%>/portal#standard">Standards</a> > <a class="urllink" href="/portal/datastandard"> Data Standards </a> > <c:if test="${bool==0}"><a class="urllink" href="/portal/coredslist">  ${urltitle} Services</a></c:if><c:if test="${bool==1}"><a class="urllink" href="/portal/shareddslist"> ${urltitle} Services</a></c:if> > ${urlnames.nameEng} </pre>

    </div>
    <div class="container third" >
        <p style="font-size: 26px; font-weight: 600;color: #693293">${title}</p>
    </div>
    <div class="container fourth">
        <div class="portlet-body mar" style="padding: 8px!important;" >
            <div class="table-scrollable table-responsive">
                <table id="datatable" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%" >
                    <thead>
                    <tr>
                        <th>Service Owner Name</th>

                    </tr>
                    </thead>

                    <tbody>
                    <%--jstl for loop--%>

                    <%--&lt;%&ndash;<c:set var="url" value="servicelist"+></c:set>&ndash;%&gt;--%>

                    <c:forEach var="data" items="${services}">
                        <tr ><td><a href="<%=request.getContextPath()%>/portal/servicedbstandard/${data.getServiceId()}">
                                ${data.getNameEng()}
                        </a></td>
                        </tr>
                    </c:forEach>

                    <%--for loop end--%>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id = "empty2">

    </div>
</div>

<%@ include file="../includes/portletfooter.jsp" %>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>



<script>

    var scrollLimitTracker = [];
    $(document).ready(function(){

        $('#datatable').DataTable({
            "sDom": '<"row" <"col-md-6 col-sm-12"l><"col-md-6 col-sm-12"f>><"table-scrollable"t><"row" <"col-md-5 col-sm-12"i><"col-md-7 col-sm-12"p>>'
        });


    });
</script>
</body>

</html>

