function setHeader() {
  var y = $(this).scrollTop();
  if (y <= 350) {
    $("#header").css("background", "rgba(56,56,56,"+y/350+")");
    $("#header").css("box-shadow", "none");
  }
  else {
    $("#header").css("background", "rgba(56,56,56,1)");
    $("#header").css("box-shadow", "0px 4px 10px rgba( 100, 100, 100, 0.5)");
  }
}
function headerTransform() {
  $("#header").css("background", "rgba(56,56,56,0)");
  $("#header").css("box-shadow", "none");
  $(document).scroll(function() {
    setHeader();
  });

}

$(document).ready(function() {
  // Header for index
  $("#header").hover(
    function() {
      $("#header").css("background", "rgba(56,56,56,1)");
    }, function(){
      setHeader();
    }
  );

  headerTransform();

});
