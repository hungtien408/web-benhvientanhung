(function ($) {
    $(window).load(function () {
        height_pop();
    });
    $(window).resize(function () {
        height_pop();
    });
    $(function () {
        mymap();
        myfunload();
        menuDanhmuc();
        $('.btn-pop-dl').click(function () {
            $('.list-doingu .popup .popup-content').css({ 'top': '-250%' });
            $('.datlich-kham .popup-content').css({ 'top': '30px' });
        });

        /**/
        var swiper = new Swiper('.swiper-container', {
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',
            slidesPerView: 3,
            slidesPerColumn: 2,
            paginationClickable: true,
            spaceBetween: 15,
            breakpoints: {
                1200: {
                    slidesPerView: 2,
                },
                992: {
                    slidesPerView: 1,
                },
                768:{
                    slidesPerView: 2,
                },
                640: {
                    slidesPerView: 1,
                }
            }
        });
    });
})(jQuery);

function myfunload() {
    $(".panel-a").mobilepanel();
    $("#menu > li").not(".home").clone().appendTo($("#menuMobiles"));
    $("#menuMobiles input").remove();
    $("#menuMobiles > li > a").append('<span class="fa fa-chevron-circle-right iconar"></span>');
    $("#menuMobiles li li a").append('<span class="fa fa-angle-right iconl"></span>');
    $("#menu > li:last-child").addClass("last");
    $("#menu > li:first-child").addClass("fisrt");

    $('#menu li').hover(function () {
        $(this).children('ul').stop(true, false, true).slideToggle(300);
    });

    $('.carousel-inner').find('.item').first().addClass('active');
    $('.carousel-indicators').find('li').first().addClass('active');
    $('.nav-tabs').find('li').first().addClass('active');
    $('.tab-content').find('.tab-pane').first().addClass('active');


    $('.scroll-popup .popup-content').mCustomScrollbar({
        autoHideScrollbar: true,
        theme: "dark-thick",
    });
    $('.camnhan-item .item .content').mCustomScrollbar({
        autoHideScrollbar: true,
        theme: "dark-thick",
    });

    $('.doctors-team').owlCarousel({
        loop: true,
        autoplaySpeed: 4000,
        margin: 30,
        nav: true,
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true,
        touchDrag: false,
        mouseDrag: false,
        responsive: {
            0: {
                items: 1
            },
            481: {
                items: 2
            },
            769: {
                items: 3,
                margin: 10
            },
            1200: {
                items: 4
            },
        }
    });
    $('.img-lkht').owlCarousel({
        loop: true,
        autoplaySpeed: 4000,
        margin: 10,
        nav: true,
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1
            },
            481: {
                items: 2
            },
            769: {
                items: 3
            },
            1200: {
                items: 3
            },
        }
    });

    $('.chuyenkhoa-carousel').owlCarousel({
        loop: true,
        autoplaySpeed: 4000,
        nav: true,
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1
            },
            481: {
                items: 2
            },
            767: {
                items: 3
            }
        }
    });

    $('.thietbi-carousel').owlCarousel({
        loop: true,
        autoplaySpeed: 4000,
        margin: 2,
        nav: true,
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 2
            },
            481: {
                items: 2
            },
            769: {
                items: 3
            },
            992: {
                items: 4
            },
            1200: {
                items: 5
            },
        }
    });

    $('.cam-nhan-carousel').owlCarousel({
        loop: true,
        autoplaySpeed: 4000,
        margin: 0,
        nav: true,
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true,
        items: 1
        //responsive: {
        //    //0: {
        //    //    items: 1
        //    //},
        //    //481: {
        //    //    items: 2
        //    //},
        //    //769: {
        //    //    items: 3,
        //    //    margin: 10
        //    //},
        //    1200: {
        //    },
        //}
    });

    $('#sliderProject').slick({
        infinite: true,
        slidesToShow: 2,
        slidesToScroll: 1,
        arrows: true,
        rows: 2,
        centerMode: false,
        responsive: [
        {
           breakpoint: 768,
           settings: {
               slidesToShow: 2,
               slidesToScroll: 1,
               rows: 2,
           }
        },
        {
        breakpoint: 1200,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
                rows: 2,
                }
        }
        ]
    });

    $('.thongtin-lienquan').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
        rows: 5,
        //responsive: [
        //{
        //    breakpoint: 768,
        //    settings: {
        //        slidesToShow: 2,
        //        slidesToScroll: 1,
        //        rows: 2,
        //    }
        //},
        //{
        //    breakpoint: 1200,
        //    settings: {
        //        slidesToShow: 3,
        //        slidesToScroll: 1,
        //        rows: 2,
        //    }
        //}
        //]
    });

    $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.slider-nav'
    });
    $('.slider-nav').slick({
        slidesToShow: 7,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: false,
        focusOnSelect: true,
        responsive: [
        {
            breakpoint: 768,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 1,
            }
        }
        ]
    });

    $('.camnhan-carousel').owlCarousel({
        loop: true,
        autoplaySpeed: 4000,
        margin: 30,
        nav: true,
        autoplay: true,
        autoplayTimeout: 2000,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1
            },
            481: {
                items: 1
            },
            769: {
                items: 2
            },
            1200: {
                items: 2
            },
        }
    });

    //$('.news-carousel').owlCarousel({
    //    loop: true,
    //    autoplaySpeed: 4000,
    //    margin: 30,
    //    nav: true,
    //    autoplay: true,
    //    autoplayTimeout: 2000,
    //    autoplayHoverPause: true,
    //    responsive: {
    //        0: {
    //            items: 1
    //        },
    //        481: {
    //            items: 1
    //        },
    //        769: {
    //            items: 2,
    //        },
    //        1200: {
    //            items: 3
    //        },
    //    }
    //});

    $('.menu .search .search-img').click(function () {
        $(this).next('.search-form').slideToggle(300);
    });

    /* accodion FAQ */
    /* accodion tin van */
    $(".tin-content").hide();
    // Áp dụng sự kiện click vào thẻ h3
    $(".tin-title").click(function () {
        // chọn .accordion (do phần tử đi đi ngay sau phần tử h3 nên ta dùng .next())
        $(".tin-title").removeClass('active');
        $accordion = $(this).next();
        // Kiểm tra nếu đang ẩn thì sẽ hiện và ẩn các phần tử khác
        // Nếu đang hiện thì click vào h3 sẽ ẩn
        if ($accordion.is(':hidden') === true) {
            $(".tin-content").slideUp();
            $accordion.slideDown();
            $(this).addClass('active');
        } else {
            $accordion.slideUp();
            $(".tin-title").removeClass('active');
        }
    });
    $('.list-question .item .cautraloi').hide();
    $('.list-question .item .traloi').click(function () {
        $(this).parent().find('.cautraloi').stop(true, false, true).slideToggle(300);
    });
}
$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('.scroll-to-top').fadeIn();
    } else {
        $('.scroll-to-top').fadeOut();
    }
});
$(window).scroll(function () {
    if ($(this).scrollTop() > 138) {
        $('.bot-head').addClass('bot-head-scroll');
    } else {
        $('.bot-head').removeClass('bot-head-scroll');
    }
});
$('.scroll-to-top').on('click', function (e) {
    e.preventDefault();
    $('html, body').animate({
        scrollTop: 0
    }, 800);
    return false;
});

