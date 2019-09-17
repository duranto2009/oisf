<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: reve--%>
  <%--Date: 1/29/2018--%>
  <%--Time: 10:22 AM--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>

<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%>

<%--<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>

<%--<head>--%>

    <%--<meta charset="utf-8">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">--%>
    <%--<meta name="description" content="">--%>
    <%--<meta name="author" content="">--%>

    <%--&lt;%&ndash;<title>Creative - Start Bootstrap Theme</title>&ndash;%&gt;--%>
    <%--<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.ico"/>--%>
    <%--<title>OISF Portal</title>--%>

    <%--&lt;%&ndash;<%@ include file="../includes/head.jsp" %>&ndash;%&gt;--%>

    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/portal/portal.css" type="text/css"/>--%>


    <%--<!-- Bootstrap core CSS -->--%>
    <%--<link href="<%=request.getContextPath()%>/assets/css/portal/bootstrap.min.css" rel="stylesheet">--%>

    <%--<!-- Custom fonts for this template -->--%>
    <%--&lt;%&ndash;<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">&ndash;%&gt;--%>
    <%--<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <%--<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">--%>

    <%--<!-- Plugin CSS <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"> -->--%>



    <%--<!-- Custom styles for this template -->--%>
    <%--<link href="<%=request.getContextPath()%>/assets/css/portal/creative.min.css" rel="stylesheet">--%>

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


<%--</head>--%>

<%--<body id="page-top">--%>

<%--<!-- Navigation -->--%>
<%--<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">--%>
    <%--<div class="container">--%>
        <%--&lt;%&ndash;<img src="<%=request.getContextPath()%>/assets/portal/img/logo/logosmall.png" width="8%" height="8%"/>&ndash;%&gt;--%>
        <%--<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"--%>
                <%--data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"--%>
                <%--aria-label="Toggle navigation">--%>
            <%--<span class="navbar-toggler-icon"></span>--%>
        <%--</button>--%>
        <%--<div class="col-md-6 collapse navbar-collapse" id="navbarResponsive">--%>
            <%--<ul class="navbar-nav">--%>
                <%--<li class="nav-item">--%>
                    <%--<a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal#about" style="color:purple;">--%>
                        <%--<div style="position: relative;">--%>
                            <%--About--%>
                            <%--<div class="navelecolorbottom" style="position: absolute;width: 100%;min-height: 0px;">--%>

                            <%--</div>--%>
                        <%--</div>--%>

                    <%--</a>--%>
                <%--</li>--%>
                <%--<li class="nav-item">--%>
                    <%--<a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal#standard" style="color:purple;">--%>

                        <%--<div style="position: relative;">--%>
                            <%--Standards--%>
                            <%--<div class="navelecolorbottom"  style="position: absolute;width: 100%;min-height: 0px;">--%>

                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li class="nav-item">--%>
                    <%--<a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal#service" style="color:purple;">--%>

                        <%--<div style="position: relative;">--%>
                            <%--Services--%>
                            <%--<div class="navelecolorbottom"  style="position: absolute;width: 100%;min-height: 0px;">--%>

                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li class="nav-item">--%>
                    <%--<a class="nav-link js-scroll-trigger" href="#contact" style="color:purple;">--%>

                        <%--<div style="position: relative;">--%>
                            <%--Contact--%>
                            <%--<div class="navelecolorbottom"  style="position: absolute;width: 100%;min-height: 0px;">--%>

                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
            <%--</ul>--%>
        <%--</div>--%>
        <%--<div class="col-md-6">--%>

        <%--</div>--%>


    <%--</div>--%>
<%--</nav>--%>


<%--<div style="margin-top: 6%;margin-bottom: 2%">--%>
    <%--<div class="customcontainer" ><p style="font-size: 26px; font-weight: 500;color: #693293">${title}</p>--%>
    <%--</div>--%>


    <%--<div class="customcontainer" style="margin-top: 10px;background-color: #F6F6F6;">--%>


            <%--<div style="display: flex;justify-content: flex-start;flex-wrap: wrap">--%>

                <%--<c:forEach var="data" items="${owners}">--%>


                    <%--<div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 a">--%>
                        <%--<div class="main-box-div " style="background-color: white">--%>

                            <%--<div class="col-xs-7-new left  ">--%>

                                <%--<a href="<%=request.getContextPath()%>/portal/servicelist/${data.id}">--%>

                                        <%--<img style="width: 90%;height: 100%;position: relative;top: 50%;left: 50%;    transform: translate(-50%,-50%);"--%>
                                             <%--src="<%=request.getContextPath()%>/${data.logoUrl}"--%>
                                             <%--onerror="this.src='<%=request.getContextPath()%>/assets/img/soon.png';">--%>

                                <%--</a>--%>


                            <%--</div>--%>
                            <%--<div class="col-xs-5-new  purpleHeader" style="background-color: #693293">--%>

                                <%--<c:if test="${data.serviceCount!=0}">--%>

                                    <%--<a href="<%=request.getContextPath()%>/portal/servicelist/${data.id}">--%>
                                        <%--<div class="title-div center-block">${data.nameEng}:${data.serviceCount}</div>--%>
                                    <%--</a>--%>
                                <%--</c:if>--%>

                            <%--</div>--%>


                        <%--</div>--%>
                    <%--</div>--%>
                <%--</c:forEach>--%>


            <%--</div>--%>


    <%--</div>--%>
