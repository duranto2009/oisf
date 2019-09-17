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
<%--<title>OISF Portal | Security Standard</title>--%>

<%--<!-- Bootstrap core CSS -->--%>
<%--<link href="<%=request.getContextPath()%>/assets/css/portal/bootstrap.min.css" rel="stylesheet">--%>

<%--<!-- Custom fonts for this template -->--%>
<%--&lt;%&ndash;<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">&ndash;%&gt;--%>
<%--<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
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


<%--<h2> <a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#defination" style="font-size: 25px">--%>
<%--What are Security Standards?</a></h2>--%>


<%--<p></p>--%>
<%--&lt;%&ndash;&ndash;%&gt;--%>
<%--<div id="keypoints">--%>
<%--<h2>Key Points</h2>--%>
<%--<ul>--%>
<%--<li>Information security is about the protection of information regardless of whether it is in digital form,--%>
<%--being stored on computers, or in transit over a network--%>
<%--</li>--%>
<%--<li>The Government places great emphasis on information security and the protection of its information and--%>
<%--computer assets. Information systems and communication networks have become essential, if not critical,--%>
<%--components in the course of electronic service delivery.--%>
<%--The security of these components has profound impact on their reliability, availability and serviceability.--%>
<%--</li>--%>
<%--<li>Bangladesh is increasingly reliant on the Internet, telecommunications infrastructure, and smart devices--%>
<%--for economic development, entrepreneurship, business operations and daily life.--%>
<%--Information security issues and the risks in the cyber environment could have various impacts on businesses and individuals.--%>
<%--</li>--%>

<%--</ul>--%>
<%--</div>--%>


<%--<p></p>--%>
<%--<div id="defination" class="collapse">--%>
<%--<p>Security Standards are the rules by which security of data are maintained.--%>
<%--In order to secure data, we must follow some security standards format.</p></div>--%>

<%--<h2>OISF Service security specification</h2>--%>
<%--<p>OISF Enterprise Service Bus will send a token (JWT) in the header of the HTTP requests to the  service providers’ backend server while invoking the API from the ESB itself. The token will reside under the “Authorization” field of the header. Token identifier is “OISFBus”.</p>--%>
<%--<p><code>Authorization: OISFBus &lt; token &gt; </code></p>--%>
<%--<p>The backend server application of the service provider can then verify the token and decide whether to respond or discard the request.</p>--%>


<%--<h5>JWT - JSON Web Tokens <sup><a href="https://jwt.io/" title="About JWT" target="_blank">[1]</a> </sup></h5>--%>
<%--<p>Quoted introduction from the site, <br/>--%>

<%--“JSON Web Token (JWT) is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object. This information can be verified and trusted because it is digitally signed. JWTs can be signed using a secret (with the HMAC algorithm) or a public/private key pair using RSA.”</p>--%>


<%--<h5>Structure <sup><a href="https://en.wikipedia.org/wiki/JSON_Web_Token" title="JSON Web Token" target="_blank" >[2]</a> </sup></h5>--%>
<%--<p>JWT consists of 3 parts: header, payload and signature. </p>--%>
<%--<h6><u>Header</u></h6>--%>
<%--<p><code>header = ‘{“alg”: ”HS256”, ”typ”: ”JWT”}</code></p>--%>
<%--<p>In the header there are 2 elements. “alg” is the hash algorithm whose value will be “HS256”. In our case we will be using HMAC with SHA256 which is a symmetric key hashing algorithm using same shared secret as the hashing key. And “typ” tells about the token type. Its value will be “JWT”.</p>--%>

