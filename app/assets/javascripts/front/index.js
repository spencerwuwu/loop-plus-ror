function headerTransform() {
  $(document).scroll(function() {
    var y = $(this).scrollTop();
    if (y <= 350) {
      $("#header").css("background", "rgba(90,90,90,"+y/350+")");
      $("#header").css("box-shadow", "none");
    }
    else {
      $("#header").css("background", "rgba(90,90,90,1)");
      $("#header").css("box-shadow", "0px 4px 10px rgba( 100, 100, 100, 0.5)");
    }
  });

}

$(document).on('turbolinks:load', function() {

  // Header for index
  if ($(".index-slide-container").is(':visible')) {
    var y = $(this).scrollTop();
    if (y <= 350) {
      $("#header").css("background", "rgba(90,90,90,0)");
      $("#header").css("box-shadow", "none");
    }
    headerTransform();
  }


});
