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
<%--&lt;%&ndash;<div class="container" style="margin-top: 35px;"><p style="font-size: 26px; font-weight: 600;color: #693293">Service&ndash;%&gt;--%>
<%--&lt;%&ndash;Metadata Defination</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--<div class="container" style="background-color: #F6F6F6;">--%>


<%--<h2><a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#defination"--%>
<%--style="font-size: 25px">--%>
<%--What does Data Integrity mean?</a></h2>--%>


<%--<p></p>--%>

<%--&lt;%&ndash;<div id="keypoints">&ndash;%&gt;--%>
<%--&lt;%&ndash;<h2>Key Points</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;<ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;<li>Information security is about the protection of information regardless of whether it is in digital form,&ndash;%&gt;--%>
<%--&lt;%&ndash;being stored on computers, or in transit over a network&ndash;%&gt;--%>
<%--&lt;%&ndash;</li>&ndash;%&gt;--%>
<%--&lt;%&ndash;<li>The Government places great emphasis on information security and the protection of its information and&ndash;%&gt;--%>
<%--&lt;%&ndash;computer assets. Information systems and communication networks have become essential, if not critical,&ndash;%&gt;--%>
<%--&lt;%&ndash;components in the course of electronic service delivery.&ndash;%&gt;--%>
<%--&lt;%&ndash;The security of these components has profound impact on their reliability, availability and serviceability.&ndash;%&gt;--%>
<%--&lt;%&ndash;</li>&ndash;%&gt;--%>
<%--&lt;%&ndash;<li>Bangladesh is increasingly reliant on the Internet, telecommunications infrastructure, and smart devices&ndash;%&gt;--%>
<%--&lt;%&ndash;for economic development, entrepreneurship, business operations and daily life.&ndash;%&gt;--%>
<%--&lt;%&ndash;Information security issues and the risks in the cyber environment could have various impacts on businesses and individuals.&ndash;%&gt;--%>
<%--&lt;%&ndash;</li>&ndash;%&gt;--%>

<%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>


<%--<p></p>--%>
<%--<div id="defination" class="collapse">--%>
<%--<p>Data integrity is the overall completeness, accuracy and consistency of data. This can be indicated by--%>
<%--the absence of alteration between two--%>
<%--instances or between two updates of a data record, meaning data is intact and unchanged. Data integrity--%>
<%--is usually imposed during the database--%>
<%--design phase through the use of standard procedures and rules. Data integrity can be maintained through--%>
<%--the use of various error-checking--%>
<%--methods and validation procedures.</p></div>--%>

<%--<h2><a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#explain"--%>
<%--style="font-size: 25px">--%>
<%--Explanation of Data Integrity</a></h2>--%>

<%--<div id="explain" class="collapse">--%>
<%--<p>Data integrity is enforced in both hierarchical and relational database models. The following three--%>
<%--integrity constraints are used in a--%>
<%--relational database structure to achieve data integrity:</p>--%>

<%--<ul>--%>
<%--<li>Entity Integrity: This is concerned with the concept of primary keys. The rule states that every--%>
<%--table must have its own primary key and--%>
<%--that each has to be unique and not null.--%>
<%--</li>--%>
<%--<li>Referential Integrity: This is the concept of foreign keys. The rule states that the foreign key--%>
<%--value can be in two states. The first--%>
<%--state is that the foreign key value would refer to a primary key value of another table, or it can--%>
<%--be null. Being null could simply mean--%>
<%--that there are no relationships, or that the relationship is unknown.--%>
<%--</li>--%>
<%--<li>Domain Integrity: This states that all columns in a relational database are in a defined domain.--%>
<%--</li>--%>

<%--</ul>--%>
<%--</div>--%>
<%--<h2><a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#why"--%>
<%--style="font-size: 25px">--%>
<%--Why do we need Data Integrity?</a></h2>--%>
<%--<p></p>--%>
<%--<div id="why" class="collapse">--%>
<%--<p> Maintaining data integrity is important for several reasons. For one, data integrity ensures--%>
<%--recoverability--%>
<%--and searchability, traceability--%>
<%--(to origin), and connectivity. Protecting the validity and accuracy of data also increases stabilitity--%>
<%--and--%>
<%--performance while improving--%>
<%--reusability and maintainability.</p>--%>
<%--<p>Data increasingly drives enterprise decision-making, but it must undergo a variety of changes and--%>
<%--processes--%>
<%--to change from raw form to more--%>
<%--usable formats that are practical for identifying relationships and facilitating informed decisions.--%>
<%--Therefore, data integrity is a top--%>
<%--priority for modern enterprises.</p>--%>

