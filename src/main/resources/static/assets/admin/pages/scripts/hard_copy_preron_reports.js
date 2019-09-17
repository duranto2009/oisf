var SortingDate = function () {

    var content = $('.inbox-content');

    var loadDraft = function (el, startDate, endDate) {

        var url = js_wb_root + "NothiRegisters/hardCopyPreronRegisterContent/" + startDate + "/" + endDate;
        content.html('');

        $.ajax({
            type: "GET",
            cache: false,
            url: url,
            dataType: "html",
            success: function (res) {

                content.html(res);
            },
            error: function (xhr, ajaxOptions, thrownError) {
                toggleButton(el);
            },
            async: false
        });
    };

    return {
        //main function to initiate the module
        init: function (startDate, endDate) {
            loadDraft($(this), startDate, endDate);
        }

    };

}();