function DoEqualSizer(myclass) {
    var heights = $(myclass).map(function () {
        $(this).height('auto');
        return $(this).height();
    }).get(),
     maxHeight = Math.max.apply(null, heights);
    $(myclass).height(maxHeight);
};

function EqualSizer_1(myclass) {
    $(document).ready(DoEqualSizer(myclass));
    window.addEventListener('resize', function () {
        DoEqualSizer(myclass);
    });
};

function EqualSizer(myclass) {
    $(document).ready(DoEqualSizer(myclass));
    window.addEventListener('resize', function () {
        DoEqualSizer(myclass);
    });
};

function mymap() {
    mympp();
    var timeout;
    $(window).resize(function () {
        clearTimeout(timeout);
        setTimeout(function () {
            mympp();
        }, 500);
    });
}

function mympp() {
    $('#mapwrap').remove();
    if ($(window).width() > 768) {
        $('#mapshow').append('<div id="mapwrap"><iframe id="iframe" src="map.aspx" frameborder="0" height="100%" width="100%"></iframe></div>');
    }
}

function menuDanhmuc() {
    $('.danh-muc > ul > li').has('ul').addClass('parent-li');
    $('.parent-li').append('<i class="fa fa-plus"></i>');
    $('.parent-li i').click(function () {
        $(this).prev('ul').stop(true, false, true).slideToggle(300);
    });
}