<%--<h6><u><b>Payload</b></u></h6>--%>
<%--<p><code>payload = ‘{“iss”: “BD.GOV.DOPTOR.OISF.ESB”, “aud”: &lt; provider-name&gt;,  “iat”: 1517459733, “nbf”: 1517458833, “exp”: 1517460633, “sub”: “service api consumption”, “cnc”: &lt;random-string&gt;</code></p>--%>
<%--<p>Payload part of the JWT contains the data, claims etc. In our case the payload will be loaded with the following elements.</p>--%>


<%--<p><b>iss (issuer):</b> who issues the token. Value will be “BD.GOV.DOPTOR.OISF.ESB”.</p>--%>
<%--<p><b>aud (audience):</b> for whom the token is issued. Its a variable field containing the name of the api publisher. e.g. oisf, grs, nothi, lisf etc.</p>--%>

<%--<p><b>sub (subject):</b> subject or context of the JWT. Value will be “service api consumption”.</p>--%>

<%--<p><b>iat (issued at):</b> unix timestamp (seconds) of the moment when the token is issued.</p>--%>

<%--<p><b>nbf (not before):</b> unix timestamp (seconds) of the moment before which the token is invalid. It is usually set to 900 seconds (15 minutes) prior issuance.</p>--%>

<%--<p><b>exp (expiration time):</b> unix timestamp (seconds) of the moment after which the token is invalid. It is usually set to 900 seconds (15 minutes) after issuance.</p>--%>

<%--<p><b>cnc (cryptographic nonce):</b> cryptographic nonce is a random string for one time use in order to avoid “Replay attacks”.</p>--%>

<%--<h6><u><b>Signature</b></u></h6>--%>
<%--<p>Signature is generated in 2 steps.</p>--%>

<%--<p># Step 1, an unsigned token is generated using the header and payload. Unsigned token is the Base64 encoded header and Base64 encoded payload concatenated with a delimiter “.” in between.</p>--%>

<%--<p><code>unsignedToken = base64Encode(header) + '.' + base64Encode(payload)</code></p>--%>

<%--<p>base64Encode(str) is a function which converts the input string “str” and returns the Base64 encoded string.</p>--%>

<%--<p> # Step 2, unsigned token is hashed using the HMAC-SHA256 algorithm and a symmetric hashing key.</p>--%>

<%--<p><code>key = &lt;shared-secret&gt;</code></p>--%>

<%--<p>“key” is the hash key to generate signature. Shared secret obtained from the OISF while registering application is used as key.</p>--%>

<%--<p><code>signature = HMAC-SHA256(key, unsignedToken)</code></p>--%>

<%--<h6><u><b>Token</b></u></h6>--%>

<%--<p>Upto this we can obtain header, payload and signature. Now we will generate a single token combining all these 3 parts. The final token is the concatenation of the Base64 encoded header, Base64 encoded payload and Base64 encoded signature delimited by “.”.</p>--%>
<%--<code>--%>
<%--token = base64Encode(header) + '.'--%>
<%--+ base64Encode(payload) + '.'--%>
<%--+ base64Encode(signature)--%>
<%--</code>--%>

<%--<p>The resultant token will somewhat look like:</p>--%>
<%--<code>--%>
<%--eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dnZWRJbkFzIjoiYWRtaW4iLCJpYXQiOjE0MjI3Nzk2Mzh9.gzSraSYS8EXBxLN_oWnFSRgCzcmJmMjLiuyu5CSpyHI--%>
<%--</code>--%>

<%--&lt;%&ndash;<h2>Why Security Standards is needed for E-Governance</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p></p>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>Standarization of data will help other E-governance system to communicate with one another with ease. If data is well&ndash;%&gt;--%>
<%--&lt;%&ndash;formatted and defined by some standards then when current and future e-governance system communicate with one another it will know by defination&ndash;%&gt;--%>
<%--&lt;%&ndash;what to do and what it can except from other solutions.Moreover Data integrity will preserve if standardization implemented </p>&ndash;%&gt;--%>

<%--&lt;%&ndash;<section  id="service" style="padding: 2px!important;">&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="container">&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="row">&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="col-lg-12 text-center">&ndash;%&gt;--%>
<%--&lt;%&ndash;<h2 class="section-heading" >Service</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;<hr class="my-4">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="row">&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="col-lg-12 ">&ndash;%&gt;--%>
<%--&lt;%&ndash;<p >OISF will provide Security Standardsization for Both Core And Shared Services.One can see what core and Shared Service Mean in below definations&ndash;%&gt;--%>

<%--&lt;%&ndash;</p>&ndash;%&gt;--%>

<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="row servicecontent">&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 middlecontainer">&ndash;%&gt;--%>

<%--&lt;%&ndash;<div class = "middle">&ndash;%&gt;--%>
<%--&lt;%&ndash;<img src="<%=request.getContextPath()%>/assets/portal/img/service/Core-Services.png">&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class = "col-md-9">&ndash;%&gt;--%>
<%--&lt;%&ndash;<h4><a href="<%=request.getContextPath()%>/portal/coredslist">Core Service</a></h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>Core service is defined</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>as the service that OISF</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>owns and can provide those</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>to other solution on the fly</p>&ndash;%&gt;--%>


<%--&lt;%&ndash;</div>&ndash;%&gt;--%>

<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 middlecontainer">&ndash;%&gt;--%>

<%--&lt;%&ndash;<div class = "middle">&ndash;%&gt;--%>
<%--&lt;%&ndash;<img src="<%=request.getContextPath()%>/assets/portal/img/service/Share-Service.png">&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;<div class = "col-md-9">&ndash;%&gt;--%>
<%--&lt;%&ndash;<h4><a href="<%=request.getContextPath()%>/portal/shareddslist">Shared Service</a></h4>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>Shared service is defined</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>as the service OISF does not own</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>and that is provided by </p>&ndash;%&gt;--%>
<%--&lt;%&ndash;<p>other e-governance solutions.</p>&ndash;%&gt;--%>


<%--&lt;%&ndash;</div>&ndash;%&gt;--%>

<%--&lt;%&ndash;</div>&ndash;%&gt;--%>


<%--&lt;%&ndash;</div>&ndash;%&gt;--%>


<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</section>&ndash;%&gt;--%>


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
<html lang="en">
<head>

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

    <link rel="stylesheet" type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <!-- Plugin CSS <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"> -->


    <!-- Custom styles for this template -->
    <link href="/assets/css/portal/creative.min.css" rel="stylesheet">

    <link href="/assets/css/portal/customportlet.css" rel="stylesheet">
    <style>
        #container h1 a,
        #container h2 a {
            color: #683392 !important;
            font-size: 21px !important;
            font-weight: 700 !important;
            font-family: "Roboto Condensed" !important;
        }

        #container p, #container li {
            color: #404040 !important;
            font-size: 14px !important;
            font-weight: 300 !important;
            font-family: "Roboto" !important;
        }

        #keypoints p, #keypoints li {
            color: #404040 !important;
            font-size: 14px !important;
            font-weight: 300 !important;
            font-family: "Roboto" !important;
        }


    </style>
    <style>
        .first {
            margin-top: 55px !important;
            margin-bottom: 2%

        }

        .second {
            margin-top: 45px !important;
            /*margin-left: -10px;*/
        }

        .third {
            margin-top: -10px !important;
        }

        .fourth {
            margin-top: 15px !important;
            background-color: #F6F6F6;
        }

        p {
            margin-left: 15px !important;
        }

        pre {
            color: green !important;
            font-weight: 700;

        }

        .urllink {
            color: green !important;
            font-weight: 600 !important;
        }
        .modal.in .modal-dialog {
            -webkit-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            -o-transform: translate(-50%, -50%);
            position: absolute;
            float: left;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
        }
    </style>

