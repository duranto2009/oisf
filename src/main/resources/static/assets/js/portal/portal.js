/**
 * Created by Bony on 9/21/2017.
 */


// for menu
$(document).ready(function () {
    $(".dropdown").hover(
        function () {
            if (screen.width > 900) {
                $('.dropdown-menu', this).stop(true, true).show();
                $(this).toggleClass('open');
            }
        },
        function () {
            if (screen.width > 900) {
                $('.dropdown-menu', this).stop(true, true).hide();
                $(this).toggleClass('open');
            }
        }
    );
});

$(document).ready(function () {
    $('#myCarousel').carousel({
        interval: 4000
    });

    var clickEvent = false;
    $('#myCarousel').on('click', '.nav a', function () {
        clickEvent = true;
        $('.nav li').removeClass('active');
        $(this).parent().addClass('active');
    }).on('slid.bs.carousel', function (e) {
        if (!clickEvent) {
            var count = $('.nav').children().length - 1;
            var current = $('.nav li.active');
            current.removeClass('active').next().addClass('active');
            var id = parseInt(current.data('slide-to'));
            if (count == id) {
                $('.nav li').first().addClass('active');
            }
        }
        clickEvent = false;
    });
});

// for up arrow
$(document).ready(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
        $('#back-to-top').tooltip('hide');
        $('body,html').animate({
            scrollTop: 0
        }, 800);
        return false;
    });

    $('#back-to-top').tooltip('show');

});