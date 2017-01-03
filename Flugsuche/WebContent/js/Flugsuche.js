/**
 * 
 */
function displayRueckflug(event) {

	var target = event.target;

	if (target.id == 'Hinflug') {

		document.getElementById("rueckFly").style.display = "none";
	
//		document.getElementById("calendarRueck").setAttribute("required", "required");
		document.getElementById("calendarRueck").setAttribute("value", "");
		document.getElementById("calendarRueck").required = false;
		document.getElementById("calendarRueck").setAttribute("pattern", "");


		
	} else {
	
		document.getElementById("rueckFly").style.display = "block";
		document.getElementById("calendarRueck").required = true;
		document.getElementById("calendarRueck").setAttribute("value", "");
		document.getElementById("calendarRueck").setAttribute("pattern", "\d{1,2}.\d{1,2}.\d{4}");

	}
}

