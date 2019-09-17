
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">

<head>

    <meta charset="utf-8"/>
    <%@ include file="../includes/head.jsp" %>
    <c:set var="context" value="${pageContext.request.contextPath}"/>


    <style type="text/css">


        .dashboard-stat ul li {
            /*margin-left: -20px;*/
            list-style-type: square;
            color: white;
        }

        .portlet:not(.light):not(.box):not(.solid) {
            padding: 0px;
        }

        .checkbox {
            margin: 15px !important;
        }

        ul {
            list-style-type: none;
        }

        #sortable_portlets {
            background-color: white;
            margin: 15px;
            padding: 15px;
            margin-top: 0px;
            margin-left: 20px;
        }

        .row {
            /*margin-top: 13px;*/
            margin-bottom: 13px;
            margin-left: 0px;
            margin-right: 0px;
            /*margin-left:10px;*/
        }

        .appmodules {
            width: 34%;
            padding: 10px;
            height: 120px;
        }

        .dashboadicon {
            width: 100%;
            height: 120px;
            background-color: white;
        }

        .dashboard-stat .footer {
            padding-left: 15px;
            padding-top: 5px;
            padding-bottom: 5px;
            padding-bottom: 5px;
        }

        .portlet > .portlet-title {
            min-height: 0px;
        }

        .col-md-8 {
            width: 60%;
        }

        .sso-logo {
            font-size: 12px;
        }

        /*start: added by forhad*/
        .modal-header {
            background-color: #9fea3c !important;
        }

        #sortable_portlets img:hover {
            cursor: pointer;
        }
        .portlet-sortable-placeholder {
            border-style:dashed !important;
            border-width: 2px 2px 2px 2px !important;
            border-color: black !important;
            margin-bottom: 25px;
            height: 170px !important ;
            /*background: lightgrey;*/
            width: 90%;
        }
        /*end: added by forhad*/

    </style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed">
<!-- BEGIN HEADER -->
<div class="page-header -i navbar navbar-fixed-top">
    <%@ include file="../includes/header.jsp" %>
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container" style="height: 100%">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar-wrapper" style="margin-top: 20px">
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <div class="page-sidebar navbar-collapse collapse">
            <%@ include file="../includes/menu.jsp" %>
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">

        <div class="page-content">

            <div id="savediv" class="row" style="margin: 0px 50px 25px 50px">
                <button id="dashboardsave" type="button" class="btn red pull-right"> সংরক্ষণ করুন </button>
            </div>


            <div class="row" id="sortable_portlets">


                <div id="column1" class="col-lg-3 col-md-4 col-sm-6 col-xs-12 column sortable">
                    <div class="portlet portlet-sortable-empty" style="height: 115px;"></div>
                </div>
                <div id="column2" class="col-lg-3 col-md-4 col-sm-6 col-xs-12 column sortable">
                    <div class="portlet portlet-sortable-empty" style="height: 115px;"></div>
                </div>
                <div id="column3" class="col-lg-3 col-md-4 col-sm-6 col-xs-12 column sortable">
                    <div class="portlet portlet-sortable-empty" style="height: 115px;"></div>
                </div>
                <div id="column4" class="col-lg-3 col-md-3 col-sm-6 col-xs-12 column sortable">
                    <div class="portlet portlet-sortable-empty" style="height: 115px;"></div>
                </div>
            </div>
        </div>
        <!-- END CONTENT BODY -->
        <div id="app" class="dashboard-stat  portlet portlet-sortable"
             style="display: none;box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.22)">
            <div class="portlet-title ui-sortable-handle">

                <button type="button" class="closePortlet pull-right" id="delete"
                        style=" background-color: Transparent;background-repeat:no-repeat;border: none;cursor:pointer;
                        overflow: hidden;outline:none;">
                    <i class="fa fa-times" aria-hidden="true" style="color:white"></i>
                </button>

            </div>

            <div class="row" style="min-height: 55px;">
                <div class="col-lg-8 col-md-8 col-sm-4 col-xs-4">
                    <img class="dashboadicon sso-logo" style="" src="" alt="কোনো ফটো পাওয়া যায় নি ">
                </div>

                <div class="col-lg-4 col-md-4 col-sm-8 col-xs-8 appmodules">

                    <ul style="margin-left: -20px">

                    </ul>

                </div>
            </div>

            <div class="more footer portlet-title ui-sortable-handle"
                 style="color: rgb(255, 255, 255);opacity: 1;text-transform: none;font-size: 13px;font-weight: 400;"
                 href="javascript:void(0);">


                <button type="button" class="closePortlet pull-right " id="settings"
                        style=" background-color: Transparent;background-repeat:no-repeat;border: none;cursor:pointer;overflow: hidden;outline:none;">

                    <%--<a data-toggle="modal" href="#responsive">--%>
                    <i class="fa fa-cog" aria-hidden="true" style="color:white"></i>
                    <%--</a>--%>
                </button>


            </div>
        </div>
    </div>

