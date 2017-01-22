var matrixEssen = null;
var matrixID = null;

var versicherung = null;
var versID = null;
var versPreis = null;
var versBez = null;

function selectVersicherung(event) {

	var target = event.target;
	var id = "" + target.id;

	if (target.checked == true) {
		versicherung = target;
		versID = id.substring(0, id.indexOf("_"));
		versPreis = id.substring(id.indexOf("_") + 1, id.indexOf("-"));
		versPreis = versPreis.replace(".", ",");
		versBez = id.substring(id.indexOf("-") + 1);
	} else {
		versicherung = null;
		versID = null;
		versPreis = null;
		versBez = null;
	}

	calculateGesamtsumme();
}

function select() {
	var hinRueck = document.getElementById("flyt");
	var person = document.getElementById("pass");
	if (matrixEssen == null) {
		matrixEssen = new Array(hinRueck.length);
		matrixID = new Array(hinRueck.length);
		for (var i = 0; i < hinRueck.length; i++) {
			matrixEssen[i] = new Array(person.length);
			matrixID[i] = new Array(person.length);
		}
	}
	var essen = getVisibleEssen().id;
	var preis = document.getElementById(essen + "_Preis");
	preis = preis.innerHTML.substring(4, preis.innerHTML.length - 1);
	// preis = parseFloat(preis).toFixed(2);
	var bezeichnung = document.getElementById(essen + "_Bez").innerHTML;
	var ishin;
	if (hinRueck.value.indexOf("Hin") != -1) {
		ishin = "(Hinflug)";
	} else {
		ishin = "(Rückflug)";
	}

	preis = preis.replace(".", ",");

	var s = person.value + " " + ishin + ": " + bezeichnung + " " + preis;

	matrixEssen[hinRueck.selectedIndex][person.selectedIndex] = s;

	matrixID[hinRueck.selectedIndex][person.selectedIndex] = essen.substring(0,
			essen.indexOf("_"))
			+ "_" + ishin;

	calculateGesamtsumme();
}

function deleteMeal() {
	var hinRueck = document.getElementById("flyt");
	var person = document.getElementById("pass");

	matrixEssen[hinRueck.selectedIndex][person.selectedIndex] = null;
	matrixID[hinRueck.selectedIndex][person.selectedIndex] = null;

	calculateGesamtsumme();

}

function sub() {

	var hinRueck = document.getElementById("flyt");
	var person = document.getElementById("pass");
	var url = "/Flugsuche/ServiceSpeichern?leistung=";
	var weiterPass = document.getElementById("weiterPass");
	if (versicherung != null)
		url = url + versID + "_(Hinflug),";

	if (url == "/Flugsuche/ServiceSpeichern?leistung=")

		document.getElementById("weiterPass").setAttribute("formaction",
				"/Flugsuche/ServiceSpeichern");

	for (var i = 0; i < hinRueck.length; i++) {
		for (var j = 0; j < person.length; j++) {
			if (matrixID[i][j] != undefined || matrixID[i][j] != null)
				url = url + matrixID[i][j] + ",";
		}
	}

	if (url == "/Flugsuche/ServiceSpeichern?leistung=")
		url = "/Flugsuche/ServiceSpeichern";

	document.getElementById("weiterPass").setAttribute("formaction", url);

}

function calculateGesamtsumme() {
	var i = 0;
	var rest = document.getElementById("restSumme");
	var hinRueck = document.getElementById("flyt");
	var person = document.getElementById("pass");
	var string = "";

	if (versicherung != null) {
		string = "<h4> Versicherung: " + versBez + " " + versPreis
				+ " &#8364;</h4>";
	}

	for (var i = 0; i < hinRueck.length; i++) {
		for (var j = 0; j < person.length; j++) {

			if (matrixEssen != null && matrixEssen[i][j] != null)
				string = string + "<h4>" + matrixEssen[i][j] + "</h4>";
		}
	}
	rest.innerHTML = string;
}

function move(richtung) {

	var hinRueck = document.getElementById("flyt").value;
	var hin = "Hin";
	if (hinRueck.indexOf("Hinflug") == -1) {
		hin = "Rueck";
	}

	var essen = getVisibleEssen();
	displayNextElement(essen.id, hin, richtung);

}

function switchFlight() {
	var essen = getVisibleEssen();
	var person = document.getElementById("flyt").value;
	firstFlugart(person.substring(0, 1));
	essen.setAttribute("class", "description unvisible");

}

function getVisibleEssen() {
	var essen = document.getElementsByClassName("visible");
	if (essen.length == 1) {
		return essen[0];
	}
}

function firstFlugart(art) {
	var essen = document.getElementsByClassName("description");

	for (var i = 0; i < essen.length; i++) {
		if (essen[i].id.indexOf(art) != -1) {
			essen[i].setAttribute("class", "description visible");
			return;
		}

	}
}

function displayNextElement(id, isHin, richtung) {
	var essen = document.getElementsByClassName("description");
	for (var i = 0; i < essen.length; i++) {
		if (essen[i].id == id) {

			if (richtung == "weiter" && i < essen.length - 1) {
				if (essen[i + 1].id.indexOf(isHin) != -1) {
					essen[i + 1].setAttribute("class", "description visible");
					essen[i].setAttribute("class", "description unvisible");

				}
			} else {
				if (richtung == "zurueck" && i > 0) {
					if (essen[i - 1].id.indexOf(isHin) != -1) {
						essen[i - 1].setAttribute("class",
								"description visible");
						essen[i].setAttribute("class", "description unvisible");

					}
				}
			}

		}
	}
}