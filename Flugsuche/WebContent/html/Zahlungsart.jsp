
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
				<li><a
					href="/Flugsuche/Flugbuchung">Flug
						wählen</a></li>
				<li><a  href="/Flugsuche/ServiceLaden">Serviceleistungen</a></li>
				<li><a  href="/Flugsuche/PassgierLaden">Passagierdaten</a></li>
				<li><a href="/Flugsuche/SitzplatzLaden">Sitzplatz</a></li>
				<li><a class = "selectedA" >Zahlung</a></li>
				<li><a href="#">Bestätigung</a></li>
			</ul>
		</nav>
	</div>

	<div class="mainField">
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
							<button type="submit" class="submitButton" onclick="checkKreditkarte()">Buchung
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