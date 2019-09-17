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

    <title>OISF Portal | CCDS Standard</title>

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
<style>
    table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
    }

    td, th {
    border: 1px  #dddddd;
    text-align: left;
    padding: 8px;
    }

    tr:nth-child(even) {
    /*background-color: #dddddd;*/
    }
    </style>

</head>

<body id="page-top" style="position: relative; top: 0px;">

<%@ include file="../includes/portletheader.jsp" %>

<div id="container" class="first">
    <div class="container second"  >
        <pre style="font-size: 20px"> Home > <a class="urllink" href="<%=request.getContextPath()%>/portal#standard">Standards</a> > CCDS Standards</pre>
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

        <%--start: what ccds--%>
        <h2>
            <a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#defination" style="font-size: 25px">
                What is CCDS standard?
            </a>
        </h2>
        <div id="defination" class="collapse">
            <p>CCDS stands for Citizen Core Data Structure. There are few information which repeat very often in government use. So it is necessary to make a core data structure so that different government application can follow the same structure to make the government service more easier and faster.</p>
            <p>According to CCDS there are twelve mandatory fields and eight optional fields for a citizen.</p>
            <%--<ul>--%>
                <%--<li><h6>facial recognition </h6>– MANDATORY. MUST comply to [ISO/IEC 19794-5];</li>--%>
                <%--<li><h6>fingerprint recognition</h6> – OPTIONAL. If used, MUST comply to [ISO/IEC 19794-4];</li>--%>
                <%--<li><h6>iris recognition</h6> – OPTIONAL. If used, MUST comply to [ISO/IEC 19794-6].</li>--%>
            <%--</ul>--%>
        </div>
        <%--end: what deploccdsyment--%>





        <%--start: each fields Terms--%>
        <h2>
            <a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#terms" style="font-size: 25px">
                 CCDS description abot each field
            </a>
        </h2>
        <div id="terms" class="collapse">
            <p>
            The Universal Data Element Framework (UDEF) provides a conceptual
            naming convention framework with associated structured unique identifiers
            for indexing and aligning semantically equivalent concepts. It provides a
            means to associate different data element names (i.e. vocabulary terms) that
            semantically refer to the same concept, to a standard data element concept
            name provided by the framework that conforms to the relevant international
            standard on naming conventions, ISO/IEC 11179-5. A key definition provided in
            paragraph 3.3.9 of ISO/IEC 11179-1 is “data element concept – concept that can
            be represented in the form of a data element, described independently of any
            particular representation.” Interpreting the meaning of data element
            concepts is the essential first step of enabling semantic interoperability
            between disparate applications.</p><br><p>
            Although CCDS is not currently adopting the very generic enterprise-wide
            perspective of the UDEF, but the following meta-data definitions of the CCDS
            elements will ensure our initial country-wide e-Governance applications
            interoperability. CCDS can easily adopt the UDEF at a later date for
            international and industry-wide interoperability when situation warrants to
            do so. Applying UDEF principles to the current CCDS can unnecessarily
            complicate its adoption and delay the CCDS implementations further.
        </p>
        </div>
        <%--end: each fields Terms--%>

            <%--start: fields of ccds--%>
            <h2>
                <a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#fields" style="font-size: 25px">
                    Fields of CCDS
                </a>
            </h2>
            <div id="fields" class="collapse">
                <table>
                    <tr>
                        <th>Mandatory Fields</th>
                        <th>Optional Fields</th>

                    </tr>
                    <tr>
                        <td>National Id</td>
                        <td>Blood Group</td>

                    </tr>
                    <tr>
                        <td>Name in Bangla</td>
                        <td>Educational Qualification</td>
                    </tr>
                    <tr>
                        <td>Mother's Information</td>
                        <td>Marital Status</td>
                    </tr>
                    <tr>
                        <td>Father's Information</td>
                        <td>Disability</td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td>Ethnicity</td>
                    </tr>
                    <tr>
                        <td>Birth Place</td>
                        <td>Biometric Information</td>
                    </tr>
                    <tr>
                        <td>Nationality</td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                    </tr>
                    <tr>
                        <td>Religion</td>
                    </tr>
                    <tr>
                        <td>Occupation</td>
                    </tr>
                    <tr>
                        <td>Present Address</td>
                    </tr>
                    <tr>
                        <td>Permenant Address</td>
                    </tr>
                </table>

            </div>
            <%--end: fields of ccds--%>



        <%--start: why need biometric--%>
        <%--<h2>--%>
            <%--<a class=" title btn btn-link dropdown-toggle" data-toggle="collapse" data-target="#1" style="font-size: 25px">--%>
                <%--Why do we need Biometric standard?--%>
            <%--</a>--%>
        <%--</h2>--%>
        <%--<p></p>--%>


        <%--<div id="1" class="collapse">--%>
            <%--<p> The following are the big advantages of application deployment</p>--%>
            <%--<ul><li>leading and participating in the development of formal national and international biometric standards</li><li>promoting and supporting associated conformity assessment efforts</li><li>educating users on the capability of standards-based open-systems solutions</li><li>promoting standards adoption</li><li>developing conformance test architectures and test tools for biometric technical interfaces and data interchange formats that our customers can use to test implementations of these standards</li><li>supporting harmonization of biometric, tokens and security standards</li>--%>
                <%--<li>addressing the use of biometric-based solutions for ID Management applications</li><li>leading and participating in major outreach efforts</li>--%>
                <%--<li>IoT landscape is becoming more complex</li>--%>
                <%--<li>Passwords are now not enough</li>--%>
                <%--<li>Biometric security is more effective</li>--%>
                <%--<li>More companies are embracing biometrics</li>--%>
            <%--</ul>--%>
        <%--</div>--%>

        <%--end: why need biometric--%>




    </div>
</div>

<%@ include file="../includes/portletfooter.jsp" %>


</body></html>