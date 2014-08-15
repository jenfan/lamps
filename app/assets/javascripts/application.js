// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require fancybox
//= require galleria-1.3.6.min
//= require galleria.classic.min
//= require_tree .

$(document).ready(function(){
    $(window).resize(function(){
	    $('#center').css({
            top: ($(window).height() - $('#center').outerHeight())/2 +50
            });
            $('#logo').css({
            top: ($(window).height() - $('#center').outerHeight())/2 -30
            });
            $('#galleria').css({
            height: $(window).height() - 70,
            width: $(window).width()-100
            });
        }); // $(window).resize END

    $(window).resize();
});    //____ $(document).ready END____

$(document).ready(function() {
  $('ul.sc_menu').css("width", ($('ul.sc_menu li').length-1)*$('li').eq(1).width()+28+'px' );
  lenta();
  $('#contact_nav').click(function() {
    $('div#contact').fadeIn();
    $('ul.sc_menu').fadeOut();
    $('#galleria').fadeOut();
  });
  $('#home_nav').click(function(){
    $('ul.sc_menu').fadeIn();
    $('div#contact').fadeOut();
    $('#galleria').fadeOut();
  });
  $('#gallery_nav').click(function(){
    $('ul.sc_menu').fadeOut();
    $('div#contact').fadeOut();
    $('#galleria').fadeIn();
  });
  $('li').hover(function(){
    $(this).find('span').css("display","block")
  }, function() {
    $(this).find('span').css("display","none")
  });
  Galleria.loadTheme('galleria.classic.min.js');
  Galleria.run('#galleria', {
      // thumbnails: 'lazy',
      fullscreenDoubleTap: true,
  });
  Galleria.ready(function(options) {

      // this = the gallery instance
      // options = the gallery options
      // this.lazyLoadChunks( 10,1000 );
  });
});

