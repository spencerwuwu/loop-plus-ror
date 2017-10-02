function narrow_visible_click() {
  $(".header-narrow-close").css("display", "none");
  $(".header-narrow-on").fadeIn();
  $("#menublack").fadeOut();
  $(".header-narrow-navbar").slideUp('slow');
}

function narrow_hidden_click() {
  $(".header-narrow-on").css("display", "none");
  $(".header-narrow-close").fadeIn();
  $("#menublack").fadeIn();
  $(".header-narrow-navbar").slideDown('slow');
}

function set_wide_submenu_position() {
  $(".header-wide-sub-container").css("top", $("#header").height() + 20);
  var left_pos = $("#page-userzone").offset();
  $(".header-wide-sub-container").css("left", left_pos.left );
}

$(document).ready(function() {

  $(window).resize(function() {
    set_wide_submenu_position();
  });

  if ($("#page-userzone").is(":visible")) {

    set_wide_submenu_position();
    $("#page-userzone").hover( function(e){
      e.preventDefault();
      $(".header-wide-sub-container").fadeIn();
    });

    $(".header-wide-sub-container").hover( function(e){
      e.preventDefault();
    }, function(e) {
      e.preventDefault();
      $(".header-wide-sub-container").fadeOut();
      var yy = $(this).scrollTop();
      if (yy <= 350) {
        $("#header").css("background", "rgba(56,56,56,"+yy/350+")");
        $("#header").css("box-shadow", "none");
      }

    });
  }

  $(".header-narrow-on").on('click', function(e){
    e.preventDefault();
    if ($(".header-narrow-navbar").is(":hidden")) {
      narrow_hidden_click()
    }
  });
  $(".header-narrow-close").on('click', function(e){
    e.preventDefault();
    if ($(".header-narrow-navbar").is(":visible")) {
      narrow_visible_click()
    }
  });
  $("#menublack").on('click', function(e){
    e.preventDefault();
    narrow_visible_click()
  });


  $("#narrow-menu-control").on('click', function(e){
    e.preventDefault();
    if ($(".navbar-sub-container").is(":visible")) {
      $(".navbar-sub-container").slideUp("slow");
    }
    else {
      $(".navbar-sub-container").slideDown("slow");
    }
  });

});
