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

$(document).ready(function() {
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
