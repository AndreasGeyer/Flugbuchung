function naechstesAngebot(){
	var aktuellesDiv = document.querySelector("article#Angebote > div.visible");
	var angebotnummer = aktuellesDiv.className.substring(aktuellesDiv.className.indexOf("Angebot") +7);
	var naechstenummer = 0;
	if(angebotnummer == 3){
		naechstenummer = 1;
	}
	else{
		naechstenummer = parseInt(angebotnummer) + 1;
	}
	var naechstesDiv = document.querySelector("article#Angebote > div.unvisible.Angebot" + naechstenummer);
	aktuellesDiv.className = "unvisible Angebot" + angebotnummer;
	naechstesDiv.className = "visible Angebot" + naechstenummer;
}

function vorherigesAngebot(){
	var aktuellesDiv = document.querySelector("article#Angebote > div.visible");
	var angebotnummer = aktuellesDiv.className.substring(aktuellesDiv.className.indexOf("Angebot") +7);
	var naechstenummer = 0;
	if(angebotnummer == 1){
		naechstenummer = 3;
	}
	else{
		naechstenummer = parseInt(angebotnummer) - 1;
	}
	var naechstesDiv = document.querySelector("article#Angebote > div.unvisible.Angebot" + naechstenummer);
	aktuellesDiv.className = "unvisible Angebot" + angebotnummer;
	naechstesDiv.className = "visible Angebot" + naechstenummer;
}