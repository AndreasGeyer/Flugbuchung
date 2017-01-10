<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Flugsuche THI</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/startseite.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/startseite.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/airportAutocomplet.js"></script>
</head>
<body>
	<%@ include file="Header.jspf"%>
	<div id="main">
		<article id="Suche">
			<h1>Flugsuche</h1>
			<div>
				<h2>Finden Sie schnell und einfach Ihren Flug!</h2>
				<form>
					<table>
						<tr>
							<th>Von</th>
							<th>Nach</th>
							<th>Am</th>
						</tr>
						<tr>
							<td><input placeholder="Abflughafen" type="text"
								id="ablflug" onkeyup="loadAirports(event)" autocomplete="off"
								name="hinflug" value="${abflughafen.ort}" required>
								<div class="autocompletAirport" id="ablflugAutocomplet"></div></td>
							<td><input autocomplete="off" placeholder="Ankunftshafen"
								type="text" id="ankunft" name="rueckflug"
								onkeyup="loadAirports(event)" value="${ankufthafen.ort}"
								required>
								<div class="autocompletAirport" id="ankunftAutocomplet"></div></td>
							<td><input type="date" name="datumhin" required /></td>
						</tr>
					</table>
					<button type="submit" class="submitButton"
						formaction="/Flugsuche/Flugbuchung" formmethod="post">Suchen</button>
				</form>
			</div>
		</article>
		<article id="Angebote">
			<h1>Angebote</h1>
			<div class="visible Angebot1">
				<h2>One Night in Bankog</h2>
				<div id="Angebotsinhalt">
					<button id="vorherigesAngebot" onclick="vorherigesAngebot()"></button>
					<img src="../img/Bangkok.jpg" />
					<div>
						<p>Hier ist irgendein Beschreibungstext</p>
						<p class="alterPreis">999,99€</p>
						<p class="neuerPreis">399,99€</p>
					</div>
					<button id="naechstesAngebot" onclick="naechstesAngebot()"></button>
				</div>
				<button id="AlleAngebote">Weitere Angebote</button>
				<button class="submitButton">Zum Angebot</button>
			</div>
			<div class="unvisible Angebot2">
				<h2>Yolo Night in Bankog</h2>
				<div id="Angebotsinhalt">
					<button id="vorherigesAngebot" onclick="vorherigesAngebot()"></button>
					<img src="../img/Bangkok.jpg" />
					<div>
						<p>Hier ist irgendein Beschreibungstext</p>
						<p class="alterPreis">999,99€</p>
						<p class="neuerPreis">399,99€</p>
					</div>
					<button id="naechstesAngebot" onclick="naechstesAngebot()"></button>
				</div>
				<button id="AlleAngebote">Weitere Angebote</button>
				<button class="submitButton">Zum Angebot</button>
			</div>
			<div class="unvisible Angebot3">
				<h2>GUTE Night in Bankog</h2>
				<div id="Angebotsinhalt">
					<button id="vorherigesAngebot" onclick="vorherigesAngebot()"></button>
					<img src="img/Bangkok.jpg" />
					<div>
						<p>Sichern Sie sich jetzt das ultimative Erholungswochenende
							in der Erlebnismetropole Bangkog.</p>
						<p class="alterPreis">999,99€</p>
						<p class="neuerPreis">299,99€</p>
					</div>
					<button id="naechstesAngebot" onclick="naechstesAngebot()"></button>
				</div>
				<button id="AlleAngebote">Weitere Angebote</button>
				<button class="submitButton">Zum Angebot</button>
			</div>
		</article>
	</div>
	<%@ include file="Footer.jspf"%>
</body>
</html>