</div>
<form action="" method="post" id="dashboardlogin" target="_blank">
    <input type="hidden" name="appid" id="appid" value="">
    <input type="hidden" name="token" id="token" vlue="">
</form>

<input type="hidden" name="forbidden" id="forbidden" value="${forbidden}">
<!-- BEGIN FOOTER -->
<div class="page-footer" style="position: fixed;width: 100%">
    <%@ include file="../includes/footer.jsp" %>
</div>
<%@ include file="../includes/includes.jsp" %>

<%--<script src="${context}/assets/js/AnimationPractice.js" type="text/javascript"></script>--%>
<script src="${context}/assets/js/menu.js" type="text/javascript"></script>
<script src="${context}/assets/pages/scripts/portlet-draggable.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript" src="${context}/assets/pages/scripts/ui-bootbox.min.js"></script>

<script th:inline="javascript">
    var postLink;



    function loginWithToken(token) {
        $("#token").val(token.trim());
        //$("#oisfForm").attr("action","http://162.222.186.235/billing/oisf/testOisf.jsp");
        //$("#oisfForm").attr("action","http://localhost/projapoti_framework/login");
        $("#oisfForm").attr("action", postLink);
        $("#oisfForm").submit();
    }

    $(document).ready(function () {

        var $forbid=$('#forbidden');
        // var count=0;
        // if(forbid==1){
        //
        //     count++;
        //
        //     if(count==1){
        //         $('#has_access').val(0);
        //     }else {
        //         $('#has_access').val(0);
        //     }
        //
        //
        // }

        if($forbid.val()==1){
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-bottom-right"
            };
            toastr.error(" আপনি যে অপশনটি নির্বাচন করেছেন তা আপনার জন্নে অনুমদিত নয়  ");
            $('#forbidden').val(0);

        }

        $(".link").click(
            function () {
                postLink = $(this).attr("data-id");
                searchText($(this).attr("data-id"));
            }
        )

    });

</script>

<!-- END THEME LAYOUT SCRIPTS -->

