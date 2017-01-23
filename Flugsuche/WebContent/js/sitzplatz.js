var sitzplatzzaehler = 0;
var anzahlsitzplaetze = 3

function changeSitzplatz(node){
	if(node.className.indexOf("frei") != -1 && sitzplatzzaehler < anzahlsitzplaetze){
		node.className = node.className.replace("frei", "reserviert");
		var form = document.getElementById("hinForm");
		sitzplatzzaehler = sitzplatzzaehler + 1;
		
		var hidden = document.createElement("input");
		hidden.setAttribute("type","hidden");
		hidden.setAttribute("name","Sitzplatz" + sitzplatzzaehler + "H");
		hidden.setAttribute("value", node.id.substring(2, node.id.length-1));
		hidden.setAttribute("id", node.id + "input");
		form.appendChild(hidden);
		
		var rest = anzahlsitzplaetze - sitzplatzzaehler;
		document.getElementById("countHin").innerText = rest;
		
	}else if(node.className.indexOf("reserviert") != -1){
		node.className = node.className.replace("reserviert", "frei");
		var form = document.getElementById("hinForm");
		hidden = document.getElementById(node.id+"input");
		form.removeChild(hidden);
		sitzplatzzaehler = sitzplatzzaehler - 1;
		var rest = anzahlsitzplaetze - sitzplatzzaehler;
		document.getElementById("countHin").innerText = rest;
		
		
	}
	
	if(anzahlsitzplaetze == sitzplatzzaehler){
		document.getElementById("submitHin").disabled = false;
	}
	else{
		document.getElementById("submitHin").disabled = true;
	}
}

document.addEventListener("DOMContentLoaded",init);

function init(){
	anzahlsitzplaetze = document.getElementById("countHin").innerText;
	document.getElementById("submitHin").disabled = true;
}
