<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

    <meta charset="utf-8"/>
    <c:set var="context" value="${pageContext.request.contextPath}" />

    <%@ include file="../includes/head.jsp" %>
    <%--<link href="/assets/layouts/layout2/css/themes/blue.min.css" rel="stylesheet" type="text/css" id="style_color" />--%>
    <link href="../assets/layouts/layout2/css/custom.min.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css" />




  <style>
      .modal-dialog{
          width: 30%;
          height: 80%;
      }
      .modal-content{
          width: 100%;
          height: 100%;
          display: flex;
          flex-direction: column;
          justify-content: space-between;
      }

      .modal-body{
          overflow-y: auto;
          flex-grow: 1;
      }

      .checkbox input[type=checkbox], .checkbox-inline input[type=checkbox], .radio input[type=radio], .radio-inline input[type=radio]{
          margin: 0px;
          position: static;
          margin-right: 10px;
      }

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

<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->

    <div class="page-sidebar-wrapper"style="margin-top: 20px">
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <div class="page-sidebar navbar-collapse collapse">

            <%@ include file="../includes/menu.jsp" %>
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->

    <div class="page-content-wrapper">
        <!-- START MAIN CONTENT -->
        <div class="page-content">
            <div class="card" >
                <div class="card-block">
                    <div class="portlet light bordered" id="form_wizard_1">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class=" icon-layers font-red"></i>
                                <span class="caption-subject font-red bold uppercase"> System Permisssion Edit for "${appname}"
                                            <span class="step-title"> </span>
                                        </span>
                            </div>
                            <%--<div class="actions">--%>
                                <%--<a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">--%>
                                    <%--<i class="icon-cloud-upload"></i>--%>
                                <%--</a>--%>
                                <%--<a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">--%>
                                    <%--<i class="icon-wrench"></i>--%>
                                <%--</a>--%>
                                <%--<a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">--%>
                                    <%--<i class="icon-trash"></i>--%>
                                <%--</a>--%>
                            <%--</div>--%>
                        </div>
                        <h1></h1>
                        <div class="portlet-body form">
                            <form class="form-horizontal" action="#" id="submit_form" method="POST" novalidate="novalidate">
                                <div class="form-wizard">
                                    <div class="form-body">
                                        <ul class="nav nav-pills nav-justified steps">

                                            <li class="active">
                                                <a href="#tab2" data-toggle="tab" class="step">
                                                    <span class="number"> 1 </span>
                                                    <span class="desc">
                                                                <i class="fa fa-check"></i> মৌলিক সার্ভিস সম্পাদনা </span>

                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab3" data-toggle="tab" class="step active">
                                                    <span class="number"> 2 </span>
                                                    <span class="desc">
                                                                <i class="fa fa-check"></i> শেয়ারকৃত সার্ভিস সম্পাদনা </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#tab4" data-toggle="tab" class="step">
                                                    <span class="number"> 3 </span>
                                                    <span class="desc">
                                                                <i class="fa fa-check"></i> পদ সম্পাদনা </span>
                                                </a>
                                            </li>
                                        </ul>
                                        <div id="bar" class="progress progress-striped" role="progressbar">
                                            <div class="progress-bar progress-bar-success" style="width: 25%;"> </div>
                                        </div>
                                        <div class="tab-content">
                                            <div class="alert alert-danger display-none">
                                                <button class="close" data-dismiss="alert"></button> You have some form errors. Please check below. </div>
                                            <div class="alert alert-success display-none">
                                                <button class="close" data-dismiss="alert"></button> Your form validation is successful! </div>

                                            <div class="tab-pane active" id="tab2">
                                                <h3 class="block"></h3>


                                                <div class="form-group" style="height: 475px;">


                                                    <div class=" col-md-offset-1 col-md-10"
                                                         id="jstree" style="height: 475px;overflow-y: scroll;">

                                                    </div>
                                                </div>

                                                <ul class="pager wizard">
                                                    <li class="previous first" style="display:none;"><a href="#">First</a></li>
                                                    <li class="previous"><a href="#">পূর্ববর্তী</a></li>
                                                    <li class="next last" style="display:none;"><a href="#">Last</a></li>
                                                    <li class="next"><a href="#">পরবর্তী</a></li>
                                                </ul>


                                            </div>
                                            <div class="tab-pane" id="tab3">
                                                <h3 class="block"> </h3>
                                                <div class="form-group" style="height: 475px;">


                                                    <div class=" col-md-offset-1 col-md-10"
                                                         id="jstree2" style="height: 475px;overflow-y: scroll;">

                                                    </div>
                                                </div>
                                                

                                                <ul class="pager wizard">
                                                    <li class="previous first" style="display:none;"><a href="#">First</a></li>
                                                    <li class="previous"><a href="#">পূর্ববর্তী</a></li>
                                                    <li class="next last" style="display:none;"><a href="#">Last</a></li>
                                                    <li class="next"><a href="#">পরবর্তী</a></li>
                                                </ul>
                                            </div>
                                            <div class="tab-pane" id="tab4">
                                                <h3 class="block"></h3>

                                                <div id="officestructure" style="height: 475px;overflow-y: scroll;">

                                                </div>

                                                                               <%----> Form Submit Button Goes Here <----%>
                                                <ul class="pager wizard">
                                                    <%--<li class="btn green button-submit" style="display:none;"><a href="#">First</a></li>--%>
                                                    <%--<li class="btn green button-submit"><a href="#">Previous</a></li>--%>
                                                    <%--<li class="next last" style="display:none;"><a href="#">Last</a></li>--%>
                                                    <%--<li class="next"><a href="#">Next</a></li>--%>
                                                    <li class="finish"><a href="javascript:;">Submit</a></li>
                                                </ul>



                                            </div>







                                        </div>
                                    </div>
                                    <div class="form-actions">
                                        <div class="row">
                                            <div class="col-md-offset-3 col-md-9">
                                                <a href="javascript:;" class="btn default button-previous disabled" style="display: none;">
                                                    <i class="fa fa-angle-left"></i> Back </a>
                                                <%--<a href="javascript:;" class="btn btn-outline green button-next"> Continue--%>
                                                    <%--<i class="fa fa-angle-right"></i>--%>
                                                <%--</a>--%>
                                                <a   href="javascript:;" class="btn green button-submit" style="display: none;"> Submit
                                                    <i class="fa fa-check"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--<input type="button" class="btn button-next" name="next" value="Blaahhh" id="blah">--%>

                            </form>
                        </div>
                    </div>

                    <input type="hidden" id="appid" value="${appid}">


                </div>
            </div>
            <input type="hidden" id="menuid" value="${menuid}">
        </div>
    </div>
    <!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="page-footer">
    <%@ include file="../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../includes/includes.jsp" %>
