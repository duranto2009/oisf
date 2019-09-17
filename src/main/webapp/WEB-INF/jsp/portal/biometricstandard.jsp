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

    <title>OISF Portal | Biometric Standard</title>

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
        <pre style="font-size: 20px"> Home > <a class="urllink" href="<%=request.getContextPath()%>/portal#standard">Standards</a> > Biometric Standards</pre>
    </div>
    <div class="container fourth" style="background-color: #F6F6F6;;min-height: 320px">
        <%--start : keypoints--%>
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
        <%--end : keypoints--%>

        <%--start: what deployment--%>
        <h2>
            <a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#defination" style="font-size: 25px">
                 What is Biometric standard?
            </a>
        </h2>
        <div id="defination" class="collapse">
           <p>Biometric standard which is another form of biometric identification is a generic term used to describe automated means of recognizing a living person through the measurement of distinguishing physiological or behavioral traits.</p>
           <p>Doc 9303 considers only three types of biometric identification systems. The types of biometrics are:</p>
            <ul>
                <li><h6>facial recognition </h6>– MANDATORY. MUST comply to [ISO/IEC 19794-5];</li>
                <li><h6>fingerprint recognition</h6> – OPTIONAL. If used, MUST comply to [ISO/IEC 19794-4];</li>
                <li><h6>iris recognition</h6> – OPTIONAL. If used, MUST comply to [ISO/IEC 19794-6].</li>
            </ul>
        </div>
        <%--end: what deployment--%>



            <%--start: Biometric Terms--%>
            <h2>
                <a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#terms" style="font-size: 25px">
                    What are the keys of Biometric standard?
                </a>
            </h2>
            <div id="terms" class="collapse">
                <p>The following terms are used in biometric identification:</p>
                <ul>
                    <li>“verify” means to perform a one-to-one match between proffered biometric data obtained from the eMRTD holder now and a biometric template created when the holder enrolled in the system;</li>
                    <li>“identify” means to perform a one-to-many search between proffered biometric data and a collection of templates representing all of the subjects who have enrolled in the system.
                    </li>
                </ul>
               <h6>Key considerations</h6>
               <p>In specifying biometric applications for eMRTDs, key considerations are:</p>
                <ul>
                <li>Global Interoperability — the crucial need to specify a system for deployment to be used in a universally interoperable manner;</li>
                <li>Uniformity — the need to minimize via specific standard setting, to the extent practical, the different solution variations that may potentially be deployed by member States;</li>
                <li>Technical Reliability — the need to provide guidelines and parameters to ensure member States deploy technologies that have been proven to provide a high level of confidence from an identity confirmation viewpoint; and that States reading data encoded by other States can be sure that the data supplied to them are of sufficient quality and integrity to enable accurate verification in their own system;</li>
                <li>Practicality — the need to ensure that recommended standards can be made operational and implemented by States without their having to introduce a plethora of disparate systems and equipment to ensure they meet all possible variations and interpretations of the standards;</li>
                <li>Durability — the requirement that the systems introduced will last the recommended maximum 10-year life of a travel document, and that future updates will be backward compatible.</li>
                </ul>


                <h6>Key Processes with respect to Biometrics</h6>
              <p >  The major components of a biometric system are:</p>
                <ul> <li>Establish identity — ensuring that the identity of the enrollee is known without doubt; </li>
                    <li>Capture — acquisition of a raw biometric sample; </li>
                    <li>Extract — conversion of the raw biometric sample data to an intermediate form; </li>
                    <li>Create template — conversion of the intermediate data into a template; </li>
                    <li>Compare — comparison with the information in a stored reference template </li>
                </ul>
            </div>
            <%--end: Biometric Terms--%>



        <%--start: why need biometric--%>
            <h2>
                <a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#1" style="font-size: 25px">
                    Why do we need Biometric standard?
                </a>
            </h2>
            <p></p>


            <div id="1" class="collapse">
                <p> The following are the big advantages of application deployment</p>
                <ul><li>leading and participating in the development of formal national and international biometric standards</li><li>promoting and supporting associated conformity assessment efforts</li><li>educating users on the capability of standards-based open-systems solutions</li><li>promoting standards adoption</li><li>developing conformance test architectures and test tools for biometric technical interfaces and data interchange formats that our customers can use to test implementations of these standards</li><li>supporting harmonization of biometric, tokens and security standards</li>
                    <li>addressing the use of biometric-based solutions for ID Management applications</li><li>leading and participating in major outreach efforts</li>
                    <li>IoT landscape is becoming more complex</li>
                    <li>Passwords are now not enough</li>
                    <li>Biometric security is more effective</li>
                    <li>More companies are embracing biometrics</li>
                </ul>
            </div>

        <%--end: why need biometric--%>




    </div>
</div>

<%@ include file="../includes/portletfooter.jsp" %>


</body></html>