<%--<p>Data integrity can be compromised in a variety of ways, making data integrity practices an essential--%>
<%--component of effective enterprise security--%>
<%--protocols. Data integrity may be compromised through :</p>--%>
<%--<ul>--%>
<%--<li>Human error, whether malicious or unintentional.</li>--%>
<%--<li>Transfer errors, including unintended alterations or data compromise during transfer from one device--%>
<%--to--%>
<%--another.--%>
<%--</li>--%>
<%--<li>Bugs, viruses/malware, hacking, and other cyber threats.</li>--%>
<%--<li>Compromised hardware, such as a device or disk crash.</li>--%>
<%--<li>Physical compromise to devices.</li>--%>

<%--</ul>--%>
<%--<p>As only some of these compromises may be adequately prevented through data security, the case for data--%>
<%--backup--%>
<%--and duplication becomes--%>
<%--critical for ensuring data integrity. Other data integrity best practices include input validation to--%>
<%--preclude the entering of invalid--%>
<%--data, error detection/data validation to identify errors in data transmission, and security measures--%>
<%--such as--%>
<%--data loss prevention, access--%>
<%--control, data encryption, and more.</p></div>--%>


<%--<h2><a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#oisf"--%>
<%--style="font-size: 25px">Data Integrity rules followed by OISF</a></h2>--%>
<%--<p></p>--%>
<%--<div id="oisf" class="collapse">--%>
<%--<p>This section describes the rules that have been applied to table columns to enforce different types of--%>
<%--data--%>
<%--integrity in OISF.</p>--%>
<%--<p><b>Null rule</b>: A null rule is a rule defined on a single column that allows or disallows inserts or--%>
<%--updates of rows containing a null (the absence of a value) in that column.</p>--%>
<%--<p><b>Unique column values</b>: A unique value rule defined on a column (or set of columns) allows the--%>
<%--insert or--%>
<%--update of a row only if it contains a unique value in that column (or set of columns).</p>--%>
<%--<p><b>Primary key values</b>: A primary key value rule defined on a key (a column or set of columns)--%>
<%--specifies--%>
<%--that each row in the table can be uniquely identified by the values in the key.</p>--%>
<%--<p><b>Referential integrity rules</b>: A referential integrity rule is a rule defined on a key (a column or--%>
<%--set--%>
<%--of columns) in one table that guarantees that the values in that key match the values in a key in a--%>
<%--related--%>
<%--table (the referenced value).</p>--%>
<%--<p>Referential integrity also includes the rules that dictate what types of data manipulation are allowed on--%>
<%--referenced values and how these actions affect dependent values. The rules associated with referential--%>
<%--integrity are:</p>--%>
<%--<ul>--%>
<%--<li><b>Restrict</b>: Disallows the update or deletion of referenced data.</li>--%>
<%--<li><b>Set to null</b>: When referenced data is updated or deleted, all associated dependent data is set--%>
<%--to--%>
<%--NULL.--%>
<%--</li>--%>
<%--<li><b>Set to default</b>: When referenced data is updated or deleted, all associated dependent data is--%>
<%--set--%>
<%--to a default value.--%>
<%--</li>--%>
<%--<li><b>Cascade</b>: When referenced data is updated, all associated dependent data is correspondingly--%>
<%--updated. When a referenced row is deleted, all associated dependent rows are deleted.--%>
<%--</li>--%>
<%--<li><b>No action</b>: Disallows the update or deletion of referenced data. This differs from RESTRICT in--%>
<%--that it is checked at the end of the statement, or at the end of the transaction if the constraint--%>
<%--is--%>
<%--deferred.--%>
<%--</li>--%>

