var menuOffen = false;

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

	target = event.target;
	fillRechung(target.id);
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

function fillRechung(id) {
	var idString = "" + id;
	var flightNumber = idString.substring(0, idString.indexOf("_", 0) + 1);
	var price = document.getElementById(id);
	var datumHin = document.getElementById("calendarHin").getAttribute("value");
	var rechnungHin = document.getElementById("RechnungHin");
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

			var preis =(parseFloat(preis)*pricePassengers[i]).toFixed(2);

			erwachsener_p.appendChild(document.createTextNode(text + " a "
					+ preis+"€"));
			var erwachsener_preis = document.createElement("p");

			preis = (preis*number).toFixed(2);
		
			erwachsener_preis.appendChild(document.createTextNode(preis + "€"));

			erwachsene.setAttribute("class", "posten");

			erwachsene.appendChild(erwachsener_p);
			erwachsene.appendChild(erwachsener_preis);

			wrapper_div.appendChild(erwachsene);
			rechnungHin.appendChild(wrapper_div);
		}
	}


}


function ajax(){
	var xmlhttp = new XMLHttpRequest();
	var target = event.target;

	xmlhttp.onreadystatechange = function(){
		
	}
}

function date() {
	var date = new Date();
	document.getElementById("monatsname").innerHTML = date.getDay();
}
