
(function($) {
    "use strict"; // Start of use strict

    // Smooth scrolling using jQuery easing
    $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function() {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html, body').animate({
                    scrollTop: (target.offset().top - 57)
                }, 1000, "easeInOutExpo");
                return false;
            }
        }
    });

    // Closes responsive menu when a scroll trigger link is clicked
    $('.js-scroll-trigger').click(function() {
        $('.navbar-collapse').collapse('hide');
    });

    // Activate scrollspy to add active class to navbar items on scroll
    /*$('body').scrollspy({
      target: '#mainNav',
      offset: 57
    });*/

    // Collapse Navbar
    var navbarCollapse = function() {
        if ($("#mainNav").offset().top > 20) {
            $("#mainNav").addClass("navbar-shrink");
        } else {
            $("#mainNav").removeClass("navbar-shrink");
        }
    };
    // Collapse now if page is not at top
    navbarCollapse();
    // Collapse the navbar when page is scrolled
    $(window).scroll(navbarCollapse);

    // Scroll reveal calls
    window.sr = ScrollReveal();
    sr.reveal('.sr-icons', {
        duration: 600,
        scale: 0.3,
        distance: '0px'
    }, 200);
    sr.reveal('.how-works-img img', {
        duration: 1000,
        delay: 200
    });
    sr.reveal('.goal-image', {
        duration: 600,
        scale: 0.3,
        distance: '0px'
    }, 300);

    $(".for-everyone-blocks").each(function(){
        var activeClass = 'hfeb-active';
        var $phoneImg = $('.phone-img-content',this);
        var original_block = $(".home-for-everyone-block." + activeClass,this);
        var original_image = original_block.attr('alt-img');
    
        $('[alt-img]',this).each(function(){
          $('<img/>')[0].src = $(this).attr('alt-img');
        });
    
        $(".home-for-everyone-block",this).hover(function() {
            original_block.removeClass(activeClass)
            var $this = $(this);
            $phoneImg.css("background-image", "url('" + $this.attr('alt-img') + "')");
        }, function() {
            original_block.addClass(activeClass);
            $phoneImg.css("background-image", "url('" + original_image + "')");
        });
    
    });

    $(".for-everyone-blocks-extra").each(function(){
        var activeClass = 'hfeb-active';
        var $phoneImg = $('.phone-img-content',this);
        var original_image = $phoneImg.attr('alt-img');
    
        $('[alt-img]',this).each(function(){
          $('<img/>')[0].src = $(this).attr('alt-img');
        });
    
        $(".home-for-everyone-block",this).hover(function() {
            var $this = $(this);
            $phoneImg.css("background-image", "url('" + $this.attr('alt-img') + "')");
        }, function() {
            var $this = $(this);
            $this.removeClass(activeClass);
            $phoneImg.css("background-image", "url('" + original_image + "')");
        });
    
    });



    $('.rutg-accordion').collapse({
        toggle: false
    });

    $(".faq-sidebar-navigation ul li a").click(function(e) {
        e.preventDefault();
        var activeFaq = $(".faq-sidebar-navigation ul li.active a");
        var id = activeFaq.attr('href');
        var dest = $(this).attr('href');
        activeFaq.parent().removeClass('active');
        $(this).parent().addClass('active');
        $(id).removeClass('active');
        $(dest).addClass('active');
        return false;
    });

    var iframes = [];
    var players = [];

    // Magnific popup calls
    var pops = $('.head-play-button').magnificPopup({
        tLoading: 'Loading image #%curr%...',
        mainClass: 'mfp-img-mobile',
        disableOn: 0,
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: true,
        fixedContentPos: false,
        callbacks: {
            open: function(e) {
              //window.autoplay = $('iframe',this.container).get(0);
              //window.fire_autoplay(window.autoplay);
            },
        },
        iframe: {
            patterns: {
                youtube: {
                    index: 'youtube.com/', // String that detects type of video (in this case YouTube). Simply via url.indexOf(index).
                    id: 'v=',
                    src: '///www.youtube.com/embed/%id%?rel=0&amp;showinfo=0' // URL that will be set as a source for iframe.
                }
            }
        }
    });

    pops.each(function(e){
        if($(this).hasClass('video-autoplay')){
            $(this).magnificPopup('open');
        }
    });

    var md = new MobileDetect(navigator.appVersion);

    $('.text-me-form').submit(function(e){
        e.preventDefault();

        var input = $('.text-me-input', this);
        var button = $('button', this);
        var phone = input.eq(0).val();

        if(phone.length < 12){
            button.addClass("error");
            setTimeout(function(){
                button.removeClass("error");
            },500);
            return false;
        }

        input.prop("disabled", true);
        button.prop("disabled", true);

        button.addClass("onclic");
        var linkData = {
            tags: [],
            channel: 'Website',
            feature: 'TextMeTheApp',
            data: {}
        };
        var options = {};
        var callback = function (err, result) {
            button.removeClass("onclic");
    
            if (err) {
                button.addClass("error");                
            } else {
                input.val('');
                button.addClass("validate")
            }
            setTimeout(function(){
                button.removeClass([
                    "validate",
                    "error"
                ]);
                input.prop("disabled", false);
                button.prop("disabled", false);
            },2500);
        };
        branch.sendSMS(phone, linkData, options, callback);
        
        return false;
    })

    $('.cta-nobranch').hide();
    if(md.mobile() === null){
        $('.cta-branch-mobile').addClass('d-none');
        $('.cta-branch-desktop').removeClass('d-none');
    }else{
        $('.cta-branch-mobile').removeClass('d-none');
        $('.cta-branch-desktop').addClass('d-none');
    }

    var cleave = [];

    $('.text-me-form').each(function(index){
        cleave.push(
            new Cleave($('.text-me-input',this).get(0), {
                phone: true,
                phoneRegionCode: 'CA',
                delimiter: '-',
                delimiterLazyShow: true
            })
        )
    });


})(jQuery); // End of use strict
