<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: reve
  Date: 1/29/2018
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
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
    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%--<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">--%>

    <!-- Plugin CSS <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"> -->


    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/assets/css/portal/creative.min.css" rel="stylesheet">
    <style>


        @import url(http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900);
        @import url(http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700);

        .roboto {
            font-family: "Roboto";
        }
        .roboto-c {
            font-family: "Roboto Condensed";
        }


        .fw-100 { font-weight: 100; }
        .fw-300 { font-weight: 300; }
        .fw-400 { font-weight: 400; }
        .fw-500 { font-weight: 500; }
        .fw-700 { font-weight: 700; }
        .fw-900 { font-weight: 900; }


        header div img {
            width: 100%;
            height: 100%;
        }

        .container {
            max-width: 1160px;
        }
        header {
            position: absolute;
            top: 74px;
            width: 100%;
            height: 150px;
        }

        #mainNav {
            height: 74px;
            position: fixed;
            background-color: #fff;
            max-height: 74px;
        }

        .carousel-item {
            height: 100%;
            background: no-repeat center center scroll;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        #person img {
            display: block;
            position: relative;
            margin: auto;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }

        .imageoverlaped {
            margin: 0px;
            position: absolute;
            bottom: 0px;
            z-index: 1000;
            background-color: transparent;
            color: black;
            font-weight: bold;
        }

        .tag {
            width: 95%;
            height: 22%;
            margin-left: 5%;
            margin-right: 5%;
            float: left;
            position: absolute;
            left: 0px;
            bottom: 0px;
            z-index: 1000;
            background-color: transparent;
            padding: 5px;
            color: black;
            font-weight: bold;
        }

        .middlecontainer {
            display: flex;
            justify-content: center;
            background: transparent;
            margin-bottom: 20px;
        }

        .middle {
            background: transparent;
            align-self: center;
            padding: 0rem;
        }

        * {
            font-family: 'Roboto Condensed', sans-serif;
        }

        a {
            color: black !important;
        }

        section {
            padding: 2rem !important;
        }

        #contact {
            padding: 0px !important;
            padding-top: 5px !important;
        }

        #person {
            padding: 10px !important;
        }

        #standard {
            padding-bottom: 20px !important;
            padding-top: 90px !important;
            background-color: #F1F5F8;
        }

        #service {
            padding-top: 90px !important;
        }

        #about {
            background-color: #F1F5F8 !important;
            color: black !important;
        }

        .light {
            border-color: black !important;
        }

        #about > div > div > div.col-md-4.text-center > h2, #about > div > div > div.col-md-4.text-center > p {
            color: black !important;
        }


        #standrardcontent > div > div > div > div > h4 > a {
            color: #02BDD5 !important;
        }

        .btn-light {
            background-color: #02BDD5 !important;
        }

        /*h1,*/
        /*h2,*/
        /*h3,*/
        /*h4,*/
        /*h5,*/
        /*h6 {*/
        /*font-family: 'Roboto Condensed', sans-serif !important;*/
        /*border: none !important;*/
        /*font-weight: lighter !important;*/
        /*}*/

        .navelecolorbottom{
            /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#1e5799+0,207cca+37,7db9e8+39 */
            background: #692D91;
            /*height: 5px!important;!* Old browsers *!*/
            background: -moz-linear-gradient(top, #692D91 20%, #ffffff 0%, #ffffff 29%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top, #692D91 20%,#ffffff 0%,#ffffff 29%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, #692D91 20%,#ffffff 0%,#ffffff 29%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#692D91', endColorstr='#B4B2D7',GradientType=0 ); /* IE6-9 */
        }
        p {
            color: #404040;
            /*font-weight: 300!important;*/
            font-size: 15px;
            margin: 0px;
        }

        li {
            color: #404040;
        }
        li a{
            color: #404040 !important;
        }
        #service p {
            margin: 0 !important;
            padding: 0 !important;

        }


        #standrardcontent > .row {
            margin-top: 50px;
        }

        .servicecontent {
            margin-top: 50px;
        }

        b, strong {
            font-weight: lighter;
        }

        #mainNav .navbar-nav>li.nav-item>a.nav-link.active, #mainNav .navbar-nav>li.nav-item>a.nav-link:focus.active{
            color: #404040!important;
        }


        .search-container {
            float: right;
        }

        .search-container input[type=text] {
            width: 250px;
            height: 30%;
            padding: 6px;
            font-size: 17px;
            border: none;
            border: 1px solid lightgray;
            border-radius: 10px;
        }

        .search-container input[type=text]:focus, .search-container button:focus {
            outline: none;
        }

        .search-container button {
            background: transparent;
            font-size: 22px;
            border: none;
            cursor: pointer;
            color: slategrey;
        }

        .search-container button:hover {
            background: #ccc;
        }


        #carouselExampleIndicators > a.carousel-control-prev {
            opacity: 1!important;
        }
        #carouselExampleIndicators > a.carousel-control-next {
            opacity: 1!important;
        }
        .carousel-control-prev img:hover{
            opacity: .3;
        }

        #carouselExampleIndicators > a.carousel-control-next > div > img:hover{
            opacity: .3;
        }
        @media (min-width: 800px) {
            #aboutrow {
                display: flex;
                justify-content: space-between;
                height: 100%;
            }

            #abouttext {
                width: 45%;

            }

            #slider {
                width: 44.4%;
            }
        }

        @media (max-width: 800px) {
            h1,
            h2,
            h3,
            h4,
            h5,
            h6 {
                font-family: 'Roboto Condensed', sans-serif !important;
                color: #404040;
                border: none !important;
                font-weight: lighter !important;
                font-size: 20px;
            }

            #aboutrow {
                display: block;
                height: 100%;
            }

            #abouttext {
                display: block;

            }

            #slider {
                display: block;
                height: 200px;
            }
        }

        @media (max-width: 576px) {
            #standrardcontent > div > div {
                margin-bottom: 30px;
            }
        }


        @media (min-height: 500px){
            :root{
                --scale:5;
            }
        }
        @media (min-height: 800px) {
            :root{
                --scale:5;
            }
        }
        @media (min-height: 1000px) {

        }

    </style>

