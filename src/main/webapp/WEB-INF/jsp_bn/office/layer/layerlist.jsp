<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>

    <meta charset="utf-8"/>

    <%@ include file="../../includes/head.jsp" %>
    <c:set var="context" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${context}/assets/jstree/dist/themes/default/style.css"/>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-footer-fixed">
<!-- BEGIN HEADER -->
<div class="page-header -i navbar navbar-fixed-top">
    <%@ include file="../../includes/header.jsp" %>
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar-wrapper" style="margin-top: 20px">
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <div class="page-sidebar navbar-collapse collapse">
            <%@ include file="../../includes/menu.jsp" %>
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <!-- START MAIN CONTENT -->
        <div class="page-content">
                  <div class="card">
                      <div class="portlet box " >
                          <div class="portlet-title">
                              <div class="caption">
                                  <i class="fa fa-picture"></i> স্তর ব্যবস্থাপনা
                              </div>
                              <%--<div class="tools  hidden-print  " >--%>
                              <%--<a  href="<%=request.getContextPath()%>/divisionadd" title="" data-original-title="Division Add" >--%>
                              <%--<i class="fa fa-plus-square-o fa-2x"aria-hidden="true" ></i> </a>--%>
                              <%--<a title="" class="btn-print" data-original-title="Division Print">--%>
                              <%--<i class="fa fa-print fa-2x"></i> </a>--%>
                              <%--&lt;%&ndash;<a title="" style="color:white; font-size: 16px" href="/office_employees/index?print=1" data-original-title="দপ্তর কর্মকর্তা তালিকা এক্সপোর্ট">&ndash;%&gt;--%>
                              <%--&lt;%&ndash;<i class="fa fa-file-excel-o fa-2x"></i>  </a>&ndash;%&gt;--%>
                              <%--</div>--%>

                    </div>


                          <div class="portlet-body">
                              <div class="row" style="margin-left: 15px;">
                                  <label class="col-md-3 control-label">  মন্ত্রণালয় </label>
                                  <div class="col-md-6">
                                      <select class="form-control" name="ministrydata" id="ministrydropdown">
                                          <option value="-1">...</option>
                                          <c:forEach var="ministry" items="${ministry}">
                                              <option value="${ministry.getId()}">
                                                      ${ministry.getNameBng()}
                                              </option>
                                          </c:forEach>
                                      </select>
                                  </div>
                              </div>

                        <div class="row" id="detail" style="margin-left: 15px;margin-top: 5%; display: none;">
                            <div class="col-md-6"
                                 style="border: none;  box-shadow: 5px 5px 20px 5px lightgrey;">
                                <div style="margin: 15px;">

                                    <form method="POST" action="" class="form-horizontal" id="layerform"
                                          novalidate="novalidate" role="form">
                                        <input type="hidden" name="id" id="layerid">
                                        <input type="hidden" name="ministryid" id="ministryid">
                                        <div class="form-body">

                                            <div class="alert alert-danger display-hide">
                                                <button class="close" data-close="alert"></button>
                                                ফর্ম সাবমিট এ সমস্যা রয়েছে।দয়া করে যাচাই করুন.
                                            </div>
                                            <div class="alert alert-success display-hide">
                                                <button class="close" data-close="alert"></button>
                                                সাকসেসফুল !
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">

                                                    <div class="row">
                                                        <div class="col-md-offset-5 col-md-5">
                                                            <label class="control-label" id="operationname"
                                                                   style="font-size: 20px;font-weight: 600;color: maroon;"></label>
                                                        </div>
                                                        <div style="float:right;margin-top: 10px;">
                                                            <a id="add" style="display: none"
                                                               title="Do you  want to add office layer? Click me"><i
                                                                    class='fa fa-plus-circle'></i></a>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-12 form-group form-horizontal">
                                                            <label class="control-label"> নাম <span class="required"
                                                                                                    aria-required="true"> * </span></label>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col-md-6">
                                                            <input name="layernamebng" id="layernamebng" type="text"
                                                                   class="form-control" placeholder=" নাম (বাংলা)" required>
                                                            <span class="help-block"></span>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <input name="layernameeng" id="layernameeng" type="text"
                                                                   class="form-control" placeholder=" নাম (ইংরেজি)" required>
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>

                                                    <div class="row form-group">
                                                        <div class="col-md-6">
                                                            <label class="control-label"> স্তর <span class="required"
                                                                                                     aria-required="true"> * </span></label>
                                                            <input name="layerlevel" id="layerlevel" type="text"
                                                                   class="form-control" placeholder=" স্তর" required>
                                                            <span class="help-block"></span>
                                                        </div>
                                                        <div class="col-md-6 form-group">
                                                            <label class="control-label"> ক্রম <span class="required"
                                                                                                     aria-required="true"> * </span></label>
                                                            <input name="layersequence" id="layerseq" type="text"
                                                                   class="form-control" placeholder=" ক্রম " required>
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col-md-8 form-group form-horizontal">
                                                            <label class="control-label">অধীনস্থ স্তর </label>
                                                            <div class="input select">
                                                                <select class="form-control" name="parentlayerid"
                                                                        id="office_Layers">
                                                                    <option value="" >---বাছাই করুন---</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-offset-5 col-md-5">
                                                            <button type="submit" class="btn green">সংরক্ষণ</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-6" style="border: none; height: 400px; overflow-y: auto;">
                                <div style="margin-left: 30%;">
                                    <label class="control-label" id="ministryname"></label>
                                    <div id="jstree">

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
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
    <%@ include file="../../includes/footer.jsp" %>
