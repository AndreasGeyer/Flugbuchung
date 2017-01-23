// Geyer Andreas
function oeffneKarte() {
	document.getElementById("kredit").className = "aktiviert";
	document.getElementById("last").className = "";
	document.getElementById("kreditkarte").className = "aktiviert";
	document.getElementById("lastschrift").className = "";
	
}

function oeffneLast() {
	document.getElementById("kredit").className = "";
	document.getElementById("last").className = "aktiviert";
	document.getElementById("kreditkarte").className = "";
	document.getElementById("lastschrift").className = "aktiviert";

}