</head>

<body id="page-top" style="position: relative;top: 0px;">

<!-- Navigation -->
<nav class="navbar navbar-toggleable-md navbar-expand-lg navbar-light fixed-top navbar-shrink bg-faded" id="mainNav">

    <%--<img src="<%=request.getContextPath()%>/assets/portal/img/logo/logosmall.png" width="8%" height="8%"/>--%>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
            data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="true"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand pull-right">
        <img class="navabar-brand" src="/assets/portal/img/logo/bd_gov.png">
    </a>


    <div class=" collapse navbar-collapse" id="navbarResponsive" style="justify-content: center">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="/portal#home" style="color:purple;">
                    <div style="position: relative;">
                        Home
                        <div class="navelecolorbottom" style="position: absolute;width: 100%;min-height: 0px;">

                        </div>
                    </div>

                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="/portal#about" style="color:purple;">
                    <div style="position: relative;">
                        About
                        <div class="navelecolorbottom" style="position: absolute;width: 100%;min-height: 0px;">

                        </div>
                    </div>

                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="/portal#standard" style="color:purple;">

                    <div style="position: relative;">
                        Standards
                        <div class="navelecolorbottom" style="position: absolute;width: 100%;min-height: 0px;">

                        </div>
                    </div>

                </a>

            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="" data-toggle="dropdown" aria-haspopup="true"
                   aria-expanded="false">

                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="left: -130px;">
                    <a class="dropdown-item" href=" <%=request.getContextPath()%>/portal/datastandard">Data
                        Standards</a>
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/portal/intstandard">Integration
                        Standards</a>
                    <a class="dropdown-item" href=" <%=request.getContextPath()%>/portal/securitystandard">Security
                        Standards</a>
                    <a class="dropdown-item" href=" <%=request.getContextPath()%>/portal/deploymentPolicy">Deployment
                        Standards</a>
                    <a class="dropdown-item" href="  <%=request.getContextPath()%>/portal/technologystandard">Technology
                        Standards</a>
                    <a class="dropdown-item" href="   <%=request.getContextPath()%>/portal/applicationstandard">Application
                        Standards</a>
                </div>
            </li>


            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="/portal#service" style="color:purple;">

                    <div style="position: relative;">
                        Services
                        <div class="navelecolorbottom" style="position: absolute;width: 100%;min-height: 0px;">

                        </div>
                    </div>
                </a>

            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">

                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" style="left: -100px;">
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/portal/corelist">Core Services</a>
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/portal/sharedlist">Shared
                        Services</a>
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/portal/serviceregistration">Service
                        Registration</a>
                </div>
            </li>


            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#" style="color:purple;">

                    <div style="position: relative;">
                        Guidelines
                        <div class="navelecolorbottom" style="position: absolute;width: 100%;min-height: 0px;">

                        </div>
                    </div>
                </a>
            </li>
            <li class="nav-item">
                <%--<a class="nav-link js-scroll-trigger" href="#feedback" style="color:purple;">--%>
                <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal/feedback" style="color:purple;">

                    <div style="position: relative;">
                        Contact
                        <div class="navelecolorbottom" style="position: absolute;width: 100%;min-height: 0px;">

                        </div>
                    </div>
                </a>
            </li>
        </ul>
        <ul class="navbar-nav mr-auto">
            <li class="nav-item pull-right">
                <div class=" search-container">
                    <form class="navbar-form form-inline" role="form">
                        <div class="form-group">
                            <button type="submit"><i class="fa fa-search"></i></button>
                            <input type="text" class="" placeholder="Search.." name="search"/>
                        </div>
                        <%--<div class="input-group-addon" ><i class="fa fa-search"></i></div>--%>
                        <%--<div class="input-group-btn">--%>
                        <%--<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>--%>
                        <%--</div>--%>

                    </form>
                </div>
            </li>

        </ul>

    </div>

    <a class="navbar-brand pull-right ">

        <img src="/assets/portal/img/logo/a2i.png">
    </a>


