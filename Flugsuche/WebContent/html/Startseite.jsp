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
		<form method="POST">
				<article id="Angebote">
			<h1>Angebote</h1>
			<div class="visible Angebot1">
				<h2>Von Berlin nach London</h2>
				<div id="Angebotsinhalt">
					<button id="vorherigesAngebot" onclick="vorherigesAngebot()"></button>
					<img src="../img/Angebot/London.jpg" />
					<div>
						<c>Ready for Tee-Time?</c> <br>
						<p>London gilt als größte, aufregendste und auch als teuerste Stadt Westeuropas. Die englische Hauptstadt ist quirlig und modern.  Im historischen Zentrum reiht sich eine Sehenswürdigkeit an die nächste. Traditionen wie die Schlüsselzeremonie im Tower überdauern die rasanten Veränderungen, denen die Stadt ausgesetzt ist.</p>
						<p class="alterPreis">115,99€</p>
						<p class="neuerPreis">89,89€</p>
					</div>
					<button id="naechstesAngebot" onclick="naechstesAngebot()"></button>
				</div>
				<button id="AlleAngebote" href="../html/Angebotsseite.jsp">Weitere Angebote</button>
				<button class="submitButton" formaction="/Flugsuche/Flugbuchung?hinflug=London?rueckflug=Berlin?datumhin=02.12.2017" formmethod="get">Zum Angebot</button>
			</div>
			<div class="unvisible Angebot2">
				<h2>Von München nach Madrid</h2>
				<div id="Angebotsinhalt">
					<button id="vorherigesAngebot" onclick="vorherigesAngebot()"></button>
					<img src="../img/Angebot/madrid.jpg" />
					<div>
						<c>Madrid: Das pulsierende Herz Spaniens </c><br> 
						<p>Madrid zeigt sich als aufregende Metropole, die bis in den frühen Morgen hinein in Bewegung ist. Ausgezeichnete Kultur, gute Gastronomie, Lebendigkeit und Sehenswürdigkeiten machen die spanische Hauptstadt zu einem der spannendsten Städtereiseziele in Spanien.</p>
						<p class="alterPreis">135,50€</p>
						<p class="neuerPreis">100,50€</p>
					</div>
					<button id="naechstesAngebot" onclick="naechstesAngebot()"></button>
				</div>
				<button id="AlleAngebote" href="../html/Angebotsseite.jsp">Weitere Angebote</button>
				<button class="submitButton" formaction="/Flugsuche/Flugbuchung?hinflug=Madrid?rueckflug=München?datumhin=05.03.2017" formmethod="get">Zum Angebot</button>
			</div>
			<div class="unvisible Angebot3">
				<h2>Von Frankfurt nach Zürich</h2>
				<div id="Angebotsinhalt">
					<button id="vorherigesAngebot" onclick="vorherigesAngebot()"></button>
					<img src="../img/Angebot/zuerich.jpg"/>
					<div>
						<c>Einmal in die Berge </c><br> 
						<p>Die Stadt Zürich liegt an der nördlichen Spitze des Zürichsees im Schweizer Mittelland. Zu den Sehenswürdigkeiten von Zürich zählen die engen Gassen in der westlichen Altstadt wie die historische 'Schipfe'. Im Osten liegt das Großmünster, das Rathaus und sowie die Spiegelgasse und der Neumarkt.</p>
						<p class="alterPreis">88,25</p>
						<p class="neuerPreis">66,00€</p>
					</div>
					<button id="naechstesAngebot" onclick="naechstesAngebot()"></button>
				</div>
				<button id="AlleAngebote" herf="../html/Angebotsseite.jsp">Weitere Angebote</button>
				<button class="submitButton" formaction="/Flugsuche/Flugbuchung?hinflug=Zürich?rueckflug=Frankfurt?datumhin=08.07.2017" formmethod="get">Zum Angebot</button>
			</div>
			<div class="unvisible Angebot4">
				<h2>Von München nach Barcelona</h2>
				<div id="Angebotsinhalt">
					<button id="vorherigesAngebot" onclick="vorherigesAngebot()"></button>
					<img src="..img/Angebot/Barcelona.jpg" />
					<div>
						<c>Ein Gefühl von Leidenschaft</c> <br> 
						<p>Direkt am Mittelmeer gelegen bietet die Barcelona eine perfekte Kombination von Städtereise und Urlaub am Meer. Die Arbeiten des katalanischen Architekten Antonio Gaudí zählen zum Weltkulturerbe.</p>
						<p class="alterPreis">187,87</p>
						<p class="neuerPreis">123,99€</p>
					</div>
					<button id="naechstesAngebot" onclick="naechstesAngebot()"></button>
				</div>
				<button id="AlleAngebote" herf="../html/Angebotsseite.jsp">Weitere Angebote</button>
				<button class="submitButton" formaction="/Flugsuche/Flugbuchung?hinflug=Barcelona?rueckflug=München?datumhin=08.05.2017" formmethod="get">Zum Angebot</button>
			</div>
		</article>
		</form>
	</div>
	<%@ include file="Footer.jspf"%>
</body>
</html>