<script>



    var  previousstate = undefined;
    var previousstateorg = [];
    var previousstateexception =[];

    var checkeditem = [];
    var uncheckeditem = [];

    var modallock =false;




    //fetch permitted data
    function permitteddata(){
        previousstate = undefined;
        previousstateorg = [];
        previousstateexception =[];
        checkeditem =[];
        uncheckeditem=[];
        $.ajax({
            type:"GET",
            url: "<%=request.getContextPath()%>/selectedservice",
            // url: "http://192.168.21.212:8082/selectedservice",
            data:{
              id: $('#appid').val()
            },
            async:false,
            success:function (response) {
                previousstate = response;
                console.log(response)
                for(var i= 0;i<response.originorganograms.length;i++){
                    previousstateorg.push(response.originorganograms[i].originorgid);
                }

                for(var i= 0;i< response.originorganogramswithexception.length;i++){
                    for(var j=0;j<response.originorganogramswithexception[i].organograms.length;j++){
                        previousstateexception.push(response.originorganogramswithexception[i].organograms[j]+'_'+response.originorganogramswithexception[i].origins.originorgid);
                        if(previousstateorg.indexOf(response.originorganogramswithexception[i].origins.originorgid)<0)previousstateorg.push(response.originorganogramswithexception[i].origins.originorgid);
                    }
                }
                console.log(previousstateorg);
                console.log(previousstateexception);
            },
            error:function () {
                alert("permitted data error");
            }
        });
    }

    //autoset coreservice
    function autosetcoreservice( tree) {
        if(previousstate!=undefined && previousstate.coreservices!=undefined){
            var checked = previousstate.coreservices;
            for(var i=0;i<checked.length;i++){
                tree.jstree('select_node', "#service_"+checked[i]);
            }
        }
    }

    //autoset shareservice
    function autosetshareservice(tree) {

        if(previousstate!=undefined && previousstate.sharedservices!=undefined){
            var checked = previousstate.sharedservices;
            for(var i=0;i<checked.length;i++){
                tree.jstree('select_node', "#service_"+checked[i]);
            }
        }
    }
    //autoset ornganogram
    function autosetoriginorganogram(tree,data){
        console.log('autosetoriginorganogram');
        if(previousstate!=undefined && previousstate.originorganograms!=undefined){
            var checked = previousstate.originorganograms;
            for(var i=0;i<checked.length;i++){
                if(checked[i].originunitid == parseInt((data.node.id.split('-'))[1]))tree.jstree('select_node', "#originorg-"+checked[i].originorgid);
            }
        }

        if(previousstate!=undefined && previousstate.originorganogramswithexception!=undefined){
            var checked = previousstate.originorganogramswithexception;
            for(var i=0;i<checked.length;i++){
                if(checked[i].origins.originunitid == parseInt((data.node.id.split('-'))[1]))tree.jstree('select_node', "#originorg-"+checked[i].origins.originorgid);
            }
        }
    }
    //automark used ministry
    function automarkministry(tree) {



        if(previousstate!=undefined && previousstate.originorganograms!=undefined){
            var checked = previousstate.originorganograms;
            for(var i=0;i<checked.length;i++){
                $('#ministry-'+checked[i].ministryid+'_anchor',tree).css('color','red');
            }
        }

        if(previousstate!=undefined && previousstate.originorganogramswithexception!=undefined){
            var checked = previousstate.originorganogramswithexception;
            for(var i=0;i<checked.length;i++){
                $('#ministry-'+checked[i].origins.ministryid+'_anchor',tree).css('color','red');
            }
        }
    }

    //automark used origin
    function automarkorigin(tree) {


        if(previousstate!=undefined && previousstate.originorganograms!=undefined){
            var checked = previousstate.originorganograms;
            for(var i=0;i<checked.length;i++){
                $('#origin-'+checked[i].originid+'_anchor',tree).css('color','red');
            }
        }

        if(previousstate!=undefined && previousstate.originorganogramswithexception!=undefined){
            var checked = previousstate.originorganogramswithexception;
            for(var i=0;i<checked.length;i++){
                $('#origin-'+checked[i].origins.originid+'_anchor',tree).css('color','red');
            }
        }
    }

    //automark used origin unit
    function automarkoriginunit(tree) {


        if(previousstate!=undefined && previousstate.originorganograms!=undefined){
            var checked = previousstate.originorganograms;
            for(var i=0;i<checked.length;i++){
                $('#originunit-'+checked[i].originunitid+'_anchor',tree).css('color','red');
            }
        }

        if(previousstate!=undefined && previousstate.originorganogramswithexception!=undefined){
            var checked = previousstate.originorganogramswithexception;
            for(var i=0;i<checked.length;i++){
                $('#originunit-'+checked[i].origins.originunitid+'_anchor',tree).css('color','red');
            }
        }
    }


    function showModal(id,url){

        var counter = Math.random()*100+1;
        for(var i=0;i<counter;i++){};
        var counter1 = Math.random()*100+1;
        for(var i=0;i<counter1;i++){};

        if(!modallock) {
            modallock = true;

            $.ajax({
                type: "GET",
                url: "<%=request.getContextPath()%>/orgbyoriginorg",
                data: {
                    id: id
                },
                async: true,
                success: function (response) {
                    if (response.length > 0) {
                        var data = [];
                        for (var i = 0; i < response.length; i++) {
                            var checkboxobject = {
                                text: response[i].organogram + ',' + response[i].office,
                                value: response[i].id + '_' + response[i].originid
                            };
                            data.push(checkboxobject);

                        }

                        bootbox.prompt({
                            title: "অর্গানোগ্রাম নির্বাচন করুন",
                            buttons: {
                                confirm: {
                                    label: 'Yes',
                                    className: 'btn-success'
                                },
                                cancel: {
                                    label: 'No',
                                    className: 'btn-danger'
                                }
                            },
                            inputType: 'checkbox',
                            inputOptions: data,
                            callback: function (result) {
                                modallock = false;

                                $('#officestructure').jstree('select_node', "#originorg-" + id);
                                if (result != null) {


                                    for (var i = 0; i < result.length; i++) {
                                        if (previousstateexception.indexOf(result[i]) < 0 && checkeditem.indexOf(result[i]) < 0) checkeditem.push(result[i]);
                                    }

                                    var totalcontent = $('.modal .bootbox-input-checkbox');
                                    for (var i = 0; i < totalcontent.length; i++) {
                                        if (!totalcontent[i].checked) {
                                            if (previousstateexception.indexOf(totalcontent[i].value) >= 0) {
                                                if (uncheckeditem.indexOf(totalcontent[i].value) < 0) uncheckeditem.push(totalcontent[i].value);
                                            }
                                        }
                                    }



                                    $('.modal.in .modal-dialog').hide();
                                    $(".modal.in .modal-dialog .btn").off("click");

                                } else {
                                    $('.modal.in .modal-dialog').hide();
                                    $(".modal.in .modal-dialog .btn").off("click");
                                }

                            }
                        }).on('shown.bs.modal', function (e) {
                            var exp = previousstate.originorganogramswithexception;
                            if(exp!= undefined){
                                for(var i=0;i<exp.length;i++){
                                    var element = exp[i];
                                    if(element.origins.originorgid == id){
                                        var realorg = element.organograms;
                                        if(realorg != undefined){
                                            for(var j =0;j<realorg.length;j++){
                                                var val = realorg[j]+'_'+id;
                                                $('.modal input[value='+val+']:checkbox').prop('checked',true);
                                            }
                                        }
                                    }
                                }
                            }

                        });

                    }
                    else {
                        $('#officestructure').jstree('select_node', "#originorg-" + id);
                        alert('There is no Real Organogram');

                    }
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
        }

    }
    function coreService(){
        $('#jstree').jstree({
            'core': {
                'data': {
                    'method': 'POST',
                    'url': function (node) {

                        return '<%=request.getContextPath()%>/getowners';
                    },
                    'data': function (node) {

                        return {'type': 0, "li_attr": "", "a_attr": ""};

                    }

                },
                'themes': {
                    'responsive': false
                }
            }, 'types': {
                'default': {
                    'icon': 'fa fa-folder icon-state-warning icon-lg'
                },
                'file': {
                    'icon': 'fa fa-file icon-state-warning icon-lg'
                }
            },
            'checkbox': {
                'keep_selected_style': false,
                'three_state': false,
                'cascade': ''
            },
            'plugins': ['types', 'checkbox']
        });


        $('#jstree').bind('loaded.jstree', function(e, data) {
            autosetcoreservice($(this));
        });

        var OKtoCascadeUp = 0;
        var OKtoCascadeDown = 0;
        var propagtionLevel = 0;
        var propagate = true;


        function CascadeUp(inNode, inCommand) {
            if (OKtoCascadeUp < 1) {
                ParentNode = $('#jstree').jstree('get_parent', inNode);
                $('#jstree').jstree(inCommand, ParentNode);
            }
        }

        function CascadeUpBack(inNode, inCommand) {
            if (propagtionLevel <= 1) {
                ParentNode = $('#jstree').jstree('get_parent', inNode);
                ChildrenNodes = jQuery.makeArray($('#jstree').jstree('get_children_dom', ParentNode));


                for (var i = 0; i < ChildrenNodes.length; i++) {
                    var value = $("#"+ChildrenNodes[i].id).attr('aria-selected');
                    if (value == "true") {
                        propagate = false;
                    }
                }
                if (propagate) {
                    propagtionLevel -= 2;
                    $('#jstree').jstree(inCommand, ParentNode);
                }

            }
        }

        function CascadeDown(inNode, inCommand) {
            if (OKtoCascadeDown < 1) {
                ChildrenNodes = jQuery.makeArray($('#jstree').jstree('get_children_dom', inNode));
                $('#jstree').jstree(inCommand, ChildrenNodes);
            }
        }

        $('#jstree').on("select_node.jstree", function (e, data) {
           $('#jstree').jstree('open_node', data.node);
            OKtoCascadeDown++;
            CascadeUp(data.node, 'select_node');
            OKtoCascadeDown--;
            CascadeDown(data.node, 'open_node');
            CascadeDown(data.node, 'select_node');
        });

        // Deselection Actions
        $('#jstree').on("deselect_node.jstree", function (e, data) {
            $('#jstree').jstree('open_node', data.node); //need this to have it deselect hidden nodes
            propagtionLevel++;
            if (propagtionLevel >= 1) {
                CascadeDown(data.node, 'open_node');
                CascadeDown(data.node, 'deselect_node');
            }
            if (propagate == true) CascadeUpBack(data.node, 'deselect_node');
            propagate = true;
            propagtionLevel = 0;
            // CascadeDown(data.node, 'close_node');
            // $('#jstree').jstree('close_node', data.node); //need this to have it deselect hidden nodes
        });

//        $("#form").submit(function () {
//
//            var checked_ids = [];
//            checked_ids = $("#jstree").jstree("get_selected");
//            $("#jstreeselectednode").val(checked_ids);
//        });
//
//
//        $('#jstree').on('loaded.jstree', function () {
//            // Do something here...
//            $(this).jstree('select_node', $('#jstree > li'));
//        });
    }
    function sharedService(){
        $('#jstree2').jstree({
            'core': {
                'data': {
                    'method': 'POST',
                    'url': function (node) {

                        return '<%=request.getContextPath()%>/getowners';
                    },
                    'data': function (node) {

                        return {'type': 1, "li_attr": "", "a_attr": ""};

                    }

                },
                'themes': {
                    'responsive': false
                }
            }, 'types': {
                'default': {
                    'icon': 'fa fa-folder icon-state-warning icon-lg'
                },
                'file': {
                    'icon': 'fa fa-file icon-state-warning icon-lg'
                }
            },
            'checkbox': {
                'keep_selected_style': false,
                'three_state': false,
                'cascade': ''
            },
            'plugins': ['types', 'checkbox']
        });

        $('#jstree2').bind('loaded.jstree', function(e, data) {
            autosetshareservice($(this));
        });

        var OKtoCascadeUp = 0;
        var OKtoCascadeDown = 0;
        var propagtionLevel = 0;
        var propagate = true;


        function CascadeUp(inNode, inCommand) {
            if (OKtoCascadeUp < 1) {
                ParentNode = $('#jstree2').jstree('get_parent', inNode);
                $('#jstree2').jstree(inCommand, ParentNode);
            }
        }

        function CascadeUpBack(inNode, inCommand) {
            if (propagtionLevel <= 1) {
                ParentNode = $('#jstree2').jstree('get_parent', inNode);
                ChildrenNodes = jQuery.makeArray($('#jstree2').jstree('get_children_dom', ParentNode));


                for (var i = 0; i < ChildrenNodes.length; i++) {
                    var value = $("#"+ChildrenNodes[i].id).attr('aria-selected');//ChildrenNodes[i].attributes[1].nodeValue;
                    if (value == "true") {
                        propagate = false;
                    }
                }
                if (propagate) {
                    propagtionLevel -= 2;
                    $('#jstree2').jstree(inCommand, ParentNode);
                }

            }
        }

        function CascadeDown(inNode, inCommand) {
            if (OKtoCascadeDown < 1) {
                ChildrenNodes = jQuery.makeArray($('#jstree2').jstree('get_children_dom', inNode));
                $('#jstree2').jstree(inCommand, ChildrenNodes);
            }
        }

        $('#jstree2').on("select_node.jstree", function (e, data) {
            $('#jstree2').jstree('open_node', data.node);
            OKtoCascadeDown++;
            CascadeUp(data.node, 'select_node');
            OKtoCascadeDown--;
            CascadeDown(data.node, 'open_node');
            CascadeDown(data.node, 'select_node');
        });

        // Deselection Actions
        $('#jstree2').on("deselect_node.jstree", function (e, data) {
            $('#jstree2').jstree('open_node', data.node); //need this to have it deselect hidden nodes
            propagtionLevel++;
            if (propagtionLevel >= 1) {
                CascadeDown(data.node, 'open_node');
                CascadeDown(data.node, 'deselect_node');
            }
            if (propagate == true) CascadeUpBack(data.node, 'deselect_node');
            propagate = true;
            propagtionLevel = 0;
            // CascadeDown(data.node, 'close_node');
            // $('#jstree').jstree('close_node', data.node); //need this to have it deselect hidden nodes
        });

//        $("#form").submit(function () {
//
//            var checked_ids = [];
//            checked_ids = $("#jstree").jstree("get_selected");
//            $("#jstreeselectednode").val(checked_ids);
//        });
//
//
//        $('#jstree2').on('loaded.jstree', function () {
//            // Do something here...
//            $(this).jstree('select_node', $('#jstree2 > li'));
//        });
    }

    function officeStructure(){

//        previousstateorg =[];
//        previousstateexception = [];
//        previousstate=[];
          $('#officestructure').jstree('destroy',function () {
                alert('destroyed');
          });
        $('#officestructure').jstree({
            'core' : {
                'data': {
                    'method':'POST',
                    'url': function (node) {
                        var str = node.id;
                        var res = str.split("-");
                        if(res[0]=="#"){
                            return   '<%=request.getContextPath()%>/jministrylistdata';
                        }
                        else if(res[0]=="ministry"){
                            return   '<%=request.getContextPath()%>/jofficeoriginlistdatabyministryid';
                        }
                        else if(res[0]=="origin"){
                            return   '<%=request.getContextPath()%>/joriginunitbyoriginid';
                        }
                        else if(res[0]=="originunit"){
                            return   '<%=request.getContextPath()%>/joriginorgbyoriginunit';
                        }

                    },
                    'data': function (node) {

                        var str = node.id;
                        var index = str.indexOf("#");
                        if(index != 0){
                            var res = str.split("-");
                            return {'id': parseInt(res[1])};
                        }
                    },
                    'success':function () {

                    }

                }
            },
            'checkbox' : {
                'keep_selected_style' : true
            },
            'plugins' : [ 'checkbox' ]
        });

        $('#officestructure').bind('open_node.jstree', function (e, data) {
            console.log('open');
            automarkministry($(this));
            automarkorigin($(this));
            automarkoriginunit($(this));
            if(data.node.id.indexOf('originunit')>=0)autosetoriginorganogram($(this),data);
        });

        $('#officestructure').bind('loaded.jstree', function(e, data) {
            console.log('load');
            automarkministry($(this));
        });

    }
    function tabController(){

        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            var target = $(e.target).attr("href") ;// activated tab

            if(target =='#tab2'){
                coreService();
            }
            else if(target =='#tab3'){
                sharedService();
            }
            else if(target =='#tab4'){
                officeStructure();
            }

        });


    }
    $(document).ready(function () {

        coreService();

        tabController();


        permitteddata();



        $('#form_wizard_1').bootstrapWizard({
            onNext: function(tab, navigation, index) {
                // alert('next');
            },
        onTabShow: function(tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index+1;
            var $percent = ($current/$total) * 100;
            $('#form_wizard_1 .progress-bar').css({width:$percent+'%'});
        },

        });


        function coreServiceData() {
            var checked_ids = [];
            var origincoreserviceid=[];
            checked_ids = $("#jstree").jstree("get_selected");
            if(checked_ids.length ==1){
                if(checked_ids[0].id!=undefined) return origincoreserviceid;
            }
            for(var i=0;i<checked_ids.length;i++){
                var s = checked_ids[i].split('_');
                if(s[0]=='service')origincoreserviceid.push(parseInt(s[1]));
            }
            return origincoreserviceid;
        }


        function shareServiceData() {
            var checked_ids = [];
            var originalsharedserviceid=[];
            checked_ids = $("#jstree2").jstree("get_selected");
            if(checked_ids.length ==1){
                if(checked_ids[0].id!=undefined) return originalsharedserviceid;
            }
            for(var i=0;i<checked_ids.length;i++){
                var s = checked_ids[i].split('_');
                if(s[0]=='service')originalsharedserviceid.push(parseInt(s[1]));
            }
            return originalsharedserviceid;
        }

        function orgnoagramDatax() {
            var checked_ids = [];
            var originaloriginunitid=[];
            checked_ids = $("#officestructure").jstree("get_selected");

            var mapping = [];
            for(var i=0;i<checkeditem.length;i++){
                var sc = checkeditem[i].split('_');
                mapping['#_'+sc[1]]=1;
            }

            for(var i=0;i<checked_ids.length;i++){
                var s = checked_ids[i].split('-');
                if(s[0]=='originorg'){

                    if(mapping['#_'+s[1]]==undefined)originaloriginunitid.push(parseInt(s[1]));
                }
            }
            return originaloriginunitid;
        }

        function orgnoagramData() {
            var checked_ids = [];
            var originaloriginunitid=[];
            checked_ids = $("#officestructure").jstree("get_selected");

            for(var i=0;i<checked_ids.length;i++){
                var s = checked_ids[i].split('-');
                if(s[0]=='originorg')originaloriginunitid.push(parseInt(s[1]));
            }

            return originaloriginunitid;
        }


        $('#form_wizard_1 .finish').click(function() {

            // alert('Finished!, Starting over!');
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-bottom-right"
            };
            toastr.success(" ফরম  সাবমিট সম্পন্ন  হচ্ছে।");
            console.log("--end of ftoaster called --");

            var data ={
                coreservice: coreServiceData(),
                shareservice:shareServiceData(),
                originorg:orgnoagramData()
            };

            var coredelete=[],coreinsert=[],shareddelete=[], shareinsert=[], orgdelete=[], orginsert=[], expdelete=[], expinsert=[];

            coreinsert = data.coreservice.filter(function(x) { return previousstate.coreservices.indexOf(x) < 0 });
            console.log(coreinsert);
            coredelete = previousstate.coreservices.filter(function(x) { return data.coreservice.indexOf(x) < 0 });
            console.log(coredelete);

            shareinsert = data.shareservice.filter(function(x) { return previousstate.sharedservices.indexOf(x) < 0 });
            console.log(shareinsert);

            shareddelete = previousstate.sharedservices.filter(function(x) { return data.shareservice.indexOf(x) < 0 });
            console.log(shareddelete);




            orginsert = data.originorg.filter(function(x) {
               return previousstateorg.indexOf(x)<0;
            });


            orgdelete = previousstateorg.filter(function(x) {

                var element = $('#originorg-'+x).length;//checking tree te ache kina
                if (element ==undefined)element = 0;
                var decision = data.originorg.indexOf(x) < 0 && element>0 ;
                return decision;

            });



            //insertlist verify
            //jodi keu new/old insert hoi for old checking previousstateord e ache kina thake org delete korte hobe and new er jonno orginsert e checking korte hobe
                expinsert = checkeditem;
                var invaliditem =[];
                for(var i=0;i<expinsert.length;i++){
                    var s = expinsert[i].split('_');
                    var id = parseInt(s[1]);
                    var decison = false;

                    //check insert item vaid or not
                    if(data.originorg.indexOf(id)>=0) {//valid
                        if (previousstateorg.indexOf(id) >= 0) {//old
                            if (orgdelete.indexOf(id) < 0) orgdelete.push(id);
                        }
                        if (orginsert.indexOf(id) >= 0) orginsert.splice(orginsert.indexOf(id), 1);
                    }else{
                        invaliditem.push(expinsert[i]);
                    }
                }
                var tempexpinsert = expinsert.filter(function (x) {
                    return invaliditem.indexOf(x)<0;
                });
               expinsert = tempexpinsert;

            //delete list verify
                expdelete = uncheckeditem;


                var previousexceptionwithoutdeletecontent = previousstateexception.filter(function (x) {
                    return expdelete.indexOf(x)<0;
                });

                for(var i =0;i<expdelete.length;i++){
                    var s = expdelete[i].split('_');
                    var id = parseInt(s[1]);
                    var decision = false;

                    //checking expinsert list e ache kina
                    for(var j=0;j<expinsert.length;j++){
                        if(expinsert[j].indexOf(''+id)>=0){
                            decision = true;
                            break;
                        }
                    }
                    if(!decision) {//jodi expinsert list e na thake
                        for (var j = 0; j < previousexceptionwithoutdeletecontent.length; j++) {//checking previous list e ache naki
                            if (previousexceptionwithoutdeletecontent[j].indexOf('' + id) >= 0) {
                                decision = true;
                                break;
                            }
                        }
                    }

                    if(!decision){//mane selected but kone exp r nei so select all hobe
                        if(data.originorg.indexOf(id)>=0&&orginsert.indexOf(id)<0)orginsert.push(id);
                    }
                }

            console.log(orginsert)
            console.log(orgdelete)
            console.log(expinsert);
            console.log(expdelete);



            var formData ={  appid:$("#appid").val(),
                coreserviceinsert: coreinsert,
                coreservicedelete: coredelete,
                shareserviceinsert:shareinsert,
                shareservicedelete:shareddelete,
                originorginsert:orginsert,
                originorgdelete:orgdelete,
                exceptioninsert:expinsert,
                exceptiondelete:expdelete
            };
            $.ajax({
                type:"POST",
                url : "<%=request.getContextPath()%>/systempermissionedit",
                data : JSON.stringify(formData),
                contentType: 'application/json',
                async: true,
                success : function(response) {
                    console.log(response);

                    permitteddata();
                    officeStructure();
                    coreService();
                    sharedService();
                },
                error: function() {
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" ফরম  সাবমিট  ব্যর্থ  হয়েছে।  আবার চেষ্টা করুন।");
                    console.log("--end of ftoaster called --");

                }
            });












            $('#rootwizard').find("a[href*='tab1']").trigger('click');
        });


        // $('#form_wizard_1').bootstrapWizard({'nextSelector': '.button-next'});
        // $("#form_wizard_1").find(".button-next").show();
        // var s=





    });
    function hello( id){
        $("#appid").val(id);
        var x = 0;
        // alert('hello'+id);
        $("#form_wizard_1").find(".button-next").show();
        // $('#form_wizard_1').bootstrapWizard({'nextSelector': '.button-next'});
        var wizard = $('#form_wizard_1').bootstrapWizard();
        wizard.bootstrapWizard('next');



    }




</script>

<script type="text/javascript" src="${context}/assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${context}/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.min.js"></script>
<script type="text/javascript"
        src="${context}/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="${context}/assets/admin/pages/scripts/table-advanced.js"></script>
<script src="${context}/assets/admin/pages/scripts/table-advanced.js"></script>


<script src="${context}/assets/pages/scripts/form-wizard.min.js" type="text/javascript"></script>
<script src="${context}/assets/global/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js" type="text/javascript"></script>




<%--working herre...    --%>


<%--<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>--%>




<script src="../assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="../assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<%--<script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>--%>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="../assets/pages/scripts/form-wizard.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<%--<script src="../assets/layouts/layout4/scripts/layout.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/layouts/layout4/scripts/demo.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>--%>



<%--<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>--%>





<%--<script src="/assets/layouts/layout2/scripts/layout.min.js" type="text/javascript"></script>--%>
<%--<script src="/assets/layouts/layout2/scripts/demo.min.js" type="text/javascript"></script>--%>
<%--<script src="/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>--%>
<%--<script src="/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>--%>
<%--<bonyy></bonyy>--%>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>


</body>
<!-- END BODY -->
</html>

</html>