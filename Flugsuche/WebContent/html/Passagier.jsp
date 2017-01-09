<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="../style/main.css" />
		<link rel="stylesheet" type="text/css" href="../style/Passagier.css" />
		<script type="text/javascript" src="../js/passagier.js"></script>
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
			
			<fieldset><legend>Passagierdaten</legend>
			
			<table>
				<tr>
				<td><label>Anzahl Passagiere Wählen: </label></td>
						<td><select name="passagieranzahl">
								<option value="Wert1">-</option>
								<option value="Wert2">1</option>
								<option value="Wert3">2</option>
								<option value="Wert4">3</option>
								<option value="Wert5">4</option>
								<option value="Wert6">5</option>
								<option value="Wert7">6</option>
								</select></td>
							</tr>
				</table>
				<div id="Passagier1">
				<h4>Passagier 1:</h4>
				<div class="Eingabe">
				<label for="vorname">Vorname:</label><br>
				<input type="text" name="vorname" id="vorname" maxlength="30" value="${kunde.vorname}" required>
				<br>
				<label for="nachname">Nachname:</label><br>
				<input type="text" name="nachname" id="nachname" maxlength="30" value="${kunde.nachname}" required>
				<br>
				<label for="gebdat">Geburtsdatum:</label><br>
				<input type="date" name="Gebdatum" id="Gebdatum" value="${kunde.geburtsdatum}">
				</div>
                <br>
                <br>
                </div>
                
                <div id="Passagier2">
                <h4>Passagier 2:</h4>
                <div class="Eingabe">
				<label for="vorname">Vorname:</label><br>
				<input type="text" name="vorname" id="vorname" maxlength="30" placeholder="Vorname" required>
				<br>
				<label for="nachname">Nachname:</label><br>
				<input type="text" name="nachname" id="nachname" maxlength="30" placeholder="Nachname" required>
				<br>
				<label for="gebdat">Geburtsdatum:</label><br>
				<input type="date" name="Gebdatum" id="Gebdatum">
				</div>
                <br>
                <br>
                </div>
                
                <div id="Passagier3">
				<h4>Passagier 3:</h4>
				<div class = "Eingabe">
				<label for="vorname">Vorname:</label><br>
				<input type="text" name="vorname" id="vorname" maxlength="30" placeholder="Vorname" required>
				<br>
				<label for="nachname">Nachname:</label><br>
				<input type="text" name="nachname" id="nachname" maxlength="30" placeholder="Nachname" required>
				<br>
				<label for="gebdat">Geburtsdatum:</label><br>
				<input type="date" name="Gebdatum" id="Gebdatum">
				</div>
				</div>
				
				<div id="Passagier4">
				<h4>Passagier 4:</h4>
				<div class = "Eingabe">
				<label for="vorname">Vorname:</label><br>
				<input type="text" name="vorname" id="vorname" maxlength="30" placeholder="Vorname" required>
				<br>
				<label for="nachname">Nachname:</label><br>
				<input type="text" name="nachname" id="nachname" maxlength="30" placeholder="Nachname" required>
				<br>
				<label for="gebdat">Geburtsdatum:</label><br>
				<input type="date" name="Gebdatum" id="Gebdatum">
				</div>
				</div>
				
				<div id="Passagier5">
				<h4>Passagier 5:</h4>
				<div class = "Eingabe">
				<label for="vorname">Vorname:</label><br>
				<input type="text" name="vorname" id="vorname" maxlength="30" placeholder="Vorname" required>
				<br>
				<label for="nachname">Nachname:</label><br>
				<input type="text" name="nachname" id="nachname" maxlength="30" placeholder="Nachname" required>
				<br>
				<label for="gebdat">Geburtsdatum:</label><br>
				<input type="date" name="Gebdatum" id="Gebdatum">
				</div>
				</div>
				
				<div id="Passagier6">
				<h4>Passagier 6:</h4>
				<div class = "Eingabe">
				<label for="vorname">Vorname:</label><br>
				<input type="text" name="vorname" id="vorname" maxlength="30" placeholder="Vorname" required>
				<br>
				<label for="nachname">Nachname:</label><br>
				<input type="text" name="nachname" id="nachname" maxlength="30" placeholder="Nachname" required>
				<br>
				<label for="gebdat">Geburtsdatum:</label><br>
				<input type="date" name="Gebdatum" id="Gebdatum">
				</div>
				</div>
				<br>
				<br>
					<button type="submit">weiter</button>
			</fieldset>
			
		</article>
		
		
		</main>


		<%@ include file="Footer.jspf" %>
	</body>
</html>