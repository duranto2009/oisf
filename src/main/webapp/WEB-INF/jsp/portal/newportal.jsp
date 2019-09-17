<%--
  Created by IntelliJ IDEA.
  User: reve
  Date: 1/29/2018
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
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
        .col-md-4{
            margin-bottom: 2%!important;
        }
        .col-sm-6{
            margin-bottom: 3%!important;
        }

        .fw-100 {
            font-weight: 100;
        }

        .fw-300 {
            font-weight: 300;
        }

        .fw-400 {
            font-weight: 400;
        }

        .fw-500 {
            font-weight: 500;
        }

        .fw-700 {
            font-weight: 700;
        }

        .fw-900 {
            font-weight: 900;
        }

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
            padding-top: 50px !important;
            background-color: #F1F5F8;
        }

        #service {
            padding-top: 50px !important;
        }

        #about {
            background-color: #F1F5F8 !important;
            color: black !important;
        }

        #feedback {
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

        .navelecolorbottom {
            /* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#1e5799+0,207cca+37,7db9e8+39 */
            background: #692D91;
            /*height: 5px!important;!* Old browsers *!*/
            background: -moz-linear-gradient(top, #692D91 20%, #ffffff 0%, #ffffff 29%); /* FF3.6-15 */
            background: -webkit-linear-gradient(top, #692D91 20%, #ffffff 0%, #ffffff 29%); /* Chrome10-25,Safari5.1-6 */
            background: linear-gradient(to bottom, #692D91 20%, #ffffff 0%, #ffffff 29%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#692D91', endColorstr='#B4B2D7', GradientType=0); /* IE6-9 */
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

        li a {
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

        #mainNav .navbar-nav > li.nav-item > a.nav-link.active, #mainNav .navbar-nav > li.nav-item > a.nav-link:focus.active {
            color: #404040 !important;
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
            opacity: 1 !important;
        }

        #carouselExampleIndicators > a.carousel-control-next {
            opacity: 1 !important;
        }

        .carousel-control-prev img:hover {
            opacity: .3;
        }

        #carouselExampleIndicators > a.carousel-control-next > div > img:hover {
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

        @media (min-height: 500px) {
            :root {
                --scale: 5;
            }
        }

        @media (min-height: 800px) {
            :root {
                --scale: 5;
            }
        }

        @media (min-height: 1000px) {

        }

        .btn-primary {
            background-color: #800080;
            border-color: #f05f40;
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
                <a class="nav-link js-scroll-trigger" href="#home" style="color:purple;">
                    <div style="position: relative;">
                        Home
                        <div class="navelecolorbottom" style="position: absolute;width: 100%;min-height: 0px;">

                        </div>
                    </div>

                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#about" style="color:purple;">
                    <div style="position: relative;">
                        About
                        <div class="navelecolorbottom" style="position: absolute;width: 100%;min-height: 0px;">

                        </div>
                    </div>

                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#standard" style="color:purple;">

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
                <a class="nav-link js-scroll-trigger" href="#service" style="color:purple;">

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


<header id="home">
    <div style="position:relative;height: 100%">
        <img src="<%=request.getContextPath()%>/assets/portal/img/header/header.jpg">
        <div style="position:absolute;top:50%;left:50%;transform: translate(-50%,-50%)">
            <img src="<%=request.getContextPath()%>/assets/portal/img/logo/logo.png">
        </div>
    </div>


</header>

<div style="position: absolute;top: 74px;width: 100%;margin-top: 150px;">
    <section class="bg-primary" id="about" style="display: flex;align-items: center; min-height: 650px">
        <div class="container" style="height: 100%">
            <div class="row" id="aboutrow" style="display: flex;">
                <div id="abouttext">
                    <h2 class="section-heading roboto-c fw-700" style="color: #683392!important;font-size: 21px;">ABOUT
                        OISF</h2>
                    <p class="mb-4 roboto fw-300" style="font-size: 14px;">E-Governance is the public sector’s use of
                        information and communication
                        technologies with the aim of
                        improving information and service delivery and making government more accountable, transparent
                        and effective. Traditional system development
                        approach for e-governance solution will create chaotic situation when different vendor use
                        different choices of technology, platform,
                        framework and it becomes difficult to
                        maintain interoperability. A development framework enables software developers to develop
                        quality software
                        because it is
                        easy to understand the role. Under these circumstances, Office
                        Information and service Framework is introduced to solve those problems.</p>

                </div>
                <div id="slider" style="border: none;height: calc(72px*var(--scale));width: 600px;">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="5000"
                         style="height:100%">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                            <%--<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>--%>
                            <%--<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>--%>
                            <%--<li data-target="#carouselExampleIndicators" data-slide-to="6"></li>--%>
                            <%--<li data-target="#carouselExampleIndicators" data-slide-to="7"></li>--%>
                        </ol>
                        <div class="carousel-inner" role="listbox" style="height:100%">
                            <!-- Slide One - Set the background image for this slide in the line below -->
                            <div class="carousel-item active"
                                 style="background-image: url('<%=request.getContextPath()%>/assets/portal/img/imageslider/page/page1.png');background-color:white;background-size:100% 100%;">
                                <div class="carousel-caption d-none d-md-block">
                                    <h3></h3>
                                    <p></p>
                                </div>
                            </div>
                            <!-- Slide Two - Set the background image for this slide in the line below -->
                            <div class="carousel-item"
                                 style="background-image: url('<%=request.getContextPath()%>/assets/portal/img/imageslider/page/page2.png');background-color:white;background-size:100% 100%;">
                                <div class="carousel-caption d-none d-md-block">
                                    <h3></h3>
                                    <p></p>
                                </div>
                            </div>
                            <!-- Slide Three - Set the background image for this slide in the line below -->
                            <div class="carousel-item"
                                 style="background-image: url('<%=request.getContextPath()%>/assets/portal/img/imageslider/page/page3.png');background-color:white;background-size:100% 100%;">
                                <div class="carousel-caption d-none d-md-block">
                                    <h3></h3>
                                    <p></p>
                                </div>
                            </div>
                            <div class="carousel-item "
                                 style="background-image: url('<%=request.getContextPath()%>/assets/portal/img/imageslider/page/page4.png');background-color:white;background-size:100% 100%;">
                                <div class="carousel-caption d-none d-md-block">
                                    <h3></h3>
                                    <p></p>
                                </div>
                            </div>
                            <%--<!-- Slide Two - Set the background image for this slide in the line below -->--%>
                            <%--<div class="carousel-item"--%>
                            <%--style="background-image: url('<%=request.getContextPath()%>/assets/portal/img/imageslider/page/page5.png');background-color:white;background-size:100% 100%;">--%>
                            <%--<div class="carousel-caption d-none d-md-block">--%>
                            <%--<h3></h3>--%>
                            <%--<p></p>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<!-- Slide Three - Set the background image for this slide in the line below -->--%>
                            <%--<div class="carousel-item"--%>
                            <%--style="background-image: url('<%=request.getContextPath()%>/assets/portal/img/imageslider/page/page6.png');background-color:white;background-size:100% 100%;">--%>
                            <%--<div class="carousel-caption d-none d-md-block">--%>
                            <%--<h3></h3>--%>
                            <%--<p></p>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="carousel-item "--%>
                            <%--style="background-image: url('<%=request.getContextPath()%>/assets/portal/img/imageslider/page/page7.png');background-color:white;background-size:100% 100%;">--%>
                            <%--<div class="carousel-caption d-none d-md-block">--%>
                            <%--<h3></h3>--%>
                            <%--<p></p>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<!-- Slide Two - Set the background image for this slide in the line below -->--%>
                            <%--<div class="carousel-item"--%>
                            <%--style="background-image: url('<%=request.getContextPath()%>/assets/portal/img/imageslider/page/page8.png');background-color:white;background-size:100% 100%;">--%>
                            <%--<div class="carousel-caption d-none d-md-block">--%>
                            <%--<h3></h3>--%>
                            <%--<p></p>--%>
                            <%--</div>--%>
                            <%--</div>--%>

                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                           data-slide="prev" style="background-color: transparent;">
                            <div style="background-color: transparent;width: 34px;height: 34px;position: relative;border-radius: 225px;margin-left: -110%;box-shadow:0px 0px 5px 3px lightgrey">
                                <img src="<%=request.getContextPath()%>/assets/portal/img/imageslider/back.png"
                                     style="position: absolute;top: -4.8px;left: -4px;width: 45px;height: 45px;">
                            </div>

                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                           data-slide="next" style="background-color: transparent;">
                            <div style="background-color: transparent;width: 34px;height: 34px;position: relative;border-radius: 225px;margin-right: -110%;box-shadow:0px 0px 5px 3px lightgrey">
                                <img src="<%=request.getContextPath()%>/assets/portal/img/imageslider/next.png"
                                     style="position: absolute;top: -4.8px;left: -4px;height: 45px;width: 45px;">
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%--<section class="bg-primary" id="person" style="background-color:white!important;min-height: 285px;display: flex;align-items: center">--%>
    <%--<div class="container">--%>
    <%--<div class="row" style="position: relative;">--%>
    <%--<a href="#" style="position: absolute;right: 0px;bottom: 0px;z-index: 10;    color: #83bbce!important;font-size: 14px;">More ...</a>--%>
    <%--<div class="col-md-3" style="text-align:center">--%>
    <%--<div >--%>
    <%--<img src="<%=request.getContextPath()%>/assets/portal/img/person/Mustafa-Jabbar.png">--%>
    <%--<p class="roboto-c fw-500" style="color: #683392!important;font-size: 25px;">--%>
    <%--Mustafa Jabbar</p>--%>
    <%--<p class="roboto fw-300" style="font-size: 16px;">Hon'ble Minister</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="col-md-3" style="text-align:center">--%>
    <%--<img src="<%=request.getContextPath()%>/assets/portal/img/person/SAJEEB-WAZED.png">--%>
    <%--<p class="roboto-c fw-500" style="color: #683392!important;font-size: 25px;">--%>
    <%--Sajeeb Wazed</p>--%>
    <%--<p class="roboto fw-300" style="font-size: 16px;">Adviser to Hon'ble PM</p>--%>
    <%--</div>--%>
    <%--<div class="col-md-3" style="text-align:center">--%>
    <%--<img src="<%=request.getContextPath()%>/assets/portal/img/person/Zunaid-Ahmed-Palak-MP.png">--%>
    <%--<p class="roboto-c fw-500" style="color: #683392!important;font-size: 25px;">--%>
    <%--Zunaid Ahmed Palak</p>--%>
    <%--<p class="roboto fw-300" style="font-size: 16px;">Hon'ble State Minister</p>--%>
    <%--</div>--%>
    <%--<div class="col-md-3" style="text-align:center">--%>
    <%--<img src="<%=request.getContextPath()%>/assets/portal/img/person/Anir-Chowdhury.png">--%>
    <%--<p class="roboto-c fw-500" style="color: #683392!important;font-size: 25px;">Anir Chowdhury</p>--%>
    <%--<p class="roboto fw-300" style="font-size: 16px;">Policy Advisor</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</section>--%>

    <section id="standard">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading roboto fw-300"
                        style="color: purple!important;font-size: 25px;transform: scaleY(1.2);">STANDARDS &
                        PROTOCOLS</h2>
                </div>
            </div>
            <div class="row" style="margin-top: 35px;">
                <div class="col-lg-12">

                    <h3 class="roboto fw-400" style="color: #404040;">
                        Standards:
                    </h3>

                    <p class="roboto fw-300" style="font-size: 16px;">Standards are defined as an established norm or
                        requirement about systems. OISF works as a mediator
                        of different systems. It connects multiple
                        system and manages communication among them. So to communicate properly and fruitfully some
                        predefined standards need to be followed.
                        Otherwise system to system communication will be in jeopardy. Because of this OISF is
                        introducing some standards that every e-governance system must follow
                        to Integrate with other systems.
                    </p>
                    <h3 class="roboto fw-400" style="color: #404040;">Protocols:</h3>

                    <p class="roboto fw-300" style="font-size: 16px;">
                        Protocols are the special set of rules that end points in a telecommunication connection use
                        when they communicate.
                        Protocols specify interactions between the communicating entities.
                    </p>
                    <p class="roboto fw-300" style="font-size: 16px;">Protocols exist at several levels in a
                        telecommunication connection. For example, there are protocols for the
                        data interchange at the hardware device level and protocols for data interchange at the
                        application program level.
                        In the standards model known as Open Systems Interconnection (OSI), there are one or more
                        protocols at each layer in
                        the telecommunication exchange that both ends of the exchange must recognize and observe.
                        As System to System communication are managed by OISF. Some protocols need to be defined to
                        ensure secure data communications.</p>
                </div>
            </div>
        </div>

        <div class="container" id="standrardcontent" style="margin-bottom: 34px;">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 ">
                    <a href="<%=request.getContextPath()%>/portal/datastandard" style=" height: 377px;width: 356px;">
                        <img src="<%=request.getContextPath()%>/assets/portal/img/standard/BoxBG1.png"
                             style="width:100%;height: 100%; box-shadow: 5px 5px 10px lightgrey; ">

                        <div class="imageoverlaped">
                            <img src="<%=request.getContextPath()%>/assets/portal/img/standard/Data-Standerd.png"
                                 style="width: 100%;
    height: 100%;">
                            <div class="tag">
                                <h4 class="roboto-c fw-500"
                                    style="color:#1fbeff; top: 50%; position: absolute;transform: translateY(-50%);font-size: 20px;">
                                    Data
                                    Standards</h4>

                            </div>
                        </div>
                    </a>

                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="<%=request.getContextPath()%>/portal/intstandard" style=" height: 377px;width: 356px;">
                        <img src="<%=request.getContextPath()%>/assets/portal/img/standard/BoxBG2.png"
                             style="width:100%;height: 100%;box-shadow:  5px 5px  10px lightgrey">
                        <div class="imageoverlaped">
                            <img src="<%=request.getContextPath()%>/assets/portal/img/standard/Integration-Standards.png"
                                 style="width: 100%;
    height: 100%;">
                            <div class="tag">
                                <h4 class="roboto-c fw-500"
                                    style="color:#1fbeff; top: 50%; position: absolute;transform: translateY(-50%);font-size: 20px;">
                                    Integration Standards</h4>

                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-6 ">
                    <a href="<%=request.getContextPath()%>/portal/securitystandard"
                       style=" min-height: 300px;width: 356px;">
                        <img src="<%=request.getContextPath()%>/assets/portal/img/standard/BoxBG1.png"
                             style="width:100%;height: 100%;box-shadow:  5px 5px  10px lightgrey">
                        <div class="imageoverlaped">
                            <img src="<%=request.getContextPath()%>/assets/portal/img/standard/Security-Standards.png"
                                 style="width: 100%;
    height: 100%;">
                            <div class="tag">
                                <h4 class="roboto-c fw-500"
                                    style="color:#1fbeff; top: 50%; position: absolute;transform: translateY(-50%);font-size: 20px;">
                                    Security Standards</h4>

                            </div>
                        </div>
                    </a>
                </div>


                <div class="col-lg-4 col-md-4 col-sm-6  ">
                    <a href="<%=request.getContextPath()%>/portal/deploymentPolicy"
                       style=" height: 377px;width: 356px;">
                        <img src="<%=request.getContextPath()%>/assets/portal/img/standard/BoxBG2.png"
                             style="width:100%;height: 100%;box-shadow:  5px 5px  10px lightgrey">
                        <div class="imageoverlaped">
                            <img src="<%=request.getContextPath()%>/assets/portal/img/standard/Deployment-Standards.png"
                                 style="width: 100%;
    height: 100%;">
                            <div class="tag">
                                <h4 class="roboto-c fw-500"
                                    style="color:#1fbeff; top: 50%; position: absolute;transform: translateY(-50%);font-size: 20px;">
                                    Deployment Standards</h4>

                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-6 ">
                    <a href="<%=request.getContextPath()%>/portal/technologystandard"
                       style=" height: 377px;width: 356px;">
                        <img src="<%=request.getContextPath()%>/assets/portal/img/standard/BoxBG1.png"
                             style="width:100%;height: 100%;box-shadow:  5px 5px  10px lightgrey">
                        <div class="imageoverlaped">
                            <img src="<%=request.getContextPath()%>/assets/portal/img/standard/Data-Integrity-Policy.png"
                                 style="width: 100%;
    height: 100%;">
                            <div class="tag">
                                <h4 class="roboto-c fw-500"
                                    style="color:#1fbeff; top: 50%; position: absolute;transform: translateY(-50%);font-size: 20px;">
                                    Technology Standards</h4>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="<%=request.getContextPath()%>/portal/applicationstandard"
                       style=" height: 377px;width: 356px;">
                        <img src="<%=request.getContextPath()%>/assets/portal/img/standard/BoxBG2.png"
                             style="width:100%;height: 100%;box-shadow:  5px 5px  10px lightgrey">
                        <div class="imageoverlaped">
                            <img src="<%=request.getContextPath()%>/assets/portal/img/standard/Software-Architectural-Standard.png"
                                 style="width: 100%;
    height: 100%;">
                            <div class="tag">
                                <h4 class="roboto-c fw-500"
                                    style="color:#1fbeff; top: 50%; position: absolute;transform: translateY(-50%);font-size: 20px;">
                                    Application Standards</h4>
                            </div>
                        </div>
                    </a>
                </div>


                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="<%=request.getContextPath()%>/portal/biometricstandard" style=" height: 377px;width: 356px;">
                        <img src="<%=request.getContextPath()%>/assets/portal/img/standard/BoxBG1.png"
                             style="width:100%;height: 100%; box-shadow: 5px 5px 10px lightgrey;">

                        <div class="imageoverlaped">
                            <img src="<%=request.getContextPath()%>/assets/portal/img/standard/Data-Standerd.png"
                                 style="width: 100%;
    height: 100%;">
                            <div class="tag">
                                <h4 class="roboto-c fw-500"
                                    style="color:#1fbeff; top: 50%; position: absolute;transform: translateY(-50%);font-size: 20px;">
                                    Biometric Standards</h4>

                            </div>
                        </div>
                    </a>

                </div>
                <div class="col-lg-4 col-md-4 col-sm-6  ">
                    <a href="<%=request.getContextPath()%>/portal/paymentstandard" style=" height: 377px;width: 356px;">
                        <img src="<%=request.getContextPath()%>/assets/portal/img/standard/BoxBG2.png"
                             style="width:100%;height: 100%; box-shadow: 5px 5px 10px lightgrey;">

                        <div class="imageoverlaped">
                            <img src="<%=request.getContextPath()%>/assets/portal/img/standard/Data-Standerd.png"
                                 style="width: 100%;
    height: 100%;">
                            <div class="tag">
                                <h4 class="roboto-c fw-500"
                                    style="color:#1fbeff; top: 50%; position: absolute;transform: translateY(-50%);font-size: 20px;">
                                    Payment Standards</h4>

                            </div>
                        </div>
                    </a>

                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <a href="<%=request.getContextPath()%>/portal/ccdsstandard" style=" height: 377px;width: 356px;">
                        <img src="<%=request.getContextPath()%>/assets/portal/img/standard/BoxBG1.png"
                             style="width:100%;height: 100%; box-shadow: 5px 5px 10px lightgrey;">

                        <div class="imageoverlaped">
                            <img src="<%=request.getContextPath()%>/assets/portal/img/standard/Data-Standerd.png"
                                 style="width: 100%;
    height: 100%;">
                            <div class="tag">
                                <h4 class="roboto-c fw-500"
                                    style="color:#1fbeff; top: 50%; position: absolute;transform: translateY(-50%);font-size: 20px;">
                                    CCDS Standards</h4>

                            </div>
                        </div>
                    </a>

                </div>

            </div>
        </div>
    </section>

    <section id="service" style="min-height: 450px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading roboto fw-300"
                        style="color: purple!important; transform: scaleY(1.2);font-size: 25px;">SERVICES</h2>
                </div>
            </div>
            <div class="row" style="margin-top:15px;">
                <div class="col-lg-12 " style="margin: 20px 0px 10px 0px;">
                    <p class="roboto fw-300" style="font-size: 14px;">Office information and Service framework works as
                        a mediator for various e-governance solutions.
                        Via this framework various e-governance solution can use different services that is provided by
                        different e goverenance solutions.
                        For example 'citizen charter' can be provided whenever a solution need it on the fly.
                        There are two types of services that OISF will provide for other e-governance solution. They
                        are:
                    <ul style="margin-left: 0px;">
                        <li class="roboto fw-300">
                            Core Services
                        </li>
                        <li class="roboto fw-300">
                            Shared Services
                        </li>

                    </ul>
                    </p>

                </div>
            </div>

            <div class="row servicecontent">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                    <a href="<%=request.getContextPath()%>/portal/corelist" style="text-decoration: none">
                        <div class="middlecontainer">
                            <div class="middle">
                                <img src="<%=request.getContextPath()%>/assets/portal/img/service/Core-Services.png">
                            </div>
                            <div class="col-md-9 ">
                                <h4 class="roboto fw-400" style="font-size: 20px;">Core Service</h4>
                                <p class="roboto fw-300" style="font-size: 13px;">Core service is defined as the service
                                    that OISF owns and can provide those to other solution on the fly</p>
                                <%--<p class="roboto fw-300"></p>--%>
                                <%--<p class="roboto fw-300">/p>--%>
                                <%--<p class="roboto fw-300">to other solution on the fly</p>--%>

                            </div>
                        </div>
                    </a>

                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <a href="<%=request.getContextPath()%>/portal/sharedlist" style="text-decoration: none">
                        <div class="middlecontainer">
                            <div class="middle">
                                <img src="<%=request.getContextPath()%>/assets/portal/img/service/Share-Service.png">
                            </div>
                            <div class="col-md-9">
                                <h4 class="roboto fw-400" style="font-size: 20px;">Shared Service</h4>
                                <p class="roboto fw-300" style="font-size: 13px;">Shared service is defined
                                    as the service that other application will provide to a third party application via
                                    OISF.</p>
                                <%--<p class="roboto fw-300">Use a translation to move</p>--%>
                                <%--<p class="roboto fw-300">up by half its own height</p>--%>
                                <%--<p class="roboto fw-300">the height of the container.</p>--%>

                            </div>
                        </div>
                    </a>

                </div>

                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">

                    <a href="<%=request.getContextPath()%>/portal/serviceregistration" style="text-decoration: none">
                        <div class="middlecontainer">
                            <div class="middle">
                                <img src="<%=request.getContextPath()%>/assets/portal/img/service/Service-Registration.png">
                            </div>
                            <div class="col-md-9">
                                <h4 class="roboto fw-400" style="font-size: 20px;">Service Registration </h4>
                                <p class="roboto fw-300" style="font-size: 13px;">
                                    <%--it halfway down the Use a translation to move up by half its own height the height of the container.--%>
                                    To integrate any service with OISF firstly an application need to be registered then
                                    various services can be registered.
                                </p>
                                <%--<p class="roboto fw-300">Use a translation to move</p>--%>
                                <%--<p class="roboto fw-300">up by half its own height</p>--%>
                                <%--<p class="roboto fw-300">the height of the container.</p>--%>

                            </div>
                        </div>
                    </a>

                </div>

            </div>
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
    </section>

    <section id="feedback" style="background-color:#ffffff !important">
        <%--<section id="feedback" style="min-height: 900px;">--%>
        <%--<div class="container">--%>
            <%--<div class="row">--%>
                <%--<div class="col-lg-12 text-center">--%>
                    <%--<h2 class="section-heading roboto fw-300"--%>
                        <%--style="color: purple!important; transform: scaleY(1.2);font-size: 25px;">CONTACT</h2>--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--&lt;%&ndash;<form style="margin-top: 2%"  enctype="multipart/form-data" action="#">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<form style="margin-top: 2%" method="post" enctype="multipart/form-data" action="${context}/portal/feedback">&ndash;%&gt;--%>


            <%--<div class="form-group row">--%>
                <%--<label class=" col-md-3 control-label">Email Address<span class="required" aria-required="true"--%>
                                                                          <%--style="color: red"> * </span></label>--%>
            <%--</div>--%>
            <%--<div class="col-md-12">--%>
                <%--<input type="text" data-required="1" class="form-control" placeholder="Email Address"--%>
                       <%--name="email">--%>
            <%--</div>--%>
            <%--<br/>--%>


            <%--<div class="form-group row">--%>
                <%--<label class=" col-md-3 control-label">Subject<span class="required" aria-required="true"--%>
                                                                    <%--style="color: red"> * </span></label>--%>
            <%--</div>--%>
            <%--<div class="col-md-12">--%>
                <%--<input type="text" data-required="1" class="form-control" placeholder="Subject"--%>
                       <%--name="subject">--%>
            <%--</div>--%>
            <%--<br/>--%>


            <%--<div class="form-group row">--%>
                <%--<label class=" col-md-3 control-label">Message--%>
                    <%--<span class="required" aria-required="true" style="color: red"> * </span>--%>
                <%--</label>--%>

            <%--</div>--%>
            <%--<div class="col-md-12">--%>


                <%--&lt;%&ndash;<input type="text" data-required="1" class="form-control" placeholder="Your Feedback" style="height:200px"&ndash;%&gt;--%>
                <%--&lt;%&ndash;name="appnamebng">&ndash;%&gt;--%>
                <%--<textarea id="message" name="message" placeholder="Message" style="height:200px;width:100%"></textarea>--%>
            <%--</div>--%>


            <%--&lt;%&ndash;<div class="form-group row">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<label class=" col-md-3 control-label">Application URL <span class="required" aria-required="true"&ndash;%&gt;--%>
            <%--&lt;%&ndash;style="color: red"> * </span></label>&ndash;%&gt;--%>

            <%--&lt;%&ndash;<div class="col-md-9">&ndash;%&gt;--%>


            <%--&lt;%&ndash;<input type="text" class="form-control" placeholder="Url" name="link">&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>


            <%--&lt;%&ndash;<div class="form-group row">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<label class=" col-md-3 control-label">Redirect URL <span class="required" aria-required="true"&ndash;%&gt;--%>
            <%--&lt;%&ndash;style="color: red"> * </span></label>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-md-9">&ndash;%&gt;--%>

            <%--&lt;%&ndash;<input type="text" class="form-control" placeholder="redirect url" name="redirect_url">&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="form-group row">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<label class=" col-md-3 control-label">IDP Postback URL <span class="required" aria-required="true"&ndash;%&gt;--%>
            <%--&lt;%&ndash;style="color: red"> * </span></label>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-md-9">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="input-icon">&ndash;%&gt;--%>

            <%--&lt;%&ndash;<input type="text" class="form-control" placeholder="IDP Postback URL" name="idp_url">&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>


            <%--&lt;%&ndash;<div class="form-group row">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<label class="col-md-3 control-label">Mobile No</label>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-md-9">&ndash;%&gt;--%>

            <%--&lt;%&ndash;<input type="text" class="form-control" placeholder="Mobile No"&ndash;%&gt;--%>
            <%--&lt;%&ndash;name="mobile" data-required="true"></div>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--&lt;%&ndash;<div class="form-group row">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<label class="col-md-3 control-label">Email Address <span class="required" aria-required="true"&ndash;%&gt;--%>
            <%--&lt;%&ndash;style="color: red"> * </span></label>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-md-9">&ndash;%&gt;--%>


            <%--&lt;%&ndash;<input type="text" class="form-control" placeholder="Email Address"&ndash;%&gt;--%>
            <%--&lt;%&ndash;name="email"></div>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>


            <%--&lt;%&ndash;<div class="form-group row">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<label class="col-md-3 control-label">Notification Mechanism</label>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-md-9">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<select class="form-control" name="mechanism">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<option value="0">Email</option>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<option value="1">SMS</option>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</select>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--&lt;%&ndash;<div class="form-group row ">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<label class="control-label col-md-3">Application Icon</label>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-md-9">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="fileinput fileinput-new" data-provides="fileinput">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="fileinput-preview thumbnail" data-trigger="fileinput"&ndash;%&gt;--%>
            <%--&lt;%&ndash;style="width: 200px; height: 150px; line-height: 150px;"></div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<span class="btn red btn-outline btn-file">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<span class="fileinput-new"> Select image </span>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<span class="fileinput-exists"> Change </span>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<input type="hidden" value="" name="...">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<input type="file" name="file"> </span>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput">&ndash;%&gt;--%>
            <%--&lt;%&ndash;Remove </a>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--<div class="form-actions">--%>
                <%--<div class="row">--%>
                    <%--<div class="col-md-offset-9 col-md-9 " style="margin-left: 45%">--%>
                        <%--&lt;%&ndash;<button type="submit" class="btn btn-default">Submit</button>&ndash;%&gt;--%>
                        <%--<button type="button" class="btn btn-primary pull-righ">Submit</button>--%>
                        <%--&lt;%&ndash;<button type="button" class="btn btn-danger">Cancel</button>&ndash;%&gt;--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--&lt;%&ndash;</form>&ndash;%&gt;--%>

            <%--&lt;%&ndash;&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="row">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-lg-12 text-center">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<h2 class="section-heading roboto fw-300" style="color: purple!important; transform: scaleY(1.2);font-size: 25px;">SERVICES</h2>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="row" style="margin-top: 50px;">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div  class="col-lg-12 " style="margin: 20px 0px 10px 0px;">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<p  class="roboto fw-300" style="font-size: 14px;">Office information and Service framework works as a mediator for various e-governance solutions.&ndash;%&gt;--%>
            <%--&lt;%&ndash;Via this framework various e-governance solution can use different services that is provided by&ndash;%&gt;--%>
            <%--&lt;%&ndash;different e goverenance solutions.&ndash;%&gt;--%>
            <%--&lt;%&ndash;For example 'citizen charter' can be provided whenever a solution need it on the fly.&ndash;%&gt;--%>
            <%--&lt;%&ndash;There are 2 tipes of services that OISF will provide for other e-governance solution. they are&ndash;%&gt;--%>
            <%--&lt;%&ndash;<ul style="margin-left: -23px;">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="roboto fw-300">&ndash;%&gt;--%>
            <%--&lt;%&ndash;Core Services&ndash;%&gt;--%>
            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="roboto fw-300">&ndash;%&gt;--%>
            <%--&lt;%&ndash;Shared Services&ndash;%&gt;--%>
            <%--&lt;%&ndash;</li>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</p>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="row servicecontent">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<a href="<%=request.getContextPath()%>/portal/corelist" style="text-decoration: none">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="middlecontainer">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="middle">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<img src="<%=request.getContextPath()%>/assets/portal/img/service/Core-Services.png">&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-md-9 ">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<h4  class="roboto fw-400" style="font-size: 20px;">Core Service</h4>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<p class="roboto fw-300" style="font-size: 13px;">Core service is defined as the service that OISF owns and can provide those to other solution on the fly</p>&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<p class="roboto fw-300"></p>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<p class="roboto fw-300">/p>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<p class="roboto fw-300">to other solution on the fly</p>&ndash;%&gt;&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</a>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<a href="<%=request.getContextPath()%>/portal/sharedlist" style="text-decoration: none">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="middlecontainer">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="middle">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<img src="<%=request.getContextPath()%>/assets/portal/img/service/Share-Service.png">&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-md-9">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<h4 class="roboto fw-400" style="font-size: 20px;">Shared Service</h4>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<p class="roboto fw-300" style="font-size: 13px;">Shared service is defined Use a translation to move up by half its own height the height of the container.</p>&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<p class="roboto fw-300">Use a translation to move</p>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<p class="roboto fw-300">up by half its own height</p>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<p class="roboto fw-300">the height of the container.</p>&ndash;%&gt;&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</a>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--&lt;%&ndash;<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">&ndash;%&gt;--%>

            <%--&lt;%&ndash;<a href="<%=request.getContextPath()%>/portal/serviceregistration" style="text-decoration: none">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="middlecontainer">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="middle">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<img src="<%=request.getContextPath()%>/assets/portal/img/service/Service-Registration.png">&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="col-md-9">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<h4  class="roboto fw-400" style="font-size: 20px;">Service Registration </h4>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<p class="roboto fw-300" style="font-size: 13px;">it halfway down the Use a translation to move up by half its own height the height of the container.</p>&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<p class="roboto fw-300">Use a translation to move</p>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<p class="roboto fw-300">up by half its own height</p>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<p class="roboto fw-300">the height of the container.</p>&ndash;%&gt;&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</a>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--<!--<div class="row servicecontent" style="margin-top:50px;">--%>
                <%--<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 middlecontainer">--%>

                <%--<div class = "middle">--%>
                    <%--<img src="img/service/Blank-Circle.png">--%>
                <%--</div>--%>
                <%--<div class = "col-md-9">--%>
                    <%--<h4>Core Service</h4>--%>
                    <%--<p>it halfway down the</p>--%>
                    <%--<p>Use a translation to move</p>--%>
                    <%--<p>up by half its own height</p>--%>
                    <%--<p>the height of the container.</p>--%>

                <%--</div>--%>

              <%--</div>--%>
              <%--<div class="col-lg-4 col-md-4 middlecontainer">--%>

                <%--<div class = "middle">--%>
                    <%--<img src="img/service/Blank-Circle.png">--%>
                <%--</div>--%>
                <%--<div class = "col-md-9">--%>
                    <%--<h4><a href="<%=request.getContextPath()%>/portal/sharedlist">Shared Service</a></h4>--%>
                    <%--<p>Shared service is defined</p>--%>
                    <%--<p>as the service OISF does not own</p>--%>
                    <%--<p>and that is provided by </p>--%>
                    <%--<p>other e-governance solutions.</p>--%>

                <%--</div>--%>

              <%--</div>--%>

              <%--<div class="col-lg-4 col-md-4 middlecontainer">--%>

                <%--<div class = "middle">--%>
                    <%--<img src="img/service/Blank-Circle.png">--%>
                <%--</div>--%>
                <%--<div class = "col-md-9">--%>
                    <%--<h4>Service Registration</h4>--%>
                    <%--<p>The detail process </p>--%>
                    <%--<p>and workflow of registering</p>--%>
                    <%--<p>a service is briefly</p>--%>
                    <%--<p>described on this section</p>--%>

                <%--</div>--%>

              <%--</div>--%>
            <%--</div>-->--%>

        <%--</div>--%>
    </section>


    <%--<section id="contact" style="background-color:#F1F5F8 !important">--%>
    <%--<div class="container" >--%>
    <%--<div class=" footer page-footer-custom " style="/*margin-right:2%;margin-left:2%;*/">--%>

    <%--<div class="row" style="padding-top: 10px;">--%>
    <%--<div class="col-md-3">--%>
    <%--<ul class=" text-left">--%>
    <%--<h4 class="roboto-c fw-400" style=" border-bottom: none ;padding-bottom: 5px; color: purple!important; font-size: 22px;">--%>
    <%--CONTACTS</h4>--%>


    <%--<a href="#">--%>
    <%--<li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Condition for Use</li>--%>
    <%--</a>--%>
    <%--<a href="#">--%>
    <%--<li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">In Cooperation With</li>--%>
    <%--</a>--%>
    <%--<a href="#">--%>
    <%--<li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Contact</li>--%>
    <%--</a>--%>
    <%--<a href="#">--%>
    <%--<li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Site Map</li>--%>
    <%--</a>--%>
    <%--</ul>--%>
    <%--</div>--%>

    <%--<div class="col-md-3">--%>
    <%--<ul class=" text-left">--%>
    <%--<h4 class="roboto-c fw-400" style=" border-bottom: none ;padding-bottom: 5px; color: purple!important; font-size: 22px;">--%>
    <%--IMPORTANT LINKS</h4>--%>
    <%--<a href="http://www.bangabhaban.gov.bd/">--%>
    <%--<li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">President's Office</li>--%>
    <%--</a>--%>
    <%--<a href="http://www.pmo.gov.bd">--%>
    <%--<li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Prime Minister's Office</li>--%>
    <%--</a>--%>
    <%--<a href="http://www.mopa.gov.bd">--%>
    <%--<li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Ministry of Public Administration</li>--%>
    <%--</a>--%>
    <%--<a href="http://www.infokosh.gov.bd/">--%>
    <%--<li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">E-Information Cell</li>--%>
    <%--</a>--%>
    <%--<a href="http://a2i.pmo.gov.bd/">--%>
    <%--<li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">a2i Programme</li>--%>
    <%--</a>--%>
    <%--</ul>--%>
    <%--</div>--%>

    <%--<div class="col-md-3">--%>
    <%--<ul class="fa-ul text-left">--%>
    <%--<h4 class="roboto-c fw-400" style=" border-bottom: none ;padding-bottom: 5px; color: purple!important; font-size: 22px;">--%>
    <%--SOCIAL NETWORK</h4>--%>
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
    <%--<h4 class="roboto-c fw-400" style=" border-bottom: none ;padding-bottom: 5px; color: purple!important; font-size: 22px;">PLANNING AND IMPLEMENTATION</h4>--%>
    <%--<div class="logo_a2i" style="margin-top:5%; margin-left:150px">--%>
    <%--<a href="http://a2i.pmo.gov.bd/">--%>
    <%--<img src="<%=request.getContextPath()%>/assets/portal/img/logo/a2i.png" width="41"--%>
    <%--height="45" style="margin-right:  10px;">--%>
    <%--<img src="<%=request.getContextPath()%>/assets/portal/img/logo/bd_gov.png" width="41"--%>
    <%--height="45">--%>
    <%--</a>--%>

    <%--</div>--%>

    <%--<div class="copy-right-title" style="margin-top:5%;">--%>
    <%--<p  class="roboto fw-300" style="font-size: 10px;">--%>
    <%--Copyrights © 2018 All Rights Reserved<br>--%>
    <%--Government of the People's Republic of Bangladesh</p>--%>
    <%--</div>--%>

    <%--</div>--%>
    <%--<!-- end of row -->--%>
    <%--</div>--%>

    <%--<!-- end of container -->--%>
    <%--</div>--%>
    <%--</div>--%>

    <%--<div style="height:45px;background-color:#9698C8">--%>

    <%--</div>--%>

    <%--</section>--%>

    <section id="contact" style="background-color:#F1F5F8 !important">
        <div class="container">
            <div class=" footer page-footer-custom " style="/*margin-right:2%;margin-left:2%;*/">

                <div class="row" style="padding-top: 10px;">
                    <div class="col-md-3">
                        <ul class=" text-left">
                            <h4 class="roboto-c fw-400"
                                style=" border-bottom: none ;padding-bottom: 5px; color: purple!important; font-size: 22px;">
                                CONTACTS</h4>

                            <%--<a href="http://www.doptor.gov.bd" target="_blank">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Login</li>
                            </a>--%>
                            <a href="#">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Condition for
                                    Use
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

                    <div class="col-md-6">
                        <ul class=" text-left">
                            <h4 class="roboto-c fw-400"
                                style=" border-bottom: none ;padding-bottom: 5px; color: purple!important; font-size: 22px;">
                                IMPORTANT LINKS</h4>

                            <a href="http://www.pmo.gov.bd">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Prime
                                    Minister's Office
                                </li>
                            </a>
                            <a href="http://www.cabinet.gov.bd/">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Cabinet
                                    Division
                                </li>
                            </a>
                            <a href="http://www.ptd.gov.bd/">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;"> Ministry of
                                    Post,Telecommunication
                                </li>
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;"> and
                                    Information Technology
                                </li>
                            </a>
                            <a href="http://a2i.pmo.gov.bd/">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">a2i Programme
                                </li>
                            </a>
                            <a href="http://doptor.gov.bd">
                                <li class="roboto fw-300" style="font-size: 14px;list-style-type: none;">Doptor Login
                                </li>
                            </a>
                        </ul>
                    </div>


                    <div class="col-md-3"
                         style="display: flex;flex-direction: column;justify-content: center;align-items: center;">

                        <div class="logo_a2i" style="margin-top:5%;">
                            <div class="logo_a2i" style="margin-top:5%;">
                                <img src="/assets/portal/img/logo/a2i.png" width="41"
                                     height="41" width="41" style="margin-right:  10px;">
                                <img src="/assets/portal/img/logo/bd_gov.png" width="41"
                                     height="41" width="41">

                                <%--<img src="<%=request.getContextPath()%>/assets/portal/img/logo/a2i.png" width="41"
                                     height="45" style="margin-top:5%;">
                                <img src="<%=request.getContextPath()%>/assets/portal/img/logo/bd_gov.png" width="41"
                                     height="45">
    --%>
                            </div>

                            <div class="copy-right-title" style="margin-top:5%;">
                                <p class="roboto fw-300" style="font-size: 10px;">
                                    Copyrights &copy; 2018 All Rights Reserved<br>
                                    Government of the People's Republic of Bangladesh</p>
                            </div>

                        </div>
                        <!-- end of row -->
                    </div>

                    <!-- end of container -->
                </div>
            </div>


        </div>

    </section>
    <div style="height:45px;background-color:#9698C8">
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath()%>/assets/js/portal/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/portal/bootstrap.bundle.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/portal/jquery.easing.min.js"></script>

    <script>


        var HIGH = 1;
        var LOW = 0;
        var priority = -1;

        function activenavitem($selector) {
            var downarrow = '';
            $('#navbarResponsive > ul > li > a > div >i').remove();
            $('#navbarResponsive > ul > li > a > div > div').css('min-height', 0);
            $selector.append(downarrow);
//        $('div',$selector).css('min-height',$('#mainNav').height()-$('#mainNav').height()*.53);
            $('div', $selector).css('min-height', 20);
        }

        function applyforactivate() {
            if (priority == HIGH) {
                var $selector = $('#navbarResponsive > ul > li:nth-child(1) > a > div');
                activenavitem($selector);
            }
            else if (priority == LOW) {
                var $selector = $('#navbarResponsive > ul > li > a.active > div');
                activenavitem($selector);
            }
            else {
                var $selector = $('#navbarResponsive > ul > li:nth-child(1) > a > div');
                activenavitem($selector);
                var linkpart = window.location.hash;
                var link = (linkpart != '') ? linkpart : 'home';
                $('html,body').animate({scrollTop: ($(link).offset().top - 74)}, 'slow');
            }
        }

        function controlScrollAndActivation() {
            // Collapse Navbar
            var navbarCollapse = function (document) {
                if ($("#mainNav").offset().top > 74) {
                    // $("#mainNav").addStyle("background-color","#fff");
                } else {
                    //  $("#mainNav").addStyle("background-color","transparent");
                    $('#navbarResponsive > ul > li > a > i').remove();
                }

            };


            // Collapse the navbar when page is scrolled
            $(document).scroll(function (event, ex) {
                navbarCollapse($(this));
            });

            // Activate scrollspy to add active class to navbar items on scroll
            $('body').scrollspy({
                target: '#mainNav',
                offset: 500
            });
            $(window).on('activate.bs.scrollspy', function () {
                applyforactivate();
            });


            $('#navbarResponsive > ul > li:nth-child(1) > a').click(function () {
//            var link = $(this).attr('href');
//            $('html,body').animate({scrollTop: ($(link).offset().top - 140)},'slow');
                applyforactivate();
            });

            $(document).scroll(function () {
                var doc = $(document);
                var win = $(window);
                var docTop = doc.scrollTop();
                var winheight = window.innerHeight;

                var scrollposition = (docTop < winheight) ? docTop : (docTop + winheight);
                if (scrollposition < 120) {
                    priority = HIGH;
                    applyforactivate();
                } else {
                    priority = LOW;
                    applyforactivate();
                }

            });

            applyforactivate();
        }

        function controllScroll() {
            // Smooth scrolling using jQuery easing
            $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function () {
                if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                    var target = $(this.hash);
                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                    if (target.length) {
                        $('html, body').animate({
                            scrollTop: (target.offset().top - 74)
                        }, 1000, "easeInOutExpo");
                        $('a.js-scroll-trigger[href*="#"]:not([href="#"])').removeClass('active');
                        $(this).addClass('active');
                        return false;
                    }
                }
            });
        }

        $(document).ready(function () {


            controllScroll();
            controlScrollAndActivation();

        });
    </script>
</body>

</html>

