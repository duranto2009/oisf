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
        <pre style="font-size: 20px"> Home > <a class="urllink" href="<%=request.getContextPath()%>/portal#standard">Standards</a> > Deployment Standards</pre>
    </div>
    <div class="container fourth" style="background-color: #F6F6F6;;min-height: 320px">


        <h2> <a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#defination" style="font-size: 25px">
            What are Deployment standards?</a></h2>




        <%--//dfjdshfjhdsjfhj--%>

        <p></p>
        <div id="keypoints">
        <h2>Key Points</h2>
        <ul>
        <li>Makes the application  system available for use
        </li>
        <li>
            Saves deployment time of the application
        </li>
        <li>
            Enhances security of the applicastion
        </li>
            <li>Monitors user actions</li>

        </ul>
        </div>


        <p></p>
        <div id="defination" class="collapse">
            <p>Deployment standards are all of the activities that make an application system available for use.
                It includes all the process
                required for preparing an application to run and operate in a specific environment.
                It involves installation, configuration, testing
                and making changes to optimize the performance of the application. It can either be
                carried out manually or through automated systems.</p></div>


        <h2><a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#why" style="font-size: 25px">
            Why do we need Deployment standards?</a></h2>
        <p></p>
        <div id="why" class="collapse">
            <p> The following are the big advantages of application deployment</p>

            <ul>
                <li><b>Time saving</b>: Application deployment makes for quick roll-outs within hours. The process of installation  also becomes faster than native ways. The
                    application can be deployed quickly and there is no need of training or learning anything. </li>
                <li><b>Enhance security</b>: Deployment can configure the roles of permission sets which can control sensitive or mission-critical group of
                    computers. This offers protection to the computers in the enterprise. Task groups can also be secured by maintaining role’s task based
                    permission sets. Additional security protocols can be applied to mission-critical or sensitive tasks.</li>
                <li><b>Monitor user actions</b>: Application deployment makes it easy to monitor user actions effectively. You can gain insight into user
                    activities around the application. The findings can be utilized to perform historical user activity analysis. It ensures everything
                    is in order and the applications are not facing any problem in their operations.</li>


            </ul></div>

        <h2><a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#policy" style="font-size: 25px">
            Deployment standards</a></h2>
        <p></p>
        <div id="policy" class="collapse">
            <p>This section describes techniques and policies of deployment that have been applied in OISF.</p>

            <ul>
                <li><b>Identify and understand deployment audience</b>: There are at least three distinct groups that need to be considered: end users,
                    the operations staff responsible for running the application once it is in production, and the support staff who is responsible for aiding
                    users with the application once it is in production. So, it is important to identify the level of control that each group has over actual deployment.
                    Can one group stop deployment if their specific requirements dont met? For example, it is quite common to discover that
                    operations departments have defined criteria for the release of new application, criteria that deployment approach must meet.</li>
                <li><b>Identify deployment strategy early</b>:  A new system can be run in parallel with the existing system or can be totally
                    cutovered. Running the system in parallel offers the advantage that one can easily back out to the original system if the new one runs
                    into problems. However, parallel operations require significant efforts on the part of everyone involved. Users need to do double
                    entry, operations staff need to run both systems, support staff need to support both systems, and development staff may need to create
                    integration code that temporarily works behind the scenes to synchronize data.</li>
                <li><b>Start planning early</b>: Deployment can be quite complex, especially when user base is physically dispersed or there is a wide
                    range of system configurations, one often find that one need to start planning early in  project lifecycle to be successful. </li>

                <li><b>Plan must reflect with organizational culture.</b>: It is very important to understand whom the application is deploying to, their current work
                    practices and policies, the amount of change they are willing to tolerate, and how the application will affect them once deployed. </li>

                <li><b>Update deployment plan regularly</b>: This helps to set realistic expectations by both  project team and deployment audience.</li>
                <li><b>Announce the deployment</b>: It is important to announce the anticipated deployment schedule, including both the expected training and
                    installation dates. Announcement could be an email to the customers, a press release, or even advertisements on television,
                    in magazines, or on the Internet. Release announcements are important because people want to know how the new system will affect them,
                    if at all, and when it will affect them. </li>
                <li><b>Hold regular release meetings</b>: The closer the application is to deployment, the greater the need to hold regular release meetings with
                    key players involved in the actual deployment.</li>
                <li><b>Understand the associated risks of deploying systems.</b></li>
                <li><b>Training is an important part of deployment.</b></li>
                <li><b>Develop supporting documentation</b>:  Another important effort is the development of operations, support, and user documentations that are
                    doing with special care in OISF..</li>
            </ul>
        </div>



    </div>
</div>

<%@ include file="../includes/portletfooter.jsp" %>


</body></html>