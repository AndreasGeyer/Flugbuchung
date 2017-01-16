<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Flugsuche THI</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/main.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/Zahlungsart.css" />


<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/premium.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/startseite.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Zahlungsart.js"></script>

</head>
<body>
	<%@ include file="Header.jspf"%>

	<main>

	<div id="navigation">
		<nav>
			<ul>
				<li><a href="${pageContext.request.contextPath}/html/Flugsuche.jsp">Flug wählen</a></li>
				<li><a href="${pageContext.request.contextPath}/html/Serviceleistungen.jsp">Serviceleistungen</a></li>
				<li><a href="${pageContext.request.contextPath}/html/Passagier.jsp">Passagierdaten</a></li>
				<li><a href="#">Zahlung</a></li>
				<li><a href="#">Bestätigung</a></li>
			</ul>
		</nav>
	</div>

	<div class="mainField">
		<div id="sidebar">
			<h4>Via Kreditkarte</h4>
			<p>Zahlung via Kreditkarte: Bei dieser Zahlungsart fallen
				Gebühren in Höhe von 5,99€ zusätzlich zur zum Betrag an.</p>
			<br> <img src="${pageContext.request.contextPath}/img/Zahlungsart/kreditkarte.png"
				alt="Kreditkarte" style="width: 150px; height: 83px;"> <br>
			<h4>Via Lastschrift</h4>
			<p>Zahlung via Lastschrift: Bei dieser Zahlungsart wird innerhalb
				von 14 Tagen der Betrag gebührenfrei von dem angegebenen Konto
				angebucht.</p>
			<br> <img src="${pageContext.request.contextPath}/img/Zahlungsart/lastschrift.png"
				alt="Lastschrift" style="width: 80px; height: 83px;">
		</div>
		<div id="main">
			<article>
			
					<h1>Wählen Sie ihre bevorzugte Zahlungsart:</h1>
					<br> <br>
					<fieldset>
						<div id="KredorEC">
							<button id="kredit" class="aktiviert" onclick="oeffneKarte()">Mit
								Kreditkarte bezahlen</button>
							<button id="last" onclick="oeffneLast()">Per Lastschrift
								bezahlen</button>
						</div>
						<form id="kreditkarte" class="aktiviert" action="/Flugsuche/ZahlungSpeichern">
							<p>
								<label>Kreditkartennummer</label> <input type="text"
									id="kartennr" name="kartennr" pattern=".{13,16}"required>
							</p>
							<p>
								<label>Prüfnummer</label> <input type="text" name ="preufnr" id ="preufnr" pattern=".{3}"required>
							</p>
							<button type="submit" class="submitButton" onclick="checkKreditkarte">Buchung
								abschließen!</button>
						</form>
						<form id="lastschrift"  method="post" action="/Flugsuche/ZahlungSpeichern">
							<p>
								<label>IBAN</label> <input type="text" name="iban"  id="iban" pattern=".{22}" required="required">
							</p>
							<p>
								<label>BIC</label> <input type="text" name="bic" id="bic" pattern=".{8,11}"required>
							</p>
							<button type="submit" class="submitButton" onclick="checkLastschrift()">Buchung
								abschließen!</button>
						</form>

					</fieldset>

				
			</article>

		</div>
	</div>


	</main>


	<%@ include file="Footer.jspf"%>
</body>
</html>