$('.chuyenkhoa-carousel .item:nth-of-type(2n)').addClass('item-even');
$('.chuyenkhoa-carousel .item:nth-of-type(2n+1)').addClass('item-odd');
$('.item-even').each(function () {
    n = $(this).children('.content');
    m = $(this).children('.img');
    n.insertAfter(m);
});


/** popup **/
$('.list-doingu .item').click(function () {
    $('#overlay-screen-active').remove();
    $('#main-content').append('<div id="overlay-screen-active">');
    $(this).find('.popup .popup-content').css('top', '30px');
});
$(document).on('click', '.doctors-team .owl-item', function () {
    $('#overlay-screen-active').remove();
    $('#main-content').append('<div id="overlay-screen-active">');
    var n = $(this).children('.item').attr('id');
    $('.team-of-doctors').find('.list-doingu').children('.popup[data-id="' + n + '"]').find('.popup-content').css('top', '30px');
});
$('.library-box > a').click(function () {
    $('#main-content').append('<div id="overlay-screen-active">');
    $(this).parent().find('.popup-1 .popup-content').css('top', '30px');
});
$('.dat-lich .container > p > a').click(function (e) {
    e.preventDefault();
    $('#main-content').append('<div id="overlay-screen-active">');
    $('.datlich-kham .popup-content').css('top', '30px');
});
$('.cauhoi-tt > a').click(function (e) {
    e.preventDefault();
    $('#main-content').append('<div id="overlay-screen-active">');
    $('.datcauhoi .popup-content').css('top', '30px');
});
$('.top-ques > a').click(function (e) {
    e.preventDefault();
    $('#main-content').append('<div id="overlay-screen-active">');
    $('.datcauhoi .popup-content').css('top', '30px');
});
$('.lich-right > a').click(function (e) {
    e.preventDefault();
    $('#main-content').append('<div id="overlay-screen-active">');
    $('.datcauhoi .popup-content').css('top', '30px');
});
$('.btn-camnhan > a').click(function (e) {
    e.preventDefault();
    $('#main-content').append('<div id="overlay-screen-active">');
    $('.vietcamnhan .popup-content').css('top', '30px');
});

$(document).on('click', ".close-modal, #overlay-screen-active", function () {
    $('.popup-content').css('top', '-250%');
    $('#overlay-screen-active').fadeOut();
    $('#overlay-screen-active').remove();
    return false;
});

function height_pop() {
    var n = $(window).height();
    $('.scroll-popup').each(function () {
        var x = $(this).children('.popup-content').height();
        if (x > n) {
            $(this).children('.popup-content').css('max-height', n - 50);
            //$(this).children('.popup-content').css('height', 'auto');
        }
        else {
            $(this).children('.popup-content').css('max-height', n - 50);
        }
    })
    //$('.popup-content').css('max-height', n - 50);
}
zindex_navtab();
function zindex_navtab() {
    var len_li = $('.nav-tabs li').length;
    //console.log(len_li);
    for (var x = 1; x <= len_li; x++) {
        $('.nav-tabs li:nth-of-type(' + x + ')').css('z-index', ((len_li + 1) - x));
    }
}