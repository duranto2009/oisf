var NotificationManager =
        {
            setNotificationPanelHeader: function (cnt_dak, cnt_nothi) {
                $("#cnt_dak").html(cnt_dak);
                $("#cnt_nothi").html(cnt_nothi);
            },
            setNotificationDakMessages: function (response) {
                var i = 0;
                var notification_html = "";

                notification_html += "<ul class='media-list list-items'>";
                for (i = 0; i < response.length; i++) {
                    notification_html += "<li class='media'><div class='media-status'><span class='media-heading-sub'>" + response[i].message_bng + "</span></div><span class='text-right;  badge badge-primary badge-roundless'>" + response[i].ago + "</span></li>";
                }

                notification_html += "</ul>";
                $("#quick_sidebar_tab_1").html(notification_html);
            },
            setNotificationNothiMessages: function (response) {
                var i = 0;
                var notification_html = "";

                notification_html += "<ul class='media-list list-items'>";
                for (i = 0; i < response.length; i++) {
                    notification_html += "<li class='media'><div class='media-status'><span class='media-heading-sub'>" + response[i].message_bng + "</span></div><span class='text-right; badge badge-primary badge-roundless'>" + response[i].ago + "</span></li>";
                }

                notification_html += "</ul>";
                $("#quick_sidebar_tab_2").html(notification_html);
            },
            loadNotifications: function ()
            {
                $.ajax({
                    type: "GET",
                    url: js_wb_root + 'notificationMessages/getNotifications',
                    async: true, /* If set to non-async, browser shows page as "Loading.."*/
                    cache: false,
                    timeout: 50000, /* Timeout in ms */
                    success: function (response) {
                        
                        NotificationManager.setNotificationPanelHeader(response.Dak, response.Nothi);
                        var notification_dak = new Array();
                        var notification_nothi = new Array();
                        var cnt_d = 0;
                        var cnt_n = 0;

                        $.each( response.data, function(i,v){
                             if (response.data[i].event_type == "Nothi"){
                                notification_nothi[cnt_n] = response.data[i];
                                cnt_n++;
                            }
                            else{
                                notification_dak[cnt_d] = response.data[i];
                                cnt_d++;
                            }
                        });
                           
                        NotificationManager.setNotificationDakMessages(notification_dak);
                        NotificationManager.setNotificationNothiMessages(notification_nothi);
                        
                        setTimeout(function(){
                           NotificationManager.loadNotifications();                           
                        }, 5000);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        setTimeout(function(){
                            NotificationManager.loadNotifications();                           
                        }, 1000);
                    }
                });

            },
            init: function ()
            {
                NotificationManager.loadNotifications();
            }

        };



