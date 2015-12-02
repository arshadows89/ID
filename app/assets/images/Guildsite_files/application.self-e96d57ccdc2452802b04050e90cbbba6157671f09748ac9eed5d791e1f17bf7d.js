// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//









$(document).ready(function() {
	$(".various").fancybox({
		type		: "iframe",
		padding     : 0,
		maxWidth	: 800,
		maxHeight	: 600,
		fitToView	: false,
		width		: '70%',
		height		: '70%',
		autoSize	: false,
		closeClick	: false,
		helpers : { 
            overlay : {
                closeClick: false
            }
        },
        iframe : {
        	preload: false
    	},
		openEffect	: 'none',
		closeEffect	: 'none',
		closeBtn	: false
	});

	$( ".closefb" ).click(function() {
	  parent.$.fancybox.close();
	});

	// alert(document.getElementsByClassName("fancybox-iframe")[0].contentWindow.location.href);

	// $( "#signupformbut" ).click(function() {
	// 	if (document.getElementsByClassName("fancybox-iframe")[0].contentWindow.location.href === "http://localhost:3000/") {
	// 		parent.$.fancybox.close();
	// 	};
	// });

	// $('.fancybox-iframe').contents().find("#signupformbut").click(function() {
	// 	if (document.getElementsByClassName("fancybox-iframe")[0].contentWindow.location.href === "http://localhost:3000/") {
	// 		parent.$.fancybox.close();
	// 	};
	// });

	// $('.fancybox-iframe').contents().find('#signupformbut').click(function() {
	// 	if ($('.fancybox-iframe').contents().find('#login').length > 0) {
	// 		parent.$.fancybox.close();
	// 	};
	// });




});

// function formSubmitFunction() {
// 	// alert('test')
// 		// if (document.getElementsByClassName("fancybox-iframe")[0].contentWindow.location.href === "http://localhost:3000/") {
// 			parent.$.fancybox.close();
// 		// };
// }

	// $('.fancybox-iframe').contents().find('#signupformbut').click(function() {
	// 	if ($('.fancybox-iframe').contents().find('#login').length > 0) {
	// 		parent.$.fancybox.close();
	// 	};
	// });

// $('.fancybox-iframe').load(function(){
//   $(this).contents().find("#signupformbut").on('click', function(event) { alert('test'); });
// });

// 		$('.fancybox-iframe').contents().find("#signupformbut").click(function() {
// alert(document.getElementsByClassName("fancybox-iframe")[0].contentWindow.location.href)
// 	});

	// $('.fancybox-iframe').load(function(){
	// 	$(this).contents().find("#signupformbut").on('click', function(event) { alert('test'); });
	// });











// when button is click if iframe location = that then clock window?



// document.addEventListener('DOMContentLoaded', function() {
	// if ($('.fancybox-iframe').contents().find('#login') {
	// 	alert("hey")
	// });
// });
// alert(document.getElementsByClassName("fancybox-iframe")[0].contentWindow.location.href)

// var closefancybox = parent.$.fancybox.close();






