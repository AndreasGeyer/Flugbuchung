<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Premium</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/premium.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/premium.js"></script>
</head>
<body>
	<%@ include file="Header.jspf"%>
	<div id="main">
		<article>
			<h1>Premium entdecken!</h1>
			<p>Du willst nie wieder ein Angebot verpassen? Du willst nie
				wieder lange nach dem besten Flug für dich suchen? Du willst nie
				wieder nervenraubende Suchen machen? Dann entscheide dich jetzt für
				Premium! Für nur 9,99€ im Jahr bekommst du die immer aktuellsten
				Angebote und wirst bei deinen Suchen beraten, ob du mit dem Buchen
				noch warten solltest!</p>
			<div>
				<button id="kredit" class="aktiviert" onclick="oeffneKarte()">Mit
					Kreditkarte bezahlen</button>
				<button id="last" onclick="oeffneLast()">Per Lastschrift
					bezahlen</button>
			</div>
			<form id="kreditkarte" class="aktiviert">
				<p>
					<label>Kreditkartennummer</label> <input type="text"
						name="kartennr">
				</p>
				<p>
					<label>Prüfnummer</label> <input type="text" name="preufnr">
				</p>
				<button type="submit" class="submitButton">Zahlungspflichtig
					abschließen!</button>
			</form>
			<form id="lastschrift">
				<p>
					<label>IBAN</label> <input type="text" name="iban">
				</p>
				<p>
					<label>BIC</label> <input type="text" name="bic">
				</p>
				<button type="submit" class="submitButton">Zahlungspflichtig
					abschließen!</button>
			</form>
		</article>
	</div>
	<%@ include file="Footer.jspf"%>
</body>
</html>