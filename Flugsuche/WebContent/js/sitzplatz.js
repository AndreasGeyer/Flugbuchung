var sitzplatzzaehler = 0;
var anzahlsitzplaetze = 3

function changeSitzplatz(node){
	if(node.className.indexOf("frei") != -1 && sitzplatzzaehler < anzahlsitzplaetze){
		node.className = node.className.replace("frei", "reserviert");
		form = document.getElementById("hinForm");
		sitzplatzzaehler = sitzplatzzaehler + 1;
		
		
	}else if(node.className.indexOf("reserviert") != -1){
		node.className = node.className.replace("reserviert", "frei");
		form = document.getElementById("hinForm");
		
		sitzplatzzaehler = sitzplatzzaehler - 1;
	}
}

function sitzplaetzeBuchen(){
	plaetze = document.getElementsByClassName("reserviert");
	form = document.getElementById("hinForm");
	str = "";
	for(i=0;i<plaetze.length ;i++){
		alert(plaetze.id.substring(3));
		//str = str + "<input type='hidden' name='sitzplatz" + i +"H' value='" + plaetze.id
	}
}