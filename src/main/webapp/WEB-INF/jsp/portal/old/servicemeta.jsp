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
    <%--<link href="<%=request.getContextPath()%>/assets/global/css/components.min.css" rel="stylesheet"  type="text/css" />--%>
    <!-- BEGIN PAGE STYLES -->
    <%--<link rel="preload" as="style" onload="this.rel='stylesheet'"--%>
          <%--href="<%=request.getContextPath()%>/assets/admin/pages/css/tasks.css"/>--%>


    <%--<link rel="preload" as="style" onload="this.rel='stylesheet'"--%>
          <%--href="<%=request.getContextPath()%>/assets/css/menu.css">--%>
    <%--<link rel="preload" as="style" onload="this.rel='stylesheet'"--%>
          <%--href="<%=request.getContextPath()%>/assets/css/portal/portal.css"/>--%>

    <%--<link href="<%=request.getContextPath()%>/assets/global/css/components.min.css" rel="stylesheet"--%>
          <%--id="style_components" type="text/css"/>--%>

    <%--<!-- END PAGE STYLES -->--%>
    <%--<link rel="preload" as="style" onload="this.rel='stylesheet'" href="/assets/css/style.css"/>--%>
    <%--<link rel="preload" as="style" onload="this.rel='stylesheet'"--%>
          <%--href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>

    <style type="text/css">
        a {
            text-shadow: none;
            color: #337ab7;
            size: 16px;
        }

        /*.green-haze{*/
        /*background-color: #44b6ae;*/
        /*color: #FFF;*/
        /*}*/
        .font-green {
             color: white !important;
        }
        table {
            white-space: normal !important;
            line-height: normal !important;
            font-weight: normal !important;
            font-size: medium !important;
            font-style: normal !important;
            text-align: start !important;
            font-variant: normal !important;
        }

    </style>

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


                    <div class="portlet box ">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-social-dribbble font-green"></i>
                                <span class="caption-subject font-green bold uppercase" style="font-size: 14px red">Service Metadata Defination</span>
                            </div>

                        </div>

                        <c:set var="detail" value="${details}"></c:set>
                        <p style="margin-left: 10px"> Service Name : ${detail.nameEng}</p>
                        <div class="portlet-body flip-scroll">
                            <div class="table-responsive">

                                <table class="table table-striped table-bordered table-hover">
                                    <thead class="">
                                    <tr>
                                        <th> Serial No</th>
                                        <th>Service Information</th>
                                        <th>Description</th>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    <tr>
                                        <td>
                                            <p>1</p>
                                        </td>
                                        <td>
                                            <p>Reference Number</p>
                                        </td>
                                        <td>
                                            <p>${detail.metadataRefNum}</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>2</p>
                                        </td>
                                        <td>
                                            <p>Service Name</p>
                                        </td>
                                        <td>
                                            <p>${detail.nameEng}</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>3</p>
                                        </td>
                                        <td>
                                            <p>Description of Service</p>
                                        </td>
                                        <td>
                                            <p>${detail.description}</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>4</p>
                                        </td>
                                        <td>
                                            <p>Owner</p>
                                        </td>
                                        <td>
                                            <p>${detail.ownerSubSystem}</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>5</p>
                                        </td>
                                        <td>
                                            <p>Output type (Data/Redirect)</p>
                                        </td>
                                        <td>
                                            <p>${detail.outputType}</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>6</p>
                                        </td>
                                        <td>
                                            <p>Service Type ( Core/Shared)</p>
                                        </td>
                                        <td>
                                            <c:if test="${details.serviceType==1}">
                                                <p>Shared</p>
                                            </c:if>
                                            <c:if test="${details.serviceType==0}">
                                                <p>Shared</p>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>7</p>
                                        </td>
                                        <td>
                                            <p>Service Invoking Parameter</p>
                                        </td>
                                        <td>
                                            <ol>
                                                <c:forEach var="data" items="${fields}">
                                                    <li>
                                                            ${data.nameEng}
                                                    </li>
                                                </c:forEach>
                                            </ol>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>8</p>
                                        </td>
                                        <td>
                                            <p>Mandatory Fields for service Invocation</p>
                                        </td>
                                        <td>

                                            <ol>
                                                <c:forEach var="data" items="${fields}">
                                                    <c:if test="${data.isMandatory==1}">
                                                        <li>
                                                                ${data.nameEng}
                                                        </li>
                                                    </c:if>
                                                </c:forEach>
                                                <c:forEach var="loopvar" items="${loop}">
                                                    <li>
                                                        Any of the following
                                                        <ol type="a">
                                                            <c:forEach var="data" items="${fields}">
                                                                <c:if test="${data.isMandatory==loopvar}">
                                                                    <li>${data.nameEng}</li>
                                                                </c:if>
                                                            </c:forEach>
                                                        </ol>
                                                    </li>
                                                </c:forEach>
                                                <%--<c:forEach var="data" items="${fields}">--%>
                                                    <%--<c:if test="${data.isMandatory==3}">--%>


                                                        <%--<li>${data.nameEng}</li>--%>


                                                    <%--</c:if>--%>
                                                <%--</c:forEach>--%>


                                            </ol>
                                            <%--<p>1. Sender S/W Application Code</p>--%>
                                            <%--<p>2. Sender Application Token</p>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>9</p>
                                        </td>
                                        <td>
                                            <p>Data Reference Model (DRM)</p>
                                        </td>
                                        <td>
                                            <p>See <a
                                                    href="<%=request.getContextPath()%>/portal/servicedbstandard/${detail.serviceId}">
                                                ${detail.dbStandRefNum}</a> of Data Standard</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>10</p>
                                        </td>
                                        <td>
                                            <p>Application Integration Reference Model (AIRM)</p>
                                        </td>
                                        <td>
                                            <p>See <a
                                                    href="<%=request.getContextPath()%>/portal/serviceintstandard/${detail.serviceId}">
                                                ${detail.intStandRefNum} </a> of Integration Standard</p>
                                        </td>
                                    </tr>


                                    </tbody>
                                </table>
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
<div>
    <div id="myDIV">

        <div class=" footer page-footer-custom ">
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
    <%--jQuery(document).ready(function () {--%>
    <%--Metronic.init(); // init metronic core components--%>
    <%--Layout.init(); // init current layout--%>
    <%--Login.init();--%>
    <%--Demo.init();--%>
    <%--// init background slide images--%>
    <%--$.backstretch([--%>
    <%--"<%=request.getContextPath()%>/assets/img/LoginBG.png"--%>
    <%--], {--%>
    <%--fade: 1000,--%>
    <%--duration: 8000--%>
    <%--}--%>
    <%--);--%>
    <%--});--%>

    $(document).ready(function () {

//        $("#dropdownDiv").;
        $('body').show();


    });
</script>


</div>


</body>

</html>