function setBodyHeight(){
  var height = $(window).height();
  $("#main-body").css("min-height", height - 76);
}

$(document).on('turbolinks:load', function() {
  setBodyHeight();

  $(window).resize(function() {
    setBodyHeight();
  });

});
