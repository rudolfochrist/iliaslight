// Some globals
var RED = "red";
var GREEN = "lightgreen";
var YELLOW = "yellow";
var BLUE = "lightblue";


function $ (elem) {
	return document.getElementById(elem);
}

function getElementsByClassName (className) {
	var result = [];
	var allElements = document.getElementsByTagName("*");
	
	for (var i = 0; i < allElements.length; i++) {
		if (allElements[i].className == className) {
			result.push(allElements[i]);
		};
	};
	
	return result;
}


var checkMultipleChoice = function(type_id, solution_id) {
    var mcRightSolutions = $(solution_id).getElementsByTagName("span");
    var mcAnswers = $(type_id).getElementsByTagName("input");
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

var checkMultipleChoices = function() {
	var multiple_choices = getElementsByClassName("multiple_choice");
	var solvedCorrect = [];
	for (var i = 0; i < multiple_choices.length; i++) {
		var type_id = multiple_choices[i].id;
		var solution_id = multiple_choices[i].id + "_sol";
		solvedCorrect.push(checkMultipleChoice(type_id, solution_id));
	};
	
	for (var i = 0; i < solvedCorrect.length; i++) {
		if (!solvedCorrect[i]) {
			return false;
		};
	};
	
	return true;
};

var checkForName = function(name, array) {
    for (var i = 0; i < array.length; i++) {
        if (name === array[i].innerHTML) {
            return true;
        };
    };
    return false;
};

var checkSingleChoice = function (type_id, solution_id) {
	var scRightSolutins = $(solution_id).getElementsByTagName("span");
	var scAnswers = $(type_id).getElementsByTagName("input");
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

var checkSingleChoices = function () {
	var singleChoices = getElementsByClassName("single_choice");
	var solvedCorrect = [];
	
	for (var i=0; i<singleChoices.length; i++) {
		var type_id = singleChoices[i].id;
		var solution_id = singleChoices[i].id + "_sol";
		solvedCorrect.push(checkSingleChoice(type_id, solution_id));
	};
	
	for (var i=0; i<solvedCorrect.length; i++) {
		if (!solvedCorrect[i]) {
			return false;
		};
	};
	
	return true;
};

var initMarktext = function (marktext_id) {
	var allSpans = $(marktext_id).getElementsByTagName("span");
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

var initMarktexts = function () {
	var marktexts = getElementsByClassName("marktext");
	for (var i=0; i<marktexts.length; i++) {
		initMarktext(marktexts[i].id)
	};
};

var checkMarktext = function(marktext_id) {
	var markTextSpans = $(marktext_id).getElementsByTagName("span");
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

var checkMarktexts = function () {
	var marktexts = getElementsByClassName("marktext");
	var solvedCorrect = [];
	
	for (var i = 0; i < marktexts.length; i++) {
		var checkResult = checkMarktext(marktexts[i].id);
		solvedCorrect.push(checkResult);
	};
	
	for (var i = 0; i < solvedCorrect.length; i++) {
		if (!solvedCorrect[i]) {
			return false;
		};
	};
	
	return true;
};

var getSolutionForGap = function (gap, answers) {
	for (var i=0; i<answers.length; i++) {
		if (gap.name == answers[i].id) {
			return answers[i].innerHTML;
		};
	};
};

var checkGapQuestion = function (type_id, solution_id) {
	var gapInputs = $(type_id).getElementsByTagName("input");
	var correctAnswers = $(solution_id).children;
	var solvedCorrect = true;
	
	for (var i=0; i < gapInputs.length; i++) {
		var gap = gapInputs[i];
		var solutonForGap = getSolutionForGap(gap, correctAnswers)
		
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

var checkGapQuestions = function () {
	var clozes = getElementsByClassName("gapquestion");
	var solvedCorrect = [];
	
	for (var i=0; i<clozes.length; i++) {
		var type_id = clozes[i].id;
		var solution_id = clozes[i].id + "_sol";
		solvedCorrect.push(checkGapQuestion(type_id, solution_id));
	};
	
	for (var i=0; i<solvedCorrect.length; i++) {
		if (!solvedCorrect[i]) {
			return false;
		};
	};
	
	return true;
};

var checkDropdown = function (type_id) {
	var selects = $(type_id).getElementsByTagName("select");
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

var checkDropdowns = function () {
	var dropdowns = getElementsByClassName("dropdown");
	var solvedCorrect = [];
	
	for (var i=0; i<dropdowns.length; i++) {
		var solved = checkDropdown(dropdowns[i].id);
		solvedCorrect.push(solved);
	};
	
	for (var i=0; i<solvedCorrect.length; i++) {
		if (!solvedCorrect[i]) {
			return false;
		};
	};
	
	return true;
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