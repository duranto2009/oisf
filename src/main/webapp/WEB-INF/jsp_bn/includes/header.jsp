<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!-- BEGIN HEADER INNER -->
<script src="<%=request.getContextPath()%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<div style="width: 100%; height:10px; background-color:#1AA326 "></div>
<div class="page-header navbar navbar-relative">
    <style>
        .page-header.navbar .top-menu .navbar-nav > li.dropdown-user .dropdown-toggle {
            padding: 0px 0px 0px 0px
        }

        .page-header.navbar .top-menu .navbar-nav > li.dropdown .dropdown-toggle:hover {
            background-color: white;
        }
    </style>

    <input type="hidden" name="empid" id="empId" value="${sessionScope.employeeId}">
    <input type="hidden" name="orgsize" id="orgSize" value="${sessionScope.organogramsize}">

    <input type="hidden" name="orgid" id="orgId" value="${sessionScope.organogramId}">

    <input type="hidden" name="username" id="username" value="${sessionScope.userInfo.getEmployeeDTO().getNameBng()}">
    <input type="hidden" name="officename" id="officename" value=" ${sessionScope.office}">
    <%--<input type="hidden" name="orgid" id="orgId" >--%>

    <!-- BEGIN HEADER INNER -->

    <div class="page-header-inner " style="display: flex;justify-content: space-between">
        <!-- BEGIN LOGO -->
        <div style="display: flex;justify-content: flex-start;">
            <div class="page-logo" style="display: inline-block">
                <div>
                    <a href="<%=request.getContextPath()%>/userdashboard">
                        <img src="<%=request.getContextPath()%>/assets/img/Logo-small.png" alt="logo"
                             class="logo-default"
                             style="margin-top: -17px"> </a>
                </div>


            </div>

            <div style="display: inline-block; margin: 0 10px;">

                <div class="menu-toggler sidebar-toggler">
                    <span></span>
                </div>

            </div>
            <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse"
               data-target=".navbar-collapse">
                <span></span>
            </a>
        </div>

        <%--<input type="hidden" id="orgsize" value="${orgs}">--%>
        <div class="top-menu pull-right">
            <ul class="nav navbar-nav pull-right" id="dropmenu" style="display: flex">

                <li class="dropdown dropdown-language" style="margin-top:25px;margin-right:10px" id="sso-widget">

                </li>



                <li class="dropdown dropdown-user" style="display: flex;align-items: center;">
                    <a href="javascript:;" id="dropdownid" data-myval="${sessionScope.userInfo.getDesignationId()}" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
                       data-close-others="true" aria-expanded="false" style="display: flex;">
                        <img style="margin-top: 0px; margin-right: 0px; margin-left: 0px;align-self: center;" class=" img-responsive profile-userpic " alt=""
                             src="${sessionScope.userInfo.getEmployeeDTO().getImageFileName()}">
                        <span id="infospan" class="username username-hide-on-mobile"
                              style="margin-left: 10px;display: flex;align-items: center">  ${sessionScope.userInfo.getEmployeeDTO().getNameBng()} ,
                            ${sessionScope.userInfo.getDesignation()}
                            <%--<br/> ${sessionScope.userInfo.getDesignation()}--%>
                            <br/> ${sessionScope.office}
                        </span>
                        <i class="fa fa-angle-down" style="align-self: center;"></i>
                    </a>




                    <ul id="headermenu" class="dropdown-menu dropdown-menu-default">


                        <c:forEach var="organogram" items="${sessionScope.organograms}">


                            <li id="${organogram.id}" value="${organogram.id}">
                                <a value="${organogram.nameBng}" href="#"> <i class="fab fa-nintendo-switch"></i>${organogram.nameBng}</a>
                            </li>
                            <%--<div class="divider"></div>--%>
                        </c:forEach>
                    <%--</ul>--%>
                    <%--<ul  class="dropdown-menu ">--%>




                        <%--<div class="divider"></div>--%>

                        <li id="profile">
                            <a href="<%=request.getContextPath()%>/profile">
                                <i class="icon-user"></i> প্রোফাইল </a>
                        </li>

                        <%--<div class="divider"></div>--%>

                        <li id="logout">
                            <a  href="<%=request.getContextPath()%>/logout.do">
                                <i  class="icon-key"></i> লগ আউট </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END HEADER INNER -->

    <input type="hidden" id="organogramheader" value="${sessionScope.organograms}">
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

    .profile-userpic {

        -webkit-border-radius: 30% !important;
        -moz-border-radius: 30% !important;
        border-radius: 50% !important;
    }