</nav>


<%--<header id="home">--%>
    <%--<div style="position:relative;height: 100%">--%>
        <%--<img src="<%=request.getContextPath()%>/assets/portal/img/header/header.jpg">--%>
        <%--<div style="position:absolute;top:50%;left:50%;transform: translate(-50%,-50%)">--%>
            <%--<img src="<%=request.getContextPath()%>/assets/portal/img/logo/logo.png">--%>
        <%--</div>--%>
    <%--</div>--%>


<%--</header>--%>




<div style="margin-top: 6%;margin-bottom: 2%">



        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading roboto fw-300"
                        style="color: purple!important; transform: scaleY(1.2);font-size: 25px;">CONTACT</h2>
                </div>
            </div>

            <%--<form style="margin-top: 2%"  enctype="multipart/form-data" action="#">--%>
            <%--<form style="margin-top: 2%" method="post" enctype="multipart/form-data" action="${context}/portal/feedback">--%>


            <div class="form-group row">
                <label class=" col-md-3 control-label">Email Address<span class="required" aria-required="true"
                                                                          style="color: red"> * </span></label>
            </div>
            <div class="col-md-12">
                <input type="text" data-required="1" class="form-control" placeholder="Email Address"
                       name="email">
            </div>
            <br/>


            <div class="form-group row">
                <label class=" col-md-3 control-label">Subject<span class="required" aria-required="true"
                                                                    style="color: red"> * </span></label>
            </div>
            <div class="col-md-12">
                <input type="text" data-required="1" class="form-control" placeholder="Subject"
                       name="subject">
            </div>
            <br/>


            <div class="form-group row">
                <label class=" col-md-3 control-label">Message
                    <span class="required" aria-required="true" style="color: red"> * </span>
                </label>

            </div>
            <div class="col-md-12">


                <%--<input type="text" data-required="1" class="form-control" placeholder="Your Feedback" style="height:200px"--%>
                <%--name="appnamebng">--%>
                <textarea id="message" name="message" placeholder="Message" style="height:200px;width:100%"></textarea>
            </div>


            <%--<div class="form-group row">--%>
            <%--<label class=" col-md-3 control-label">Application URL <span class="required" aria-required="true"--%>
            <%--style="color: red"> * </span></label>--%>

            <%--<div class="col-md-9">--%>


            <%--<input type="text" class="form-control" placeholder="Url" name="link">--%>

            <%--</div>--%>

            <%--</div>--%>


            <%--<div class="form-group row">--%>
            <%--<label class=" col-md-3 control-label">Redirect URL <span class="required" aria-required="true"--%>
            <%--style="color: red"> * </span></label>--%>
            <%--<div class="col-md-9">--%>

            <%--<input type="text" class="form-control" placeholder="redirect url" name="redirect_url">--%>

            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="form-group row">--%>
            <%--<label class=" col-md-3 control-label">IDP Postback URL <span class="required" aria-required="true"--%>
            <%--style="color: red"> * </span></label>--%>
            <%--<div class="col-md-9">--%>
            <%--<div class="input-icon">--%>

            <%--<input type="text" class="form-control" placeholder="IDP Postback URL" name="idp_url">--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>


            <%--<div class="form-group row">--%>
            <%--<label class="col-md-3 control-label">Mobile No</label>--%>
            <%--<div class="col-md-9">--%>

            <%--<input type="text" class="form-control" placeholder="Mobile No"--%>
            <%--name="mobile" data-required="true"></div>--%>

            <%--</div>--%>

            <%--<div class="form-group row">--%>
            <%--<label class="col-md-3 control-label">Email Address <span class="required" aria-required="true"--%>
            <%--style="color: red"> * </span></label>--%>
            <%--<div class="col-md-9">--%>


            <%--<input type="text" class="form-control" placeholder="Email Address"--%>
            <%--name="email"></div>--%>

            <%--</div>--%>


            <%--<div class="form-group row">--%>
            <%--<label class="col-md-3 control-label">Notification Mechanism</label>--%>
            <%--<div class="col-md-9">--%>
            <%--<select class="form-control" name="mechanism">--%>
            <%--<option value="0">Email</option>--%>
            <%--<option value="1">SMS</option>--%>
            <%--</select>--%>
            <%--</div>--%>
            <%--</div>--%>

            <%--<div class="form-group row ">--%>
            <%--<label class="control-label col-md-3">Application Icon</label>--%>
            <%--<div class="col-md-9">--%>
            <%--<div class="fileinput fileinput-new" data-provides="fileinput">--%>
            <%--<div class="fileinput-preview thumbnail" data-trigger="fileinput"--%>
            <%--style="width: 200px; height: 150px; line-height: 150px;"></div>--%>
            <%--<div>--%>
            <%--<span class="btn red btn-outline btn-file">--%>
            <%--<span class="fileinput-new"> Select image </span>--%>
            <%--<span class="fileinput-exists"> Change </span>--%>
            <%--<input type="hidden" value="" name="...">--%>
            <%--<input type="file" name="file"> </span>--%>
            <%--<a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput">--%>
            <%--Remove </a>--%>
            <%--</div>--%>
            <%--</div>--%>

            <%--</div>--%>
            <%--</div>--%>

            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-9 col-md-9 " style="margin-left: 45%">
                        <%--<button type="submit" class="btn btn-default">Submit</button>--%>
                        <button type="button" class="btn btn-primary pull-righ">Submit</button>
                        <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                    </div>
                </div>
            </div>
            <%--</form>--%>

            <%----%>
            <%--<div class="row">--%>
            <%--<div class="col-lg-12 text-center">--%>
            <%--<h2 class="section-heading roboto fw-300" style="color: purple!important; transform: scaleY(1.2);font-size: 25px;">SERVICES</h2>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="row" style="margin-top: 50px;">--%>
            <%--<div  class="col-lg-12 " style="margin: 20px 0px 10px 0px;">--%>
            <%--<p  class="roboto fw-300" style="font-size: 14px;">Office information and Service framework works as a mediator for various e-governance solutions.--%>
            <%--Via this framework various e-governance solution can use different services that is provided by--%>
            <%--different e goverenance solutions.--%>
            <%--For example 'citizen charter' can be provided whenever a solution need it on the fly.--%>
            <%--There are 2 tipes of services that OISF will provide for other e-governance solution. they are--%>
            <%--<ul style="margin-left: -23px;">--%>
            <%--<li class="roboto fw-300">--%>
            <%--Core Services--%>
            <%--</li>--%>
            <%--<li class="roboto fw-300">--%>
            <%--Shared Services--%>
            <%--</li>--%>

            <%--</ul>--%>
            <%--</p>--%>

            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="row servicecontent">--%>
            <%--<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">--%>
            <%--<a href="<%=request.getContextPath()%>/portal/corelist" style="text-decoration: none">--%>
            <%--<div class="middlecontainer">--%>
            <%--<div class="middle">--%>
            <%--<img src="<%=request.getContextPath()%>/assets/portal/img/service/Core-Services.png">--%>
            <%--</div>--%>
            <%--<div class="col-md-9 ">--%>
            <%--<h4  class="roboto fw-400" style="font-size: 20px;">Core Service</h4>--%>
            <%--<p class="roboto fw-300" style="font-size: 13px;">Core service is defined as the service that OISF owns and can provide those to other solution on the fly</p>--%>
            <%--&lt;%&ndash;<p class="roboto fw-300"></p>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<p class="roboto fw-300">/p>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<p class="roboto fw-300">to other solution on the fly</p>&ndash;%&gt;--%>

            <%--</div>--%>
            <%--</div>--%>
            <%--</a>--%>

            <%--</div>--%>
            <%--<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">--%>
            <%--<a href="<%=request.getContextPath()%>/portal/sharedlist" style="text-decoration: none">--%>
            <%--<div class="middlecontainer">--%>
            <%--<div class="middle">--%>
            <%--<img src="<%=request.getContextPath()%>/assets/portal/img/service/Share-Service.png">--%>
            <%--</div>--%>
            <%--<div class="col-md-9">--%>
            <%--<h4 class="roboto fw-400" style="font-size: 20px;">Shared Service</h4>--%>
            <%--<p class="roboto fw-300" style="font-size: 13px;">Shared service is defined Use a translation to move up by half its own height the height of the container.</p>--%>
            <%--&lt;%&ndash;<p class="roboto fw-300">Use a translation to move</p>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<p class="roboto fw-300">up by half its own height</p>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<p class="roboto fw-300">the height of the container.</p>&ndash;%&gt;--%>

            <%--</div>--%>
            <%--</div>--%>
            <%--</a>--%>

            <%--</div>--%>

            <%--<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">--%>

            <%--<a href="<%=request.getContextPath()%>/portal/serviceregistration" style="text-decoration: none">--%>
            <%--<div class="middlecontainer">--%>
            <%--<div class="middle">--%>
            <%--<img src="<%=request.getContextPath()%>/assets/portal/img/service/Service-Registration.png">--%>
            <%--</div>--%>
            <%--<div class="col-md-9">--%>
            <%--<h4  class="roboto fw-400" style="font-size: 20px;">Service Registration </h4>--%>
            <%--<p class="roboto fw-300" style="font-size: 13px;">it halfway down the Use a translation to move up by half its own height the height of the container.</p>--%>
            <%--&lt;%&ndash;<p class="roboto fw-300">Use a translation to move</p>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<p class="roboto fw-300">up by half its own height</p>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<p class="roboto fw-300">the height of the container.</p>&ndash;%&gt;--%>

            <%--</div>--%>
            <%--</div>--%>
            <%--</a>--%>

            <%--</div>--%>

            <%--</div>--%>
            <!--<div class="row servicecontent" style="margin-top:50px;">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 middlecontainer">

                <div class = "middle">
                    <img src="img/service/Blank-Circle.png">
                </div>
                <div class = "col-md-9">
                    <h4>Core Service</h4>
                    <p>it halfway down the</p>
                    <p>Use a translation to move</p>
                    <p>up by half its own height</p>
                    <p>the height of the container.</p>

                </div>

              </div>
              <div class="col-lg-4 col-md-4 middlecontainer">

                <div class = "middle">
                    <img src="img/service/Blank-Circle.png">
                </div>
                <div class = "col-md-9">
                    <h4><a href="<%=request.getContextPath()%>/portal/sharedlist">Shared Service</a></h4>
                    <p>Shared service is defined</p>
                    <p>as the service OISF does not own</p>
                    <p>and that is provided by </p>
                    <p>other e-governance solutions.</p>

                </div>

              </div>

              <div class="col-lg-4 col-md-4 middlecontainer">

                <div class = "middle">
                    <img src="img/service/Blank-Circle.png">
                </div>
                <div class = "col-md-9">
                    <h4>Service Registration</h4>
                    <p>The detail process </p>
                    <p>and workflow of registering</p>
                    <p>a service is briefly</p>
                    <p>described on this section</p>

                </div>

              </div>
            </div>-->

        </div>
