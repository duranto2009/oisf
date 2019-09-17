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

        <%--a {--%>
            <%--color: black;--%>
        <%--}--%>

        <%--#mainNav{--%>
            <%--height:8%;--%>
            <%--position: fixed;--%>
            <%--background-color: #fff;--%>
        <%--}--%>

        <%--#contact{--%>
            <%--padding:0px !important;--%>
            <%--padding-top:5px !important;--%>
        <%--}--%>

        <%--h1,--%>
        <%--h2,--%>
        <%--h3,--%>
        <%--h4,--%>
        <%--h5,--%>
        <%--h6 {--%>
            <%--font-family: 'Roboto Condensed', sans-serif!important;--%>
            <%--color:black !important;--%>
            <%--border: none !important;--%>
            <%--font-weight:lighter!important;--%>
        <%--}--%>
        <%--p{--%>
            <%--color:black;--%>
        <%--}--%>
        <%--body{--%>
            <%--display: flex;--%>
            <%--flex-direction: column;--%>
            <%--justify-content: space-between;--%>
        <%--}--%>
        <%--#datatable_paginate > ul > li.paginate_button.page-item > a{--%>
            <%--color: black;--%>
        <%--}--%>
        <%--#datatable_paginate > ul > li.active > a, .pagination > li.active > span{--%>
            <%--background-color: lightgrey;--%>
            <%--border: darkgrey solid 1px;--%>
        <%--}--%>
    <%--</style>--%>

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
<!-- Navigation -->
<%@ include file="../includes/portletheader.jsp" %>
<div class="first">
    <div class="container second">
        <pre style="font-size: 20px"> Home  ><a class="urllink" href="<%=request.getContextPath()%>/portal#standard">  Standards</a> <c:if test="${bool==0}">> <a class="urllink" href="/portal/corelist">${urltitle} Services</a></c:if><c:if test="${bool==1}">><a class="urllink" href="/portal/sharedlist">${urltitle} Services</a></c:if>> <a class="urllink" href="/portal/servicelist/${urlnames.id}">${urlnames.nameEng}  </a>> Integration Standard</pre>
    </div>

    <div class="container third" ><p style="font-size: 26px; font-weight: 600;color: #693293">Service
        Integration Standard</p>
    </div>
    <div class="container fourth" style="margin-top: 10px;min-height: 70vh;background-color: #F6F6F6;">




        <div class="portlet box ">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-social-dribbble font-green"></i>
                </div>

            </div>
            <c:set var="detail" value="${fields}"></c:set>
            <p style="margin-left: 10px;font-size: 22px"><b style="font-weight: 500;color: #693293"> Service Name : </b>${detail.nameEng}</p>
            <div class="portlet-body">
                <div class="table-responsive">
                    <table border="2px" class="table table-striped table-bordered table-hover" style="background-color: white">

                        <tbody>
                        <tr>
                            <td>
                                <p>Reference No</p>
                            </td>
                            <td>
                                <p>${fields.intStandRefNum}</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Invoking Uri</p>
                            </td>
                            <td>
                                <p>${fields.invokingUri}</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Example of request</p>
                            </td>
                            <td>
                                <p>Request Uri- ${fields.requestUri}</p>


                                <pre>

                                    ${fields.exampleRequest.trim()}
                                </pre>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Service Response</p>
                            </td>
                            <td>
                                <p>Response code : 200 interpretation : Successful Return.</p>
                                <p>Response code : 301 interpretation : Moved Permanently/Redirect.</p>
                                <p>Response code : 400 interpretation : Bad Request(Required info not present).</p>
                                <p>Response code : 401 interpretation : Unauthorized.</p>
                                <p>Response code : 403 interpretation : Forbidden.</p>
                                <p>Response code : 404 interpretation : Not Found.</p>
                                <p>Response code : 405 interpretation : Request method not allowed.</p>
                                <p>Response code : 406 interpretation : Not Acceptable.</p>
                                <p>Response code : 408 interpretation : Request time out.</p>
                                <p>Response code : 500 interpretation : Internal Server Error.</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Example of Response</p>
                            </td>
                            <td>
                                            <pre>
                                                ${fields.exampleResponse}
                                            </pre>
                            </td>
                        </tr>
                        </tbody>


                    </table>
                </div>
            </div>
        </div>




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

