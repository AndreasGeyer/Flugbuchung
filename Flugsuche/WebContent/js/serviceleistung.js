var matrixEssen = null;
var matrixID = null;

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
	preis = preis.innerHTML.substring(4,preis.innerHTML.length-1);
	preis = parseFloat(preis).toFixed(2);
	var bezeichnung = document.getElementById(essen + "_Bez").innerHTML;
	var ishin;
	if (hinRueck.value.indexOf("Hin") != -1) {
		ishin = "(Hinflug)";
	} else {
		ishin = "(Rückflug)";
	}
	var s = person.value + " " + ishin + ": " + bezeichnung + " " + preis
			+ " €";
	
	matrixEssen[hinRueck.selectedIndex][person.selectedIndex] = s;
	alert(essen);
	matrixID[hinRueck.selectedIndex][person.selectedIndex] = essen.substring(0,essen.indexOf("_"))+"_"+ishin;
	


}

function sub(){

	var hinRueck = document.getElementById("flyt");
	var person = document.getElementById("pass");
	var url = "/Flugsuche/ServiceSpeichern?leistung=";
	for (var i = 0; i < hinRueck.length; i++) {
		for (var j = 0; j < person.length; j++) {
			url = url+matrixID[i][j]+",";
		}
	}
	var weiterPass = document.getElementById("weiterPass");
	document.getElementById("weiterPass").setAttribute("formaction", url);


}

/*function calculateGesamtsumme() {
	var i = 0;
	var rest = document.getElementById("restSumme");
	var hinRueck = document.getElementById("flyt");
	var person = document.getElementById("pass");
	var string = "";
	for (var i = 0; i < hinRueck.length; i++) {
		for (var j = 0; j < person.length; j++) {
			alert("vv");
			if (matrixEssen[i][j] != null)
				string = string + "<h4>" + matrixEssen[i][j] + "</h4>";
		}
	}
	rest.innerHTML = string;
}*/

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
	alert(art);
	for (var i = 0; i < essen.length; i++) {
		if (essen[i].id.indexOf(art) != -1) {
			essen[i].setAttribute("class", "description visible");
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
				if (richtung == "zurück" && i > 0) {
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