</div>

<div style="width: 100%;">


    <section id="contact" style="background-color:#F1F5F8 !important">
        <div class="container">
            <div class=" footer page-footer-custom " style="/*margin-right:2%;margin-left:2%;*/">

                <div class="row" style="padding-top: 10px;">
                    <div class="col-md-3">
                        <ul class=" text-left">
                            <h4 class="roboto-c fw-400"
                                style=" border-bottom: none ;padding-bottom: 5px; color: purple!important; font-size: 22px;">
                                CONTACTS</h4>


                            <a href="#">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Condition for
                                    Use
                                </li>
                            </a>
                            <a href="#">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">In Cooperation
                                    With
                                </li>
                            </a>
                            <a href="#">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Contact</li>
                            </a>
                            <a href="#">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Site Map</li>
                            </a>
                        </ul>
                    </div>

                    <div class="col-md-3">
                        <ul class=" text-left">
                            <h4 class="roboto-c fw-400"
                                style=" border-bottom: none ;padding-bottom: 5px; color: purple!important; font-size: 22px;">
                                IMPORTANT LINKS</h4>
                            <a href="http://www.bangabhaban.gov.bd/">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">President's
                                    Office
                                </li>
                            </a>
                            <a href="http://www.pmo.gov.bd">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Prime
                                    Minister's Office
                                </li>
                            </a>
                            <a href="http://www.mopa.gov.bd">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Ministry of
                                    Public Administration
                                </li>
                            </a>
                            <a href="http://www.infokosh.gov.bd/">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">E-Information
                                    Cell
                                </li>
                            </a>
                            <a href="http://a2i.pmo.gov.bd/">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">a2i Programme
                                </li>
                            </a>
                        </ul>
                    </div>

                    <div class="col-md-3">
                        <ul class="fa-ul text-left">
                            <h4 class="roboto-c fw-400"
                                style=" border-bottom: none ;padding-bottom: 5px; color: purple!important; font-size: 22px;">
                                SOCIAL NETWORK</h4>
                            <a href="https://www.fb.com"><span class="fa-stack fa-sm">
							<i class="fa fa-circle fa-stack-2x" style=""></i>
							<i class="fa fa-facebook fa-stack-1x fa-inverse"
                               style="background-color:  royalblue;border-radius: 20px;"></i>
						</span></a>
                            <a href="https://plus.google.com"><span class="fa-stack fa-sm">
							<i class="fa fa-circle fa-stack-2x"></i>
							<i class="fa fa-google-plus fa-stack-1x fa-inverse"
                               style="background-color:  #DB5246;border-radius:  20px;"></i>
						</span></a>
                            <a href="https://twitter.com"><span class="fa-stack fa-sm">
							<i class="fa fa-circle fa-stack-2x"></i>
							<i class="fa fa-twitter fa-stack-1x fa-inverse"
                               style="background-color:  #28AAE1;border-radius: 20px;"></i>
						</span></a>
                            <a href="https://www.youtube.com"><span class="fa-stack fa-sm">
							<i class="fa fa-circle fa-stack-2x"></i>
							<i class="fa fa-youtube fa-stack-1x fa-inverse"
                               style="background-color: #ad1926;color: white;border-radius:  20px;"></i>
						</span></a>


                        </ul>
                    </div>
                    <div class="col-md-3">
                        <h4 class="roboto-c fw-400"
                            style=" border-bottom: none ;padding-bottom: 5px; color: purple!important; font-size: 22px;">
                            PLANNING AND IMPLEMENTATION</h4>
                        <div class="logo_a2i" style="margin-top:5%; margin-left:150px">
                            <a href="http://a2i.pmo.gov.bd/">
                                <img src="/assets/portal/img/logo/a2i.png" width="41" height="45"
                                     style="margin-right:  10px;">
                                <img src="/assets/portal/img/logo/bd_gov.png" width="41" height="45">
                            </a>

                        </div>

                        <div class="copy-right-title" style="margin-top:5%;">
                            <p class="roboto fw-300" style="font-size: 10px;">
                                Copyrights © 2018 All Rights Reserved<br>
                                Government of the People's Republic of Bangladesh</p>
                        </div>

                    </div>
                    <!-- end of row -->
                </div>

                <!-- end of container -->
            </div>
        </div>

        <div style="height:45px;background-color:#9698C8">

        </div>

    </section>
