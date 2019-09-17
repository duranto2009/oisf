var SummarySheetFormEditable = function () {

    $.mockjaxSettings.responseTime = 500;

    var log = function (settings, response) {

    }

    var initAjaxMock = function () {
        //ajax mocks

        $.mockjax({
            url: '/post',
            response: function (settings) {
                log(settings, this);
            }
        });

        $.mockjax({
            url: '/error',
            status: 400,
            statusText: 'Bad Request',
            response: function (settings) {
                this.responseText = 'Please input correct value';
                log(settings, this);
            }
        });

        $.mockjax({
            url: '/status',
            status: 500,
            response: function (settings) {
                this.responseText = 'Internal Server Error';
                log(settings, this);
            }
        });

        $.mockjax({
            url: '/groups',
            response: function (settings) {
                this.responseText = [{
                        value: 0,
                        text: 'Guest'
                    }, {
                        value: 1,
                        text: 'Service'
                    }, {
                        value: 2,
                        text: 'Customer'
                    }, {
                        value: 3,
                        text: 'Operator'
                    }, {
                        value: 4,
                        text: 'Support'
                    }, {
                        value: 5,
                        text: 'Admin'
                    }
                ];
                log(settings, this);
            }
        });

    }

    var initEditables = function () {
        $.fn.editable.defaults.mode = 'inline';
		
        jQuery.uniform.update('#inline');

        //global settings 
        $.fn.editable.defaults.inputclass = 'form-control';
        $.fn.editable.defaults.url = '/post';

        //editables element samples
        
        $('#summary_office').editable({
            url: '/post',
            type: 'text',
            pk: 1,
			validate: function (value) {
                if ($.trim(value) == '')
                    return 'This field is required';
            },
            title: 'দপ্তরের নাম লিখুন'
        });

        $('#summary_title').editable({
            url: '/post',
            type: 'text',
            pk: 1,
			validate: function (value) {
                if ($.trim(value) == '')
                    return 'This field is required';
            },
            title: 'শিরোনাম লিখুন'
        });
		
		$('#summary_subject').editable({
            url: '/post',
            type: 'text',
            pk: 1,
			validate: function (value) {
                if ($.trim(value) == '')
                    return 'This field is required';
            },
            title: 'বিষয় লিখুন'
        });

        $('#summary_ref_no').editable({
            inputclass: 'form-control input-medium',
            url: '/post',
            type: 'text',
            pk: 1,
			validate: function (value) {
                if ($.trim(value) == '')
                    return 'This field is required';
            },
            title: 'স্মারক নাম্বার লিখুন'
        });

        $('#pencilOnSummary').click(function (e) {
            e.stopPropagation();
            e.preventDefault();
            $('#summarySheet #summary_note').editable('toggle');
        });

        $('#summary_note').editable({
            showbuttons: 'left'
        });

        $('#summary_date').editable({
            rtl: 'right',
            display: function (value) {
                //var d = new Date(value);
                if (value) {
                    var bDate = new Array("০", "১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯");
                    var bMonth = new Array("০১", "০২", "০৩", "০৪", "০৫", "০৬", "০৭", "০৮", "০৯", "১০", "১১", "১২");
                    var dtb, dtb1, dtb2;
                    var dt = value.getDate();
                    if (dt >= 10) {
                        dtb1 = Math.floor(dt / 10);
                        dtb2 = dt % 10;
                        dtb = bDate[dtb1] + "" + bDate[dtb2];
                    } else {
                        dtb = bDate[0] + "" + bDate[dt];
                    }

                    var mnb;
                    var mn = value.getMonth();
                    mnb = bMonth[mn];

                    var yrb = "", yr1;
                    var yr = value.getFullYear();

                    for (var i = 0; i < 3; i++) {
                        yr1 = yr % 10;
                        yrb = bDate[yr1] + yrb;
                        yr = Math.floor(yr / 10);
                    }

                    yrb = bDate[yr] + "" + yrb;

                    $(this).text(dtb + "/" + mnb + "/" + yrb + " খ্রিষ্টাব্দ");

                    if ($("#sending_date_2")) {
                        $("#sending_date_2").text($(this).text()).attr('readDate', value);
                    }
                }
            }
        });

    }

    return {
        //main function to initiate the module
        init: function () {

            // inii ajax simulation
            initAjaxMock();

            // init editable elements
            initEditables();

        }
    };

}();