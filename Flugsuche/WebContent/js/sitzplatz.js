var sitzplatzzaehler = 0;
var anzahlsitzplaetze;
var sitzplatzzaehlerrueck = 0;
var anzahlsitzplaetzerueck;

function changeSitzplatz(node) {
	if (node.id.substring(node.id.length - 1, node.id.length) == "H") {
		if (node.className.indexOf("frei") != -1
				&& sitzplatzzaehler < anzahlsitzplaetze) {
			node.className = node.className.replace("frei", "reserviert");
			var form = document.getElementById("hinForm");
			sitzplatzzaehler = sitzplatzzaehler + 1;

			var hidden = document.createElement("input");
			hidden.setAttribute("type", "hidden");
			hidden.setAttribute("name", "Sitzplatz" + sitzplatzzaehler + "H");
			hidden.setAttribute("value", node.id.substring(2,
					node.id.length - 1));
			hidden.setAttribute("id", node.id + "input");
			form.appendChild(hidden);

			var rest = anzahlsitzplaetze - sitzplatzzaehler;
			document.getElementById("countHin").innerText = rest;

		} else if (node.className.indexOf("reserviert") != -1) {
			node.className = node.className.replace("reserviert", "frei");
			var form = document.getElementById("hinForm");
			hidden = document.getElementById(node.id + "input");
			form.removeChild(hidden);
			sitzplatzzaehler = sitzplatzzaehler - 1;
			var rest = anzahlsitzplaetze - sitzplatzzaehler;
			document.getElementById("countHin").innerText = rest;

		}
	} else {
		if (node.className.indexOf("frei") != -1
				&& sitzplatzzaehlerrueck < anzahlsitzplaetzerueck) {
			node.className = node.className.replace("frei", "reserviert");
			var form = document.getElementById("hinForm");
			sitzplatzzaehlerrueck = sitzplatzzaehlerrueck + 1;

			var hidden = document.createElement("input");
			hidden.setAttribute("type", "hidden");
			hidden.setAttribute("name", "Sitzplatz" + sitzplatzzaehlerrueck + "R");
			hidden.setAttribute("value", node.id.substring(2,
					node.id.length - 1));
			hidden.setAttribute("id", node.id + "input");
			form.appendChild(hidden);

			var rest = sitzplatzzaehlerrueck - sitzplatzzaehlerrueck;
			document.getElementById("countRueck").innerText = rest;

		} else if (node.className.indexOf("reserviert") != -1) {
			node.className = node.className.replace("reserviert", "frei");
			var form = document.getElementById("hinForm");
			hidden = document.getElementById(node.id + "input");
			form.removeChild(hidden);
			sitzplatzzaehlerrueck = sitzplatzzaehlerrueck - 1;
			var rest = anzahlsitzplaetze - sitzplatzzaehlerrueck;
			document.getElementById("countRueck").innerText = rest;

		}
	}
	if (anzahlsitzplaetze == sitzplatzzaehler && anzahlsitzplaetzerueck == sitzplatzzaehlerrueck) {
		document.getElementById("submitHin").disabled = false;
	} else {
		document.getElementById("submitHin").disabled = true;
	}
}

document.addEventListener("DOMContentLoaded", init);

function init() {
	anzahlsitzplaetze = document.getElementById("countHin").innerText;
	if (document.getElementById("countRueck") != null) {
		anzahlsitzplaetzerueck = document.getElementById("countRueck").innerText;
	} else {
		anzahlsitzplaetzerueck = 0;
	}
	document.getElementById("submitHin").disabled = true;
}