<%--</div>--%>
<%--<section id="contact">--%>
    <%--<div style="background-color:#F1F5F8 !important">--%>
        <%--<div class=" footer page-footer-custom " style="margin-right:2%;margin-left:2%;">--%>

            <%--<div class="row" style="padding-top: 10px;">--%>
                <%--<div class="col-md-3">--%>
                    <%--<ul class="fa-ul text-left">--%>
                        <%--<h4 style=" border-bottom: 1px solid ;padding-bottom: 5px; color: purple!important;"><b>Home</b></h4>--%>


                        <%--<a href="#">--%>
                            <%--<li>Condition for Use</li>--%>
                        <%--</a>--%>
                        <%--<a href="#">--%>
                            <%--<li>In Cooperation With</li>--%>
                        <%--</a>--%>
                        <%--<a href="#">--%>
                            <%--<li>Contact</li>--%>
                        <%--</a>--%>
                        <%--<a href="#">--%>
                            <%--<li>Site Map</li>--%>
                        <%--</a>--%>
                    <%--</ul>--%>
                <%--</div>--%>

                <%--<div class="col-md-3">--%>
                    <%--<ul class="fa-ul text-left">--%>
                        <%--<h4 style=" border-bottom: 1px solid ;padding-bottom: 5px;color: purple!important;"><b>Important Links</b></h4>--%>
                        <%--<a href="http://www.bangabhaban.gov.bd/">--%>
                            <%--<li>President's Office</li>--%>
                        <%--</a>--%>
                        <%--<a href="http://www.pmo.gov.bd">--%>
                            <%--<li>Prime Minister's Office</li>--%>
                        <%--</a>--%>
                        <%--<a href="http://www.mopa.gov.bd">--%>
                            <%--<li>Ministry of Public Administration</li>--%>
                        <%--</a>--%>
                        <%--<a href="http://www.infokosh.gov.bd/">--%>
                            <%--<li>E-Information Cell</li>--%>
                        <%--</a>--%>
                        <%--<a href="http://a2i.pmo.gov.bd/">--%>
                            <%--<li>a2i Programme</li>--%>
                        <%--</a>--%>
                    <%--</ul>--%>
                <%--</div>--%>

                <%--<div class="col-md-3">--%>
                    <%--<ul class="fa-ul text-left" style="margin-left:0px;">--%>
                        <%--<h4 style=" border-bottom: 1px solid ;padding-bottom: 5px;color: purple!important;"><b>Social</b></h4>--%>
                        <%--<a href="https://www.fb.com"><span class="fa-stack fa-sm">--%>
							<%--<i class="fa fa-circle fa-stack-2x" style=""></i>--%>
							<%--<i class="fa fa-facebook fa-stack-1x fa-inverse" style="background-color:  royalblue;border-radius: 20px;"></i>--%>
						<%--</span></a>--%>
                        <%--<a href="https://plus.google.com"><span class="fa-stack fa-sm">--%>
							<%--<i class="fa fa-circle fa-stack-2x"></i>--%>
							<%--<i class="fa fa-google-plus fa-stack-1x fa-inverse" style="background-color:  #DB5246;border-radius:  20px;"></i>--%>
						<%--</span></a>--%>
                        <%--<a href="https://twitter.com"><span class="fa-stack fa-sm">--%>
							<%--<i class="fa fa-circle fa-stack-2x"></i>--%>
							<%--<i class="fa fa-twitter fa-stack-1x fa-inverse" style="background-color:  #28AAE1;border-radius: 20px;"></i>--%>
						<%--</span></a>--%>
                        <%--<a href="https://www.youtube.com"><span class="fa-stack fa-sm">--%>
							<%--<i class="fa fa-circle fa-stack-2x"></i>--%>
							<%--<i class="fa fa-youtube fa-stack-1x fa-inverse" style="background-color: #ad1926;color: white;border-radius:  20px;"></i>--%>
						<%--</span></a>--%>


                    <%--</ul>--%>
                <%--</div>--%>
                <%--<div class="col-md-3">--%>
                    <%--<h4 style=" border-bottom: 1px solid;padding-bottom: 5px;color: purple!important;"><b>Planning and Implementation</b></h4>--%>
                    <%--<div class="logo_a2i" style="margin-top:5%; margin-left:180px">--%>
                        <%--<a href="http://a2i.pmo.gov.bd/">--%>
                            <%--<img src="/assets/portal/img/logo/a2i.png" width="41" height="45" style="margin-right:  10px;">--%>
                            <%--<img src="/assets/portal/img/logo/bd_gov.png" width="41" height="45">--%>
                        <%--</a>--%>

                    <%--</div>--%>

                    <%--<div class="copy-right-title" style="margin-top:5%;">--%>
                        <%--<p style="font-size: 11px">--%>
                            <%--Copyrights © 2017 All Rights Reserved<br>--%>
                            <%--Government of the People's Republic of Bangladesh</p>--%>
                    <%--</div>--%>

                <%--</div>--%>
                <%--<!-- end of row -->--%>
            <%--</div>--%>

            <%--<!-- end of container -->--%>
        <%--</div>--%>
    <%--</div>--%>

    <%--<div style="height:20px;background-color:#9698C8">--%>

    <%--</div>--%>

