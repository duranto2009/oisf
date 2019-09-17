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

    <%--<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.ico"/>--%>
    <%--<title>OISF Portal</title>--%>

    <%--<!-- Bootstrap core CSS -->--%>
    <%--<link href="<%=request.getContextPath()%>/assets/css/portal/bootstrap.min.css" rel="stylesheet">--%>

    <%--<!-- Custom fonts for this template -->--%>
    <%--&lt;%&ndash;<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">&ndash;%&gt;--%>
    <%--<link rel="stylesheet" type="text/css"--%>
          <%--href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <%--<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">--%>

    <%--<!-- Plugin CSS <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"> -->--%>


    <%--<!-- Custom styles for this template -->--%>
    <%--<link href="<%=request.getContextPath()%>/assets/css/portal/creative.min.css" rel="stylesheet">--%>

    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"--%>
          <%--integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">--%>


    <%--&lt;%&ndash;<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">&ndash;%&gt;--%>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>--%>
    <%--&lt;%&ndash;<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>&ndash;%&gt;--%>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"--%>
            <%--integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"--%>
            <%--crossorigin="anonymous"></script>--%>


    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/portal/portaldesign.css">--%>

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
                    <%--<a class="nav-link js-scroll-trigger" href="#service" style="color:purple;">--%>

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
    <%--&lt;%&ndash;<div class="container" style="margin-top: 35px;"><p style="font-size: 26px; font-weight: 600;color: #693293">Service&ndash;%&gt;--%>
    <%--&lt;%&ndash;Metadata Defination</p>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
    <%--<div class="container" style="background-color: #F6F6F6;">--%>


        <%--<h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#def" style="font-size: 25px">--%>
            <%--What are Integration Standards?</a></h2>--%>


        <%--<p></p>--%>
        <%--<div id="keypoints">--%>
            <%--<h2>Key Points</h2>--%>
            <%--<ul>--%>
                <%--<li>integration Standards are rules establishing how request and responses are described and given.--%>
                <%--</li>--%>
                <%--<li>Using standards makes integration service can be shared by more than just the project or person that--%>
                    <%--created the data.--%>
                <%--</li>--%>
                <%--<li>Standards are useful for integrating data from multiple resources. If the various--%>
                    <%--sources agreed upon a standard to begin with, this saves time reconciling any--%>
                    <%--differences.--%>
                <%--</li>--%>


            <%--</ul>--%>
        <%--</div>--%>
        <%--<p></p>--%>
        <%--<div id="def" class="collapse">--%>
            <%--<p>Integration is the act of bringing together components of various system that functions as one.--%>
                <%--In an IT context, integration refers to the end result of a process that aims to stitch together--%>
                <%--different,--%>
                <%--often disparate, subsystems so that the data contained in each becomes part of a larger,--%>
                <%--more comprehensive system that, ideally, quickly and easily shares data when needed</p>--%>
        <%--</div>--%>

        <%--<h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#whynot" style="font-size: 25px">--%>
            <%--Why do we need Integration Standards?</a></h2>--%>
        <%--<div id="whynot" class="collapse">--%>
            <%--<p>Using standards makes using things easier.Traditional system development approach for e-governance--%>
                <%--solution will--%>
                <%--create chaotic situation when different vendor usage different method to intgrate with one another and--%>
                <%--it--%>
                <%--becomes difficult to maintain interoperability among the system. Hence it is necessary to define a--%>
                <%--standard for--%>
                <%--integration that facilitate software development, maintenance and reuse.</p>--%>
        <%--</div>--%>

        <%--<h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#notgood" style="font-size: 25px">--%>
            <%--Why Point to Point Integration Isn't Good Enough</a></h2>--%>
        <%--<div id="notgood" class="collapse">--%>
        <%--<p>When used with small infrastructures, where only two or three systems must be integrated, this model can work--%>
            <%--quite well,--%>
            <%--providing a lightweight integration solution tailor-made to the needs of the infrastructure. However, as--%>
            <%--additional components are--%>
            <%--added to an infrastructure, the number of point-to-point connections required to create a comprehensive--%>
            <%--integration architecture begins to increase exponentially.</p>--%>

        <%--<p> A three-component infrastructure requires only three point-to-point connections to be considered fully--%>
            <%--integrated.--%>
            <%--By comparison, the addition of just two more components increases this number to 10 connectors.--%>
            <%--This is already approaching an unmanageable level of complexity, and once an infrastructure includes 8 or 9--%>
            <%--component systems, and the number of connections jumps into the 30s, point-to-point integration is no longer--%>
            <%--a viable option.</p>--%>

        <%--<p> Remember that each of these connectors must be separately developed and maintained across system version--%>
            <%--changes,--%>
            <%--scalability changes, and more (or, in some cases, even purchased at high cost from a vendor), and the--%>
            <%--unsuitability of point-to-point--%>
            <%--integration for complex enterprise scenarios becomes painfully clear.</p>--%>
        <%--</div>--%>

        <%--<h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#benefit" style="font-size: 25px">--%>
            <%--Benefits of Integration</a></h2>--%>
        <%--<div id="benefit" class="collapse">--%>
        <%--<ul>--%>
            <%--<li>Less time spent on development</li>--%>
            <%--<li>Easy to extend standard integration content</li>--%>
            <%--<li>Standard integrations can be used as templates</li>--%>
            <%--<li>Content became available on the fly</li>--%>

        <%--</ul></div>--%>

        <%--<h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#eservice" style="font-size: 25px">--%>
             <%--E-Governance Point of View</a></h2>--%>
        <%--<p></p>--%>
        <%--<div id="eservice" class="collapse">--%>
        <%--<p>Various e-governance project Needed some common features that they often time developed again and again for--%>
            <%--each system .--%>
            <%--If these system could be integrated with one another to share there data and services to other system then a--%>
            <%--viable time of development--%>
            <%--may be saved. But this could not be done randomly. there sould be some rules and defination for integration.--%>
            <%--Otherwise the--%>
            <%--whole scenario might get cheotic.That is why integration standard is needed </p></div>--%>


        <%--<section id="service" style="padding: 2px !important;">--%>
            <%--<div class="container">--%>
                <%--<div class="row">--%>
                    <%--<div class="col-lg-12 text-center">--%>
                        <%--<h2 class="section-heading">Integration Standard for Services</h2>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="row">--%>
                    <%--<div class="col-lg-12 ">--%>
                        <%--<p>OISF will provide Integration Standard for Both Core And Shared Services.One can see what--%>
                            <%--core and Shared Service Mean in below definations--%>

                        <%--</p>--%>

                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="row servicecontent">--%>
                    <%--<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 middlecontainer">--%>

                        <%--<div class="middle">--%>
                            <%--<img src="<%=request.getContextPath()%>/assets/portal/img/service/Core-Services.png">--%>
                        <%--</div>--%>
                        <%--<div class="col-md-9">--%>
                            <%--<h4><a href="<%=request.getContextPath()%>/portal/coredslist">Core Service</a></h4>--%>
                            <%--<p>Core service is defined</p>--%>
                            <%--<p>as the service that OISF</p>--%>
                            <%--<p>owns and can provide those</p>--%>
                            <%--<p>to other solution on the fly</p>--%>


                        <%--</div>--%>

                    <%--</div>--%>
                    <%--<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 middlecontainer">--%>

                        <%--<div class="middle">--%>
                            <%--<img src="<%=request.getContextPath()%>/assets/portal/img/service/Share-Service.png">--%>
                        <%--</div>--%>
                        <%--<div class="col-md-9">--%>
                            <%--<h4><a href="<%=request.getContextPath()%>/portal/shareddslist">Shared Service</a></h4>--%>
                            <%--<p>Shared service is defined</p>--%>
                            <%--<p>as the service OISF does not own</p>--%>
                            <%--<p>and that is provided by </p>--%>
                            <%--<p>other e-governance solutions.</p>--%>


                        <%--</div>--%>

                    <%--</div>--%>


                <%--</div>--%>
        <%--</section>--%>


    <%--</div>--%>