</head>

<body id="page-top" style="position: relative; top: 0px;">

<%@ include file="../includes/portletheader.jsp" %>

<div id="container" class="first">
    <div class="container second">
        <pre style="font-size: 20px"> Home > <a class="urllink" href="<%=request.getContextPath()%>/portal">Service Portal</a> > Service Registration </pre>
    </div>
    <div class=" container fourth" style="background-color: whitesmoke ;padding: 2%">

        <h4>Service Registration Form:</h4>

        <form style="margin-top: 2%" method="post" novalidate="novalidate" role="form"
              action="${context}/serviceregistration" id="form_b">
            <div class="form-body">

                <div class="form-group row">
                    <label class=" col-md-3 control-label">Application Name <span class="required" aria-required="true"
                                                                                  style="color: red"> * </span></label>

                    <div class="col-md-9">

                        <input required="required" type="text" data-required="1" class="form-control"
                               placeholder="App Name English"
                               name="appname">


                    </div>

                </div>
                <div class="form-group row">
                    <label class=" col-md-3 control-label">Bangla Name
                        <span class="required" aria-required="true" style="color: red"> * </span>
                    </label>

                    <div class="col-md-9">


                        <input required="required" type="text" data-required="1" class="form-control"
                               placeholder="App Name Bangla"
                               name="appnamebng">

                    </div>

                </div>
                <div class="form-group row">
                    <label class=" col-md-3 control-label">Application URL <span class="required" aria-required="true"
                                                                                 style="color: red"> * </span></label>

                    <div class="col-md-9">


                        <input required="required" type="text" class="form-control" placeholder="Url" name="link">

                    </div>

                </div>
                <div class="form-group row">
                    <label class=" col-md-3 control-label">Redirect URL <span class="required" aria-required="true"
                                                                              style="color: red"> * </span></label>
                    <div class="col-md-9">

                        <input required="required" type="text" class="form-control" placeholder="redirect url"
                               name="redirect_url">

                    </div>
                </div>
                <div class="form-group row">
                    <label class=" col-md-3 control-label">IDP Postback URL <span class="required" aria-required="true"
                                                                                  style="color: red"> * </span></label>
                    <div class="col-md-9">
                        <div class="input-icon">

                            <input required="required" type="text" class="form-control" placeholder="IDP Postback URL"
                                   name="idp_url">
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-md-3 control-label">Mobile No</label>
                    <div class="col-md-9">

                        <input required="required" type="text" class="form-control" placeholder="Mobile No"
                               name="mobile" data-required="true"></div>

                </div>

                <div class="form-group row">
                    <label class="col-md-3 control-label">Email Address <span class="required" aria-required="true"
                                                                              style="color: red"> * </span></label>
                    <div class="col-md-9">


                        <input required="required" type="text" class="form-control" placeholder="Email Address"
                               name="email"></div>

                </div>


                <div class="form-group row">
                    <label class="col-md-3 control-label">Notification Mechanism</label>
                    <div class="col-md-9">
                        <select class="form-control" name="mechanism">
                            <option value="0">Email</option>
                            <option value="1">SMS</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-9 col-md-9 " style="margin-left: 35%">
                        <button type="button" id="check"  class="btn btn-success">Submit</button>
                        <button type="button" class="btn btn-danger">Cancel</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <input type="hidden" id="menuid" value="${menuid}">
