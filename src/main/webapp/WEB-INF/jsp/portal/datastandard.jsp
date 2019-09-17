

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
    <link href="<%=request.getContextPath()%>/assets/css/portal/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    <!-- Plugin CSS <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet"> -->


    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/assets/css/portal/creative.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/css/portal/customportlet.css" rel="stylesheet">


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
            font-weight: 800!important;

        }
        .urllink{
            color: green!important;
            font-weight: 600!important;
        }
    </style>

</head>

<body id="page-top" style="position: relative; top: 0px;">

<!-- Navigation -->
<%@ include file="../includes/portletheader.jsp" %>


<div id="container" class="first">
    <div class="container second" >
        <pre style="font-size: 20px"> Home > <a class="urllink" href="<%=request.getContextPath()%>/portal#standard">Standards</a> > Data Standards</pre>

    </div>
    <div class="container fourth" style="background-color: #F6F6F6;">


        <h2>
            <a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#defination" style="font-size: 25px">What are
                Data Standards?
                <span class="caret"></span>

            </a>
        </h2>


        <p></p>
        <div id="keypoints">
            <h2>Key Points</h2>
            <ul>
                <li>Standards are rules establishing how data are described and recorded in a consistent
                    format.
                </li>
                <li>Using standards makes data more usable to more than just the project or person that
                    created the data.
                </li>
                <li>Standards are useful for integrating data from multiple resources. If the various
                    sources agreed upon a standard to begin with, this saves time reconciling any
                    differences.
                </li>
                <li>When collecting new data, try to find data standards for the type of data you are
                    collecting.
                </li>

            </ul>
        </div>
        <p></p>
        <div id="defination" class="collapse">
            <p>Data standards are the rules by which data are described and recorded. In order to share,
                exchange, and understand data, we must standardize the format as well as the meaning.</p></div>

        <h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#why"  style="font-size: 25px">
            Why do we need Data Standards?<span class="caret"></span></a></h2>
        <div id="why" class="collapse">
            <p>Using standards makes using things easier. For example, let's say you need a AAA battery for your
                flashlight. You don't need to worry about the make of the battery, since all AAA batteries are
                the same size - because they are produced to a standard. You don't need to worry about getting a
                specific brand of AAA battery, since all AAA batteries will work in your flashlight.</p>
            <p>The Bureau of Land Management notes that "Standards provide data integrity, accuracy and
                consistency, clarify ambiguous meanings, minimize redundant data, and document business rules."
                Utilizing data standards allow the agency to move from "project-based" data files to
                "enterprise" data files - and vice versa. In other words, the data becomes usable to more than
                just the project or person that created the data, because you know the data will be in an
                expected format and you know what is represented by the data.</p>
            <p>If different groups are using different data standards, combining data from multiple sources is
                difficult, if not impossible. If we go back to the case of needing a battery for our flashlight,
                if there were no standards for AAA batteries, then we wouldn't be able to use just any AAA
                battery. We'd have to find one specific for our make and model of flashlight. You'd have to have
                many sets of AAA batteries in your house, one that worked for each item, instead of one set that
                works in all applicable cases.</p>


            <p>If you were trying to integrate datasets from different sources, each of which used a different
                format for their date variable, it would be a much harder task since you would have to convert
                the dates into a common format before you could integrate the data. If everyone agreed upon what
                standard they were going to use for dates, then you wouldn't have to do this extra step.</p>
            <p>A structured data element name gives us:</p>
            <ul>
                <li>An informative name</li>
                <li>A description and definition</li>
                <li>The ability to assign unique, consistent names</li>
                <li>The ability to identify the natural relationships of data</li>
                <li>The ability to identify all of the uses of a data element</li>
            </ul>
        </div>
        <h2><a class="btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#eservice" style="font-size: 25px">
            Why Data Standard is needed for E-Governance</a></h2>
        <p></p>
        <div id="eservice" class="collapse">
            <p>Standarization of data will help other E-governance system to communicate with one another with ease. If data
                is well
                formatted and defined by some standards then when current and future e-governance system communicate with
                one another it will know by defination
                what to do and what it can except from other solutions.Moreover Data integrity will preserve if
                standardization implemented </p>
        </div>

        <section id="service" class="service" style="padding: 2px!important;">
            <div class="container">
                <div class="row">
                    <h2><a class="btn btn-link "  style="font-size: 25px">
                        Data standardization of Services</a></h2>
                    <%--<div class="col-lg-12 text-left">--%>
                        <%----%>
                        <%--&lt;%&ndash;<h2 class="section-heading">Data Stanadrdization of Services</h2>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;<hr class="my-4">&ndash;%&gt;--%>
                    <%--</div>--%>
                </div>
                <div class="row">
                    <div class="col-lg-12 ">
                        <p>OISF will provide data standardization for Both Core And Shared Services.One can see
                            what   core and Shared Service Mean in below definations

                        </p>

                        <br>


                    </div>
                </div>

                <div class="row servicecontent">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

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

                            <a href="<%=request.getContextPath()%>/portal/coredslist" style="text-decoration: none">
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
                            <%--<img src="<%=request.getContextPath()%>/assets/portal/img/service/Share-Service.png">--%>
                        <%--</div>--%>
                        <%--<div class="col-md-9">--%>
                            <%--<h4><a href="<%=request.getContextPath()%>/portal/shareddslist">Shared Service</a></h4>--%>
                            <%--<p>Shared service is defined</p>--%>
                            <%--<p>as the service OISF does not own</p>--%>
                            <%--<p>and that is provided by </p>--%>
                            <%--<p>other e-governance solutions.</p>--%>


                        <%--</div>--%>
                            <a href="<%=request.getContextPath()%>/portal/shareddslist" style="text-decoration: none">
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