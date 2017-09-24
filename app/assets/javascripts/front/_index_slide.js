function goDotDotDot() {
  $(".readMore").dotdotdot();
}

// Setting Vars
var sqssSlidePlayInterval = 6180;
var sqssSlidePlayIntervalTouched = 6180;
var sqssTouchRange = 50;

// Init Vars
var sqssSlideShowObj = [];
var sqssTouchStartPosX;
var sqssTouchStartPosY;
var sqssTouchMovedPosX;
var sqssTouchMovedPosY;
var sqssTouchTouchedObj;
var sqssTouchTouchedObjId;
var sqssTouchInTouch = false;
var sqssNaviUA = navigator.userAgent.toLowerCase();
var sqssClientIsAndroid = sqssNaviUA.indexOf("android") > -1;

///// SHALL WE BEGIN ////////////////////
$(document).on('turbolinks:load', function() {
	SQSSInitSlideShow();
});
function SQSSInitSlideShow() {
	for (var i = 0, j = $(".slideBlock").length; i < j; i++) {
		sqssSlideShowObj[i] = new Array();
		sqssSlideShowObj[i][0] = $(".slideBlock")[i];
		sqssSlideShowObj[i][1] = $($(".slideBlock")[i]).find(".slideFrame").length;
		sqssSlideShowObj[i][2] = 1;
		SQSSRefreshSlidePosition(i);
	}
	SQSSAddTouchEventListener();
	SQSSAddMouseOverListener();
	SQSSMakePoint();
	setTimeout(function(){
		for (var i = 0, j = $(".slideBlock").length; i < j; i++) {
			SQSSInitSlideEffectClass(i);
			sqssSlideShowObj[i][3] = setInterval('SQSSNextSlide(' + i + ')', sqssSlidePlayInterval);
			sqssSlideShowObj[i][4] = true;
		}
	}, 49);
}

function SQSSMakePoint() {
	for (var i = 0, j = sqssSlideShowObj.length; i < j; i++) {
		for (var x = 0; x < sqssSlideShowObj[i][1]; x++) {
			if (x == 0) {
				$(sqssSlideShowObj[i][0]).find(".slidePoint").append('<div class="point here" onclick="SQSSToSlide('+ i + ',' + (x + 1) +')"></div>');
			} else {
				$(sqssSlideShowObj[i][0]).find(".slidePoint").append('<div class="point" onclick="SQSSToSlide('+ i + ',' + (x + 1) +')"></div>');
			}
		}
	}
}

