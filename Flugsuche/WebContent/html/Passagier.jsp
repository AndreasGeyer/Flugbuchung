<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="../style/main.css" />
		<link rel="stylesheet" type="text/css" href="../style/Passagier.css" />
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
				  <li><a href="../html/Zahlungsart.jsp">Zahlung</a></li>
				  <li><a href="#">Bestätigung</a></li>
			 </ul>
		</nav>
		</div>
		
		<article>
		<form>
			<h1>Passagiere</h1><br>
			<br>
			<fieldset>
				<h4>Passagier 1:</h4>
				<label for="vorname">Vorname:</label><br>
				<input type="text" name="vorname" id="vorname" maxlength="30" required>
				<br>
				<label for="nachname">Nachname:</label><br>
				<input type="text" name="nachname" id="nachname" maxlength="30" required>
				<br>
				<label for="gebdat">Geburtsdatum:</label><br>
				<input type="date" name="Gebdatum" id="Gebdatum">
                <br>
                <br>
                <h4>Passagier 2:</h4>
				<label for="vorname">Vorname:</label><br>
				<input type="text" name="vorname" id="vorname" maxlength="30" required>
				<br>
				<label for="nachname">Nachname:</label><br>
				<input type="text" name="nachname" id="nachname" maxlength="30" required>
				<br>
				<label for="gebdat">Geburtsdatum:</label><br>
				<input type="date" name="Gebdatum" id="Gebdatum">
                <br>
                <br>
				<h4>Passagier 3:</h4>
				<label for="vorname">Vorname:</label><br>
				<input type="text" name="vorname" id="vorname" maxlength="30" required>
				<br>
				<label for="nachname">Nachname:</label><br>
				<input type="text" name="nachname" id="nachname" maxlength="30" required>
				<br>
				<label for="gebdat">Geburtsdatum:</label><br>
				<input type="date" name="Gebdatum" id="Gebdatum">
                <br>
                <br>
                <br>				
				<label for="mail">E-Mail:</label><br>
				<input id="mail" name="email" type="email" required>
				<br>
				<label for="mail">E-Mail Bestätigung:</label><br>
				<input id="mailbestätigung" name="email" type="email" required>
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