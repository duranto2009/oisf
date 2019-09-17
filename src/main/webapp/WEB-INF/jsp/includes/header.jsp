<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- BEGIN HEADER INNER -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<div style="width: 100%; height:10px; background-color:#1AA326 "></div>
<div class="page-header navbar navbar-relative">
    <style>
        .page-header.navbar .top-menu .navbar-nav > li.dropdown-user .dropdown-toggle{
            padding: 0px 0px 0px 0px
        }
        .page-header.navbar .top-menu .navbar-nav > li.dropdown .dropdown-toggle:hover{
            background-color :white;
        }
    </style>
    <!-- BEGIN HEADER INNER -->
    <div class="page-header-inner " style="display: flex;justify-content: space-between">
                <!-- BEGIN LOGO -->
        <div style="display: flex;justify-content: flex-start;">
                <div class="page-logo" style="display: inline-block">
                    <div>
                        <a href="<%=request.getContextPath()%>/userdashboard">
                            <img src="<%=request.getContextPath()%>/assets/img/Logo-small.png" alt="logo" class="logo-default"
                                 style="margin-top: -17px"> </a>
                    </div>


                </div>

                <div  style="display: inline-block; margin: 0 10px;">

                    <div class="menu-toggler sidebar-toggler">
                        <span></span>
                    </div>

                </div>
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse"
                   data-target=".navbar-collapse">
                    <span></span>
                </a>
        </div>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN TOP NAVIGATION MENU -->
        <div class="top-menu pull-right">
            <ul class="nav navbar-nav pull-right" style="display: flex">
                <!-- BEGIN NOTIFICATION DROPDOWN -->
                <!-- DOC: Apply "dropdown-dark" class after "dropdown-extended" to change the dropdown styte -->
                <!-- DOC: Apply "dropdown-hoverable" class after below "dropdown" and remove data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to enable hover dropdown mode -->
                <!-- DOC: Remove "dropdown-hoverable" and add data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to the below A element with dropdown-toggle class -->

                <!-- BEGIN USER LOGIN DROPDOWN -->
                <!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                <li class="dropdown dropdown-language" style="margin-top:25px;margin-right:10px" id="sso-widget">

                </li>

                <li class="dropdown dropdown-user" style="display: flex;align-items: center;">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                       data-close-others="true" aria-expanded="false" style="display: flex;">
                        <img style="margin-top: 0px; margin-right: 0px; margin-left: 0px;align-self: center;" class=" img-responsive profile-userpic " alt="" src="<%=request.getContextPath()%>\assets\img\profile\1.jpg" >
                        <span class="username username-hide-on-mobile" style="margin-left: 10px;display: flex;align-items: center">  ${sessionScope.userInfo.getEmployeeDTO().getNameBng()}
                            <br/> ${sessionScope.userInfo.getDesignation()}
                            <br/>ঢাকা ,বাংলাদেশ</span>
                        <i class="fa fa-angle-down" style="align-self: center;"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-default">
                        <li>
                            <a href="<%=request.getContextPath()%>/profile">
                                <i class="icon-user"></i> প্রোফাইল </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="<%=request.getContextPath()%>/logout.do">
                                <i class="icon-key"></i> লগ আউট </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END HEADER INNER -->
</div>
<style>
    .tiles {
        margin: 30px;
        position: absolute;
        width: 320px;
        left: -220px;
        background-color: #f2f2f2;
        border: 1px solid #d8dade;
        display: grid;
        grid-template-columns: 100px 100px 100px

    }

    .profile-userpic  {

        -webkit-border-radius: 30%
        !important;-moz-border-radius: 30%
    !important;border-radius: 50% !important;
    }
</style>

