/**
 * 
 */
function displayRueckflug(event) {

	var target = event.target;

	if (target.id == 'Hinflug') {

		document.getElementById("rueckFly").setAttribute("id","rueckFlyNone");
		document.getElementById("calendarRueck").setAttribute("value", "");
		document.getElementById("calendarRueck").required = false;



		
	} else {
	
		document.getElementById("rueckFlyNone").setAttribute("id","rueckFly");
		document.getElementById("calendarRueck").setAttribute("value", "");

	}
}