</div>
<!-- END FOOTER -->
<%@ include file="../../includes/includes.jsp" %>

<script src="${context}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
        type="text/javascript"></script>
<script src="${context}/assets/global/scripts/app.min.js" type="text/javascript"></script>


<script>

    var FormValidation = function () {
        var e = function () {
                var e = $("#layerform"),
                    r = $(".alert-danger", e),
                    i = $(".alert-success", e);

                e.validate({
                    errorElement: "span", errorClass: "help-block help-block-error",
                    focusInvalid: !1, ignore: "", messages: {
                        select_multi: {
                            maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                            minlength: jQuery.validator.format("At least {0} items must be selected")
                        }
                    }, rules: {

                        layerlevel: {
                            required: !0,
                            number: !0,
                            minlength: 1,
                            maxlength: 3
                        },
                        layersequence: {
                            required: !0,
                            number: !0,
                            minlength: 1,
                            maxlength: 3
                        },
                        status: {
                            required: !0,
                            number: !0,
                            minlength: 1,
                            maxlength: 3
                        },
                        officeministryengshort: {
                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedEngname: true,
                        },

                        layernamebng: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedBngname: true,

                        },

                        layernameeng: {

                            required: true,
                            minlength: 3,
                            maxlength: 100,
                            checkSpacedEngname: true,

                        }


                    }, messages: {

                        layernamebng: {
                            required: "বাংলায় স্তর নেম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        layernameeng: {
                            required: "ইংরেজিতে স্তর নেম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        officeministryengshort: {
                            required: "ইংরেজিতে সংক্ষিপ্ত মন্ত্রণালয় নেম দিন",
                            minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                            maxlength: "১০০ টি অক্ষর এর কম দিন"
                        },
                        officetype: {
                            required: "মন্ত্রণালয় টাইপ নির্বাচন করুন",
                            number: "শুধুমাত্র ইংরেজি নম্বর গ্রহণযোগ্য"
                        },
                        referencecode: {
                            required: "রেফারেন্স কোড অবশ্য পূরণীয়",
                            number: "শুধুমাত্র ইংরেজি নম্বর গ্রহণযোগ্য"
                        },
                        status: {
                            required: "স্ট্যাটাস কোড অবশ্য পূরণীয়",
                            number: "শুধুমাত্র ইংরেজি নম্বর গ্রহণযোগ্য"
                        },


                    },
                    invalidHandler: function (e, t) {
                        i.hide(), r.show(), App.scrollTo(r, -200)
                    },
                    highlight: function (e) {
                        $(e).closest(".form-group").addClass("has-error")
                    },
                    unhighlight: function (e) {
                        $(e).closest(".form-group").removeClass("has-error")
                    },
                    success: function (e) {
                        e.closest(".form-group").removeClass("has-error")

                    },
                    submitHandler: function (e, event) {
                        i.show(), r.hide(), event.preventDefault()

                    }
                });
            },

            t = function () {
                jQuery().wysihtml5 && $(".wysihtml5").size() > 0 && $(".wysihtml5").wysihtml5({stylesheets: ["../assets/global/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]})
            };
        $.validator.addMethod('checkEngname', function (value, element) {
            return this.optional(element) || (/^[a-zA-Z]*$/.test(value));


        }, " No space or Number or  Special Charecter or  Bangla  character is allowed");

        $.validator.addMethod('checkBngname', function (value, element) {
            return this.optional(element) || (!/\s/g.test(value) && !/[^\u0980-\u09ff]/.test(value));

        }, " No space or Number or  No  Special Charecter or  English character is allowed");


        $.validator.addMethod('checkSpacedEngname', function (value, element) {
            return this.optional(element) || (/^[a-zA-Z0-9,.;?;\s]*$/.test(value));


        }, "বাংলা অক্ষর গ্রহণযোগ্য নয়। ");


        $.validator.addMethod('checkSpacedBngname', function (value, element) {
            return this.optional(element) || (!/[^\u0980-\u09ff,.;?!/\s]/.test(value));

        }, " ইংরেজি অক্ষর গ্রহণযোগ্য নয়।");

        $.validator.addMethod("valueNotEquals", function (value, element, arg) {
            return arg !== value;
        }, "প্রদত্ত মান গ্রহণযোগ্য নয়");


        return {
            init: function () {
                t(), e()
            }
        }

        }();


    var msg = "স্তর";
    function childList(parentId, data) {
        var childs = [];
        for (var i = 0; i < data.length; i++) {
            if (data[i].parentLayerId == parentId) childs.push(data[i]);
        }
        return childs;
    }

    function layerStructure(id, data) {
        var jsonforjstree = '[' ;
        var childs= childList(id,data);
        for(var i=0;i<childs.length;i++){
            jsonforjstree += '{ "id" : "'+childs[i].id+'",';
            var checkChild = childList(childs[i].id,data);
            if(checkChild.length ==0)jsonforjstree += '  "text" : "'+childs[i].layerNameBng.trim()+'<a  title=\'এই স্তরটি বাতিল করুন\' class=\'red equ\' data-office-id=8 data-office-unit-id=110 data-office-unit-org-id=145 onclick=showModal(\''+childs[i].id+'\',\'/layerdelete\',msg.trim())><i class=\'fa fa fa-minus-circle\'></i></a>",';
            else jsonforjstree += '  "text" : "'+childs[i].layerNameBng.trim()+'",';
            jsonforjstree += '  "li_attr" : {"ll" : "'+childs[i].layerLevel+'","ls" : "'+childs[i].layerSequence+'","eng" : "'+childs[i].layerNameEng.trim()+'"},';
            if(i!=(childs.length -1))jsonforjstree += '  "children" : '+layerStructure(childs[i].id,data)+'},';
            else jsonforjstree += '  "children" : '+layerStructure(childs[i].id,data)+'}';
        }
        jsonforjstree += ']';
        return jsonforjstree;
    }


    function createJSTrees(jsonData) {
        $('#jstree').jstree('destroy');
        $('#jstree').jstree({
            'core': {
                'data': jsonData
            }
        });
        $('#jstree').jstree("refresh");
        $('#jstree').on("select_node.jstree", function (e, data) {
//            $('#jstree').jstree('open_node', data.node);
            $("#operationname").text("স্তর সম্পাদনা");
            var eng = data.node.li_attr.eng;
            var seq = data.node.li_attr.ls;
            var level = data.node.li_attr.ll;
            var parentid = data.node.parent;
            var id = data.node.id;
            var bng = data.node.text;
            var actuallength = bng.indexOf("<");
            if (actuallength != -1) bng = bng.substr(0, actuallength);
            $("#layerid").val(id);
            $("#layerform").attr('action', '${context}/editlayer');
            $("#layerseq").val(seq);
            $("#layerlevel").val(level);
            $("#layernamebng").val(bng);
            $("#layernameeng").val(eng);
            $('#office_Layers > option[value=' + parentid + ']').attr('selected', true);
            $("#add").show();

        });
    }
    // function showModal(id,url) {
    //     bootbox.confirm({
    //         message: '<p class="text-center">Do you want to delete</p>',
    //         title: "Custom title",
    //         size: "small",
    //         buttons: {
    //             confirm: {
    //                 label: 'Yes',
    //                 className: 'btn-success'
    //             },
    //             cancel: {
    //                 label: 'No',
    //                 className: 'btn-danger'
    //             }
    //         },
    //         callback: function (result) {
    //
    //             if (result == true) {
    //                 var data;
    //                 $.ajax({
    //                     type: "POST",
    //                     url: url,
    //                     data: {
    //                         id: id
    //                     },
    //                     async: false,
    //                     success: function (response) {
    //                         data = response;
    //                         $('.modal.in .modal-dialog').hide();
    //                         $(".modal.in .modal-dialog .btn").off("click");
    //                         fetchData($("#ministrydropdown").val());
    //                     },
    //                     error: function () {
    //                         alert('Error occured');
    //                     }
    //                 });
    //
    //             } else {
    //                 $('.modal.in .modal-dialog').hide();
    //                 $(".modal.in .modal-dialog .btn").off("click");
    //             }
    //
    //         }
    //     });
    // }
    function reload()
    {
        fetchData($("#ministrydropdown").val());
    }

    function fetchData( value) {
        $("#operationname").text("নতুন স্তর");
        $("#layerid").val("");
        $("#layerform").attr('action', '${context}/addlayer');
        $("#layerseq").val("");
        $("#layerlevel").val("");
        $("#layernamebng").val("");
        $("#layernameeng").val("");
        $('#office_Layers > option[value= "0"]').attr('selected', true);
        $("#add").hide();
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/layersbyministries",
            data: {
                id: value
            },
            async: false,
            success : function(response) {
                $("#layerform").attr('action','${context}/addlayer');
                var lStructure = layerStructure(0,response);
                console.log(lStructure);
                var myJsonString = JSON.parse(lStructure);
                $("#ministryname").text($("#ministrydropdown option:selected").text());
                $("#operationname").text("নতুন স্তর");

                createJSTrees(myJsonString);
                var select = $('#office_Layers');
                select.empty();
                select.append($('<option></option>').val(0).html('...'));
                $.each(response, function (index, value) {
                    select.append(
                        $('<option></option>').val(value.id).html(value.layerNameBng)
                    );
                });

                $("#detail").show();
                return response;
            },
            error: function () {
                alert('Error occured');
            }
        });
    }

    $(document).ready(function () {

        FormValidation.init();

        $("#ministrydropdown").change(function () {
            fetchData($(this).val());
        });
        $("#add").click(function () {
        $("#operationname").text("নতুন স্তর");
        $("#layerid").val("");
        $("#layerform").attr('action','${context}/addlayer');
        $("#layerseq").val("");
        $("#layerlevel").val("");
        $("#layernamebng").val("");
        $("#layernameeng").val("");
        $('#office_Layers > option[value= "0"]').attr('selected',true);
        $(this).hide();
    });


        $("#layerform").on('submit',(function (event) {


            if ($('#layerform').valid()) {


                $("#ministryid").val($("#ministrydropdown").val());
                var formData = {
                    'id': $('input[name=id]').val(),
                    'ministryid': $('input[name=ministryid]').val(),
                    'layernamebng': $('input[name=layernamebng]').val(),
                    'layernameeng': $('input[name=layernameeng]').val(),
                    'layerlevel': $('input[name=layerlevel]').val(),
                    'layersequence': $('input[name=layersequence]').val(),
                    'parentlayerid': $('#office_Layers').val(),
                };
                var formaction = $("#layerform").attr('action');
                $.ajax({
                    type: "POST",
                    url: formaction,
                    data: formData,
                    async: false,
                    success: function (response) {
                        //event.preventDefault();
                        //FormValidation.init();

                        if(response == 1) {
                            fetchData($("#ministrydropdown").val());
                            toastr.success("স্তরটি সফলভাবে সংরক্ষণ করা হয়েছে ","সার্থক");
                        }
                        else
                        {
                            toastr.error(" স্তরটি সংরক্ষণ করা যায়নি","দুঃখিত");
                        }
                    },
                    error: function() {
                        //alert('Error occured');
                        toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ","দুঃখিত");
                    }
                });




            }

            event.preventDefault();

        }));


    });

</script>
<script type="text/javascript" src="${context}/assets/global/plugins/bootbox/bootbox.min.js"></script>
<script type="text/javascript"src="${context}/assets/js/common/modalcontrol.js"></script>
</body>
<!-- END BODY -->
</html>
