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
    <style>

        * {
            font-family: 'Roboto Condensed', sans-serif;
        }
        a {
            color: black;
        }

        #mainNav{
            height:8%;
            position: fixed;
            background-color: #fff;
        }

        #contact{
            padding:0px !important;
            padding-top:5px !important;
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            font-family: 'Roboto Condensed', sans-serif!important;
            color:black !important;
            border: none !important;
            font-weight:lighter!important;
        }
        p{
            color:black;
        }
        body{
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        #datatable_paginate > ul > li.paginate_button.page-item > a{
            color: black;
        }
        #datatable_paginate > ul > li.active > a, .pagination > li.active > span{
            background-color: lightgrey;
            border: darkgrey solid 1px;
        }
    </style>

</head>

<body id="page-top">

<!-- Navigation -->
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
    <div class="container">
        <img src="<%=request.getContextPath()%>/assets/portal/img/logo/logosmall.png" width="8%" height="8%"/>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal#about" style="color:purple;">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal#standard" style="color:purple;">Standard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="<%=request.getContextPath()%>/portal#service" style="color:purple;">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link js-scroll-trigger" href="#contact" style="color:purple;">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="mydiv" style="margin-top: 6%;margin-bottom: 2%">

</div>

<section id="contact">
    <div style="background-color:#F1F5F8 !important">
        <div class=" footer page-footer-custom " style="margin-right:2%;margin-left:2%;">

            <div class="row" style="padding-top: 10px;">
                <div class="col-md-3">
                    <ul class="fa-ul text-left">
                        <h4 style=" border-bottom: 1px solid ;padding-bottom: 5px; color: purple!important;"><b>Home</b></h4>


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
                        <h4 style=" border-bottom: 1px solid ;padding-bottom: 5px;color: purple!important;"><b>Important Links</b></h4>
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
                        <h4 style=" border-bottom: 1px solid ;padding-bottom: 5px;color: purple!important;"><b>Social</b></h4>
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
							<i class="fa fa-youtube fa-stack-1x fa-inverse" style="background-color: #ad1926;color: white;border-radius:  20px;"></i>
						</span></a>


                    </ul>
                </div>
                <div class="col-md-3">
                    <h4 style=" border-bottom: 1px solid;padding-bottom: 5px;color: purple!important;"><b>Planning and Implementation</b></h4>
                    <div class="logo_a2i" style="margin-top:5%; margin-left:180px">
                        <a href="http://a2i.pmo.gov.bd/">
                            <img src="/assets/portal/img/logo/a2i.png" width="41" height="45" style="margin-right:  10px;">
                            <img src="/assets/portal/img/logo/bd_gov.png" width="41" height="45">
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

    <div style="height:20px;background-color:#9698C8">

    </div>

</section>

<!-- Bootstrap core JavaScript -->
<script src="<%=request.getContextPath()%>/assets/js/portal/jquery.min.js"></script>
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

