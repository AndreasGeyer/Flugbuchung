window.onresize = function() {
	unsichtibar("HinElement");
	unsichtibar("RueckElement");
}

window.addEventListener("DOMContentLoaded", function() {
	unsichtibar("HinElement");
	unsichtibar("RueckElement");
});
var hinflugSelected = null;
var rueckFlugselected = null;

function displayFlightDetails(event, hin) {

	if (hin == "Hin")
		hinflugSelected = event.target.id;
	else
		rueckFlugselected = event.target.id;

	var class_visible = document.getElementsByClassName('visible'
			+ hin.toString());
	for (var i = 0; i < class_visible.length; i++) {
		class_visible[i].style.display = "none";
		class_visible[i].setAttribute("class", "unvisible" + hin.toString());
	}

	var target = event.target;
	while (target.nodeName != "TR") {

		target = target.parentNode;
	}

	var id = target.getAttribute('id');

	var tr_visible = document.getElementById(id + "_detail");

	tr_visible.setAttribute("class", "visible" + hin.toString());
	tr_visible.style.display = "table-row";

	target = event.target;

	fillRechung(target.id, hin);
}

function displayFlyTime(event) {
	var target = event.target;
	var id = target.id;
	var idString = "" + id.toString();
	var value = target.value;
	var dateString = "";
	var date = new Date(parseInt(value));

	var dateMinutes = date.getMinutes();
	if (date.getMinutes() < 10) {
		dateMinutes = "0" + dateMinutes;
	}

	if (idString.indexOf("Uhr", 0) != -1) {

		dateString = date.getHours() + ":" + dateMinutes + " Uhr";
	} else if ((idString.indexOf("max", 0) != -1)) {
		dateString = parseFloat(target.value).toFixed(2) + " €";
	}

	else {
		dateString = date.getHours() + ":" + dateMinutes + " h";
	}

	var spanField = document.getElementById(id.substring(0, idString.indexOf(
			"_", 0))
			+ "_span");
	var innerHTMLspanField = spanField.innerHTML;

	innerHTMLspanField = innerHTMLspanField.substring(0, innerHTMLspanField
			.indexOf("bis", 0) + 4);
	spanField.innerHTML = innerHTMLspanField + dateString + "</strong>";

	if (idString.indexOf("Hin", 0) != -1)
		ajax("Hin");
	else
		ajax("Rueck");
}

function displayPrice(event) {
	var target = event.target;
	var id = target.id;
	var idString = "" + id.toString();
	var value = target.value + " €";

	var spanField = document.getElementById(id.substring(0, idString.indexOf(
			"_", 0))
			+ "_span");
	var innerHTMLspanField = spanField.innerHTML;

	innerHTMLspanField = innerHTMLspanField.substring(0, innerHTMLspanField
			.indexOf("bis", 0) + 4);
	spanField.innerHTML = innerHTMLspanField + value + "</strong>";
}

function fillRechung(id, hin) {
	var idString = "" + id;
	var flightNumber = idString.substring(0, idString.indexOf("_", 0) + 1);
	var price = document.getElementById(id);
	var datumHin = document.getElementById("calendarHin").getAttribute("value");
	var rechnungHin = "";
	var stringHinRueck;
	if (hin == "Hin") {
		rechnungHin = document.getElementById("RechnungHin");
		datumHin = document.getElementById("calendarHin").getAttribute("value");
		stringHinRueck = "HINFLUG";
	} else {
		rechnungHin = document.getElementById("RechnungRueck");
		datumHin = document.getElementById("calendarRueck").getAttribute(
				"value");
		stringHinRueck = "RUECKFLUG";
	}
	var abflugzeit = document.getElementById(flightNumber + "abflugzeit");
	var ankunftzeit = document.getElementById(flightNumber + "ankunftzeit");
	var abflugort = document.getElementById(flightNumber + "abflugort").innerText;
	var ankunftort = document.getElementById(flightNumber + "ankunftort").innerText;

	// var child = rechnungHin.firstChild;
	// var i = rechnungHin.removeChild(child);
	var parent = rechnungHin.parentNode;

	while (rechnungHin.hasChildNodes() == true) {
		var child = rechnungHin.firstChild;
		rechnungHin.removeChild(child);
	}

	var header_hin = document.createElement("span");
	header_hin.appendChild(document.createTextNode(stringHinRueck));
	rechnungHin.appendChild(header_hin);

	var abflugzeit_strong = document.createElement("strong");
	abflugzeit_strong.appendChild(document.createTextNode(datumHin));
	var abflugzeit_p = document.createElement("p");
	abflugzeit_p.appendChild(abflugzeit_strong);
	rechnungHin.appendChild(abflugzeit_p);

	var abflug_p = document.createElement("p");
	abflug_p.appendChild(document.createTextNode(abflugzeit.innerText
			+ abflugort));
	rechnungHin.appendChild(abflug_p);

	var ankunft_p = document.createElement("p");
	ankunft_p.appendChild(document.createTextNode(ankunftzeit.innerText
			+ ankunftort));
	rechnungHin.appendChild(ankunft_p);

	var wrapper_div = document.createElement("div");
	var arrayPassengers = [ 'erwachsen', 'kind', 'babie' ];
	var pricePassengers = [ 1, 0.8, 0.6 ];
	for (var i = 0; i < arrayPassengers.length; i++) {

		var anzahl_erwachsene = document.getElementById(arrayPassengers[i]);
		var text = anzahl_erwachsene.options[anzahl_erwachsene.selectedIndex].text;
		var number = parseFloat(text.substring(0, 1));

		if (i == 0 || number > 0) {

			var erwachsene = document.createElement("div");
			var erwachsener_p = document.createElement("p");
			var preis = price.parentNode.innerText.replace(",", ".");

			var preis = (parseFloat(preis) * pricePassengers[i]).toFixed(2);

			erwachsener_p.appendChild(document.createTextNode(text + " a "
					+ preis + "€"));
			var erwachsener_preis = document.createElement("p");

			preis = (preis * number).toFixed(2);

			erwachsener_preis.appendChild(document.createTextNode(preis + "€"));

			erwachsene.setAttribute("class", "posten");

			erwachsene.appendChild(erwachsener_p);
			erwachsene.appendChild(erwachsener_preis);

			wrapper_div.appendChild(erwachsene);
			rechnungHin.appendChild(wrapper_div);
		}
	}

}

