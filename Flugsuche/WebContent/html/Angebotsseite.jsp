<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="../style/main.css" />
		<link rel="stylesheet" type="text/css" href="../style/Angebotsseite.css" />
		<script type="text/javascript" src="../js/startseite.js"></script>
	</head>
	<body>
		<%@ include file="Header.jspf" %>
	<div id="main">
	<div id="ueberschrift">
	<h1> Unsere beliebsteten Reiseziele </h1>
	</div>
	
	<div id="angebote">
	
		
		<button class="fotoButton" id="button-moskau" ><b>nach Moskau</b></button>
		<button class="fotoButton" id="button-düsseldorf"><b>nach Düsseldorf</b></button>
		<button class="fotoButton" id="button-rom" ><b>nach Rom</b></button>
		<button class="fotoButton" id="button-paris" ><b>nach Paris</b></button>
	
		<button class="fotoButton" id="button-dublin"><b>nach Dublin</b></button>
		<button class="fotoButton" id="button-sideny" ><b>nach Sidney</b></button>
		<button class="fotoButton" id="button-side" ><b>nach Side</b></button>
		<button class="fotoButton" id="button-barcelona" ><b>nach Barcelona</b></button>
	
		<button class="fotoButton" id="button-bali" ><b>nach Bali</b></button>
		<button class="fotoButton" id="button-miami" ><b>nach Miami</b></button>
		<button class="fotoButton" id="button-lissabon" ><b>nach Lissabon</b></button>
		<button class="fotoButton" id="button-hamburg" ><b>nach Hamburg</b></button>
		
		
	
	</div>
	<div id="ueberschrift">
	<h1> !! Sparen Sie bis zu 30% bei Ihrem Flug!! </h1>
	</div>
	
	<div id="TabelleAngebote">
	
	<button class="Angebote" id="Berlin" ><b>Berlin nach London nur 55,55€</b></button>
	<button class="Angebote" id="München" ><b>München nach Madrid nur 99,99€</b></button>
	<button class="Angebote" id="Essen" ><b>Berlin nach London nur 55,55€</b></button>
	<button class="Angebote" id="Frankfurt" ><b>Frankfurt nach Zürich nur 88,88€</b></button>
	<button class="Angebote" id="Dresden" ><b>Dresden nach Barcelona nur 101,10€</b></button>
	<button class="Angebote" id="Mainz" ><b>Mainz nach Düsseldorf nur 57,50€</b></button>
	
		
		</div>		
		<%@ include file="Footer.jspf" %>
	</body>
</html>