</style>
<script>
    var s='' +
        '\n' +
        '                        <li id="profile" >\n' +
        '                            <a href="<%=request.getContextPath()%>/profile">\n' +
        '                                <i class="icon-user"></i> প্রোফাইল </a>\n' +
        '                        </li>\n' +
        '\n' +
        '                       ' +
        '\n' +
        '                        <li id="logout">\n' +
        '                            <a  href="<%=request.getContextPath()%>/logout.do">\n' +
        '                                <i  class="icon-key"></i> লগ আউট </a>\n' +
        '                        </li>'

    var $activeorgditach;
    function makeitactive(selected) {
         $('#logout').detach();
         $('#profile').detach();

        var info=$('#infospan');
        info.empty();
        info.append($('#username').val());
        info.append(selected.children('a').text());
        info.append('<br/>');
        info.append($('#officename').val());


        if($activeorgditach!=undefined)$('#headermenu').append($activeorgditach);
        $('#headermenu').append(s);
        $activeorgditach = selected.detach();
        $('#dropdownid').prop('data-myval',getActiveOrgId());
    }
    $(document).ready(function () {




//        console.log($activeorgditach);






        var $logout=$('#logout');
        $('#dropdownid').prop('data-myval',getActiveOrgId());

        var  organograms =$('#organogramheader').val();

        $logout.on('click',function () {
           // localStorage.clear();
            localStorage.removeItem("orgId");
            localStorage.removeItem("sidemenu_"+getActiveOrgId());

        });

        // #dropmenu > li.dropdown.dropdown-user > ul > li:nth-child(3)
        var $selector = $('#dropmenu > li.dropdown.dropdown-user > ul > li');

        //var $selector=$('#dropmenu li');
        var size = $('#orgSize').val();


        $selector.on('click', function () {
            // location.reload();
            makeitactive($(this));

            if ($selector.index(this) < size) {


                var orgID=this.value;
                $('#usedorgid').val(orgID);

                var app = "",side = "";
                // localStorage.clear();
                var key = "sidemenu_"+orgID;
                localStorage.removeItem("sidemenu_"+orgID);

                setActiveOrgId(orgID);

                var menu = getStoredValue(key);

                if(menu!=null){
                    $("#sidebar").append(menu);
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/getappdata",
                        data: {
                            id: getActiveOrgId()
                        },
                        async: false,
                        success: function (response) {
                            data = response;
                            // if(response==null){
                            //
                            //
                            //     $('#sortable_portlets').hide();
                            //
                            // }else {
                            //     $('#sortable_portlets').show();
                            // }
                            var s = makeAppMenu(-1);
                            $("#sidebar").empty();
                            $("#sidebar").append(s);
                            app = s;

                            // $('div[id^=app_]').remove();
                            dashboardloader(orgID);
                            return response;
                        },
                        error: function () {
                             toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ");
                        }
                    });

                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/getsidemenudata",
                        data: {
                            id: getActiveOrgId()
                        },
                        async: false,
                        success: function (response) {
                            data = response;
                            var s = makeSideMenu(-1);
                            //$("#sidebar").empty();
                            $("#sidebar").append(s);
                            side = s;
                            expandmenu();
                            return response;
                        },
                        error: function () {
                             toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ");
                        }
                    });

                    storeValue(key, app + "\n" + side);
                }



            }

        });


        localStorage.clear();
        var beforereloadactive = getActiveOrgId();

        setActiveOrgId(beforereloadactive);
        makeitactive($("#headermenu #"+beforereloadactive));

    });
</script>