<script>
    var bool = 0;
    var colorPattern;
    var initialstate;
    var deleteditem = [];
    var organisationId;

    function showSettingsModal(res, id) {
        console.log("============== response   + ID ================");
        console.log(res + " : " + id);
        var options = [
            {value: '#', text: 'Choose one'},
            {value: 1, text: 'Vim'},
            {value: 2, text: 'Sublime Text'},
            {value: 3, text: 'WebStorm/PhpStorm'},
            {value: 4, text: 'Komodo IDE'},
            {value: 5, text: 'Other'}
        ];

        var arr = [];
        var len = res.length;
//        arr.push({
//            value: '#',
//            text: 'Choose one'
//        });
        for (var i = 0; i < len; i++) {
            arr.push({
                value: res[i].id,
                text: res[i].nameBng
            });
        }
        // console.log("=========== arr ============\n");//")
        // console.log(arr);
        // console.log("=========== options ============\n");//")
        // console.log(options);


//        getting the options selected previously by user
        var selected;
        $.ajax({
            type: "POST",
            url: "${context}/dashitemmodalbyorgid",
            data: {
                modalId: id
            },
            async: false,
            success: function (response) {
                console.log("===!!!! GET MODULE ID BY USER !!!! ========");
                console.log(response);
                selected = response;
//                showSettingsModal(response);

            },
            error: function () {
                toastr.options = {"closeButton": true,"debug": false, "positionClass": "toast-bottom-right"};toastr.error(" পাওয়া যায়নি। আবার চেষ্টা করুন");
            }
        });

        console.log("=========== SELECTED ====================");
        console.log(selected);
        $("#dashboardsave").trigger("click");

        bootbox.prompt({
            title: "<div style='color: white'>মডিউল বাছাই করুন </div> ",
            size: "small",
            value: selected,
            inputType: "checkbox",
            inputOptions: arr,
            buttons: {
                cancel: {
                    label: '<i class="fa fa-times "></i> বাতিল করুন ',
                    className: 'btn-danger'
                },
                confirm: {
                    label: '<i class="fa fa-check "></i> সংরক্ষণ করুন ',
                    className: 'btn-success'
                }
            },
            callback: function (result) {

                showResult(result);
            }
        });

        function showResult(result) {
            if (typeof result !== "undefined" && result !== null) {
                console.log("============= result ============= ");
                console.log(result);
                // $('.modal.in .modal-dialog').hide();
                // $(".modal.in .modal-dialog .btn").off("click");




                if (result.length > 2 || result.length == 0) {
                     // alert("সর্বোচ্চ দুইটি অ্যাপ্লিকেশন সিলেক্ট করা যায়");
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" সর্বোচ্চ দুইটি অ্যাপ্লিকেশন সিলেক্ট করা যায়।");

                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "${context}/savedashitem",
                        data: {
                            id: result,
                            modalId: id
                        },
                        async: false,
                        success: function (response) {
//                            createDashBoard(response);
                            console.log("=========================================");
                            console.log(response);
                            // $("#sortable_portlets").empty();
                            // createColorPattern();
                            dashboardloader(organisationId);
                            console.log("=========================================");
                            $('.modal.in .modal-dialog').hide();
                            $(".modal.in .modal-dialog .btn").off("click");
                        },
                        error: function () {
                            toastr.options = {
                                "closeButton": true,
                                "debug": false,
                                "positionClass": "toast-bottom-right"
                            };
                            toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ");
                            $('.modal.in .modal-dialog').hide();
                            $(".modal.in .modal-dialog .btn").off("click");
                        }
                    });

//                    alert(result);


                    // location.reload(true);
                    // dashboardloader(getActiveOrgId());
                    // var orgID = getActiveOrgId();
                }
            }else{
                $('.modal.in .modal-dialog').hide();
                $(".modal.in .modal-dialog .btn").off("click");
            }
        }
    }

    function showModal(appid) {
        var idpart = appid.split("_");
        var actualid = parseInt(idpart[1]);
        bootbox.confirm({
            message: '<p class="text-center"> অ্যাপ্লিকেশন টি মুছে ফেলতে চান? </p>',
            title: "<div style='color: white'> নিশ্চিত করুন </div> ",
            size: "small",
            buttons: {
                confirm: {
                    label:  'হ্যাঁ' ,
                    className: 'btn-success'
                },
                cancel: {
                    label: 'না',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result == true) {
                    $('#savediv').show();
                    deleteditem.push(actualid);
                    $("#" + appid).remove();
                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");

                } else {
                    $('#savediv').hide();
                    $('.modal.in .modal-dialog').hide();
                    $(".modal.in .modal-dialog .btn").off("click");
                }

            }
        });

    }

    function getChild(child, id, appName) {


        console.log("============ CHILD ============ ");
        console.log(child);
        console.log("============ ID =============== ");
        console.log(id);
        console.log("==================APP NAME ================== ");
        console.log(appName);
        console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        //        getting the options selected previously by user
        var selected;
        $.ajax({
            type: "POST",
            url: "${context}/dashitemmodalbyorgid",
            data: {
                modalId: id
            },
            async: false,
            success: function (response) {
                console.log("===!!!! GET MODULE ID BY USER !!!! ========");
                console.log(response);
                selected = response;
//                showSettingsModal(response);

            },
            error: function () {
                toastr.options = {"closeButton": true,"debug": false, "positionClass": "toast-bottom-right"};toastr.error(" পাওয়া যায়নি। আবার চেষ্টা করুন");
            }
        });

        var s = "";
        for (i = 0; i < child.length; i++) {
            var url = child[i].url, nameBng = child[i].nameBng;
            if (selected.includes(child[i].id))
                s += "<li><a class='sso-logo' data-appName='" + appName + "' data-landing-page-url='" + url + "' href='" + url + "' style=\"color:white;text-decoration:none;\">" + nameBng + "</a></li>\n";
        }
        return s;
    }


    function createPortletFromTemplate(id, url, namebng, iconurl, children, appName, defaultPage) {
        // $("#app").empty();
        var genportlet = $("#app").clone();
        // genportlet.empty();
        var applink = $("div>a", genportlet);
        var appicon = $("div>div>img", genportlet);
        var appmodule = $("div>ul", genportlet);
        var footer = $(".footer", genportlet);

        footer.append(namebng);

        genportlet.css("display", "block");
        genportlet.attr("id", "app_" + id);
        // logos urls
       // applink.prop("href", defaultPage);
         applink.prop("href", url);
        applink.attr("class", "sso-logo");
        applink.attr("style", "height:40px;color:white;text-decoration:none;");
        applink.attr("data-appname", appName);
        applink.attr("data-landing-page-url", defaultPage);
        applink.attr("target", "_blank")
        //applink.text(namebng);
        applink.text("");

        // target="_blank"

        appicon.attr("src", iconurl);
        appicon.attr("data-landing-page-url", defaultPage);
        // appicon.attr("href", url);
         appicon.attr("href", defaultPage);
        appicon.attr("data-appname", appName);
        appicon.attr("data-landing-page-url", defaultPage);
        appicon.attr("target", "_blank")
        appmodule.append(getChild(children, id, appName));
        return genportlet;
    }

    function createDashBoard(data) {
        //
        // $('#column1').empty();
        // $('#column2').empty();
        // $('#column3').empty();
        // $('#column4').empty();


        var column = ["#column1", "#column2", "#column3", "#column4"];

        initialstate = [];
        console.log(" inside create dash board ");
        console.log(data);

        for (j = 0; j < data.length; j++) {
            var s = createPortletFromTemplate(data[j].id + "", data[j].url, data[j].nameBng, data[j].logoUrl, data[j].child, data[j].nameEng, data[j].defaultPage);
            var id = column[data[j].columnId - 1] + " .portlet-sortable-empty";
            var ele = $(id);
            ele.before(s);

            var key = "app_" + data[j].id;
            initialstate[key] = {
                row: data[j].rowId,
                column: data[j].columnId
            };
        }
    }

    function create2DArray(rows) {
        var arr = [];

        for (var i = 0; i < rows; i++) {
            arr[i] = [];
        }

        return arr;
    }

    function getColor() {
        var color, scolor;
        if (bool == 1) {
            color = "#693293";
            scolor = "#7F51A3", bool = 0
        }
        else {
            color = "#8CC63E";
            scolor = "#9DCE5B";
            bool = 1;
        }

        var C = {
            c: color,
            s: scolor
        };
        return C;
    }

    function createColorPattern() {
        colorPattern = create2DArray(100);
        for (row = 0; row < 100; row++) {
            bool = 1 - bool;
            for (column = 0; column < 4; column++) {

                colorPattern[row][column] = getColor();
            }
        }
    }

    function colorRefresh() {
        var s = $('#sortable_portlets .portlet-sortable');
        bool = 1;

        s.each(function () {
            var pp = $(this).parent();
            var bf = $(this).prevUntil(pp);
            var r = bf.length;
            var c = parseInt(pp[0].id.slice(-1)) - 1;
            color = colorPattern[r][c];
            $(this).css("background-color", color.c);
            $('.more', this).css("background-color", color.s);
            $(".appmodules", this).css("background-color", color.s);

        });
    }

    function dashboardloader(id) {

         bool = 0;
         initialstate =[];
         deleteditem = [];

        $('div[id^=app_]').remove();
        $('#savediv').hide();
        $.ajax({
            type: "POST",
            url: "${context}/dashitem",
            data: {
                id: id
            },
            async: false,
            success: function (response) {
                createDashBoard(response);
                // console.log(initialstate);
            },
            error: function () {
                toastr.options = {"closeButton": true,"debug": false, "positionClass": "toast-bottom-right"};toastr.error(" পাওয়া যায়নি। আবার চেষ্টা করুন");
            }
        });

        $('#sortable_portlets').sortable({
            scroll: true,
            scrollSensitivity: 100,
            scrollSpeed: 100,
            update: function () {
                colorRefresh();
                $('#savediv').show();
            }

        });

        $("#application ul li").draggable({
                helper: 'clone',
                containment: 'window'
            }
        );


        $('#sortable_portlets').droppable(
            {
                accept: '#application ul li',
                drop: function (ev, ui) {
                    var droppedItem = $(ui.draggable).clone();
                    var id = droppedItem[0].id;
                    var list = $("#sortable_portlets");
                    var check = $("#app_" + id, list);
                    if (check.length == 0) {

                        $('#savediv').show();
                        deleteditem = jQuery.grep(deleteditem, function (value) {
                            return value != id;
                        });
                        var url = droppedItem[0].firstElementChild.href,
                            nameBng = droppedItem[0].firstElementChild.innerText, logoUrl = droppedItem.attr("icon"),
                            child = [],
                            childArray = [];
                        child = $('#' + id + ' ul').children();
                        var yes = false;
                        child.each(function (value, current_element) {
                            if (yes) {
                                var url = current_element.firstElementChild.href,
                                    nameBng = current_element.firstElementChild.innerText;
                                childArray.push({
                                    url: url,
                                    nameBng: nameBng
                                })
                            }
                            else yes = true;

                        });
                        var pos = ui.draggable.offset(), dPos = $(this).offset();
                        var width = list.width();
                        var column = Math.floor((ev.pageX - list.parent().offset().left) / (width * .25)) + 1;

//                        dynamically list selection


                        var s = createPortletFromTemplate(id, url, nameBng, logoUrl, childArray, "");
                        var ele = $("#column" + column + " > .portlet-sortable-empty");
                        ele.before(s);
                        colorRefresh();


                    }
                    else {
                        // alert("app already exist");
                        toastr.options = {
                            "closeButton": true,
                            "debug": false,
                            "positionClass": "toast-top-right"
                        };
                        toastr.error("অ্যাপলিকেশন  ইতিমধ্যে  ড্যাশবোর্ডে রয়েছে।");
                    }
                }
            }
        );

        colorRefresh();
    }
    $(document).ready(function () {
        localStorage.clear();

            var orgID = getActiveOrgId();
            organisationId = orgID;

            $('#savediv').hide();

            createColorPattern();

            dashboardloader(orgID);

            $("#dashboardsave").click(function () {
                $('#savediv').hide();
                var changeditem = [];
                var createditem = [];
                var s = $('#sortable_portlets .portlet-sortable');

                s.each(function () {

                    var pp = $(this).parent();
                    var bf = $(this).prevUntil(pp);
                    var r = bf.length;
                    var c = parseInt(pp[0].id.slice(-1)) - 1;

                    var app = initialstate[this.id];
                    var idpart = this.id.split("_");
                    var actualid = parseInt(idpart[1]);
                    if ($.isEmptyObject(app)) createditem.push({
                        id: actualid,
                        row: r + 1,
                        column: c + 1
                    });
                    else {
                        if (!((app.row == r + 1) && (app.column == c + 1))) {
                            changeditem.push({
                                id: actualid,
                                row: r + 1,
                                column: c + 1
                            });
                        }
                    }


                });

                //post change list and deleted list
                var data = {
                    "updated": changeditem,
                    "created": createditem,
                    "deleted": deleteditem,
                    "desid": getActiveOrgId()
                };

                $.ajax({
                    type: "POST",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    url: "${context}/savedashboard",
                    data: JSON.stringify(data),
                    async: false,
                    success: function (response) {
                        var s = $('#sortable_portlets .portlet-sortable');
                        initialstate = [];
                        s.each(function () {

                            var pp = $(this).parent();
                            var bf = $(this).prevUntil(pp);
                            var r = bf.length;
                            var c = parseInt(pp[0].id.slice(-1)) - 1;
                            var idpart = this.id;
                            initialstate[idpart] = {
                                row: r + 1,
                                column: c + 1
                            };
                        });
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


            });

            $("#sortable_portlets").on('click', "#delete", function (e) {
                var app = $(this).parents(".portlet-sortable");
                var id = app[0].id;
                showModal(id);
            });


            $("#sortable_portlets").on('click', "#settings", function (e) {

                var app = $(this).parents(".portlet-sortable");
                var id = app[0].id;
                id = id.replace(/[^\d.]/g, '');
//            alert(id);
                $.ajax({
                    type: "POST",
                    url: "<%=request.getContextPath()%>/dashitemmodal",
                    data: {
                        id: id
                    },
                    async: false,
                    success: function (response) {
                        // console.log(response);
                        if(response.length>0){
                            showSettingsModal(response, id);
                        }else{
                            toastr.options = {
                                "closeButton": true,
                                "debug": false,
                                "positionClass": "toast-top-right"
                            };
                            toastr.error(" মডিউল পাওয়া যায়নি");

                        }


                    },
                    error: function () {
                        toastr.options = {
                            "closeButton": true,
                            "debug": false,
                            "positionClass": "toast-top-right"
                        };
                        toastr.error(" মডিউল পাওয়া যায়নি");
                    }
                });

            });


            var postLink;

            function loginWithToken(token) {
                $("#token").val(token.trim());
                //$("#oisfForm").attr("action","http://162.222.186.235/billing/oisf/testOisf.jsp");
                //$("#oisfForm").attr("action","http://localhost/projapoti_framework/login");
                $("#oisfForm").attr("action", postLink);
                $("#oisfForm").submit();
            }

        }
    );

</script>
<style>
    .image {
        width: 80px;
        height: 80px;
        display: block;
        float: left;
        padding-top: 10px;
        padding-left: 15px;
        margin-bottom: 15px;
        font-size: 35px;
        line-height: 35px;
    }

    #throbble {
        display: none
    }
</style>
<!--script type="text/javascript" src="http://103.48.18.28/sso/lib/script.js"></script-->
<script type="text/javascript" src="http://idp.doptor.gov.bd/sso/lib/script.2.min.js"></script>
<%--<script type="text/javascript" src="http://174.136.37.245:8080/sso/lib/script.2.min.js"></script>--%>

<script type="text/javascript">
    $(document).ready(function () {
        $('body').show();

        // widget.init(
        //     {
        //         "ajaxUrl": "/iALoginReqInfoAjax",
        //         "widgetColor": "light",
        //         "widgetSize": "20px"
        //     }
        // );
        widget.init({
            "widgetColor": "light",
            "widgetSize": "20px",
            "appPermissionURL": "<%=request.getContextPath()%>/oisf/sso/user/apps"
        });

        http://103.48.18.21:8081/
            $('.sso-logo').click(function () {
                var href = $(this).attr('href');
                if (href != undefined) {
                    if (href.indexOf('http://') >= 0) window.location.replace(href);
                    else window.location.replace('http://' + href);
                }
            });
    });
</script>


</body>

</html>