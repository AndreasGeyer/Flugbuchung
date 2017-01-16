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


	<!-- Autor Magdalena Hora -->

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
				<form action="${pageContext.request.contextPath}/UserAnlegen" method="post">
					<fieldset><legend>Registrierung</legend>
						
						<table>
						<div>
							<tr>
								<td><label>Anrede</label></td>
								<td><select name="anrede">
										<option value="Herr">Herr</option>
										<option value="Frau">Frau</option>
								</select></td>
							</tr>
							</div>
						<div>
						<tr>
								<td><label>Titel</label></td>
								<td><select name="titel">
										<option value=null>-</option>
										<option value="Dr.">Dr.</option>
										<option value="Prof.">Prof.</option>
										<option value="Prof. Dr.">Prof. Dr.</option>
								</select></td>
							</tr>
						</div>
						</table>
						
						<div>
						<label for="vorname">Vorname:</label>
							<input type="text" name="vorname" id="vorname" maxlength="30" required><span></span>
						</div>
						
						<div>
						<label for="nachname">Nachname:</label> 
							<input type="text" name="nachname" id="nachname" maxlength="30" required> <span></span>
						</div>
						
						<div>	
						<label for="gebdat">Geburtsdatum:</label> 
							<input type="date" name="Gebdatum" id="Gebdatum"> <span></span>
						</div>
						
						<div>
						<label for="passwort">Passwort:</label>
							<input type="password" name="passwort" id="passwort"maxlength="30" required> <span></span> 
						</div>
						
						<div>	
						<label for="email">Email:</label>
							<input type="email" name="email" id="email" maxlength="40" required> <br> <span></span>
						</div>
						
						<div>
						<label for="strasse">Straße:</label> 
							<input type="text" name="strasse" id="strasse" required> <span></span>
						</div>
						
						<div>	
						<label for="hausnr">Hausnummer:</label> 
							<input type="text" name="hausnr" id="hausnr" maxlength="10" required> <span></span>
						</div>
						
						<div>	
						<label for="plz">Postleitzahl:</label> 
							<input type="text" name="plz" id="plz" maxlength="10" required> <span></span>
						</div>
						
						<div>
						<label for="ort">Ort:</label> 
							<input type="text" name="ort" id="ort" maxlength="30" required> <span></span>
						</div>
						
						<div>	
							<button type="submit" onclick="prüfung()">speichern</button>
						</div>
					</fieldset>

				</form>
			</article>
			
	<%@ include file="Footer.jspf"%>
</body>
</html>
