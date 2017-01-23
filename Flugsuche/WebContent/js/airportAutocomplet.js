/*Author Bauer Jürgen
 * 
 * 
 * Ajax zum Laden des Airports*/

function loadAirports(event) {

	var xmlhttp = new XMLHttpRequest();
	var target = event.target;

	xmlhttp.onreadystatechange = function() {

		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

			var airports = JSON.parse(xmlhttp.responseText);
			var autoCompletDiv = document.getElementById(target.id
					+ "Autocomplet");

			if (airports == null || airports.length == 0) {
				autoCompletDiv.style.visibility = "hidden";
				return;
			} else {

				autoCompletDiv.innerHTML = "";
				autoCompletDiv.style.visibility = "visible";

				var ul = document.createElement("ul");
				ul.setAttribute("class", "listAirportAuto");

				for (var i = 0; i < airports.length; i++) {
					var li = document.createElement("li");
			
	
		
					var firstletter = airports[i].ort.toLowerCase().indexOf(target.value.toLowerCase());
					var ort = airports[i].ort;
					var ortText = "";
					if (firstletter > 0) {
						ortText = ort.substring(0, firstletter)
								+ "<strong>"
								+ ort.substring(firstletter, firstletter
										+ target.value.length) + "</strong>"
								+ ort.substring(firstletter +target.value.length);
				
					} else {
						ortText = "<strong>"
								+ ort.substring(0, target.value.length)
								+ "</strong>"
								+ ort.substring(target.value.length);
			
					}

					var text = ortText + " (" + airports[i].kuerzel + "), "
							+ airports[i].land;

					li.setAttribute("id", airports[i].ort + "_"
							+ airports[i].kuerzel);
					li.innerHTML = text;

					var func = "selectAirport(event," + target.id.toString()
							+ ")";
					li.setAttribute("onclick", func);

					ul.appendChild(li);

				}

				autoCompletDiv.appendChild(ul);
				window.addEventListener("mousedown", function(e) {

					var autocompletAirport = document
							.getElementsByClassName("autocompletAirport");
					
					
					var childNodes = autoCompletDiv.childNodes[0].childNodes;
					var hasChild = false;
					for (var j = 0; j < childNodes.length; j++) {
						if (childNodes[j].id == e.target.id
								|| autoCompletDiv.parentNode.nodeTyp == "ul") {
							hasChild = true;
							break;
						}
					}
					if (!hasChild)
						for (var i = 0; i < autocompletAirport.length; i++) {
							autocompletAirport[i].innerHTML = "";
							autocompletAirport[i].style.visibility = "hidden";
						
						}

				});

			}
		}
	};
	var url = "/Flugsuche/Flugorte?" + target.id + "=" + target.value;
	xmlhttp.open("GET", url, true);
	xmlhttp.send();
}

/*Autocompletietung wird geschlossen bei Selektion
 * */

function selectAirport(event, inputField) {
	var target = event.target;
	var airport = target.id;

	var value = airport.substring(0, airport.indexOf("_"));
	document.getElementById(inputField.id).value = value;

	var autoCompletDiv = document.getElementById(inputField.id + "Autocomplet");

	autoCompletDiv.innerHTML = "";
	autoCompletDiv.style.visibility = "hidden";
}
