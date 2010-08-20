// Some globals
var RED = "red";
var GREEN = "lightgreen";
var YELLOW = "yellow";
var BLUE = "lightblue";


function $ (elem) {
	return document.getElementById(elem);
}


var checkMultipleChoice = function() {
    var mcRightSolutions = $("multiple_choice_sol").getElementsByTagName("span");
    var mcAnswers = $("multiple_choice").getElementsByTagName("input");
    var solvedCorrect = true;

    for (var i = 0; i < mcAnswers.length; i++) {
        var check = mcAnswers[i];
        var shouldBeChecked = checkForName(check.name, mcRightSolutions);
        if (shouldBeChecked && check.checked) {
            check.parentNode.style.backgroundColor = GREEN;
        }
        else if (!shouldBeChecked && !check.checked) {
            check.parentNode.style.backgroundColor = GREEN;
        }
        else {
            check.parentNode.style.backgroundColor = RED;
            solvedCorrect = false;
        };
    };

    return solvedCorrect;
};

var checkForName = function(name, array) {
    for (var i = 0; i < array.length; i++) {
        if (name === array[i].innerHTML) {
            return true;
        };
    };
    return false;
};

var checkSingleChoice = function() {
	var scRightSolutins = $("single_choice_sol").getElementsByTagName("span");
	var scAnswers = $("single_choice").getElementsByTagName("input");
	var solvedCorrect = true;
	
	for (var i=0; i<scAnswers.length; i++) {
		var radio = scAnswers[i];
		var shouldBeSelected = checkForName(radio.id, scRightSolutins);
		
		if (shouldBeSelected && radio.checked) {
			radio.parentNode.style.backgroundColor = GREEN;
		}
		else if (!shouldBeSelected && !radio.checked) {
			radio.parentNode.style.backgroundColor = GREEN;
		}
		else {
			radio.parentNode.style.backgroundColor = RED;
			solvedCorrect = false;
		};
	};
	return solvedCorrect;
};

var initMarktext = function() {
	var allSpans = $("marktext").getElementsByTagName("span");
	for (var i=0; i < allSpans.length; i++) {
		allSpans[i].onclick = function() {
			if (this.style.backgroundColor === YELLOW) {
				this.style.backgroundColor = "";
			}
			else {
				this.style.backgroundColor = YELLOW;
			};
		};
	};
};

var checkMarktext = function() {
	var markTextSpans = $("marktext").getElementsByTagName("span");
	var solvedCorrect = true;
	
	for (var i=0; i < markTextSpans.length; i++) {
		var span = markTextSpans[i];
		var shouldBeMarked = (span.getAttribute("class") === "mark") ? true : false;
		
		if (shouldBeMarked && span.style.backgroundColor === YELLOW) {
			span.style.backgroundColor = GREEN;
		}
		else if (!shouldBeMarked && span.style.backgroundColor === YELLOW) {
			span.style.backgroundColor = RED;
			solvedCorrect = false;
		}
		else if (shouldBeMarked && !span.style.backgroundColor) {
			span.style.backgroundColor = BLUE;
			solvedCorrect = false;
		};
	};
	
	return solvedCorrect;
};

var checkGapQuestion = function() {
	var gapInputs = $("gapquestion").getElementsByTagName("input");
	var correctAnswers = $("gapquestion_sol").children;
	var solvedCorrect = true;
	
	for (var i=0; i < gapInputs.length; i++) {
		var gap = gapInputs[i];
		var solutonForGap = $(gap.name).innerHTML;
		
		if (gap.value == solutonForGap) {
			gap.style.backgroundColor = GREEN;
		}
		else {
			gap.style.backgroundColor = RED;
			gap.value = solutonForGap;
			solvedCorrect = false;
		};
	};
	
	return solvedCorrect;
};

var checkDropdown = function() {
	var selects = $("dropdown").getElementsByTagName("select");
	var solvedCorrect = true;
	
	for (var i=0; i < selects.length; i++) {
		var currentSelect = selects[i];
		var selectedIndex = currentSelect.selectedIndex;
		var rightOptionIndex = findRightOptionIndex(currentSelect.options);
		
		if (selectedIndex === rightOptionIndex) {
			currentSelect.style.backgroundColor = GREEN;
		}
		else {
			currentSelect.style.backgroundColor = RED;
			currentSelect.selectedIndex = rightOptionIndex;
			solvedCorrect = false;
		};
	};
	
	return solvedCorrect;
};

var findRightOptionIndex = function(options) {
	for (var i=0; i < options.length; i++) {
		if(options[i].getAttribute("class") === "correct_option") {
			return options[i].index;
		}
	};
	
	return -1;
};

var checkCorrelation = function() {
	var selects = $("correlation").getElementsByTagName("select");
	var solvedCorrect = true;
	
	for (var i=0; i < selects.length; i++) {
		var select = selects[i];
		var selectedIndex = select.selectedIndex;
		var indexOfRightOption = findRightOptionIndex(select.options);
		
		if (selectedIndex === indexOfRightOption) {
			select.style.backgroundColor = GREEN;
		}
		else {
			select.style.backgroundColor = RED;
			select.selectedIndex = indexOfRightOption;
			solvedCorrect = false;
		};
	};
	
	return solvedCorrect;
};