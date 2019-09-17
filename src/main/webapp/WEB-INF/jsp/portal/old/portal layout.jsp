<%--
  Created by IntelliJ IDEA.
  User: reve
  Date: 1/29/2018
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Creative - Start Bootstrap Theme</title>

    <%--<%@ include file="../includes/head.jsp" %>--%>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/assets/css/portal/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <%--<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">--%>
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">

    <!-- Plugin CSS <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"> -->


    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/assets/css/portal/creative.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css" type="text/css"/>
    <style>

        *{
            font-family:'Roboto Condensed', sans-serif;
        }
        a {
            color: black;
        }


        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            font-family: 'Roboto Condensed', sans-serif;
            color:black;
        }
        p{
            color:black;
        }

    </style>

</head>

<body id="page-top">

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
    <div class="container">
        <img src="<%=request.getContextPath()%>/assets/portal/img/logo/logosmall.png"/>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#about" style="color:purple;">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#standard" style="color:purple;">Standard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#service" style="color:purple;">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#contact" style="color:purple;">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container" style="margin-top: 74px">



</div>

<div id="footer">
    <div style="background-color:#F2F2F2">
        <div class=" footer page-footer-custom " style="margin-right:2%;margin-left:2%;">

            <div class="row" style="padding-top: 10px;">
                <div class="col-md-3">
                    <ul class="fa-ul text-left">
                        <h4 style=" border-bottom: 1px solid ;padding-bottom: 5px;"><b>Home</b></h4>


                        <a href="#">
                            <li>Condition for Use</li>
                        </a>
                        <a href="#">
                            <li>In Cooperation With</li>
                        </a>
                        <a href="#">
                            <li>Contact</li>
                        </a>
                        <a href="#">
                            <li>Site Map</li>
                        </a>
                    </ul>
                </div>

                <div class="col-md-3">
                    <ul class="fa-ul text-left">
                        <h4 style=" border-bottom: 1px solid ;padding-bottom: 5px;"><b>Important Links</b></h4>
                        <a href="http://www.bangabhaban.gov.bd/">
                            <li>President's Office</li>
                        </a>
                        <a href="http://www.pmo.gov.bd">
                            <li>Prime Minister's Office</li>
                        </a>
                        <a href="http://www.mopa.gov.bd">
                            <li>Ministry of Public Administration</li>
                        </a>
                        <a href="http://www.infokosh.gov.bd/">
                            <li>E-Information Cell</li>
                        </a>
                        <a href="http://a2i.pmo.gov.bd/">
                            <li>a2i Programme</li>
                        </a>
                    </ul>
                </div>

                <div class="col-md-3">
                    <ul class="fa-ul text-left" style="margin-left:0px;">
                        <h4 style=" border-bottom: 1px solid ;padding-bottom: 5px;"><b>Social</b></h4>
                        <a href="https://www.fb.com"><span class="fa-stack fa-sm">
							<i class="fa fa-circle fa-stack-2x" style=""></i>
							<i class="fa fa-facebook fa-stack-1x fa-inverse" style="background-color:  royalblue;border-radius: 20px;"></i>
						</span></a>
                        <a href="https://plus.google.com"><span class="fa-stack fa-sm">
							<i class="fa fa-circle fa-stack-2x"></i>
							<i class="fa fa-google-plus fa-stack-1x fa-inverse" style="background-color:  #DB5246;border-radius:  20px;"></i>
						</span></a>
                        <a href="https://twitter.com"><span class="fa-stack fa-sm">
							<i class="fa fa-circle fa-stack-2x"></i>
							<i class="fa fa-twitter fa-stack-1x fa-inverse" style="background-color:  #28AAE1;border-radius: 20px;"></i>
						</span></a>
                        <a href="https://www.youtube.com"><span class="fa-stack fa-sm">
							<i class="fa fa-circle fa-stack-2x"></i>
							<i class="fa fa-youtube fa-stack-1x fa-inverse" style="background-color: #ad1926;color: black;border-radius:  20px;"></i>
						</span></a>


                    </ul>
                </div>
                <div class="col-md-3">
                    <h4 style=" border-bottom: 1px solid;padding-bottom: 5px;"><b>Planning and Implementation</b></h4>
                    <div class="logo_a2i" style="margin-top:5%; margin-left:180px">
                        <a href="http://a2i.pmo.gov.bd/">
                            <img src="<%=request.getContextPath()%>/assets/portal/img/logo/a2i.png" width="41" height="45" style="margin-right:  10px;">
                            <img src="<%=request.getContextPath()%>/assets/portal/img/logo/bd_gov.png" width="41" height="45">
                        </a>

                    </div>

                    <div class="copy-right-title" style="margin-top:5%;">
                        <p style="font-size: 11px">
                            Copyrights © 2017 All Rights Reserved<br>
                            Government of the People's Republic of Bangladesh</p>
                    </div>

                </div>
                <!-- end of row -->
            </div>

            <!-- end of container -->
        </div>
    </div>

    <div style="height:40px;background-color:#9698C8">



    </div>
</div>

<!-- Bootstrap core JavaScript -->
<script src="<%=request.getContextPath()%>/assets/js/portal/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/portal/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/js/portal/jquery.easing.min.js"></script>

<%--<%@ include file="../includes/includes.jsp" %>--%>


<script>

    var scrollLimitTracker = [];
    $(document).ready(function(){

        // Collapse Navbar
        var navbarCollapse = function(document) {
            if ($("#mainNav").offset().top > 100) {
                $("#mainNav").addClass("navbar-shrink");
            } else {
                $("#mainNav").removeClass("navbar-shrink");
                $('#navbarResponsive > ul > li > a > i').remove();
            }

        };


    });
</script>
</body>

</html>

