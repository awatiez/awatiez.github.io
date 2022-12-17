var questionNr = 0;
var nbQuestions = 8;

//resetRadioButtons();
/* var submitButton = document.getElementById("submitButton");
submitButton.addEventListener("click", submitAnswer); */

function submitAnswer(el) {
	if (answerIsCorrect(el)) {
		nextQuestion();
	} else {
		wrongAnswer();
	}
	//resetRadioButtons();
}

/*
function resetRadioButtons() {
	const radioButtons = document.querySelectorAll('input[type="radio"]');
	for (const radioButton of radioButtons) {
		radioButton.checked = false;
	}
}

function getAnswer() {
	const QuestionRadioButtons = document.querySelectorAll('input[name="' + questionNr.toString() + '"]');
	for (const QuestionRadioButton of QuestionRadioButtons) {
		if (QuestionRadioButton.checked) {
			return QuestionRadioButton.value;
		}
	}
	return null;
}*/

function answerIsCorrect(el) {
	if (el.classList.contains("t")) {
		return true;
	}
	return false;
}

function wrongAnswer() {
	document.body.style.backgroundColor = "red";
	setTimeout(function() {document.body.style.backgroundColor = "white";}, 200);
}

function nextQuestion() {
	document.body.style.backgroundColor = "green";
	setTimeout(function() {document.body.style.backgroundColor = "white";}, 200);
	document.getElementById("div" + questionNr.toString()).style.display = "none"
	
	questionNr += 1;
	if (questionNr == nbQuestions) {
		done();
	} else {
		document.getElementById("div" + questionNr.toString()).style.display = "block"
	}
}

function done() {
	window.location.replace("cercles.html");
}

//--------------------------------------------------------------

function submit8Numbers() {
	alert("et c'est gagné")
}