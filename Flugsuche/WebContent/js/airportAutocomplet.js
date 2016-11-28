


function loadAirports() {
	alert("aus");
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		alert(xmlhttp.status);
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			alert("aus3");
			var airports = JSON.parse(xmlhttp.responseText);
			if (airports == null || airports.length == 0) {
				alert("aus4");
				return;
			}
			alert(airports.length);
		}
	};
	xmlhttp.open("GET", "Flugorte" , true);
	xmlhttp.send();
}