function ajax(hinorRueck) {

	var xmlhttp = new XMLHttpRequest();

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

			var fluege = JSON.parse(xmlhttp.responseText);

			if (fluege == null) {
				return;
			} else {
				var elements = [];

				var table = null;
				if (hinorRueck == "Hin" || hinorRueck == "HinRueck")
					table = document.getElementById("hinTable");
				else
					table = document.getElementById("rueckTable");

				var i = table.querySelectorAll("tr");
				var body = table.querySelectorAll("tbody");

				for (var int = 0; int < i.length; int++) {

					if (i[int].id != "") {
						var elem = document.getElementById(i[int].id);
						// elem.style.display = "none";
						elements.push(elem);

					}
				}

				var paretn = elements[0].parentNode;

				for (var int2 = 0; int2 < fluege.length * 2; int2++) {

					var pos = getElementPosition(elements, fluege[int2 / 2].id);
					var node = elements[pos];
					node.style.display = "table-row";
					var node2 = elements[pos + 1];
					elements[pos] = null;
					elements[pos + 1] = null;

					paretn.appendChild(node);
					paretn.appendChild(node2);

					int2++;

				}
				displayNone(elements, paretn)

			}
		}
	}
	var input;
	if (hinorRueck == "Hin" || hinorRueck == "HinRueck")
		input = document.getElementsByName("Preis");
	else
		input = document.getElementsByName("inputRueck");
	var hinSortierung = null;
	for (var i = 0; i < input.length; i++) {
		if (input[i].checked == true) {
			hinSortierung = input[i].value;
		}
	}

	var params = "";

	if (hinorRueck == "Hin" || hinorRueck == "HinRueck") {
		var preisHin = document.getElementById("maxPriceHin_input").value;
		var uhrzeit = document.getElementById("UhrzeitHin_input").value;
		var flugdauer = document.getElementById("zeitHin_input").value;
		var gesellschaft = document.getElementsByName("fluggesellschaft");
		var string_gesellschaft = "";
		for (var i = 0; i < gesellschaft.length; i++) {
			if (gesellschaft[i].checked == true) {
				string_gesellschaft = string_gesellschaft
						+ gesellschaft[i].id.toString() + ",";
			}
		}

		params = "HinRueck=Hin&preisHin=" + preisHin + "&uhrzeitHin=" + uhrzeit
				+ "&ges=" + string_gesellschaft + "&flugdauer=" + flugdauer;
	} else if (hinorRueck == "Rueck") {
		var preisRueck = document.getElementById("maxPriceRueck_input").value;
		var uhrzeitRueck = document.getElementById("UhrzeitRueck_input").value;
		var flugdauerRueck = document.getElementById("zeitRueck_input").value;
		var gesellschaft = document.getElementsByName("fluggesellschaft");
		var string_gesellschaft = "";
		for (var i = 0; i < gesellschaft.length; i++) {
			if (gesellschaft[i].checked == true) {
				string_gesellschaft = string_gesellschaft
						+ gesellschaft[i].id.toString() + ",";
			}
		}

		params = "HinRueck=Rueck&preisHin=" + preisRueck + "&uhrzeitHin="
				+ uhrzeitRueck + "&ges=" + string_gesellschaft + "&flugdauer="
				+ flugdauerRueck;
	}

	var url = "/Flugsuche/FlugTableAktualisieren?sortingHin" + "="
			+ hinSortierung + "&" + params;
	xmlhttp.open("GET", url, true)

	xmlhttp.send();
	if (hinorRueck == "HinRueck") {
		ajax("Rueck");
	}
}

