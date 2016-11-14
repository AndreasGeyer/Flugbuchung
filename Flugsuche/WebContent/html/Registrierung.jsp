<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="../style/main.css" />
		<link rel="stylesheet" type="text/css" href="../style/Registrierung.css" />
		<script type="text/javascript" src="../js/user.js"></script>
	</head>
	<body>
		<%@ include file="Header.jspf" %>
		<div id="main">
		
		<article>
		<form>
			<h1>Registrieren</h1><br>
			<br>
			<fieldset>
				<label for="vorname">Vorname:</label><br>
				<input type="text" name="vorname" id="vorname" maxlength="30" required>
				<br>
				<label for="nachname">Nachname:</label><br>
				<input type="text" name="nachname" id="nachname" maxlength="30" required>
				<br>
				<label for="gebdat">Geburtsdatum:</label><br>
				<input type="date" name="Gebdatum" id="Gebdatum">
                <br>
				<label for="benutzername">Benutzername:</label><br>
				<input type="text" name="benutzername" id="benutername" maxlength="30" required>
				<br>
				<label for="passwort">Passwort:</label><br>
				<input type="password" name="passwort" id="passwort" maxlength="30" required>
				<br>
				<label for="mail">E-Mail:</label><br>
				<input id="mail" name="email" type="email" required>
				<br>
				<label for="mail">E-Mail Bestätigung:</label><br>
				<input id="mail" name="email" type="email" required>
				<br>
				<p>Bitte Wählen Sie Ihre Account-Art:</p>
				<p>
					<input type="checkbox" name="normal" id="normal">
						<label for="normal" id="normal">Normal</label><br>
					<input type="checkbox" name="premium" id="normal">
						<label for="premium" id="premium">Premium</label><br>
				</p><br>
				<from methode="post" enctype="multipart/from-data">
					<p>Profilbild auswählen:
						<input type="file" name="bild" accept="image/*">
					</p>
				</from>
			</fieldset>
			
		</form>
		</article>
		<div id="Button-Registrierung">
			<button type="submit">registrieren</button>
		</div>
		</div>		
		<%@ include file="Footer.jspf" %>
	</body>
</html>