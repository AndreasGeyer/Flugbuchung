<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="../style/main.css" />
		<link rel="stylesheet" type="text/css" href="../style/startseite.css" />
	</head>
	<body>
		<%@ include file="Header.jspf" %>
		<div id="main">
			<article id="Suche">
				<h1>Flugsuche</h1>
				<div>
					<h2>Finden Sie schnell und einfach Ihren Flug!</h2>
					<form>
						<table>
							<tr>
								<th>Von</th>					<th>Nach</th>					<th>Am</th>
							</tr>
							<tr>
								<td><input type="text"/></td>	<td><input type=text" /></td>	<td><input type="date"/></td>
							</tr>
						</table>
						<button type="submit" class="submitButton">Suchen</button>
					</form>
				</div>
			</article>
			<article id="Angebote">
				<h1>Angebote</h1>
				<div>
					<h2>One Night in Bankog</h2>
					<div id="Angebotsinhalt">
						<button id="vorherigesAngebot"></button>
						<img src="../img/Bangkok.jpg"/>
						<div>
							<p>Hier ist irgendein Beschreibungstext</p>
							<p class="alterPreis">999,99€</p>
							<p class="neuerPreis">399,99€</p>
						</div>
						<button id="naechstesAngebot"></button>
					</div>
					<button id="AlleAngebote">Weitere Angebote</button>
					<button class="submitButton">Zum Angebot</button>
				</div>
			</article>
		</div>		
		<%@ include file="Footer.jspf" %>
	</body>
</html>