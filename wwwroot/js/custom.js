/* ========================================================================= */
/*	Preloader
/* ========================================================================= */



$(document).ready(function(){


   
	
	/* ========================================================================= */
	/*	Fix Slider Height
	/* ========================================================================= */	

	var slideHeight = $(window).height();
	
	$('#slider, .carousel.slide, .carousel-inner, .carousel-inner .item').css('height',slideHeight);

	$(window).resize(function(){'use strict',
		$('#slider, .carousel.slide, .carousel-inner, .carousel-inner .item').css('height',slideHeight);
	});
	
	

	
	/* ========================================================================= */
	/*	Back to Top
	/* ========================================================================= */
	
	
    $(window).scroll(function () {
        if ($(window).scrollTop() > 400) {
            $("#back-top").fadeIn(200)
        } else {
            $("#back-top").fadeOut(200)
        }
    });
    $("#back-top").click(function () {
        $("html, body").stop().animate({
            scrollTop: 0
        }, 1500, "easeInOutExpo")
    });
	
});


// ==========  START GOOGLE MAP ========== //
//function initialize() {
//    var myLatLng = new google.maps.LatLng(22.402789, 91.822156);

//    var mapOptions = {
//        zoom: 14,
//        center: myLatLng,
//        disableDefaultUI: true,
//        scrollwheel: false,
//        navigationControl: false,
//        mapTypeControl: false,
//        scaleControl: false,
//        draggable: false,
//        mapTypeControlOptions: {
//            mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'roadatlas']
//        }
//    };

//    var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);


//    var marker = new google.maps.Marker({
//        position: myLatLng,
//        map: map,
//        icon: 'img/location-icon.png',
//        title: '',
//    });

//}

//google.maps.event.addDomListener(window, "load", initialize);
// ========== END GOOGLE MAP ========== //