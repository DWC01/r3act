$(document).ready(function(){
  
  var toggle = function() {
    $('.page-menu').toggleClass('show-page-menu');
    $('.page-content-wrap').toggleClass('page-menu-content-push');
    $('.page-menu-i').toggleClass('show-page-menu-i');
  }

  $('.page-menu-toggle').on( "click", function() {
    toggle();
  });

});