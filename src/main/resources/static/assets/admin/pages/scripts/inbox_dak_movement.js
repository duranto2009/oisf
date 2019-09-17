var InboxDakMovement = function () {
    var content = $('.inbox-content');
    var detailscontent = $('.inbox-details');
    var loading = $('.inbox-loading');
    var conditions = '';
    var listListing = '';

    var loadInbox = function (el, name) {

        var url = js_wb_root + "dakMovements/inboxContent/" + name;
        var title = $('.inbox-nav > li.' + name + ' a').attr('data-title');

        listListing = name;
        conditions = "";
        loading.show();
        content.show();
        detailscontent.html('');
        detailscontent.hide();
        content.html('');
        toggleButton(el);

        $.ajax({
            type: "GET",
            cache: false,
            url: url,
            dataType: "text",
            success: function (res) {
                toggleButton(el);

                $('.inbox-nav > li.active').removeClass('active');
                $('.inbox-nav > li.' + name).addClass('active');
                $('.inbox-header > h1').text(title);

                loading.hide();
                content.html(res);
                if (Layout.fixContentHeight) {
                    Layout.fixContentHeight();
                }
                Metronic.initUniform();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                toggleButton(el);
            },
            async: false
        });

        // handle group checkbox:
        jQuery('body').on('change', '.mail-group-checkbox', function () {
            var set = jQuery('.mail-checkbox');
            var checked = jQuery(this).is(":checked");
            jQuery(set).each(function () {
                $(this).attr("checked", checked);
            });
            jQuery.uniform.update(set);
        });
    };

    var loadInboxDetailMessgae = function (el, name) {
        loading.show();
        content.hide();
        detailscontent.show();
        detailscontent.html('');

        var url = '';
        var dak_type = el.attr("data-dak-type");

        var url = "";

        if (dak_type == "Daptorik")
            url = js_wb_root + "dakMovements/viewDakDaptorik";
        else
            url = js_wb_root + "dakMovements/viewDakNagorik";

        toggleButton(el);
        var message_id = el.attr("data-messageid");

        $.ajax({
            type: "GET",
            cache: false,
            url: url,
            dataType: "text",
            data: {'message_id': message_id, conditions: conditions, si: el.data("si"), totalRec: $('table#datatable_dak').children('tbody').children('tr').length},
            success: function (res) {
                toggleButton(el);

                $('.inbox-header > h1').text('ডাক দেখুন');

                loading.hide();
                detailscontent.html(res);
                Layout.fixContentHeight();
                Metronic.initUniform();
                $('[data-toggle="tooltip"]').tooltip();
                if ($('.projapoticanvas').length == 1) {
                    ProjapotiCanvas.init('.img-src');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                toggleButton(el);
                loadInbox($(this), 'inbox');
            },
            async: false
        });
    };

    var loadSentDetailMessgae = function (el, name) {

        var message_id = el.attr("data-messageid");
        var dak_type = el.attr("data-dak-type");

        if (dak_type == "Nagorik")
            var url = url = js_wb_root + "dakMovements/viewDakNagorikSent";
        else
            var url = url = js_wb_root + "dakMovements/viewDakDaptorikSent";

        loading.show();
        content.hide();
        detailscontent.show();
        detailscontent.html('');

        toggleButton(el);

        $.ajax({
            type: "GET",
            cache: false,
            url: url,
            dataType: "text",
            data: {'message_id': message_id, conditions: conditions, si: el.data("si"), totalRec: $('table#datatable_dak').children('tbody').children('tr').length},
            success: function (res) {
                toggleButton(el);

                $('.inbox-header > h1').text('ডাক দেখুন');

                loading.hide();
                detailscontent.html(res);

                Layout.fixContentHeight();
                Metronic.initUniform();
                $('[data-toggle="tooltip"]').tooltip();
                if ($('.projapoticanvas').length == 1) {
                    ProjapotiCanvas.init('.img-src', false);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                toggleButton(el);
            },
            async: false
        });
    };

    var loadNotiVuktoDetailMessgae = function (el, name) {

        loading.show();
        content.hide();
        detailscontent.show();
        detailscontent.html('');

        toggleButton(el);

        var url = '';

        var dak_type = el.attr("data-dak-type");
        if (dak_type == "Nagorik")
            url = js_wb_root + "dakMovements/viewDakNagorikNothiVukto";
        else
            url = js_wb_root + "dakMovements/viewNothiVukto";

        var message_id = el.attr("data-messageid");

        $.ajax({
            type: "GET",
            cache: false,
            url: url,
            dataType: "text",
            data: {'message_id': message_id, conditions: conditions, si: el.data("si"), totalRec: $('table#datatable_dak').children('tbody').children('tr').length},
            success: function (res) {
                toggleButton(el);
                $('.inbox-header > h1').text('ডাক দেখুন');
                loading.hide();
                detailscontent.html(res);

                Layout.fixContentHeight();
                Metronic.initUniform();
                $('[data-toggle="tooltip"]').tooltip();
                if ($('.projapoticanvas').length == 1) {
                    ProjapotiCanvas.init('.img-src', false);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                toggleButton(el);
            },
            async: false
        });
    };

    var loadNotiJatoDetailMessgae = function (el, name) {

        loading.show();
        content.hide();
        detailscontent.show();
        detailscontent.html('');

        toggleButton(el);

        var url = '';

        var dak_type = el.attr("data-dak-type");
        if (dak_type == "Nagorik")
            url = js_wb_root + "dakMovements/viewDakNagorikNothiJato";
        else
            url = js_wb_root + "dakMovements/viewNothiJato";

        var message_id = el.attr("data-messageid");

        $.ajax({
            type: "GET",
            cache: false,
            url: url,
            dataType: "text",
            data: {'message_id': message_id, conditions: conditions, si: el.data("si"), totalRec: $('table#datatable_dak').children('tbody').children('tr').length},
            success: function (res) {
                toggleButton(el);
                $('.inbox-header > h1').text('ডাক দেখুন');
                loading.hide();
                detailscontent.html(res);

                Layout.fixContentHeight();
                Metronic.initUniform();
                $('[data-toggle="tooltip"]').tooltip();
                if ($('.projapoticanvas').length == 1) {
                    ProjapotiCanvas.init('.img-src', false);
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                toggleButton(el);
            },
            async: false
        });
    };

    var initWysihtml5 = function () {
        $('.inbox-wysihtml5').wysihtml5({
            "stylesheets": [js_wb_root + "assets/global/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]
        });
    };

    var initFileupload = function () {

        $('#fileupload').fileupload({
            // Uncomment the following to send cross-domain cookies:
            //xhrFields: {withCredentials: true},
            url: js_wb_root + 'ssets/global/plugins/jquery-file-upload/server/php/',
            autoUpload: true
        });

        // Upload server status check for browsers with CORS support:
        if ($.support.cors) {
            $.ajax({
                url: js_wb_root + 'assets/global/plugins/jquery-file-upload/server/php/',
                type: 'HEAD'
            }).fail(function () {
                $('<span class="alert alert-error"/>')
                        .text('দুঃখিত! আপলোড সার্ভারে এখন সংযোগ দেয়া সম্ভব হচ্ছে না')
                        .appendTo('#fileupload');
            });
        }
    };

    var loadCompose = function (el) {
        var url = 'inbox_compose.html';

        loading.show();
        content.html('');
        toggleButton(el);
        conditions = "";

        // load the form via ajax
        $.ajax({
            type: "GET",
            cache: false,
            url: url,
            dataType: "html",
            success: function (res) {
                toggleButton(el);

                $('.inbox-nav > li.active').removeClass('active');
                $('.inbox-header > h1').text('ডাক উত্তোলন করুন');

                loading.hide();
                content.html(res);

                initFileupload();
                initWysihtml5();

                $('.inbox-wysihtml5').focus();
                Layout.fixContentHeight();
                Metronic.initUniform();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                toggleButton(el);
            },
            async: false
        });
    };

    var loadInboxAfterSent = function (el, name) {
        var messageid = $(el).attr("data-message-id");
        var to_id = $(el).attr("data-dak-to");
        var from_id = $(el).attr("data-dak-from");
        var url = js_wb_root + "dakMovements/sendDak";
        var title = $('.inbox-nav > li.' + name + ' a').attr('data-title');
        listListing = name;

        loading.show();
        content.html('');
        toggleButton(el);

        $.ajax({
            type: "post",
            cache: false,
            url: url,
            dataType: "json",
            data: {'message_id': messageid, 'to': to_id, 'from': from_id},
            success: function (res) {
                loadInbox($(this), 'sent');
            },
            error: function (xhr, ajaxOptions, thrownError) {
                toggleButton(el);
            },
            async: false
        });
    };

    var dakRevert = function (el) {
        var messageid = $(el).data("message-id");
        var url = js_wb_root + "dakMovements/dakRevert";
        listListing = name;

        loading.show();
        content.html('');
        toggleButton(el);

        $.ajax({
            type: "post",
            cache: false,
            url: url,
            dataType: "json",
            data: {'message_id': messageid},
            success: function (res) {
                if (res == 1) {
                    loadInbox($(this), 'inbox');
                } else {
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error("দুঃখিত! ডাকটি ফেরত আনা সম্ভব হচ্ছে না");

                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                toggleButton(el);
            },
            async: false
        });
    };

    var dakForwardFromList = function (comment, selectedMessageId, to_officer_id, to_office_name, priority_level, to_officer_level, dak_type, currentShape, attachmentid, type) {


        if (typeof (currentShape) == "undefined")
            currentShape = "";
        if (typeof (type) == "undefined")
            type = "";

        if (typeof (attachmentid) == "undefined")
            attachmentid = "";

        if (typeof (priority_level) == "undefined")
            priority_level = "";
        if (typeof (to_officer_level) == "undefined")
            to_officer_level = "";
        if (typeof (dak_type) == "undefined")
            dak_type = "Daptorik";

        var messageid = selectedMessageId;

        if (dak_type == "Daptorik")
            var url = js_wb_root + "dakMovements/forwardSelectedDaptorikDak";
        else
            var url = js_wb_root + "dakMovements/forwardSelectedNagorikDak";

        $.ajax({
            type: "post",
            cache: false,
            url: url,
            dataType: "json",
            data: {
                'messageId': messageid,
                'comment': comment,
                toOfficerId: to_officer_id,
                to_office_name: to_office_name,
                to_priority_level: priority_level,
                to_officer_level: to_officer_level,
                currentShape: {x: currentShape.x, y: currentShape.y, font: currentShape.font, color: currentShape.color},
                attachmentid: attachmentid
            },
            success: function (res) {

                if (type == '') {

                    loadInbox($(this), 'inbox');

                }

//                if(res==0){
//                    toastr.options = {
//                        "closeButton": true,
//                        "debug": false,
//                        "positionClass": "toast-bottom-right"
//                    };
//                    toastr.error("দুঃখিত! ডাক ফরোয়ার্ড করা সম্ভব হয়নি");
//                    return;
//                }
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "positionClass": "toast-bottom-right"
                };
                toastr.success("ডাক ফরোয়ার্ড করা হয়েছে");

            },
            error: function (xhr, ajaxOptions, thrownError) {
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "positionClass": "toast-bottom-right"
                };
                toastr.error("দুঃখিত! ডাক ফরোয়ার্ড করা সম্ভব হয়নি");
            },
            async: false
        });
    };

    var loadReply = function (el) {
        var messageid = $(el).attr("data-messageid");
        var url = js_wb_root + 'dakMovements/dakReply?message_id=' + messageid;

        loading.show();
        content.html('');
        conditions = "";
        toggleButton(el);

        // load the form via ajax
        $.ajax({
            type: "GET",
            cache: false,
            url: url,
            dataType: "html",
            success: function (res) {
                toggleButton(el);

                $('.inbox-nav > li.active').removeClass('active');
                $('.inbox-header > h1').text('উত্তর দিন');

                loading.hide();
                content.html(res);
                $('[name="message"]').val($('#reply_email_content_body').html());

                handleCCInput(); // init "CC" input field

                //initFileupload();
                //initWysihtml5();
                Layout.fixContentHeight();
                Metronic.initUniform();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                toggleButton(el);
            },
            async: false
        });
    };

    var loadSearchResults = function (el, name) {
        var url = 'inbox_search_result.html';

        loading.show();
        content.html('');
        toggleButton(el);

        $.ajax({
            type: "GET",
            cache: false,
            url: url,
            dataType: "html",
            success: function (res) {
                toggleButton(el);

                $('.inbox-nav > li.active').removeClass('active');
                $('.inbox-header > h1').text('খুঁজুন');

                loading.hide();
                content.html(res);
                Layout.fixContentHeight();
                Metronic.initUniform();
            },
            error: function (xhr, ajaxOptions, thrownError) {
                toggleButton(el);
            },
            async: false
        });
    };

    var handleCCInput = function () {
        var the = $('.inbox-compose .mail-to .inbox-cc');
        var input = $('.inbox-compose .input-cc');
        the.hide();
        input.show();
        $('.close', input).click(function () {
            input.hide();
            the.show();
        });
    };

    var handleBCCInput = function () {

        var the = $('.inbox-compose .mail-to .inbox-bcc');
        var input = $('.inbox-compose .input-bcc');
        the.hide();
        input.show();
        $('.close', input).click(function () {
            input.hide();
            the.show();
        });
    };

    var toggleButton = function (el) {
        if (typeof el == 'undefined') {
            return;
        }
        if (el.attr("disabled")) {
            el.attr("disabled", false);
        } else {
            el.attr("disabled", true);
        }
    };


    $(document).on('click', '.btnNothiVukto', function () {

        $('#selected_dak_id').val('');
        $('#selected_dak_type').val('');
        var selectedVal = '';
        var dak_type = '';
        $.each($('.dak_list_checkbox_to_select:checked'), function () {

            selectedVal += $(this).val() + ',';
            dak_type += $(this).data('dak-type') + ',';
        });

        if (selectedVal.length === 0) {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-bottom-right"
            };
            toastr.error("দুঃখিত! ডাক বাছাই করা হয়নি।");
            return false;
        } else {
            $('#nothiVuktoKoron-modal').modal('show');
            $('.nothiVuktoContent').find('.modal-body').html('<img src="' + js_wb_root + 'assets/global/img/loading-spinner-grey.gif" alt="" class="loading"> <span>&nbsp;&nbsp;লোড হচ্ছে। একটু অপেক্ষা করুন... </span>');
            $.ajax({
                url: js_wb_root + 'nothiMasters/userNothiList',
                dataType: 'text',
                method: 'post',
                data: {'dak_id': selectedVal, 'dak_type': dak_type},
                success: function (response) {
                    $('.nothiVuktoContent').find('.modal-body').html(response);
                    $('#selected_dak_id').val(selectedVal);
                    $('#selected_dak_type').val(dak_type);

                    Metronic.init();
                    Metronic.initSlimScroll('.scroller');
                }
            });
        }
    });

    $(document).on('click', '.newNothiCreate', function () {
        $('.nothiCreateContent').show();
        $('.nothiVuktoContent').find('.modal-body').html('');
        $('.nothiVuktoContent').hide();

        var dak_subject = $(this).attr('dak_subject');
        var nothijato = $(this).attr('data-nothijato');

        $('.nothiCreateContent').find('.scroller').html('<img src="' + js_wb_root + 'assets/global/img/loading-spinner-grey.gif" alt="" class="loading"> <span>&nbsp;&nbsp;লোড হচ্ছে। একটু অপেক্ষা করুন... </span>');
        $.ajax({
            url: js_wb_root + 'nothiMasters/add/0/add/' + dak_subject + '/' + nothijato,
            method: 'post',
            success: function (response) {
                $('.nothiCreateContent').find('.scroller').html(response);
                $('.nothi-add-menu').hide();
                $('.nothiCreateButton').hide();
                $('#nothi-types-id').select2();
                
                $('.bntNothiListShow').show();
                initTable1();
                $('.dataTables_filter').css('float', 'left');
                $('.permissiondiv').show();

                Metronic.init();
                Metronic.initSlimScroll('.scroller');
            }
        });
    });

    $(document).on('click', '.bntNothiListShow', function () {
        $('.nothiCreateContent').hide();
        $('.nothiCreateContent').find('.scroller').html('');
        $('.nothiVuktoContent').show();
        
        var nothijato = $(this).attr('data-nothijato');

        $('.nothiVuktoContent').find('.modal-body').html('<img src="' + js_wb_root + 'assets/global/img/loading-spinner-grey.gif" alt="" class="loading"> <span>&nbsp;&nbsp;লোড হচ্ছে। একটু অপেক্ষা করুন... </span>');

        $.ajax({
            url: js_wb_root + 'nothiMasters/userNothiList',
            data: {nothijato:nothijato},
            type:'post',
            success: function (response) {
                $('.nothiVuktoContent').find('.modal-body').html(response);
                Metronic.init();
                Metronic.initSlimScroll('.scroller');
            }
        });
    });

    $(document).on('click', '.nothiVuktoKoronSingle', function () {

        var selectedVal = $(this).data('id');
        var dak_type = $(this).data('dak-type');

        if (selectedVal.length === 0) {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-bottom-right"
            };
            toastr.error("দুঃখিত! ডাক বাছাই করা হয়নি।");
            return false;
        } else {
            $('#nothiVuktoKoron-modal').modal('show');
            $('.nothiVuktoContent').find('.modal-body').html('<img src="' + js_wb_root + 'assets/global/img/loading-spinner-grey.gif" alt="" class="loading"> <span>&nbsp;&nbsp;লোড হচ্ছে। একটু অপেক্ষা করুন... </span>');
            $.ajax({
                url: js_wb_root + 'nothiMasters/userNothiList',
                data: {'dak_id': selectedVal, 'dak_type': dak_type},
                method: 'post',
                dataType: 'text',
                success: function (response) {
                    $('.nothiVuktoContent').find('.modal-body').html(response);
                    $('#selected_dak_id').val(selectedVal);
                    $('#selected_dak_type').val(dak_type);

                    Metronic.init();
                    Metronic.initSlimScroll('.scroller');
                }
            });
        }
    });

    $(document).on('submit', '#NothiVuktoKoronForm', function (e) {
        e.preventDefault();

        if ($('#NothiVuktoKoronForm').find('.nothipermittedlist.active').length > 0) {
            if ($('#NothiVuktoKoronForm').find('.selectPartNo.active').length > 0) {

                var nothi_id = $('#NothiVuktoKoronForm').find('.selectPartNo.active').find('td').eq(0).attr('nothi_parts_id');
                var nothi_master_id = $('#NothiVuktoKoronForm').find('.selectPartNo.active').find('td').eq(0).attr('nothi_masters_id');
                
               if(confirm("আপনি কি নির্বাচিত নথিতে উপস্থাপন অথবা নথিজাত করতে চান?")){
                    $(this).find('input[type=submit]').attr('disabled', 'disabled');
                    if (nothi_id == 0) {

                        if (nothi_master_id == 0 || typeof (nothi_master_id) == 'undefined') {
                            toastr.options = {
                                "closeButton": true,
                                "debug": false,
                                "positionClass": "toast-bottom-right"
                            };
                            $('#NothiVuktoKoronForm').find('input[type=submit]').removeAttr('disabled');
                            toastr.error("দুঃখিত! নথি বাছাই করা হয়নি।");
                            return false;
                        } else {

                            $('#NothiVuktoKoronForm').find('#selected_nothi_master_id').val(nothi_master_id);

                            $.ajax({
                                url: js_wb_root + "nothiMasters/add",
                                data: {formData: $('#NothiVuktoKoronForm').serializeArray(), priviliges: []},
                                type: "POST",
                                async: false,
                                dataType: 'JSON',
                                success: function (response) {

                                    if (response.status == 'error') {

                                        toastr.error(response.msg);
                                        $('#NothiVuktoKoronForm').find('input[type=submit]').removeAttr('disabled');
                                        return false;
                                    } else if (response.status == 'success') {
                                        nothi_id = response.id;
                                        $('#NothiVuktoKoronForm').find('#selected_nothi_part_id').val(response.id);
                                    }
                                },
                                error: function (status, xresponse) {

                                    $('#NothiVuktoKoronForm').find('input[type=submit]').removeAttr('disabled');
                                }

                            });

                        }
                    } else {
                        $('#NothiVuktoKoronForm').find('#selected_nothi_master_id').val(nothi_master_id);
                        $('#NothiVuktoKoronForm').find('#selected_nothi_part_id').val(nothi_id);

                    }


                    if (nothi_id <= 0) {
                        $('#NothiVuktoKoronForm').find('input[type=submit]').removeAttr('disabled');
                        toastr.options = {
                            "closeButton": true,
                            "debug": false,
                            "positionClass": "toast-bottom-right"
                        };
                        toastr.error("দুঃখিত! নথি বাছাই করা হয়নি।");
                        return false;
                    }

                    var url = js_wb_root + "nothiMasters/nothiVuktoKoron";
                    $.ajax({
                        url: url,
                        data: $(this).serializeArray(),
                        type: "POST",
                        async: false,
                        dataType: 'JSON',
                        success: function (response) {

                            if (response.status === 'error') {
                                $('#NothiVuktoKoronForm').find('input[type=submit]').removeAttr('disabled');
                                toastr.options = {
                                    "closeButton": true,
                                    "debug": false,
                                    "positionClass": "toast-bottom-right"
                                };
                                toastr.error(response.msg);
                                return false;

                            } else if (response.status === 'success') {
                                toastr.options = {
                                    "closeButton": true,
                                    "debug": false,
                                    "positionClass": "toast-bottom-right"
                                };
                                toastr.success(response.msg);
                                $(this).find('span').removeClass('checked');
                                $('#NothiVuktoKoronForm')[0].reset();
                                $('#nothiVuktoKoron-modal').modal('toggle');

                                var url = js_wb_root + 'nothiMasters/nothiDetails/' + nothi_id;

                                window.location.href = url;
                            }
                        },
                        error: function (status, xresponse) {
                            $('#NothiVuktoKoronForm').find('input[type=submit]').removeAttr('disabled');
                        }
                    });
                }
            } else {
                $('#NothiVuktoKoronForm').find('input[type=submit]').removeAttr('disabled');
                toastr.options = {
                    "closeButton": true,
                    "debug": false,
                    "positionClass": "toast-bottom-right"
                };
                toastr.error("দুঃখিত! নথি বাছাই করা হয়নি।");
                return false;
            }

        } else {
            $('#NothiVuktoKoronForm').find('input[type=submit]').removeAttr('disabled');
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-bottom-right"
            };
            toastr.error("দুঃখিত! নথি বাছাই করা হয়নি।");
            return false;
        }

        return false;
    });

    $(document).on('click', '.btnNothiJato', function () {

        $('#selected_dak_id').val('');
        $('#selected_dak_type').val('');
        var selectedVal = '';
        var dak_type = '';
        $.each($('.dak_list_checkbox_to_select:checked'), function () {

            selectedVal += $(this).val() + ',';
            dak_type += $(this).data('dak-type') + ',';
        });

        if (selectedVal.length === 0) {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-bottom-right"
            };
            toastr.error("দুঃখিত! ডাক বাছাই করা হয়নি।");
            return false;
        } else {
            $('#nothiVuktoKoron-modal').modal('show');
            $('.nothiVuktoContent').find('.modal-body').html('<img src="' + js_wb_root + 'assets/global/img/loading-spinner-grey.gif" alt="" class="loading"> <span>&nbsp;&nbsp;লোড হচ্ছে। একটু অপেক্ষা করুন... </span>');
            $.ajax({
                url: js_wb_root + 'nothiMasters/userNothiList',
                dataType: 'text',
                method: 'post',
                data: {'dak_id': selectedVal, 'dak_type': dak_type,'nothijato':1},
                success: function (response) {
                    $('.nothiVuktoContent').find('.modal-body').html(response);
                    $('#selected_dak_id').val(selectedVal);
                    $('#selected_dak_type').val(dak_type);
                    $('#nothijato_input').val(1);

                    Metronic.init();
                    Metronic.initSlimScroll('.scroller');
                }
            });
        }
    });
    
    $(document).on('click', '.nothiJatoKoronSingle', function () {

        var selectedVal = $(this).data('id');
        var dak_type = $(this).data('dak-type');

        if (selectedVal.length === 0) {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-bottom-right"
            };
            toastr.error("দুঃখিত! ডাক বাছাই করা হয়নি।");
            return false;
        } else {
            $('#nothiVuktoKoron-modal').modal('show');
            $('.nothiVuktoContent').find('.modal-body').html('<img src="' + js_wb_root + 'assets/global/img/loading-spinner-grey.gif" alt="" class="loading"> <span>&nbsp;&nbsp;লোড হচ্ছে। একটু অপেক্ষা করুন... </span>');
            $.ajax({
                url: js_wb_root + 'nothiMasters/userNothiList',
                data: {'dak_id': selectedVal, 'dak_type': dak_type,'nothijato':1},
                method: 'post',
                dataType: 'text',
                success: function (response) {
                    $('.nothiVuktoContent').find('.modal-body').html(response);
                    $('#selected_dak_id').val(selectedVal);
                    $('#nothijato_input').val(1);
                    $('#selected_dak_type').val(dak_type);

                    Metronic.init();
                    Metronic.initSlimScroll('.scroller');
                }
            });
        }
    });
    
    return {
        //main function to initiate the module
        init: function (page) {
            if (typeof (page) != 'undefined' && page != '') {
                if (page == 'inbox')
                    loadInbox($(this), "inbox");
                else if (page == 'sent')
                    loadInbox($(this), "sent");
            } else {
                loadInbox($(this), "inbox");
            }

            $('.inbox-details').on('click', '.inbox-discard-btn', function (e) {
                e.preventDefault();
                loadInbox($(this), "inbox");
            });

            $('.inbox-details').on('click', '.sent-discard-btn', function (e) {
                e.preventDefault();
                loadInbox($(this), "sent");
            });

            $('.inbox-details').on('click', '.nothivukto-discard-btn', function (e) {
                e.preventDefault();
                loadInbox($(this), "nothivukto");
            });

            $('.inbox-details').on('click', '.nothijato-discard-btn', function (e) {
                e.preventDefault();
                loadInbox($(this), "nothijato");
            });

            // handle reply and forward button click
            $('.inbox').on('click', '.reply-btn', function () {
                loadReply($(this));
            });

            $('.inbox-content').on('click', '.dak_forward_btn', function () {
                loadInboxAfterSent($(this), 'sent');
            });

            // handle view message
            $('.inbox-details').on('click', '.dak_revert', function () {
                dakRevert($(this));
            });

            $(document).on("click", '.showDetailsDakInbox', function () {
                conditions = $('.filter input').map(function () {
                    var obj = {};
                    var $item = $(this);
                    obj[$item.attr('name')] = $item.val();
                    return obj;
                }).get();

                loadInboxDetailMessgae($(this));
            });

            $(document).on("click", '.showPaginateDetailsDakInbox', function () {

                if (typeof (js_paginate_type) != 'undefined') {
                    if (js_paginate_type == 1) {
                        var si = $(this).data('si');

                        if ($('table#datatable_dak').children('tbody').children('tr').length < si) {
                            si = 1;
                        }

                        si = si - 1;

                        $('.inbox-content').find('.showDetailsDakInbox').eq(si).click();
                    } else {
                        conditions = $('.filter input').map(function () {
                            var obj = {};
                            var $item = $(this);
                            obj[$item.attr('name')] = $item.val();
                            return obj;
                        }).get();

                        loadInboxDetailMessgae($(this));
                    }
                } else {
                    var si = $(this).data('si');

                    if ($('table#datatable_dak').children('tbody').children('tr').length < si) {
                        si = 1;
                    }

                    si = si - 1;

                    $('.inbox-content').find('.showDetailsDakInbox').eq(si).click();
                }

            });

            $(document).on('click', '.showDetailsDakSent', function () {
                conditions = $('.filter input').map(function () {
                    var obj = {};
                    var $item = $(this);
                    obj[$item.attr('name')] = $item.val();
                    return obj;
                }).get();
                loadSentDetailMessgae($(this));
            });

            $(document).on('click', '.showDetailsNothiVukto', function () {
                conditions = $('.filter input').map(function () {
                    var obj = {};
                    var $item = $(this);
                    obj[$item.attr('name')] = $item.val();
                    return obj;
                }).get();
                loadNotiVuktoDetailMessgae($(this));
            });

            $(document).on('click', '.showDetailsNothiJato', function () {
                conditions = $('.filter input').map(function () {
                    var obj = {};
                    var $item = $(this);
                    obj[$item.attr('name')] = $item.val();
                    return obj;
                }).get();
                loadNotiJatoDetailMessgae($(this));
            });

            $(document).on('click', '.showPaginateDetailsDakSent', function () {

                if (typeof (js_paginate_type) != 'undefined') {
                    if (js_paginate_type == 1) {
                        var si = $(this).data('si');

                        if ($('table#datatable_dak').children('tbody').children('tr').length < si) {
                            si = 1;
                        }

                        si = si - 1;

                        $('.inbox-content').find('.showDetailsDakSent').eq(si).click();

                    } else {
                        conditions = $('.filter input').map(function () {
                            var obj = {};
                            var $item = $(this);
                            obj[$item.attr('name')] = $item.val();
                            return obj;
                        }).get();
                        loadSentDetailMessgae($(this));
                    }
                } else {
                    var si = $(this).data('si');

                    if ($('table#datatable_dak').children('tbody').children('tr').length < si) {
                        si = 1;
                    }

                    si = si - 1;

                    $('.inbox-content').find('.showDetailsDakSent').eq(si).click();

                }
            });

            $(document).on('click', '.showPaginateDetailsNothiVuktoDak', function () {

                if (typeof (js_paginate_type) != 'undefined') {
                    if (js_paginate_type == 1) {
                        var si = $(this).data('si');

                        if ($('table#datatable_dak').children('tbody').children('tr').length < si) {
                            si = 1;
                        }

                        si = si - 1;

                        $('.inbox-content').find('.showDetailsNothiVukto').eq(si).click();

                    } else {
                        conditions = $('.filter input').map(function () {
                            var obj = {};
                            var $item = $(this);
                            obj[$item.attr('name')] = $item.val();
                            return obj;
                        }).get();

                        loadNotiVuktoDetailMessgae($(this));
                    }
                } else {
                    var si = $(this).data('si');

                    if ($('table#datatable_dak').children('tbody').children('tr').length < si) {
                        si = 1;
                    }

                    si = si - 1;

                    $('.inbox-content').find('.showDetailsNothiVukto').eq(si).click();

                }
            });

            $(document).on('click', '.showPaginateDetailsNothiJatoDak', function () {

                if (typeof (js_paginate_type) != 'undefined') {
                    if (js_paginate_type == 1) {
                        var si = $(this).data('si');

                        if ($('table#datatable_dak').children('tbody').children('tr').length < si) {
                            si = 1;
                        }

                        si = si - 1;

                        $('.inbox-content').find('.showDetailsNothiJato').eq(si).click();

                    } else {
                        conditions = $('.filter input').map(function () {
                            var obj = {};
                            var $item = $(this);
                            obj[$item.attr('name')] = $item.val();
                            return obj;
                        }).get();

                        loadNotiVuktoDetailMessgae($(this));
                    }
                } else {
                    var si = $(this).data('si');

                    if ($('table#datatable_dak').children('tbody').children('tr').length < si) {
                        si = 1;
                    }

                    si = si - 1;

                    $('.inbox-content').find('.showDetailsNothiJato').eq(si).click();

                }
            });


            $('.inbox-content').on('click', '.inbox-nav > li.new > a', function (e) {
                e.preventDefault();
                loadInbox($(this), "new");
            });
            $('.inbox-content').on('click', '.inbox-nav > li.inbox > a', function (e) {
                e.preventDefault();
                loadInbox($(this), "inbox");
            });

            $('.inbox-content').on('click', '.inbox-nav > li.sent > a', function (e) {
                e.preventDefault();
                loadInbox($(this), "sent");
            });

            $('.inbox-content').on('click', '.inbox-nav > li.nothivukto > a', function (e) {
                e.preventDefault();
                loadInbox($(this), "nothivukto");
            });
            $('.inbox-content').on('click', '.inbox-nav > li.nothijato > a', function (e) {
                e.preventDefault();
                loadInbox($(this), "nothijato");
            });

            $('.inbox-content').on('click', '.inbox-nav > li.dispatched > a', function (e) {
                e.preventDefault();
                loadInbox($(this), "dispatched");
            });

            $('.inbox-content').on('click', '.inbox-nav > li.trash > a', function (e) {
                e.preventDefault();
                loadInbox($(this), "trash");
            });


            $('.inbox-content').on('change', '.extramenu', function (e) {
                e.preventDefault();
                var val = $(this).find('option:selected').val();
                if (val != '--')
                    loadInbox($(this), val);
            });



            $('.inbox-nav > li.new > a').click(function () {
                loadInbox($(this), 'new');//prev->inbox
            });
            // handle inbox listing
            $('.inbox-nav > li.inbox > a').click(function () {
                loadInbox($(this), 'inbox');//prev->inbox
            });

            // handle sent listing
            $('.inbox-nav > li.sent > a').click(function () {
                loadInbox($(this), 'sent');
            });

            // handle draft listing
            $('.inbox-nav > li.dispatched > a').click(function () {
                loadInbox($(this), 'dispatched');
            });

            // handle trash listing
            $('.inbox-nav > li.trash > a').click(function () {
                loadInbox($(this), 'trash');
            });

            //handle compose/reply cc input toggle
            $('.inbox-content').on('click', '.mail-to .inbox-cc', function () {
                handleCCInput();
            });

            //handle compose/reply bcc input toggle
            $('.inbox-content').on('click', '.mail-to .inbox-bcc', function () {
                handleBCCInput();
            });

            $('.inbox-content').on('click', '#forwardAllSelected', function () {

                var i = 0;
                var dakaction = $('.dak_list_checkbox_to_action').find('input[name=dak_actions]').val();
                var toofficer = $('.dak_list_checkbox_to_action input[name=to_officer_id]').val();
                var toofficername = $('.dak_list_checkbox_to_action input[name=to_officer_name]').val();
                var mainofficer = $('.dak_list_checkbox_to_action input[name=to_officer_level]').val();

                if (toofficer.length == 0) {
                    error = true;
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error("দুঃখিত! প্রাপক বাছাই করা হয়নি");
                    return;

                }
                if (mainofficer.length == 0) {
                    error = true;
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error("দুঃখিত! মুল প্রাপক বাছাই করা হয়নি");
                    return;

                }

                $('.dak_list_checkbox_to_select:checked').each(function () {
                    var selectedVal = '';
                    var dak_type = '';
                    selectedVal = $(this).val();
                    dak_type = $(this).data('dak-type');
                    var error = false;

                    if (selectedVal.length === 0) {
                        error = true;
                        toastr.options = {
                            "closeButton": true,
                            "debug": false,
                            "positionClass": "toast-bottom-right"
                        };
                        toastr.error("দুঃখিত! কোনো ডাক বাছাই করা হয়নি");
                        return;

                    }
                    dakForwardFromList(
                            dakaction,
                            selectedVal,
                            toofficer,
                            toofficername,
                            $('.dak_list_checkbox_to_action select[name=dak_priority_level]').val(),
                            mainofficer, dak_type, '', '', 'multi'
                            );
                    $(this).closest('tr').children('td').attr('style', 'background-color: #f8fbfd;');
                });
                loadInbox($(this), 'inbox');
            });

            $('.inbox-content').on('click', '.forwardSingle', function () {
                var selectedVal = '';
                var dakType = '';
                selectedVal = $(this).closest('tr').parent().parent().closest('tr').find('.dak_list_checkbox_to_select').val();
                dakType = $(this).closest('tr').parent().parent().closest('tr').find('.dak_list_checkbox_to_select').attr('data-dak-type');

                var error = false;


                if ($(this).closest('table').parent().parent().find('input[name=to_officer_id]').val().length == 0) {
                    error = true;
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error("দুঃখিত! প্রাপক বাছাই করা হয়নি");
                    return;
                }

                if ($(this).closest('table').parent().parent().find('input[name=to_officer_level]').val().length == 0) {
                    error = true;
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error("দুঃখিত! মুল প্রাপক বাছাই করা হয়নি");
                    return;
                }

                if (selectedVal.length == 0) {
                    error = true;
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error("দুঃখিত! কোনো ডাক বাছাই করা হয়নি");
                    return;
                }
                /*
                 if ($(this).closest('table').find('input[name=dak_actions]').val().length == 0) {
                 error = true;
                 }*/

                if (error) {
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error("দুঃখিত! দয়া করে প্রয়োজনীয় তথ্য দিন");
                    return;
                }

                dakForwardFromList($(this).closest('table').find('input[name=dak_actions]').val(), selectedVal,
                        $(this).closest('table').parent().parent().find('input[name=to_officer_id]').val(),
                        $(this).closest('table').parent().parent().find('input[name=to_officer_name]').val(),
                        $(this).closest('table').find('select[name=dak_priority_level]').val(),
                        $(this).closest('table').parent().parent().find('input[name=to_officer_level]').val(), dakType
                        );
            });

            $('.inbox-details').on('click', '#forwardSingle', function () {

                var selectedVal = '';
                selectedVal = $(this).attr('dak_id');

                var dakType = '';
                dakType = $(this).attr('dak_type');

                var error = false;
                if ($(this).parents('.inbox-details').find('input[name=to_officer_level]').val().length == 0) {
                    error = true;
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error("দুঃখিত! মুল প্রাপক বাছাই করা হয়নি");
                    return;
                }

                if ($(this).parents('.inbox-details').find('input[name=to_officer_id]').val().length == 0) {
                    error = true;
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error("দুঃখিত! প্রাপক বাছাই করা হয়নি");
                    return;
                }

                if (selectedVal.length == 0) {
                    error = true;
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error("দুঃখিত! কোনো ডাক বাছাই করা হয়নি");
                    return;
                }

                if (error) {
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error("দুঃখিত! দয়া করে প্রয়োজনীয় তথ্য দিন");
                    return;
                }

                if ($('.projapoticanvas').length == 0) {
                    dakForwardFromList(
                            $(this).parents('.inbox-details').find('input[name=dak_actions]').last().val(), selectedVal,
                            $(this).parents('.inbox-details').find('input[name=to_officer_id]').val(),
                            $(this).parents('.inbox-details').find('input[name=to_officer_name]').val(),
                            $(this).parents('.inbox-details').find('select[name=dak_priority_level]').val(),
                            $(this).parents('.inbox-details').find('input[name=to_officer_level]').val(), dakType
                            );
                } else {
                    dakForwardFromList(
                            $(this).parents('.inbox-details').find('input[name=dak_actions]').last().val(), selectedVal,
                            $(this).parents('.inbox-details').find('input[name=to_officer_id]').val(),
                            $(this).parents('.inbox-details').find('input[name=to_officer_name]').val(),
                            $(this).parents('.inbox-details').find('select[name=dak_priority_level]').val(),
                            $(this).parents('.inbox-details').find('input[name=to_officer_level]').val(), dakType, ProjapotiCanvas.getcommentShape(), ProjapotiCanvas.getCurImgId()
                            );
                }


            });

            $('.inbox-content').on('click', '#forwardAllSelectedWithMultipleComment', function () {


                $('.dak_list_checkbox_to_select:checked').each(function () {
                    var selectedVal = '';
                    selectedVal = $(this).val();

                    var dak_type = $(this).data('dak-type');
                    var error = false;

                    if ($(this).closest('tr').find('.dak_sender_cell_list').find('input[name=to_officer_id]').val().length == 0) {
                        error = true;
                        toastr.options = {
                            "closeButton": true,
                            "debug": false,
                            "positionClass": "toast-bottom-right"
                        };
                        toastr.error("দুঃখিত! প্রাপক বাছাই করা হয়নি");
                        return;

                    }

                    if ($(this).closest('tr').find('.dak_sender_cell_list').find('input[name=to_officer_level]').val().length == 0) {
                        error = true;
                        toastr.options = {
                            "closeButton": true,
                            "debug": false,
                            "positionClass": "toast-bottom-right"
                        };
                        toastr.error("দুঃখিত! মুল প্রাপক বাছাই করা হয়নি");
                        return;
                    }

                    if (selectedVal.length == 0) {
                        error = true;
                        toastr.options = {
                            "closeButton": true,
                            "debug": false,
                            "positionClass": "toast-bottom-right"
                        };
                        toastr.error("দুঃখিত! কোনো ডাক বাছাই করা হয়নি");
                        return;
                    }


                    if (error) {
                        $(this).closest('tr').children('td').attr('style', 'background-color:rgba(255, 144, 144, 0.8)');
                        toastr.options = {
                            "closeButton": true,
                            "debug": false,
                            "positionClass": "toast-bottom-right"
                        };
                        toastr.error("লাল চিহ্নিত ডাক ফরোয়ার্ড করা সম্ভব হচ্ছে না");
                        return;
                    } else {
                        dakForwardFromList($(this).closest('tr').find('.dak_sender_cell_list').find('input[name=dak_actions]').val(), selectedVal,
                                $(this).closest('tr').find('.dak_sender_cell_list').find('input[name=to_officer_id]').val(),
                                $(this).closest('tr').find('.dak_sender_cell_list').find('input[name=to_officer_name]').val(),
                                $(this).closest('tr').find('.dak_sender_cell_list').find('select[name=dak_priority_level]').val(),
                                $(this).closest('tr').find('.dak_sender_cell_list').find('input[name=to_officer_level]').val(), dak_type
                                );
                        $(this).closest('tr').children('td').attr('style', 'background-color: #f8fbfd;');
                    }

                });
            });

            //handle loading content based on URL parameter
            if (Metronic.getURLParameter("a") === "view") {
                loadMessage();
            } else if (Metronic.getURLParameter("a") === "compose") {
                loadCompose();
            } else {
                //loadInbox($(this), "inbox");
            }

        }

    };

}();
