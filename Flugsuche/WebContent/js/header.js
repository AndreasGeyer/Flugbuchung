function anmeldenFenster(){
	if(document.getElementById("popupUserFenster").className == "anmeldenAktiviert"){
		document.getElementById("popupUserFenster").innerHTML = '';
		document.getElementById("popupUserFenster").className = '';
	}else{
		var htmlpart = '<form>';
		htmlpart += '<p>E-Mail:<br><input name="email" type="text"></p>';
		htmlpart += '<p>Passwort:<br><input name="password" type="password"></p>';
		htmlpart += '<button>Log-In</button>';
		htmlpart += '</form>';
		htmlpart += '<a id="registrieren" href="Startseite.jsp">Noch nicht regisitriert?</a>';
		
		document.getElementById("popupUserFenster").innerHTML = htmlpart;
		document.getElementById("popupUserFenster").className = "anmeldenAktiviert";
	}
}

function userFenster(){
	if(document.getElementById("popupUserFenster").className == "userAktiviert"){
		document.getElementById("popupUserFenster").innerHTML = '';
		document.getElementById("popupUserFenster").className = '';
	}else{
		var htmlpart = '';
		htmlpart += '<button>Meine Flüge</button>';
		htmlpart += '<a href="User.jsp"><button>Mein Profil</button></a>';
		htmlpart += '<button>Ausloggen</button>';
		
		document.getElementById("popupUserFenster").innerHTML = htmlpart;
		document.getElementById("popupUserFenster").className = "userAktiviert";
	}
}
