// Geyer Andreas
var menuOffen = false;

function oeffneAendern(menuId) {
	if (menuOffen == false) {
		var menu = document.getElementById(menuId);
		menu.className = menu.className + " visible";
		menuOffen = true;
	}
}
 
function checkPasswort(){
	var altesPasswort = document.getElementById("altespasswortAbgleich").value;
	var altesPasswortEingabe = document.getElementById("altespasswort").value;
	var neuesPasswort = document.getElementById("neuespasswort").value;
	var neuesPasswortWdh = document.getElementById("neuespasswortwdh").value;
	var pwfalsch = false;
	if(altesPasswort != altesPasswortEingabe){
		document.getElementById("msgaltespasswort").className="passwortFalsch";
		pwfalsch = true;
	}else{
		document.getElementById("msgaltespasswort").className="";
	}
	if(neuesPasswort != neuesPasswortWdh){
		document.getElementById("msgneuespasswort").className="passwortFalsch";
		pwfalsch = true;
	}else{
		document.getElementById("msgneuespasswort").className="";
	}
	if(pwfalsch == false){
		document.getElementById("passwortForm").submit();
	}
}



function schlieseAendern(menuId) {
	var menu = document.getElementById(menuId);
	menu.className = menu.className.substring(0, menu.className
			.indexOf(" visible"));
	menuOffen = false;

}

function openPremium(){
	location = "html/Premium.jsp";
}