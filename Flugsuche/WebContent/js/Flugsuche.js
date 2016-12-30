/**
 * 
 */
function displayRueckflug(event) {

	var target = event.target;
	if (target.id == 'Hinflug') {

		document.getElementById("rückFly").visibility = 'hidden';
		document.getElementById("calendarRueck").required = false;
		document.getElementById("calendarRueck").value = "";
		var i = document.getElementById("rückFly");
		
	} else {
		document.getElementById("rückFly").style.visibility = 'visible';
		document.getElementById("calendarRueck").required = true;
	}
}

