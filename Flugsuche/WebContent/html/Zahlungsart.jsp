<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="../style/main.css" />
		<link rel="stylesheet" type="text/css" href="../style/Zahlungsart.css" />
		<script type="text/javascript" src="../js/startseite.js"></script>
	</head>
	<body>
		<%@ include file="Header.jspf" %>
			
	<main>
		
		<div id="navigation">
			<nav>
			 <ul>
				  <li><a href="../html/Flugsuche.jsp">Flug wählen</a></li>
				  <li><a href="../html/Serviceleistungen.jsp">Serviceleistungen</a></li>
				  <li><a href="../html/Passagier.jsp">Passagierdaten</a></li>
				  <li><a href="#">Zahlung</a></li>
				  <li><a href="#">Bestätigung</a></li>
			 </ul>
		</nav>
		</div>

		<article>
		<form>
			<h1>Wählen Sie ihre bevorzugte Zahlungsart:</h1><br>
			<br>
			<fieldset>
				<h4>Via Kreditkarte</h4>
				<p>
					<input id="MasterCard" type="radio" name="MasterCard"> 
					<labelfor="MasterCard">MasterCard</label><br>
					<input id="VisaCard" type="radio" name="VisaCard"> 
					<label for="VisaCard">VisaCard</label><br>
				</p>
				<label for="KPrüfNr">Ihre Kratenprüfnummer:</label><br>
				<input type="text" name="KPrüfNr" id="KPrüfNr" maxlength="30" required>
				<br>
				<br>
				<h4>Via Lastschrift</h4>
				<label for="BIC">Ihr BIC:</label><br>
				<input type="text" name="BIC" id="BIC" maxlength="30" required>
				<br>
				<label for="IBAN">Ihre IBAN:</label><br>
				<input type="text" name="IBAN" id="IBAN" maxlength="30" required>
				<br>
				
			</fieldset>
			
		</form>
		</article>
		<div id="Speichern">
			<button type="submit">weiter</button>
		</div>
		
		
		</main>


		<%@ include file="Footer.jspf" %>
	</body>
</html>