<%--</section>--%>

<%--<!-- Bootstrap core JavaScript -->--%>
<%--<script src="<%=request.getContextPath()%>/assets/js/portal/jquery.min.js"></script>--%>




<%--<script>--%>

    <%--var scrollLimitTracker = [];--%>
    <%--$(document).ready(function(){--%>



    <%--});--%>
<%--</script>--%>
<%--</body>--%>


<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en"><head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/assets/img/favicon.ico">

    <title>OISF Portal</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/portal/portal.css" type="text/css"/>
    <!-- Bootstrap core CSS -->
    <link href="/assets/css/portal/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <!-- Plugin CSS <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"> -->


    <!-- Custom styles for this template -->
    <link href="/assets/css/portal/creative.min.css" rel="stylesheet">
    <link href="/assets/css/portal/customportlet.css" rel="stylesheet">

    <style>
        .first{
            margin-top: 55px!important;
            margin-bottom: 2%

        }
        .second{
            margin-top: 45px!important;
            /*margin-left: -10px;*/
        }
        .third{
            margin-top: -10px!important;
        }
        .fourth{
            margin-top: 15px!important;
            background-color: #F6F6F6;
        }
        p{
            margin-left: 15px!important;
        }
        pre{
            color: green!important;
            font-weight: 800!important;

        }
        .urllink{
            color: green!important;
            font-weight: 600!important;
        }
    </style>


</head>

<body id="page-top" style="position: relative; top: 0px;">

<!-- Navigation -->
<%@ include file="../includes/portletheader.jsp" %>

<div id="container" class="first">
    <div class="container second" >
        <pre style="font-size: 20px"> Home > <a class="urllink" href="<%=request.getContextPath()%>/portal#service">Services</a> > Shared Services</pre>

    </div>
    <div class="container third " >

    <p style="font-size: 26px; font-weight: 500;color: #693293;margin-left: 10px">${title}</p>
    </div>


    <div class="container fourth" >


        <div style="display: flex;justify-content: flex-start;flex-wrap: wrap">

            <c:forEach var="data" items="${owners}">


                <div class="col-xs-4 col-sm-4 col-md-2 col-lg-2 a">
                    <div class="main-box-div " style="background-color: white">

                        <div class="col-xs-7-new left  ">

                            <a href="<%=request.getContextPath()%>/portal/servicelist/${data.id}">

                                <img style="width: 90%;height: 100%;position: relative;top: 50%;left: 50%;    transform: translate(-50%,-50%);"
                                     src="<%=request.getContextPath()%>/${data.logoUrl}"
                                     onerror="this.src='<%=request.getContextPath()%>/assets/img/soon.png';">

                            </a>


                        </div>
                        <div class="col-xs-5-new  purpleHeader" style="background-color: #693293">

                            <c:if test="${data.serviceCount!=0}">
                                <c:set var="string1" value="${data.nameEng}"/>
                                <c:set var="string2" value="${fn:replace(string1,' ', '')}" />

                                <a href="<%=request.getContextPath()%>/assets/portaldoc/${string2}.docx">
                                    <div    style="margin-left: 8px" class="title-div center-block"><i class="fa fa-download"></i></div>

                                </a> &nbsp;


                                <a href="<%=request.getContextPath()%>/portal/servicelist/${data.id}">
                                    <div class="title-div center-block">${data.nameEng}:${data.serviceCount}</div>
                                </a>
                            </c:if>

                        </div>


                    </div>
                </div>
            </c:forEach>


        </div>


    </div>
</div>

<%@ include file="../includes/portletfooter.jsp" %>

</body></html>