///// SLIDE EFFECT ////////////////////
function SQSSInitSlideEffectClass(whichObj) {
	SQSSAddSlideEffectClass(whichObj);
}
function SQSSAddSlideEffectClass(whichObj) {
	for (i = 1; i <= sqssSlideShowObj[whichObj][1]; i++) {
		$(sqssSlideShowObj[whichObj][0]).find(".slideFrame:nth-child(" + i + ")").addClass("slideEffect");
	}
}
function SQSSRemoveSlideEffectClass(whichObj) {
	for (i = 1; i <= sqssSlideShowObj[whichObj][1]; i++) {
		$(sqssSlideShowObj[whichObj][0]).find(".slideFrame:nth-child(" + i + ")").removeClass("slideEffect");
	}
}
///// MOUSE OVER EVENTS ///////////////
function SQSSAddMouseOverListener() {
	for (var i = 0, j = $(".slideBlock").length; i < j; i++) {
		sqssSlideShowObj[i][0].addEventListener("mouseover", SQSSMouseOverHandler);
		sqssSlideShowObj[i][0].addEventListener("mouseout", SQSSMouseOutHandler);
	}
}
function SQSSMouseOverHandler(eventObj) {
	for (var i = 0, j = $(".slideBlock").length; i < j; i++) {
		if (this == sqssSlideShowObj[i][0] && sqssSlideShowObj[i][4] == true) {
			clearInterval(sqssSlideShowObj[i][3]);
			sqssSlideShowObj[i][4] = false;
		}
	}
}
function SQSSMouseOutHandler(eventObj) {
	for (var i = 0, j = $(".slideBlock").length; i < j; i++) {
		if (this == sqssSlideShowObj[i][0] && sqssSlideShowObj[i][4] == false) {
			SQSSResetInterval(i);
		}
	}
}
///// TOUCH EVENTS ////////////////////
function SQSSAddTouchEventListener() {
	for (var i = 0, j = $(".slideBlock").length; i < j; i++) {
		sqssSlideShowObj[i][0].addEventListener("touchstart", SQSSTouchStartEventHandler);
		sqssSlideShowObj[i][0].addEventListener("touchmove", SQSSTouchMoveEventHandler);
		sqssSlideShowObj[i][0].addEventListener("touchend", SQSSTouchEndEventHandler);
	}
}
function SQSSTouchStartEventHandler(eventObj) {
	sqssTouchStartPosX = eventObj.touches[0].pageX;
	sqssTouchStartPosY = eventObj.touches[0].pageY;
	for (var i = 0, j = $(".slideBlock").length; i < j; i++) {
		if (this == sqssSlideShowObj[i][0]) {
			sqssTouchTouchedObj = this;
			sqssTouchTouchedObjId = i;
			SQSSRemoveSlideEffectClass(i);
			clearInterval(sqssSlideShowObj[i][3]);
		}
	}
}
function SQSSTouchMoveEventHandler(eventObj) {
	if (sqssTouchInTouch || sqssClientIsAndroid) {
		eventObj.preventDefault();
	}
	sqssTouchMovedPosX = eventObj.touches[0].pageX;
	sqssTouchMovedPosY = eventObj.touches[0].pageY;
	slidePosPercentageDrag = Math.ceil(((sqssTouchMovedPosX - sqssTouchStartPosX) / $(window).width()) * 100);
	if (Math.abs(slidePosPercentageDrag) >= 5) {
		sqssTouchInTouch = true;
		for (i = 1; i <= sqssSlideShowObj[sqssTouchTouchedObjId][1]; i++) {
			slidePosPercentage = (i - sqssSlideShowObj[sqssTouchTouchedObjId][2]) * 100 + slidePosPercentageDrag;
			$(sqssSlideShowObj[sqssTouchTouchedObjId][0]).find(".slideFrame:nth-child(" + i + ")").css("left", slidePosPercentage + "%");
		}
	}
	if (sqssClientIsAndroid) {
		window.scrollBy(0, (sqssTouchStartPosY - sqssTouchMovedPosY));
	}
}
function SQSSTouchEndEventHandler(eventObj) {
	if ((sqssTouchMovedPosX - sqssTouchRange) > sqssTouchStartPosX) {
		SQSSPrevSlideTouch(sqssTouchTouchedObjId);
	} else if (sqssTouchMovedPosX < (sqssTouchStartPosX - sqssTouchRange)) {
		SQSSNextSlideTouch(sqssTouchTouchedObjId);
	} else {
		SQSSRefreshSlidePosition(sqssTouchTouchedObjId);
	}
	SQSSResetInterval(sqssTouchTouchedObjId);
	SQSSAddSlideEffectClass(sqssTouchTouchedObjId);
	sqssTouchInTouch = false;
}
function SQSSPrevSlideTouch(whichObj) {
	sqssSlideShowObj[whichObj][2] -= 1;
	if (sqssSlideShowObj[whichObj][2] <= 0) {
		sqssSlideShowObj[whichObj][2] = 1;
	}
	SQSSChangePoint(whichObj);
	SQSSRefreshSlidePosition(whichObj);
}
function SQSSNextSlideTouch(whichObj) {
	if (sqssSlideShowObj[whichObj][2] < sqssSlideShowObj[whichObj][1]) {
		sqssSlideShowObj[whichObj][2] += 1;
	} else {
		sqssSlideShowObj[whichObj][2] = sqssSlideShowObj[whichObj][1];
	}
	SQSSChangePoint(whichObj);
	SQSSRefreshSlidePosition(whichObj);
}


///// CHANGE IS GOOD ////////////////////
function SQSSChangePoint(whichObj) {
	$(sqssSlideShowObj[whichObj][0]).find(".point").removeClass("here");
	$(sqssSlideShowObj[whichObj][0]).find(".point:nth-child(" + sqssSlideShowObj[whichObj][2] + ")").addClass("here");
}

function SQSSNextSlide(whichObj) {
	clearInterval(sqssSlideShowObj[whichObj][3]);
	if (sqssSlideShowObj[whichObj][2] < sqssSlideShowObj[whichObj][1]) {
		sqssSlideShowObj[whichObj][2] += 1;
	} else {
		sqssSlideShowObj[whichObj][2] = 1;
	}
	SQSSChangePoint(whichObj);
	SQSSRefreshSlidePosition(whichObj);
	SQSSResetInterval(whichObj);
}
function SQSSToSlide(whichObj, toWhich) {
	clearInterval(sqssSlideShowObj[whichObj][3]);
	sqssSlideShowObj[whichObj][2] = toWhich;
	SQSSChangePoint(whichObj);
	SQSSRefreshSlidePosition(whichObj);
	SQSSResetInterval(whichObj);
}
function SQSSRefreshSlidePosition(whichObj) {
	for (i = 1; i <= sqssSlideShowObj[whichObj][1]; i++) {
		slidePosPercentage = (i - sqssSlideShowObj[whichObj][2]) * 100;
		$(sqssSlideShowObj[whichObj][0]).find(".slideFrame:nth-child(" + i + ")").css("left", slidePosPercentage + "%");
	}
}
function SQSSResetInterval(whichObj) {
	clearInterval(sqssSlideShowObj[whichObj][3]);
	sqssSlideShowObj[whichObj][3] = setInterval('SQSSNextSlide(' + whichObj + ')', sqssSlidePlayInterval);
	sqssSlideShowObj[whichObj][4] = true;
}

function setHeight(){
	var width = $(window).width();
  if (width >= 789)
    $(".index-slide-container").css("height", width /2.2);
  else 
    $(".index-slide-container").css("height", width *4/3);
}


$(document).ready(function() {
  goDotDotDot();

  setHeight();

  $(window).resize(function() {
    goDotDotDot();
    setHeight();
  });
});

