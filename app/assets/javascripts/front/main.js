function setBodyHeight(){
  var height = $(window).height();
  $("#main-body").css("min-height", height - 76);
}

$(document).ready(function() {
  setBodyHeight();

  $(window).resize(function() {
    setBodyHeight();
  });

});