<%--</ul>--%>
<%--<p><b>Complex integrity checking</b>: A user-defined rule for a column (or set of columns) that allows or--%>
<%--disallows inserts, updates, or deletes of a row based on the value it contains for the column (or set of--%>
<%--columns).</p>--%>
<%--</div>--%>



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
        <pre style="font-size: 20px"> Home > <a  class="urllink" href="<%=request.getContextPath()%>/portal#standard">Standards</a> > Technology Standards</pre>
    </div>
    <div class="container fourth" style="background-color: #F6F6F6;min-height: 400px">


        <h2><a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#defination"
               style="font-size: 25px">
            What are Technology Standards?</a></h2>


        <p></p>

        <div id="keypoints">
        <h2>Key Points</h2>
        <ul>
        <li>Establishes boundaries for technology usage
        </li>
        <li> Improves the quality and responsiveness of essential technical support services
        </li>
        <li>Manages product compatibility
        </li>
            <li>Reduces the number of platform conflict problems</li>
            <li>Minimizes the risks associated with an uncontrolled technology portfolio</li>

        </ul>
        </div>


        <p></p>
        <div id="defination" class="collapse">
            <p>Technology Standards are the rules that establish boundaries for technology usage, specifying technology to be used
                and restricting access to technology that is deemed non-standard. It is the standards that
                make other policies possible, including email, data security and disaster recovery.</p></div>

        <h2><a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#explain"
               style="font-size: 25px">
            categories of Technology Standards</a></h2>

        <div id="explain" class="collapse">
            <p> Technology standards, most often relating to the
                hardware and software products allocated to individual end-users and typically fall into three defining categories:</p>

            <ul>
                <li><b>Solution Standards</b>: Standards that specify the types of products that can be used (according to manufacturer, version,
                    platform or other defining characteristics), as well as the process by which these standardized products are acquired.
                </li>
                <li><b>Configuration Standards</b>:Standards that specify the way selected devices, software and apps are installed and configured.
                </li>
                <li><b>Utilization Standards</b>: Standards that specify the applicability of a given technology product (or set of products) to a
                    demonstrated, stated business need, forming the basis of technology planning, procurement and product selection recommendations.
                </li>

            </ul>
        </div>
        <h2><a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#why"
               style="font-size: 25px">
            The Benefits of Techology Standards</a></h2>
        <p></p>
        <div id="why" class="collapse">
            <p> Experience has shown that good things happen when the right set of end-user technology standards are appropriately planned and applied.
            Here are the benefits of technology standards:</p>
            <ul>
                <li>By limiting the variety of hardware and software products in use, IT departments will have the opportunity to develop focused,
                    in-depth product expertise, thereby improving the quality and responsiveness of essential technical support services.</li>
                <li>By limiting the variety of products in use, IT departments can better test and manage product compatibility, thereby reducing the number of platform conflict problems.
                </li>
                <li>Standardization can lower technology acquisition costs through volume purchasing, bringing discounted pricing, as well as greater
                    leverage to negotiate more favorable maintenance and training contracts.</li>
                <li>With a focus on a specific set of technology products, the end-user community will have the opportunity to develop in-depth product expertise - to enhance operational productivity and maximize technology utilization.</li>
                <li>Standardization can minimize the risks associated with an uncontrolled technology portfolio, facilitating disaster recovery planning, software licensing management, and security management.</li>

            </ul>
            </div>


        <h2><a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#oisf"
               style="font-size: 25px">Technology Standards followed by OISF</a></h2>
        <p></p>
        <div id="oisf" class="collapse">
            <p>This section describes the steps that have been followed to improve technology standards in OISF.</p>

            <ul>
                <li>Middleware </li>
                <li> Enterprise Integrator
                </li>
                <li>AI, Chatbot, Chatting Tools
                </li>
                <%--<li> Being flexible--%>
                <%--</li>--%>
                <%--<li>Involving end-users in the standards process--%>
                <%--</li>--%>
                <li>Proper Communication</li>
                <li>Asking for feedback</li>
                <%--<li>Enforcing standards consistently</li>--%>
                <%--<li>Integrating standards guidelines and purchasing procedures</li>--%>

            </ul>

        </div>



    </div>
</div>

<%@ include file="../includes/portletfooter.jsp" %>

</body></html>

