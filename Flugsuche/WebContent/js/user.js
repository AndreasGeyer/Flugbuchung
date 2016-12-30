var selectedHin = null;
var seletRueck = null;

function oeffneAendern(menuId) {
	if (menuOffen == false) {
		var menu = document.getElementById(menuId);
		menu.className = menu.className + " visible";
		menuOffen = true;
	}
}

function schlieseAendern(menuId) {
	var menu = document.getElementById(menuId);
	menu.className = menu.className.substring(0, menu.className
			.indexOf(" visible"));
	menuOffen = false;

}

function displayFlightDetails(event, hin) {

	var class_visible = document.getElementsByClassName('visible'
			+ hin.toString());
	for (var i = 0; i < class_visible.length; i++) {
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
	if (idString.indexOf("Uhr", 0) != -1) {
		dateString = date.getHours() + ":" + date.getMinutes() + " Uhr";
	} else if ((idString.indexOf("max", 0) != -1)) {
		dateString = target.value + " €";
	}

	else {
		dateString = date.getHours() + ":" + date.getMinutes() + " h";
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
	if (hin == "Hin")
		rechnungHin = document.getElementById("RechnungHin");
	else
		rechnungHin = document.getElementById("RechnungRueck");
	var abflugzeit = document.getElementById(flightNumber + "abflugzeit");
	var ankunftzeit = document.getElementById(flightNumber + "ankunftzeit");
	var abflugort = document.getElementById(flightNumber + "abflugort").innerText;
	var ankunftort = document.getElementById(flightNumber + "ankunftort").innerText;

	alert(flightNumber);

	// var child = rechnungHin.firstChild;
	// var i = rechnungHin.removeChild(child);
	var parent = rechnungHin.parentNode;

	while (rechnungHin.hasChildNodes() == true) {
		var child = rechnungHin.firstChild;
		rechnungHin.removeChild(child);
	}

	var header_hin = document.createElement("span");
	header_hin.appendChild(document.createTextNode("HINFLUG"));
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
				alert(fluege.toString());
				var table = null;
				if (hinorRueck == "Hin" || hinorRueck == "HinRueck")
					table = document.getElementById("hinTable");
				else
					table = document.getElementById("rueckTable");

				var i = table.querySelectorAll("tr");
				var body = table.querySelectorAll("tbody");
				alert(i == null);
				alert(i);
				for (var int = 0; int < i.length; int++) {
					alert(i[int].id);
					if (i[int].id != "") {
						var elem = document.getElementById(i[int].id);
						//elem.style.display = "none";
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

	var input = document.getElementsByName("Preis");
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

		params = "HinRueck=Hin&preisHin=" + preisHin + "&uhrzeitHin=" + uhrzeit + "&ges="
				+ string_gesellschaft + "&flugdauer=" + flugdauer;
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

		params = "HinRueck=Rueck&preisHin=" + preisRueck + "&uhrzeitHin=" + uhrzeitRueck
				+ "&ges=" + string_gesellschaft + "&flugdauer="
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

function resize() {
	if (window.innerWidth <= 849) {

	}
}

function date() {
	var date = new Date();
	document.getElementById("monatsname").innerHTML = date.getDay();
}