<%--</div>--%>
<%--<section id="contact">--%>
    <%--<div style="background-color:#F1F5F8 !important">--%>
        <%--<div class=" footer page-footer-custom " style="margin-right:2%;margin-left:2%;">--%>

            <%--<div class="row" style="padding-top: 10px;">--%>
                <%--<div class="col-md-3">--%>
                    <%--<ul class="fa-ul text-left">--%>
                        <%--<h4 style=" border-bottom: 1px solid ;padding-bottom: 5px; color: purple!important;"><b>Home</b>--%>
                        <%--</h4>--%>


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
                        <%--<h4 style=" border-bottom: 1px solid ;padding-bottom: 5px;color: purple!important;"><b>Important--%>
                            <%--Links</b></h4>--%>
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
                        <%--<h4 style=" border-bottom: 1px solid ;padding-bottom: 5px;color: purple!important;">--%>
                            <%--<b>Social</b></h4>--%>
                        <%--<a href="https://www.fb.com"><span class="fa-stack fa-sm">--%>
							<%--<i class="fa fa-circle fa-stack-2x" style=""></i>--%>
							<%--<i class="fa fa-facebook fa-stack-1x fa-inverse"--%>
                               <%--style="background-color:  royalblue;border-radius: 20px;"></i>--%>
						<%--</span></a>--%>
                        <%--<a href="https://plus.google.com"><span class="fa-stack fa-sm">--%>
							<%--<i class="fa fa-circle fa-stack-2x"></i>--%>
							<%--<i class="fa fa-google-plus fa-stack-1x fa-inverse"--%>
                               <%--style="background-color:  #DB5246;border-radius:  20px;"></i>--%>
						<%--</span></a>--%>
                        <%--<a href="https://twitter.com"><span class="fa-stack fa-sm">--%>
							<%--<i class="fa fa-circle fa-stack-2x"></i>--%>
							<%--<i class="fa fa-twitter fa-stack-1x fa-inverse"--%>
                               <%--style="background-color:  #28AAE1;border-radius: 20px;"></i>--%>
						<%--</span></a>--%>
                        <%--<a href="https://www.youtube.com"><span class="fa-stack fa-sm">--%>
							<%--<i class="fa fa-circle fa-stack-2x"></i>--%>
							<%--<i class="fa fa-youtube fa-stack-1x fa-inverse"--%>
                               <%--style="background-color: #ad1926;color: white;border-radius:  20px;"></i>--%>
						<%--</span></a>--%>


                    <%--</ul>--%>
                <%--</div>--%>
                <%--<div class="col-md-3">--%>
                    <%--<h4 style=" border-bottom: 1px solid;padding-bottom: 5px;color: purple!important;"><b>Planning and--%>
                        <%--Implementation</b></h4>--%>
                    <%--<div class="logo_a2i" style="margin-top:5%; margin-left:180px">--%>
                        <%--<a href="http://a2i.pmo.gov.bd/">--%>
                            <%--<img src="/assets/portal/img/logo/a2i.png" width="41" height="45"--%>
                                 <%--style="margin-right:  10px;">--%>
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

    <%--$(document).ready(function () {--%>


    <%--});--%>
