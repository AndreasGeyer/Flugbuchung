/**
 * 
 */
function displayRueckflug(event) {

	var target = event.target;
	if (target.id == 'Hinflug') {

		document.getElementById("rückFly").style.visibility = 'hidden';
		document.getElementById("calendarRueck").required = false;
		var i = document.getElementById("rückFly");
		
	} else {
		document.getElementById("rückFly").style.visibility = 'visible';
		document.getElementById("calendarRueck").required = true;
	}
}

