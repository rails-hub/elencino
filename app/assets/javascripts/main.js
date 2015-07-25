$(".toggle-menu").on("click",function(){
	$("#wrapper").toggleClass('open');
});


// Scroll to functionality
$(function() {
  $('a[href*=#]:not([href=#])').click(function() {
  	// if( $(this).closest('ul').hasClass('noscroll') ){ return; }
  	// if( $(this).closest('.panel-group').hasClass('noscroll') ){ return; }
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').stop().animate({ scrollTop: target.offset().top }
            , 700 
            , 'easeInOutExpo' 
        );
        return false;
      }
    }
  });
});