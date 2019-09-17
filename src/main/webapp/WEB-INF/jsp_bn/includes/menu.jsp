<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- BEGIN SIDEBAR MENU -->
<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
<ul class="page-sidebar-menu " data-keep-expanded="true" data-auto-scroll="true" data-slide-speed="200">
    <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
    <%--<li class="sidebar-toggler-wrapper">--%>
    <%--<!-- BEGIN SIDEBAR TOGGLER BUTTON -->--%>
    <%--<div class="sidebar-toggler">--%>
    <%--</div>--%>
    <%--<!-- END SIDEBAR TOGGLER BUTTON -->--%>
    <%--</li>--%>
    <li id="configDashboardMenu" style="background-color: #9DCE5B;margin-top: -10px"><a
            href="<%=request.getContextPath()%>/userdashboard" style="background-color: inherit">
        <i
                class="fa fa-th-large"></i>
        <span class="title" style="color: White"><b>ড্যাশবোর্ড</b> </span><span
            class="selected"></span></a>
    </li>
    <ul class="page-sidebar-menu " id="sidebar">

    </ul>


    ${sidemenu}

    <%--<ul class="page-sidebar-menu " i>--%>

        <%--<li>--%>
            <%--<a style="font-size: 14px!important;" href="<%=request.getContextPath()%>/feedback">--%>
                <%--<span class=" title gen-office1"> ফিডব্যাক  </span></a>--%>
        <%--</li>--%>
    <%--</ul>--%>


</ul>

<input type="hidden" id="usedorgid" value="">


<script>
    var data = [];

    function expandmenu() {
        var menuid = $("#menuid").val();
        var parentmenuId = $("#"+menuid).parents('li');
        for(var i=parentmenuId.length-1;i>=0;i--){
            var id = parentmenuId[i].id;
            if(id!=undefined && id !='') {
                $('#' + id).addClass("open");
                $('#'+id+' > ul').css('display','block');
            }
        }
        console.log(parentmenuId);
        if(menuid!=undefined && menuid !=''){
            $('#'+menuid).addClass("active");
        }

    }
    function getchildbyparentid(id) {
        var databyid = [];
        for (i = 0; i < data.length; i++) {
            if (data[i].parentId == id) databyid[i] = data[i];
        }
        return databyid;
    }

    var level = 0;

    function makeSideMenu(id) {
        var sideMenu = "";
        var clist = [];
        clist = getchildbyparentid(id);

        if (clist.length == 0) return "</a>\n";
        else if ((level + 1) != 1) sideMenu = " <span\n" +                             //setting necessary arrow
            "                        class=\"arrow \"></span></a>\n";

        level++;
        if (level != 1) sideMenu += "\n<ul class=\"sub-menu\">\n";

        clist.forEach(function (currentvalue, index, clist) {
            if (level == 1) {
                sideMenu += "\t\n<li id=\"" + currentvalue.id + "\"> \t<a href=\"#\"><span class=\"gen-office1\"></span><span class=\"title\"> " + currentvalue.nameBng + "  </span>" + makeSideMenu(currentvalue.id) + "\n</li>";
                sideMenu += '\t\n<li class="divider"></li>';
            }
            else {
                var link;
                if (currentvalue.url == '#') link = '\"#\"';
                else link = "\"<%=request.getContextPath()%>/" + currentvalue.url + "?menuid=" + currentvalue.id + "\"";
                sideMenu += "\t\n <li id=\"" + currentvalue.id + "\">\n" +
                    "                        \t<a href=" + link + "><i class=\"fa fa-edit\"></i> " + currentvalue.nameBng + makeSideMenu(currentvalue.id) + "\n</li>";
            }
        });
        if (level != 1) sideMenu += "\n</ul>\n";
        level--;
        return sideMenu;
    }

    function makeAppMenu(id) {


        var sideMenu = "";
        var plist = [];
        var clist = [];
        plist = getchildbyparentid(id);

        if (plist.length != 0) {
            sideMenu += sideMenu += "\t\n<li id=\"application\"> \t<a href=\"#\"><span class=\"gen-office1\"></span><span class=\"title\"> ই সার্ভিস সমূহ  </span> <span\n" +
                "                        class=\"arrow \"></span></a>\n<ul class=\"sub-menu\">\n";
            plist.forEach(function (currentvalue, index, clist) {
                clist = getchildbyparentid(currentvalue.id);
                if (clist.length == 0)
                    sideMenu += "\t\n <li id=\"" + currentvalue.id + "\" icon = " + currentvalue.iconUrl + ">\n" +
                        "                        \t<a  href=\"" + currentvalue.url + "\"target='_blank'><i class=\"fa fa-edit\"></i> " + currentvalue.nameBng + "</a></li>";

                else {
                    sideMenu += "\t\n <li id=\"" + currentvalue.id + "\" icon = " + currentvalue.iconUrl + ">\n" +
                        "                        \t<a href=\"" + currentvalue.url + "\" target='_blank'><i class=\"fa fa-edit\"></i> " + currentvalue.nameBng + " <span\n" +
                        "                        class=\"arrow \"></span></a>\n<ul class=\"sub-menu\">\n";

                    sideMenu += "\t\n <li id=\"" + currentvalue.id + "home" + "\">\n" +
                        "                        \t<a href=\"" + currentvalue.url + "\" target='_blank'><i class=\"fa fa-modx\"></i> হোমপেজ </a>\n</li>";
                    clist.forEach(function (cvalue, index, plist) {
                        sideMenu += "\t\n <li id=\"" + cvalue.id + "\">\n" +
                            "                        \t<a href=\"" + cvalue.url + "\" target='_blank'><i class=\"fa fa-anchor\"></i> " + cvalue.nameBng + "</a>\n</li>";
                    });
                    sideMenu += "</ul>\n</li>";
                }

            });
            sideMenu += "</ul>\n</li>";
        }

        return sideMenu;
    }


    function getActiveOrgId() {
        var orgID = -1;
        if (localStorage.getItem("orgId") == null) {
            orgID = $('#orgId').val();
            setActiveOrgId(orgID)

        } else {
            orgID = localStorage.getItem("orgId");
        }
        return orgID;
    }

    function setActiveOrgId(orgId) {
        storeValue("orgId", orgId);
    }

    function storeValue(key, value) {
        if (localStorage) {
            localStorage.setItem(key, value);
        } else {
            $.cookies.set(key, value);
        }
    }

    function getStoredValue(key) {
        if (localStorage) {
            return localStorage.getItem(key);
        } else {
            return $.cookies.get(key);
        }
    }


    $(document).ready(function () {


        var orgID = getActiveOrgId();

        localStorage.removeItem("sidemenu_" + orgID);
        //var orgID=$('#orgId').val();
        var app = "", side = "";
        // localStorage.clear();
        var key = "sidemenu_" + orgID;
        // window.localStorage.clear();
        var menu = getStoredValue(key);
        if (menu != null) {
            $("#sidebar").append(menu);
        }
        else {
            $.ajax({
                type: "POST",
                url: "<%=request.getContextPath()%>/getappdata",
                data: {
                    id: orgID
                },
                async: false,
                success: function (response) {
                    data = response;
                    var s = makeAppMenu(-1);
                    $("#sidebar").append(s);
                    app = s;
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
                    id: orgID
                },
                async: false,
                success: function (response) {
                    data = response;
                    var s = makeSideMenu(-1);
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

    });
</script>
<!-- END SIDEBAR MENU -->