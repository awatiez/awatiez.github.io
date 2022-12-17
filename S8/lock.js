var sun_1 = 1;
var nomi_2 = 76;
var capheus_3 = 47;
var riley_4 = 12;
var will_5 = 83;
var wolfgang_6 = 9;
var lito_7 = 90;
var kala_8 = 62;

function submit() {
	
	if (document.getElementById("sun_1").value == sun_1 &&
		document.getElementById("nomi_2").value == nomi_2 &&
		document.getElementById("capheus_3").value == capheus_3 &&
		document.getElementById("riley_4").value == riley_4 &&
		document.getElementById("will_5").value == will_5 &&
		document.getElementById("wolfgang_6").value == wolfgang_6 &&
		document.getElementById("lito_7").value == lito_7 &&
		document.getElementById("kala_8").value == kala_8)
		{
		document.body.innerHTML = "<p>Bravo !</p>\
		<p>Les chiffres entrés nous permettent de savoir que c'est cet individu qui a le paquet !</p>\
		<img src='media/arno.png' class='pic'/>\
		<p>Trouve-le et demande-lui le paquet !</p>";
	} else {
		document.body.style.backgroundColor = "red";
		setTimeout(function() {document.body.style.backgroundColor = "white";}, 200);
	}
}