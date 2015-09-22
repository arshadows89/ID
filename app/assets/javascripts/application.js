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
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require fancybox
//= require turbolinks
//= require_tree .


$(document).ready(function() {
	$(".various").fancybox({
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

});


