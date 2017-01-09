function anmeldenFenster(){
	if(document.getElementById("popupUserFenster").className == "anmeldenAktiviert"){
		document.getElementById("popupUserFenster").className = '';
	}else{
		document.getElementById("popupUserFenster").className = "anmeldenAktiviert";
	}
}

function userFenster(){
	if(document.getElementById("popupUserFenster").className == "userAktiviert"){
		document.getElementById("popupUserFenster").className = '';
	}else{
		document.getElementById("popupUserFenster").className = "userAktiviert";
	}
}

function ausloggen(){
	document.cookie = "kundenid=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/Flugsuche/;";
	location.reload();
}
