$(document).ready(function() {
  var fileInput = document.querySelector(".pic-input-container");
  //console.log(fileInput.querySelector(".target"));
  fileInput.querySelector(".target").addEventListener( "change", function( event ) {  
    var parts = this.value.split("\\");
    var result = parts[parts.length - 1];
    fileInput.querySelector(".return").innerHTML = result;  
  });


});

