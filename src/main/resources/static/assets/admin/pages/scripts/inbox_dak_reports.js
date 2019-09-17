var DraftDakMovement = function () {

    var content = $('.inbox-content');
    var loading = $('.inbox-loading');
    var listListing = '';

    var loadDraft = function (el, name) {

        var url = js_wb_root + "Reports/inboxDakContent/"+name;
        var title = $('.inbox-nav > li.' + name + ' a').attr('data-title');
        listListing = name;
        loading.show();
        content.html('');
        toggleButton(el);

        $.ajax({
            type: "GET",
            cache: false,
            url: url,
            dataType: "html",
            success: function(res)
            {

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

                $('[data-toggle="tooltip"]').tooltip();
            },
            error: function(xhr, ajaxOptions, thrownError)
            {
                toggleButton(el);
            },
            async: false
        });


    };

    var toggleButton = function(el) {
        if (typeof el == 'undefined') {
            return;
        }
        if (el.attr("disabled")) {
            el.attr("disabled", false);
        } else {
            el.attr("disabled", true);
        }
    };

    return {
        //main function to initiate the module
        init: function (url) {
            loadDraft($(this), url);
        }

    };

}();