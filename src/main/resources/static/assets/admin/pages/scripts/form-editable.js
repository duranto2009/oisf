var FormEditable = function () {

    $.mockjaxSettings.responseTime = 500;

    var log = function (settings, response) {
        /*return;
        var s = [],
            str;
        s.push(settings.type.toUpperCase() + ' url = "' + settings.url + '"');
        for (var a in settings.data) {
            if (settings.data[a] && typeof settings.data[a] === 'object') {
                str = [];
                for (var j in settings.data[a]) {
                    str.push(j + ': "' + settings.data[a][j] + '"');
                }
                str = '{ ' + str.join(', ') + ' }';
            } else {
                str = '"' + settings.data[a] + '"';
            }
            s.push(a + ' = ' + str);
        }
        s.push('RESPONSE: status = ' + response.status);

        if (response.responseText) {
            if ($.isArray(response.responseText)) {
                s.push('[');
                $.each(response.responseText, function (i, v) {
                    s.push('{value: ' + v.value + ', text: "' + v.text + '"}');
                });
                s.push(']');
            } else {
                s.push($.trim(response.responseText));
            }
        }
        s.push('--------------------------------------\n');
        $('#console').val(s.join('\n') + $('#console').val());*/
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

    var initEditables = function ($office) {

        //set editable mode based on URL parameter

        //set editable mode based on URL parameter
        $.fn.editable.defaults.mode = 'inline';
       /* if (Metronic.getURLParameter('mode') == 'inline') {
            $('#inline').attr("checked", true);
        } else {
            $('#inline').attr("checked", false);
            jQuery.uniform.update('#inline');
        }*/
        jQuery.uniform.update('#inline');

        //global settings
        $.fn.editable.defaults.inputclass = 'form-control';
        $.fn.editable.defaults.url = '/post';



        //global settings 
        $.fn.editable.defaults.inputclass = 'form-control';
        $.fn.editable.defaults.url = '/post';

        //editables element samples 
        $('#offices').editable({
            url: '/post',
            type: 'text',
            pk: 1,
            value: $office.office_name,
            name: 'offices',
            title: 'দপ্তরের নাম লিখুন',
            display: function (value) {
                if (!value) {
                    $(this).html(' ');
                    return;
                }
                var html =  $office.office_name ;
                $(this).html(html);
            }
        });
		
		$('#subject').editable({
            url: '/post',
            type: 'text',
            pk: 1,
            name: 'subject',
            title: 'বিষয় লিখুন'
        });
		
		$('#web_url_or_office_address').editable({
            url: '/post',
            type: 'text',
            value: $office.office_address,
            pk: 1,
            name: 'web_url_or_office_address',
            title: 'ঠিকানা / ওয়েবসাইটের ঠিকানা লিখুন',
            display: function (value) {
                if (!value) {
                    $(this).html(' ');
                    return;
                }
                var html =  $office.office_address;
                $(this).html(html);
            }
        });

        $('#sharok_no').editable({
			name: "sharok_no",
            validate: function (value) {
                if ($.trim(value) == '') return 'This field is required';
            },
			display: function (value) {
				$(this).text(value);
				if ($("#sharok_no_2")) {
					$("#sharok_no_2").text(value);
				}
			}
        });


        $('#pencil').click(function (e) {
            e.stopPropagation();
            e.preventDefault();
            $('#note').editable('toggle');
        });


        $('#note').editable({
            showbuttons : (Metronic.isRTL() ? 'left' : 'right')
        });

        $('#sending_date').editable({
            rtl : Metronic.isRTL(),
			display: function (value) {
				//var d = new Date(value);
				if (value) {
					var bDate = new Array("০", "১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯");
					var bMonth = new Array("০১", "০২", "০৩", "০৪", "০৫", "০৬", "০৭", "০৮", "০৯", "১০", "১১", "১২");
					var dtb, dtb1, dtb2;
					var dt = value.getDate();
					if (dt >= 10) {
						dtb1 = Math.floor(dt/10);
						dtb2 = dt%10;
						dtb = bDate[dtb1] + "" + bDate[dtb2];
					} else {
						dtb = bDate[0] + "" + bDate[dt];
					}
					
					var mnb;
					var mn = value.getMonth();
					mnb = bMonth[mn];
					
					var yrb = "", yr1;
					var yr = value.getFullYear();
					
					for (var i=0; i<3; i++) {
						yr1 = yr % 10;
						yrb = bDate[yr1] + yrb;
						yr = Math.floor(yr / 10);
					}
					
					yrb = bDate[yr] + "" + yrb;
					
//					$(this).text(dtb + "/" + mnb + "/" + yrb + " খ্রিষ্̣টাব্দ");
					$(this).text(dtb + "/" + mnb + "/" + yrb);
					
					if ($("#sending_date_2")) {
						$("#sending_date_2").text($(this).text()).attr('readDate',value);
					}
				}
			}
        });


        $('#reference').editable({
            inputclass: 'form-control input-medium',
            url: '/post',
            type: 'text',
            pk: 1,
            name: 'reference',
            title: 'সূত্র লিখুন (যদি থাকে)'
        });

    }

    return {
        //main function to initiate the module
        init: function ($office) {

            // inii ajax simulation
            initAjaxMock();

            // init editable elements
            initEditables($office);
            
            // init editable toggler
            $('#enable').click(function () {
                $('#user .editable').editable('toggleDisabled');
            });


            // handle editable elements on hidden event fired
            $('#user .editable').on('hidden', function (e, reason) {
                if (reason === 'save' || reason === 'nochange') {
                    var $next = $(this).closest('tr').next().find('.editable');
                    if ($('#autoopen').is(':checked')) {
                        setTimeout(function () {
                            $next.editable('show');
                        }, 300);
                    } else {
                        $next.focus();
                    }
                }
            });


        }

    };

}();