/**
 * 
 */

var months = [ "Januar", "Februar", "März", "April", "Mai", "Juni", "Juli",
		"August", "September", "Oktober", "November", "Dezember" ];
var numberofOpenCalendars = 0;
var listInputs = null
var selectedDate = new Date();

function currentMonthName(calendarHin) {
	selectedDate = new Date();
	var today = selectedDate;
	listInputs = calendarHin;
	var name = months[today.getMonth()] + " " + today.getFullYear();
	// document.getElementById("monatsname").innerHTML = name;

	if (numberofOpenCalendars < 1) {
		createHeaderKalender(calendarHin);
		createBodyCalender(today.getMonth(), today.getFullYear(), calendarHin);
	}

}

function createBodyCalender(monthNumber, year, calendarHin) {

	var tbody = document.createElement("tbody");

	var date = new Date(year, monthNumber, 1);
	var today = new Date();
	for (var i = 0; i <= 5; i++) {
		var tr = document.createElement("tr");

		for (var int = 0; int < 7; int++) {

			// Berechnung der Zuordnung Wochentag - Wochendatum
			if (date.getMonth() == monthNumber
					&& (date.getDay() - 1 == int || (date.getDay() == 0 && int == 6))) {

				var td = document.createElement("td");
				td.appendChild(document.createTextNode(date.getDate()));
				td.setAttribute("class", "datePicker");
				td.setAttribute("id", date.toLocaleDateString());
				var a = td.getAttribute("name");

				if (equaleDate(today, date)) {
					td.setAttribute("id", "today");
					
				}

				if (today < date || equaleDate(today, date)) {

					td.setAttribute("onclick", "selectDate(this.id)");
			

				} else {
					if (today.getMonth() >= date.getMonth()
							&& today.getFullYear() >= date.getFullYear())
						td.setAttribute("class", "last");
				}

				date.setDate(date.getDate() + 1);

				tr.appendChild(td)
			} else {
				var td = document.createElement("td");
				tr.appendChild(td);
			
			}
		}

		tbody.appendChild(tr);
	
	}

	document.getElementById("calendarTable" + numberofOpenCalendars)
			.appendChild(tbody);
	window.addEventListener("mousedown", function(event) {
		var target = event.target;
		var tableRow = target.parentNode;
		var tableBody_Head = tableRow.parentNode;
		var table = tableBody_Head.parentNode;
		if(table.id != "calendarTable1"){
			removeCalendar();
		}

	});
}

function createHeaderKalender(calendarHin) {

	// var today = new Date();
	

	var table = document.createElement("table");
	table.setAttribute("class", "tables");
	numberofOpenCalendars++;
	table.setAttribute("id", "calendarTable" + numberofOpenCalendars);

	var thead = document.createElement("thead");
	var tr = document.createElement("tr");
	var td1 = document.createElement("td");
	td1.appendChild(document.createTextNode("<"));

	var clickedFunction = "renewCalendar('" + calendarHin + "',-1)";
	td1.setAttribute("onclick", clickedFunction.toString());

	var td2 = document.createElement("td");
	td2.setAttribute("colspan", "5");
	td2.appendChild(document.createTextNode(months[selectedDate.getMonth()]
			+ " " + selectedDate.getFullYear()));

	var td3 = document.createElement("td");
	td3.appendChild(document.createTextNode(">"));

	clickedFunction = "renewCalendar('" + calendarHin + "',1)";
	td3.setAttribute("onclick", clickedFunction.toString());

	tr.appendChild(td1);
	tr.appendChild(td2);
	tr.appendChild(td3);

	var weekDays = [ "Mo", "Di", "Mi", "Do", "Fr", "Sa", "So" ];

	var tr2 = document.createElement("tr");
	for (var i = 0; i < weekDays.length; i++) {
		var th = document.createElement("th");
		th.appendChild(document.createTextNode(weekDays[i]));
		tr2.appendChild(th);
	}

	thead.appendChild(tr);
	thead.appendChild(tr2);
	table.appendChild(thead);

	var n = document.getElementById(calendarHin);

	var parent = n.parentNode;

	parent.appendChild(table);

}

function equaleDate(date1, date2) {

	if (date1.getDate() == date2.getDate()
			&& date1.getMonth() == date2.getMonth()
			&& date1.getFullYear() == date2.getFullYear()) {
		return true;
	}
	return false;
}

function selectDate(date,c) {

	var input = document.getElementById(listInputs);

	if (date != null) {
		if (date == "today")
			input.setAttribute("value", new Date().toLocaleDateString());
		else
			input.setAttribute("value", date);
	}
	input.getAttribute("required", "true");
	removeCalendar();
}

function renewCalendar(cha, numberMonth) {

	nextDate(numberMonth)
	removeCalendar(cha);
	createHeaderKalender(cha);
	createBodyCalender(selectedDate.getMonth(), selectedDate.getFullYear(), cha);

}

function removeCalendar() {
	

	var e = document.getElementById("calendarTable" + numberofOpenCalendars);
	// alert(e.querySelector("td[colspan=5]").toString());
	if (e != null) {
		
		var body = e.parentNode;
	
		body.removeChild(e);
		numberofOpenCalendars--;
	
	}

}

function nextDate(numberMonth) {

	if (numberMonth == 1) {
		if (selectedDate.getMonth() == 12) {
			var year = selectedDate.getFullYear() + 1;
			selectedDate = new Date(year, 1, 1);
		} else {
			selectedDate.setMonth(selectedDate.getMonth() + 1, 1);
		}
	} else {
		if (selectedDate.getMonth() == 1) {
			var year = selectedDate.getFullYear() - 1;
			selectedDate = new Date(year, 12, 1);
		} else {
			selectedDate.setMonth(selectedDate.getMonth() - 1, 1);
		}
	}

}
