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
  var top_pos = $("#header").offset();
  $(".header-wide-sub-container").css("top", top_pos.top + $("#header").height() + 20);
  var left_pos = $("#page-userzone").offset();
  $(".header-wide-sub-container").css("left", left_pos.left -15);
}

$(document).ready(function() {

  $(window).resize(function() {
    set_wide_submenu_position();
  });

  if ($("#page-userzone").is(":visible")) {

    set_wide_submenu_position();
    $("#page-userzone").on('click', function(e){
      e.preventDefault();
      if ($(".header-wide-sub-container").is(":visible")) {
        $(".header-wide-sub-container").slideUp("slow");
      }
      else {
        $(".header-wide-sub-container").slideDown("slow");
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