function displayNone(elements, parent) {
	for (var i = 0; i < elements.length; i++) {

		if (elements[i] != null) {

			var node = elements[i++];
			parent.appendChild(node);
			node.style.display = "none";

			var node2 = elements[i];
			parent.appendChild(node2);
			node2.style.display = "none";

		}
	}
}

function getElementPosition(elements, id) {
	for (var i = 0; i < elements.length; i++) {
		if (elements[i] != null && elements[i].id == id) {
			return i;
		}
	}
}

function unsichtibar(HinRueck) {
	var zahl = 5;
	var left = 0;
	var right = 0;
	if (window.innerWidth < 850) {

		zahl = 3;
		left = 1;
		right = 1;
	} else if (window.innerWidth >= 850 && window.innerWidth <= 1199) {
		zahl = 4;
		left = 1;
		right = 2;
	} else if (window.innerWidth >= 1200) {
		zahl = 5;
		left = 2;
		right = 2;
	}

	var elements = [];
	var elem = document.getElementsByClassName("element");
	for (var i = 0; i < elem.length; i++) {
		var idString = elem[i].id.toString();

		if (idString.indexOf(HinRueck, 0) != -1) {
			elements.push(elem[i]);
			elem[i].style.display = "none";
		}
	}
	var nearestElementHin;
	if (HinRueck == "HinElement") {
		nearestElementHin = document.getElementsByName("nearestHin");
	} else
		nearestElementHin = document.getElementsByName("nearestRueck");

	if (nearestElementHin.length > 0) {
		var id = nearestElementHin[0].getAttribute("id");

		var noNearestElementHin = parseInt(id.substring(id.indexOf("_") + 1));
		noNearestElementHin--;

		if (elements.length + 1 < noNearestElementHin + right) {
			left = left + right;
			right = 0;
		} else if (left > noNearestElementHin) {

			right = right + left;
			left = 0;
		}

		for (var j = noNearestElementHin - left; j <= noNearestElementHin
				+ right; j++) {

			elements[j].style.display = "block";
		}
	}

}

function shiftDate(richtung, HinRueck) {

	var nearestElement;
	if (HinRueck == "Hin")
		nearestElement = document.getElementsByName("nearestHin");
	else
		nearestElement = document.getElementsByName("nearestRueck");

	var id = nearestElement[0].getAttribute("id");

	var firstPart_id = id.substring(0, id.indexOf("_") + 1);
	var noNearestElement = parseInt(id.substring(id.indexOf("_") + 1));

	if ("rechts" == richtung)
		noNearestElement++;
	else
		noNearestElement--;

	var newNearest = document.getElementById(firstPart_id + noNearestElement);

	if (newNearest != null) {
		if (HinRueck == "Hin") {
			nearestElement[0].setAttribute("name", "");
			newNearest.setAttribute("name", "nearestHin");
			unsichtibar("HinElement");
		} else {
			nearestElement[0].setAttribute("name", "");
			newNearest.setAttribute("name", "nearestRueck");
			unsichtibar("RueckElement");
		}

	}

}

function submitDate(date, HinRueck) {

	var calendar;
	if (HinRueck == "Hin") {
		calendar = document.getElementById("calendarHin");
	} else {
		calendar = document.getElementById("calendarRueck");
	}
	calendar.setAttribute("value", date);

	document.getElementById("suchForm").submit();

}

function checkValidity() {
	alert("sds");
	var rueckFly = document.getElementById("rueckFly");
	if (rueckFly != null) {
		var calendar = document.getElementById("calendarRueck");
		if (calendar.getAttribute("value") == "") {
			return false;
		}
	}
	return true;
}

function displayRueckflug(event) {

	var target = event.target;

	if (target.id == 'Hinflug') {

		document.getElementById("rueckFly").setAttribute("id", "rueckFlyNone");
		document.getElementById("calendarRueck").setAttribute("value", "");
		document.getElementById("calendarRueck").required = false;

	} else {

		document.getElementById("rueckFlyNone").setAttribute("id", "rueckFly");
		document.getElementById("calendarRueck").setAttribute("value", "");

	}
}

function g() {
	var element = document.getElementById("weiterButton");
	var elementsRueck = document.getElementsByName("RueckflugInput");
	var url;
	alert(elementsRueck.length);
	if (elementsRueck.length == 0) {
		if (hinflugSelected != null) {
			url = "/Flugsuche/ServiceLaden?HinflugInput="
					+ hinflugSelected.toString();
			element.setAttribute("formaction", url);
			element.submit();
			return true;
		}

	}
	else{
		if (hinflugSelected != null && rueckFlugselected != null) {
			
			url = "/Flugsuche/ServiceLaden?HinflugInput="
					+ hinflugSelected.toString()+"&RueckflugInput="+rueckFlugselected.toString();
			alert(url);
			element.setAttribute("formaction", url);
			element.submit();
			return true;
			}
	}
	return false;
	// alert(url);

}
