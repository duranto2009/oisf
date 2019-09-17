<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title> Office Information and Service Framework (OISF) </title>
    <%@ include file="../includes/head.jsp" %>

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/admin/pages/css/tasks.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/portal/portal.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/menu.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/img/favicon.ico" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <%--<link href="<%=request.getContextPath()%>/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />--%>
    <!-- BEGIN PAGE STYLES -->
    <%--<link rel="preload" as="style" onload="this.rel='stylesheet'" href="<%=request.getContextPath()%>/assets/admin/pages/css/tasks.css"/>--%>


    <%--<link rel="preload" as="style" onload="this.rel='stylesheet'" href="<%=request.getContextPath()%>/assets/css/menu.css">--%>
    <%--<link rel="preload" as="style" onload="this.rel='stylesheet'" href="<%=request.getContextPath()%>/assets/css/portal/portal.css"/>--%>

    <%--<link href="<%=request.getContextPath()%>/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />--%>

    <%--<!-- END PAGE STYLES -->--%>
    <%--<link rel="preload" as="style" onload="this.rel='stylesheet'" href="<%=request.getContextPath()%>/assets/css/style.css"/>--%>
    <%--<link rel="preload" as="style" onload="this.rel='stylesheet'"--%>
    <%--href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>



</head>



<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed">

<div>
    <div class="topbar navbar-fixed-top-" id="myDIV1"></div>
    <div id="example1">
        <%--<div class="page-header md-shadow-z-1-i navbar navbar-fixed-top">--%>
        <%--<%@ include file="../includes/header.jsp"%>--%>
        <%--</div>--%>

        <div class="container inner_wrapper">
            <div class=" navbar navbar-relative ">
                <div class="topbar"></div>
                <div class="container">
                    <!-- nav -->
                    <nav class="navbar navbar-defaut"
                         style="background-color: white;margin-left: -20px;margin-top: 10px; margin-right: 10px;">
                        <div class="container-menu">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="#"><img src="<%=request.getContextPath()%>/static/assets/img/Logo-small.png"
                                                                      style="max-width: 100%; margin-top: -28px"></a>
                            </div>

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="<%=request.getContextPath()%>/portal">Standard</a></li>
                                    <li class="dropdown ">
                                        <a href="#" class="dropdown-toggle"
                                           data-toggle="dropdown">Services<span
                                                class="caret"></span></a>
                                        <ul class="dropdown-menu " style="background-color:
                                         rgb(252, 248, 227); color: rgb(51, 122, 183); border-color: rgba(0, 255, 255, 0.3); display: none;">

                                            <li class="dropdown-header">
                                                <a href="http://a2i.pmo.gov.bd/" target="_blank">Core Services</a></li>

                                            <li class="dropdown-header">
                                                <a href="http://www.nothi.gov.bd/users/sslLogin" target="_blank">Shared Services</a>
                                            </li>

                                        </ul>
                                    </li>


                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">About<span
                                                class="caret"></span></a>
                                        <ul class="dropdown-menu"
                                            style="background-color: rgb(252, 248, 227); color: rgb(51, 122, 183); border-color: rgba(0, 255, 255, 0.3); display: none;">
                                            <li><a href="#">Terms & Conditions</a></li>
                                            <li><a href="#">Help</a></li>
                                        </ul>
                                    </li>

                                </ul>
                            </div>
                            <!-- /.navbar-collapse -->
                        </div>
                        <!-- /.container-fluid -->
                    </nav>
                    <!-- end of nav -->
                </div>
            </div>

            <div class="">


                <div class=" page-container all_info" style="background-color: white">


                    <div class="portlet box red">
                        <div class="portlet-body">
                            <div class="mt-element-list">
                                <div class="mt-list-head list-default green-haze">
                                    <div class="row">
                                        <div class="col-xs-8">
                                            <div class="list-head-title-container">
                                                <h3 class="list-title  sbold">Services List</h3>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="mt-list-container list-default">

                                    <ul class="list-default">

                                        <%--<c:set var="url" value="servicelist"+></c:set>--%>

                                        <c:forEach var="data" items="${services}">
                                            <li class="mt-list-item"><a href="<%=request.getContextPath()%>/portal/servicedbstandard/${data.getServiceId()}">
                                                    ${data.getNameEng()}
                                            </a>
                                            </li>
                                        </c:forEach>


                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>


    </div>
</div>



<div>
    <div id="myDIV">

        <div class=" footer ">
            <div class="container">
                <div class="row">
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
                        <ul class="fa-ul text-left">
                            <h4 style=" border-bottom: 1px solid ;padding-bottom: 5px;"><b>Social</b></h4>
                            <span class="fa-stack fa-sm">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                </span><span class="fa-stack fa-sm">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                </span>
                            <span class="fa-stack fa-sm">
                  <i class="fa fa-circle fa-stack-2x"></i>
                  <i class="fa fa-google-plus fa-stack-1x fa-inverse"></i>
                </span>
                        </ul>
                    </div>
                    <div class="col-md-3" >
                        <h4 style=" border-bottom: 1px solid;padding-bottom: 5px;"><b>Planning and Implementation</b></h4>
                        <div class="logo_a2i">
                            <a href="http://a2i.pmo.gov.bd/">
                                <img src="<%=request.getContextPath()%>/assets/img/a2i.png" width="41" height="45">
                                <img src="<%=request.getContextPath()%>/assets/img/bd_gov.png" width="41" height="45">
                            </a>

                        </div>

                        <div class="copy-right-title">
                            <p style="font-size: 11px">
                                Copyrights © 2017 All Rights Reserved<br>
                                Government of the People's Republic of Bangladesh</p>
                        </div>

                    </div>


                </div>
                <!-- end of row -->
            </div>

            <!-- end of container -->
        </div>
        <div class="footer-bottom"></div>
        <div align="right">
            <a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button"
               title=""
               data-toggle="tooltip" data-placement="left" data-original-title=""
               style="display: inline;"><span class="fa fa-chevron-circle-up"></span></a>
        </div>
    </div>
    <!-- END FOOTER -->
    <script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <%@ include file="../includes/includes.jsp" %>


    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/portal/portal.js"></script>
    <%--<link rel="preload" as="style" onload="this.rel='stylesheet'" href="<%=request.getContextPath()%>/assets/css/portal/item.css"/>--%>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/portal/item.css" type="text/css"/>
</div>

<style type="text/css">


    .footer h4 {
        border-bottom: 1px solid #bebebe;
        padding-bottom: 5px;
    }

    @media (min-width: 1260px) {
        /* 1200px */
        .container {
            width: 1050px;
        }
    }
</style>
<script>

    $(document).ready(function () {

//        $("#dropdownDiv").;
        $('body').show();


    });
</script>


</div>


</body>

</html>