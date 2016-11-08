<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="../style/main.css" />
		<link rel="stylesheet" type="text/css" href="../style/user.css" />
		<script type="text/javascript" src="../js/user.js"></script>
	</head>
	<body>
		<%@ include file="Header.jspf" %>
		<div id="main">
			<article>
				<ul>
					<h1>Deine Daten</h1>
					<li class="anzeigen" onclick="oeffneAendern('Name')">
						<h2>Name</h2><span class="inhalt">Herr Andreas Geyer</span><span class="bearbeiten">Bearbeiten</span>
					</li>
					<li id="Name" class="aendern">
						<form>
							<table>
								<tr>
									<td><label>Anrede</label></td>
									<td><select>
										<option>Herr</option>
										<option>Frau</option>
									</select></td>
								</tr>
								<tr>
									<td><label>Titel</label></td>
									<td><select>
										<option>-</option>
										<option>Dr.</option>
										<option>Prof.</option>
										<option>Dr. Prof.</option>
									</select></td>
								</tr>
								<tr>
									<td><label>Vorname</label></td>
									<td><input type="text"/></td>
								</tr>
								<tr>
									<td><label>Nachname</label></td>
									<td><input type="text"/></td>
								</tr>
								<tr>
									<td><button onclick="schlieseAendern('Name')">Abbrechen</button></td>
									<td><button type="submit" class="submitButton">Speichern</button></td>
								</tr>
							</table>
							
						</form>
					</li>
					<li class="anzeigen" onclick="oeffneAendern('Adresse')">
						<h2>Adresse</h2><span class="inhalt">Paulinus-Fröhlich-Straße 12, 85283 Wolnzach</span><span class="bearbeiten">Bearbeiten</span>
					</li>
					<li id="Adresse" class="aendern">
						<form>
							<table>
								<tr>
									<td><label>Straße</label></td>
									<td><input type="text"/></td>
								</tr>
								<tr>
									<td><label>Hausnummer</label></td>
									<td><input type="text"/></td>
								</tr>
								<tr>
									<td><label>Postleitzahl</label></td>
									<td><input type="text"/></td>
								</tr>
								<tr>
									<td><label>Ort</label></td>
									<td><input type="text"/></td>
								</tr>
								<tr>
									<td><button onclick="schlieseAendern('Adresse')">Abbrechen</button></td>
									<td><button type="submit" class="submitButton">Speichern</button></td>
								</tr>
							</table>
							
						</form>
					</li>
					<li class="anzeigen" onclick="oeffneAendern('Geburtsdatum')">
						<h2>Geburtsdatum</h2><span class="inhalt">05.05.1995</span><span class="bearbeiten">Bearbeiten</span>
					</li>
					<li id="Geburtsdatum" class="aendern">
						<form>
							<table>
								<tr>
									<td><label>Geburtsdatum</label></td>
									<td><input type="date"/></td>
								</tr>
								<tr>
									<td><button onclick="schlieseAendern('Geburtsdatum')">Abbrechen</button></td>
									<td><button type="submit" class="submitButton">Speichern</button></td>
								</tr>
							</table>
							
						</form>
					</li>
					<li class="anzeigen" onclick="oeffneAendern('Email')">
						<h2>E-Mail</h2><span class="inhalt">andreas.geyer@geyer-net.de</span><span class="bearbeiten">Bearbeiten</span>
					</li>
					<li id="Email" class="aendern">
						<form>
							<table>
								<tr>
									<td><label>E-Mail</label></td>
									<td><input type="email"/></td>
								</tr>
								<tr>
									<td><button onclick="schlieseAendern('Email')">Abbrechen</button></td>
									<td><button type="submit" class="submitButton">Speichern</button></td>
								</tr>
							</table>
							
						</form>
					</li>
					<li class="anzeigen" onclick="oeffneAendern('Passwort')">
						<h2>Passwort</h2><span class="inhalt">Altes Passwort durch ein Neues ersetzen</span><span class="bearbeiten">Bearbeiten</span>
					</li>
					<li id="Passwort" class="aendern">
						<form>
							<table>
								<tr>
									<td><label>Altes Passwort</label></td>
									<td><input type="password"/></td>
								</tr>
								<tr>
									<td><label>Neues Passwort</label></td>
									<td><input type="password"/></td>
								</tr>
								<tr>
									<td><label>Neues Passwort (wdh)</label></td>
									<td><input type="password"/></td>
								</tr>
								<tr>
									<td><button onclick="schlieseAendern('Passwort')">Abbrechen</button></td>
									<td><button type="submit" class="submitButton">Speichern</button></td>
								</tr>
							</table>
							
						</form>
					</li>
					<li class="anzeigen">
						<h2>Profilbild</h2><span class="inhalt">Altes Profilbild durch ein neues ersetzen</span><span class="bearbeiten">Bearbeiten</span>
					</li>
					<li class="anzeigen">
						<h2>Account</h2><span class="inhalt">Sie benutzen den Standard Account</span><span class="bearbeiten">Bearbeiten</span>
					</li>
				</ul>
				<!-- 				<div id="Premium">
					<p>Sie sind noch kein Premiumkunde. Erfahren Sie jetzt mehr über die Vorteile eines Premiumkunden.
					<button id="PremimumKunde">Mehr erfahren</button>
				</div>-->
				
			</article>
		</div>		
		<%@ include file="Footer.jspf" %>
	</body>
</html>