</div>

<%@ include file="../includes/portletfooter.jsp" %>



<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/js/common/validation.js" type="text/javascript"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>



<script>
    function showModal() {
        bootbox.confirm({
            message: '<p class="text-center">Do you want to Register Service?</p>',
            title: "",
            size:"small",
            buttons: {
                confirm: {
                    label: 'Confirm',
                    className: 'btn-success'
                },
                cancel: {
                    label: 'Cancel',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if(result == true){

                    $( "#form_b" ).submit();
                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");

                }else{
                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");
                }

            }
        });

    }
    $(document).ready(function () {

        $('#check').click(function () {

            if($('input[name=appname]').val()==""){
                // alert("Appname is empty");
                var html = "<span class='error' style='color:red;'>This Field Is Requierd</span>"

                $('input[name=appname]').siblings('span').remove();
                $('input[name=appname]').after( html );
                return false;
            }
            else if($('input[name=appnamebng]').val()==""){
                var html = "<span class='error' style='color:red;'>This Field Is Requierd</span>"
                $('input[name=appnamebng]').siblings('span').remove();
                $('input[name=appnamebng]').after( html );

                return false;
            }
            else if($('input[name=link]').val()==""){
                var html = "<span class='error' style='color:red;'>This Field Is Requierd</span>"
                $('input[name=link]').siblings('span').remove();
                $('input[name=link]').after( html );
                return false;
            }
            else if($('input[name=mobile]').val()==""){
                var html = "<span class='error' style='color:red;'>This Field Is Requierd</span>"
                $('input[name=mobile]').siblings('span').remove();
                $('input[name=mobile]').after( html );
                return false;
            }
            else if($('input[name=idp_url]').val()==""){
                var html = "<span class='error' style='color:red;'>This Field Is Requierd</span>"
                $('input[name=idp_url]').siblings('span').remove();
                $('input[name=idp_url]').after( html );
                return false;
            }
            else if($('input[name=redirect__url]').val()==""){
                var html = "<span class='error' style='color:red;'>This Field Is Requierd</span>"
                $('input[name=redirect__url]').siblings('span').remove();
                $('input[name=redirect__url]').after( html );
                return false;
            }
            else if($('input[name=email]').val()==""){
                var html = "<span class='error' style='color:red;'>This Field Is Requierd</span>"
                $('input[name=email]').siblings('span').remove();
                $('input[name=email]').after( html );
                return false;
            }
            else {
                // $("#dialog").dialog({autoOpen : false, modal : true, show : "blind", hide : "blind"});
                //
                // $("#dialog").open();
                showModal();


            }



        })

    }
    );
</script>
</body>
</html>





