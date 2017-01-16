<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Flugsuche THI</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/main.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/Registrierung.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user.js"></script>
</head>
<body>
	<%@ include file="Header.jspf"%>

	<h1>Registrieren</h1>
	<br>

	<div class="mainField">

		<div id="sidebar">
			<h4>Normalkunde</h4>
			<p>Als Normalekunde bekommen Sie nur bestimmte Angebote
				vorgeschlagen.</p>
			<br> <img src="${pageContext.request.contextPath}/img/Registrierung/Basic.jpg" alt="Normaltarif"
				style="width: 150px; height: 83px;"> <br>
			<h4>Premiumkunde</h4>
			<p>Als Premiumkunde bekommen Sie all unsere Topangebote. Wir
				zeigen Ihnen die aktuellsten Sparmöglichkeiten und alle
				Lieblingsziele.</p>
			<br> <img src="${pageContext.request.contextPath}/img/Registrierung/premium.png" alt="Premium"
				style="width: 150px; height: 93px;"> <br>
		</div>

		<div id="main">
			<article>
				<form>

					<br>
					<fieldset>
						<label for="vorname">Vorname:</label><br> <input type="text"
							name="vorname" id="vorname" maxlength="30" required> <br>
						<label for="nachname">Nachname:</label><br> <input
							type="text" name="nachname" id="nachname" maxlength="30" required>
						<br> <label for="gebdat">Geburtsdatum:</label><br> <input
							type="date" name="Gebdatum" id="Gebdatum"> <br> <label
							for="benutzername">Benutzername:</label><br> <input
							type="text" name="benutzername" id="benutername" maxlength="30"
							required> <br> <label for="passwort">Passwort:</label><br>
						<input type="password" name="passwort" id="passwort"
							maxlength="30" required> <br> <label for="passwort">Passwort
							Bestätigung:</label><br> <input type="password" name="passwort"
							id="passwort bestätigung" maxlength="30" required> <br>
						<label for="mail">E-Mail:</label><br> <input id="mail"
							name="email" type="email" required> <br> <label
							for="mail">E-Mail Bestätigung:</label><br> <input
							id="mailbestätigung" name="email" type="email" required>
						<br>
						<p>Bitte Wählen Sie Ihre Account-Art:</p>
						<p>
							<input id="Normalkunde" type="radio" name="Normalkunde">
							<labelfor="Normalkunde">Normal</label>
							<br>
							<input id="Premiumkunde" type="radio" name="Premiumkunde">
							<label for="Premiumkunde">Premium</label>
							<br>
						</p>
						<br>
						<from methode="post" enctype="multipart/from-data">
						<p>
							Profilbild auswählen: <input type="file" name="bild"
								accept="image/*">
						</p>
						</from>
					</fieldset>

				</form>
			</article>
			<div id="Button-Registrierung">
				<button type="submit" onclick="prüfung()">registrieren</button>
			</div>
		</div>
	</div>
	<%@ include file="Footer.jspf"%>
</body>
</html>