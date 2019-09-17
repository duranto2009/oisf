$(document).ready(function () {

    $('#divisiondropdown').change(function () {
        var data = "";
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/districtlistbydiv",
            data: {
                id: $(this).val()
            },
            async: false,
            success: function (response) {
                data = response;
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

        var select = $('#districtdropdown');
        select.empty();
        select.append($('<option></option>').val(-1).html('...'));
        $.each(data, function (index, value) {
            select.append(
                $('<option></option>').val(value.id).html(value.districtNameBng).attr('bbs', value.bbsCode)
            );
        });

        var selected = $(this).find('option:selected');
        var extra = selected.data('bbs');
        $('input[name = divisionbbscode]').val(extra);

    });

    $('#districtdropdown').change(function () {
        var selected = $(this).find('option:selected');
        var extra = selected.data('bbs');
        $('input[name = districtbbscode]').val(extra);

    });


});