</div>

<!-- Bootstrap core JavaScript -->
<%--<script src="/assets/js/portal/jquery.min.js"></script>--%>
<script src="${context}/assets/js/portal/bootstrap.bundle.min.js"></script>
<script src="${context}/assets/js/portal/jquery.easing.min.js"></script>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/respond.min.js"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/excanvas.min.js"></script>--%>
<%--<%@ include file="../includes/includes.jsp" %>--%>


<%--<script src="${context}/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.pulsate.min.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/bootstrap-toastr/toastr.min.js"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery-titlealert/jquery.titlealert.min.js" type="text/javascript"></script>--%>

<%--src="<%=request.getContextPath()%>/assets/global/scripts/metronic.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/admin/layout4/scripts/layout.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/admin/layout4/scripts/demo.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/admin/pages/scripts/index.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/admin/pages/scripts/tasks.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/admin/pages/scripts/ui-general.js" type="text/javascript"></script>--%>
<%--<script src="<%=request.getContextPath()%>/assets/admin/pages/scripts/ui-toastr.js"></script>--%>

<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<%--form validation--%>
<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/js/common/validation.js" type="text/javascript"></script>

<script>

    jQuery(document).ready(function () {
        Metronic.init(); // init metronic core componets
        Layout.init(); // init layout
        Demo.init(); // init demo features

        $("#fileMessageCounterPulse").pulsate();
        $("#messageCounterPulse, .page-quick-sidebar .badge").pulsate({color: '#FF5722'});

        $(".link").click(
            function () {
                postLink = $(this).attr("data-id");
                searchText($(this).attr("data-id"));
            }
        )


    });
</script>


</body>
</html>