<%--</script>--%>
<%--</body>--%>

<%--</html>--%>




<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        #container h1 a,
        #container h2 a{
            color: #683392!important;
            font-size: 21px!important;
            font-weight: 700!important;
            font-family: "Roboto Condensed"!important;
        }

        #container p,#container li {
            color: #404040 !important;
            font-size: 14px !important;
            font-weight: 300 !important;
            font-family: "Roboto" !important;
        }
        #keypoints p,#keypoints li{
            color: #404040!important;
            font-size: 14px!important;
            font-weight: 300!important;
            font-family: "Roboto"!important;
        }



    </style>
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
            font-weight: 700;

        }
        .urllink{
            color: green!important;
            font-weight: 600!important;
        }
    </style>

</head>

<body id="page-top" style="position: relative; top: 0px;">

<%@ include file="../includes/portletheader.jsp" %>

<div id="container" class="first">
    <div class="container second"  >
        <pre style="font-size: 20px"> Home > <a class="urllink" href="<%=request.getContextPath()%>/portal#standard">Standards</a> > Integration Standards</pre>
    </div>
    <div class="container fourth" style="background-color: #F6F6F6;">


        <h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#def" style="font-size: 25px">
            What are Integration Standards?</a></h2>


        <p></p>
        <div id="keypoints">
            <h2>Key Points</h2>
            <ul>
                <li>integration Standards are rules establishing how request and responses are described and given.
                </li>
                <li>Using standards makes integration service can be shared by more than just the project or person that
                    created the data.
                </li>
                <li>Standards are useful for integrating data from multiple resources. If the various
                    sources agreed upon a standard to begin with, this saves time reconciling any
                    differences.
                </li>


            </ul>
        </div>
        <p></p>
        <div id="def" class="collapse">
            <p>Integration is the act of bringing together components of various system that functions as one.
                In an IT context, integration refers to the end result of a process that aims to stitch together
                different,
                often disparate, subsystems so that the data contained in each becomes part of a larger,
                more comprehensive system that, ideally, quickly and easily shares data when needed</p>
        </div>

        <h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#whynot" style="font-size: 25px">
            Why do we need Integration Standards?</a></h2>
        <div id="whynot" class="collapse">
            <p>Using standards makes using things easier.Traditional system development approach for e-governance
                solution will
                create chaotic situation when different vendor usage different method to intgrate with one another and
                it
                becomes difficult to maintain interoperability among the system. Hence it is necessary to define a
                standard for
                integration that facilitate software development, maintenance and reuse.</p>
        </div>

        <h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#notgood" style="font-size: 25px">
            Why Point to Point Integration Isn't Good Enough</a></h2>
        <div id="notgood" class="collapse">
            <p>When used with small infrastructures, where only two or three systems must be integrated, this model can work
                quite well,
                providing a lightweight integration solution tailor-made to the needs of the infrastructure. However, as
                additional components are
                added to an infrastructure, the number of point-to-point connections required to create a comprehensive
                integration architecture begins to increase exponentially.</p>

            <p> A three-component infrastructure requires only three point-to-point connections to be considered fully
                integrated.
                By comparison, the addition of just two more components increases this number to 10 connectors.
                This is already approaching an unmanageable level of complexity, and once an infrastructure includes 8 or 9
                component systems, and the number of connections jumps into the 30s, point-to-point integration is no longer
                a viable option.</p>

            <p> Remember that each of these connectors must be separately developed and maintained across system version
                changes,
                scalability changes, and more (or, in some cases, even purchased at high cost from a vendor), and the
                unsuitability of point-to-point
                integration for complex enterprise scenarios becomes painfully clear.</p>
        </div>

        <h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#benefit" style="font-size: 25px">
            Benefits of Integration</a></h2>
        <div id="benefit" class="collapse">
            <ul>
                <li>Less time spent on development</li>
                <li>Easy to extend standard integration content</li>
                <li>Standard integrations can be used as templates</li>
                <li>Content became available on the fly</li>

            </ul></div>

        <h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#eservice" style="font-size: 25px">
            E-Governance Point of View</a></h2>
        <p></p>
        <div id="eservice" class="collapse">
            <p>Various e-governance project Needed some common features that they often time developed again and again for
                each system .
                If these system could be integrated with one another to share there data and services to other system then a
                viable time of development
                may be saved. But this could not be done randomly. there sould be some rules and defination for integration.
                Otherwise the
                whole scenario might get cheotic.That is why integration standard is needed </p></div>


        <section id="service" style="padding: 2px !important;">
            <div class="container">
                <div class="row">
                    <h2><a class="btn btn-link "  style="font-size: 25px">
                        Integration Standard for Services</a></h2>
                    <%--<div class="col-lg-12 text-center">--%>
                        <%--<h2 class="section-heading">Integration Standard for Services</h2>--%>
                    <%--</div>--%>
                </div>
                <div class="row">
                    <div class="col-lg-12 ">
                        <p>OISF will provide Integration Standard for Both Core And Shared Services.One can see what
                            core and Shared Service Mean in below definations<br/><br/>

                        </p>

                    </div>
                </div>
                <div class="row servicecontent">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">

                        <%--<div class="middle">--%>
                            <%--<img src="/assets/portal/img/service/Core-Services.png">--%>
                        <%--</div>--%>
                        <%--<div class="col-md-9">--%>
                            <%--<h4><a href="/portal/coreislist">Core Service</a></h4>--%>
                            <%--<p>Core service is defined</p>--%>
                            <%--<p>as the service that OISF</p>--%>
                            <%--<p>owns and can provide those</p>--%>
                            <%--<p>to other solution on the fly</p>--%>


                        <%--</div>--%>

                            <a href="<%=request.getContextPath()%>/portal/coreislist" style="text-decoration: none">
                                <div class="middlecontainer">
                                    <div class="middle">
                                        <img src="<%=request.getContextPath()%>/assets/portal/img/service/Core-Services.png">
                                    </div>
                                    <div class="col-md-9 ">
                                        <h4  class="roboto fw-400" style="font-size: 20px;">Core Service</h4>
                                        <p class="roboto fw-300" style="font-size: 13px;">Core service is defined as the service that OISF owns and can provide those to other solution on the fly</p>
                                        <%--<p class="roboto fw-300"></p>--%>
                                        <%--<p class="roboto fw-300">/p>--%>
                                        <%--<p class="roboto fw-300">to other solution on the fly</p>--%>

                                    </div>
                                </div>
                            </a>

                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 ">

                        <%--<div class="middle">--%>
                            <%--<img src="/assets/portal/img/service/Share-Service.png">--%>
                        <%--</div>--%>
                        <%--<div class="col-md-9">--%>
                            <%--<h4><a href="/portal/sharedislist">Shared Service</a></h4>--%>
                            <%--<p>Shared service is defined</p>--%>
                            <%--<p>as the service OISF does not own</p>--%>
                            <%--<p>and that is provided by </p>--%>
                            <%--<p>other e-governance solutions.</p>--%>


                        <%--</div>--%>

                            <a href="<%=request.getContextPath()%>/portal/sharedislist" style="text-decoration: none">
                                <div class="middlecontainer">
                                    <div class="middle">
                                        <img src="<%=request.getContextPath()%>/assets/portal/img/service/Share-Service.png">
                                    </div>
                                    <div class="col-md-9">
                                        <h4 class="roboto fw-400" style="font-size: 20px;">Shared Service</h4>
                                        <p class="roboto fw-300" style="font-size: 13px;">Shared service is defined
                                            as the service that other application will provide to a third party application via OISF.</p>
                                        <%--<p class="roboto fw-300">Use a translation to move</p>--%>
                                        <%--<p class="roboto fw-300">up by half its own height</p>--%>
                                        <%--<p class="roboto fw-300">the height of the container.</p>--%>

                                    </div>
                                </div>
                            </a>

                    </div>


                </div>
            </div>
        </section>


    </div>
</div>

<%@ include file="../includes/portletfooter.jsp" %>


</body></html>

