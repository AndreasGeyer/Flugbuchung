var menuOffen = false;

function oeffneAendern(menuId) {
	if (menuOffen == false) {
		var menu = document.getElementById(menuId);
		menu.className = menu.className + " visible";
		menuOffen = true;
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