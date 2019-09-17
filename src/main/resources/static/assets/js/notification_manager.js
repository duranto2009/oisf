var dak_id = 0, nothi_id = 0, initscrool = 0;
var NotificationManager =
        {
            handleQuickSidebarToggler: function () {
                // quick sidebar toggler
                $('.page-header .quick-sidebar-toggler, .page-quick-sidebar-toggler').click(function (e) {
                    $('body').toggleClass('page-quick-sidebar-open');
                });
            },
            setNotificationPanelHeader: function (cnt_dak, cnt_nothi) {
                $(".dakcoun").html(cnt_dak);
                $(".nothicoun").html(cnt_nothi);
            },
            setNotificationDakMessages: function (response) {
                var i = 0;
                var notification_html = "";

                notification_html += "<ul class='feeds list-items'>";
                for (i = 0; i < response.length; i++) {
                    if (i == 0)
                    {
                        dak_id = response[i].id;
                    }
                    notification_html += "<li class='media' ><div class='media-status' ><span class='media-heading-sub'>" + response[i].message_bng + "</span></div><span class='text-right; pull-right  badge badge-primary badge-roundless'>" + response[i].ago + "</span></li>";
                }

                notification_html += "</ul>";
                $("#quick_sidebar_tab_1 .page-quick-sidebar-chat-users").prepend(notification_html);

            },
            setNotificationNothiMessages: function (response) {
                var i = 0;
                var notification_html = "";

                notification_html += "<ul class='media-list list-items'>";
                for (i = 0; i < response.length; i++) {
                    if (i == 0)
                    {
                        nothi_id = response[i].id;
                    }
                    notification_html += "<li class='media'><div class='media-status'><span class='media-heading-sub'>" + response[i].message_bng + "</span></div><span class='text-right; pull-right badge badge-primary badge-roundless'>" + response[i].ago + "</span></li>";
                }

                notification_html += "</ul>";
                $("#quick_sidebar_tab_2 .page-quick-sidebar-alerts-list").prepend(notification_html);
            },
            loadNotifications: function ()
            {
                var wrapper = $('.page-quick-sidebar-wrapper');
                var wrapperChat = wrapper.find('.page-quick-sidebar-chat');

                /* For Slider of Dak*/
                var initChatSlimScroll = function () {
                    var chatUsers = wrapper.find('.page-quick-sidebar-chat-users');
                    var chatUsersHeight;

                    chatUsersHeight = wrapper.height() - wrapper.find('.nav-justified > .nav-tabs').outerHeight();

                    // chat user list 
                    Metronic.destroySlimScroll(chatUsers);
                    chatUsers.attr("data-height", chatUsersHeight);
                    Metronic.initSlimScroll(chatUsers);

                    var chatMessages = wrapperChat.find('.page-quick-sidebar-chat-user-messages');
                    var chatMessagesHeight = chatUsersHeight - wrapperChat.find('.page-quick-sidebar-chat-user-form').outerHeight() - wrapperChat.find('.page-quick-sidebar-nav').outerHeight();

                    // user chat messages 
                    Metronic.destroySlimScroll(chatMessages);
                    chatMessages.attr("data-height", chatMessagesHeight);
                    Metronic.initSlimScroll(chatMessages);
                };




                wrapper.find('.page-quick-sidebar-chat-users .media-list > .media').click(function () {
                    wrapperChat.addClass("page-quick-sidebar-content-item-shown");
                });

                wrapper.find('.page-quick-sidebar-chat-user .page-quick-sidebar-back-to-list').click(function () {
                    wrapperChat.removeClass("page-quick-sidebar-content-item-shown");
                });

                /* For Slider of Nothi*/
                var wrapper1 = $('.page-quick-sidebar-wrapper');
                var wrapperAlerts = wrapper1.find('.page-quick-sidebar-alerts');

                var initAlertsSlimScroll = function () {
                    var alertList = wrapper.find('.page-quick-sidebar-alerts-list');
                    var alertListHeight;

                    alertListHeight = wrapper.height() - wrapper.find('.nav-justified > .nav-tabs').outerHeight();

                    // alerts list 
                    Metronic.destroySlimScroll(alertList);
                    alertList.attr("data-height", alertListHeight);
                    Metronic.initSlimScroll(alertList);
                };


                /* For Slider of Nothi*/
                /*Initalize only once the scroll of Dak and Nothi*/
                if (initscrool === 0)
                {
                    ///For Dak scroll
                    initChatSlimScroll();
                    Metronic.addResizeHandler(initChatSlimScroll); // reinitialize on window resize

                    ///For Nothi scroll
                    initAlertsSlimScroll();
                    Metronic.addResizeHandler(initAlertsSlimScroll);

                    initscrool = 1;
                }
                /*Initalize only once the scroll of Dak and Nothi*/


                $.ajax({
                    type: "GET",
                    url: js_wb_root + 'notificationMessages/getNotifications',
                    data: {"dak_id": dak_id, "nothi_id": nothi_id},
                    async: true, /* If set to non-async, browser shows page as "Loading.."*/
                    cache: false,
                    timeout: 30000, /* Timeout in ms */
                    success: function (response) {

                        NotificationManager.setNotificationPanelHeader(response.Dak, response.Nothi);

                        var notification_dak = new Array();
                        var notification_nothi = new Array();
                        var cnt_d = 0;
                        var cnt_n = 0;

                        $.each(response.data, function (i, v) {
                            if (response.data[i].event_type == "Nothi") {
                                notification_nothi[cnt_n] = response.data[i];
                                cnt_n++;
                            } else {
                                notification_dak[cnt_d] = response.data[i];
                                cnt_d++;
                            }
                        });

                        NotificationManager.setNotificationDakMessages(notification_dak);
                        NotificationManager.setNotificationNothiMessages(notification_nothi);



                        setTimeout(function () {
                            NotificationManager.loadNotifications();

                        }, 120000);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
//                        setTimeout(function () {
//                            NotificationManager.loadNotifications();
//                        }, 120000);
                    }
                });

            },
            init: function ()
            {
                NotificationManager.handleQuickSidebarToggler();
                NotificationManager.loadNotifications();

            }

        };

$(function(){
    NotificationManager.init();
})


