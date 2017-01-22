function checkLändercode(value) {

	if (value == 'DE') {
		return false
	} else {
		return true;
	}

}

function isNumeric(value) {

	for (var i = 0; i < value.length; i++) {
		if (false == Number.isInteger(parseInt(value.charAt(i)))) {
			alert(value.charAt(i));
			return true;
		}
	}
	return false;
}

function trimIBAN(valueIBAN) {
	alert(valueIBAN.length);
	if (valueIBAN.length == 22)
		return false;
	return true;
}

function trimBIC(valueBIC){
	if (valueBIC.length >= 8 && valueBIC.length <= 11)
		return false;
	return true;
}

function trimKreiditkarte(value){
	if (value.length >= 13 && value.length <= 16)
		return false;
	return true;
}

function trimPrüfsumme(value){
	if (value.length == 3)
		return false;
	return true;
}

function trimBIC(value){
	if (value.length >= 8 && value.length <= 11)
		return false;
	return true;
}

function checkLastschrift() {

	var iban = document.getElementById("iban");
	var value = iban.value;
	value = value.trim();
	value = value.replace(" ", "");
	if (iban.validity.patternMismatch || trimIBAN(value)) {
		iban.setCustomValidity("Die IBAN besitzt 22 Zeichen!");
	}

	else if (checkLändercode(value.substring(0, 2))) {
		iban.setCustomValidity("Der Ländercode ist nicht DE!");
	} else if (isNumeric(value.substring(3))) {
		iban
				.setCustomValidity("Nach Ländercode nur numerische Zahlen erlaubt!");
	}
	var bic = document.getElementById("bic");
	var value = bic.value;
	value = value.trim();
	value = value.replace(" ", "");
	
	if (bic.validity.patternMismatch || trimBIC(value)) {
		bic.setCustomValidity("Die BIC besitzt 8 bis 11 Zeichen!");
	}

	
}

function checkKreditkarte(){
	
	var kartennr = document.getElementById("kartennr");
	var value = kartennr.value;
	value = value.trim();
	value = value.replace(" ", "");
	if (kartennr.validity.patternMismatch || trimKreiditkarte(value)) {
		kartennr.setCustomValidity("Die kartennr besitzt 13-16 Zeichen!");
	}
	
	var preufnr = document.getElementById("preufnr");
	var value = preufnr.value;
	value = value.trim();
	value = value.replace(" ", "");
	if (preufnr.validity.patternMismatch || trimPrüfsumme(value)) {
		preufnr.setCustomValidity("Die kartennr besitzt 3 Zeichen!");
	}
}
