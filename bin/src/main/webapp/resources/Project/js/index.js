(function ($) {
   
    // Ripple-effect animation
    $(".ripple-effect").click(function (e) {
        var rippler = $(this);

      	rippler.append("<span class='ink'></span>");

        var ink = rippler.find(".ink:last-child");
        // prevent quick double clicks
        ink.removeClass("animate");

        // set .ink diametr
        if (!ink.height() && !ink.width()) {
            var d = Math.max(rippler.outerWidth(), rippler.outerHeight());
            ink.css({
                height: d,
                width: d
            });
        }

        // get click coordinates
        var x = e.pageX - rippler.offset().left - ink.width() / 2;
        var y = e.pageY - rippler.offset().top - ink.height() / 2;

        // set .ink position and add class .animate
        ink.css({
            top: y + 'px',
            left: x + 'px'
        }).addClass("animate");
        
        // remove ink after 1second from parent container
        setTimeout(function(){
        	ink.remove();
        },1000)
    })



// Ripple-effect-All animation (Hiệu ứng gợn sóng button)
    function fullRipper(color,time){
       setTimeout(function() {
            var rippler = $(".ripple-effect-All");
            if(rippler.find(".ink-All").length == 0){
                rippler.append("<span class='ink-All'></span>");
                

                var ink = rippler.find(".ink-All");
                // prevent quick double clicks
                //ink.removeClass("animate");

                // set .ink diametr
                if (!ink.height() && !ink.width()) {
                    var d = Math.max(rippler.outerWidth(), rippler.outerHeight());
                    ink.css({
                        height: d,
                        width: d
                    });
                }

                // get click coordinates
                var x =0;
                var y =rippler.offset().top - ink.height()/1.5;

                // set .ink position and add class .animate
                ink.css({
                    top: y + 'px',
                    left: x + 'px',
                    background:color
                }).addClass("animate");

                rippler.css('z-index',2);

                setTimeout(function(){
                    ink.css({
                        '-webkit-transform': 'scale(2.5)',
                        '-moz-transform': 'scale(2.5)',
                        '-ms-transform': 'scale(2.5)',
                        '-o-transform': 'scale(2.5)',
                        'transform': 'scale(2.5)'
                    })
                    rippler.css('z-index',0);
                },1500);
            }
       },time)
        
    }

    // Form control border-bottom line (Line màu xanh)
    $('.blmd-line .form-control').bind('focus',function(){
        $(this).parent('.blmd-line').addClass('blmd-toggled').removeClass("hf");
    }).bind('blur',function(){
        var val=$(this).val();
        if(val){
            $(this).parent('.blmd-line').addClass("hf");
        } else {
            $(this).parent('.blmd-line').removeClass('blmd-toggled');
        }
    })
})(jQuery);

// Validate form access
$(document).ready(() => {
    $("button").click((e) => {
        e.preventDefault(); // Prevent the default event

        var name = $("#username").val();
        var password = $("#password").val();
        if (name == "" || name == null) {
            alert('Missing user!');
            var flag1 = ("false");
        }
        else {
            var flag1 = ("true");
        };
        if (password == "" || password == null) {
            alert('Missing password');
            var flag2 = ("false");
        }
        else if (password.length < 8) {
            alert('Password is too short, please input at least 8 characters!');
            var flag2 = ("false");
        }
        else {
            var flag2 = ("true");
        };
        if (flag1 == "true") {
            if (flag2 == "true") {
                

                $('#login-form').submit();
            }
            else {
                location.href = '#';
            };
        }
        else {
        };
    });
});
