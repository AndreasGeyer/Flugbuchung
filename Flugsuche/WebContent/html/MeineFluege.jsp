<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>User</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/meineFluege.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/meineFluege.js"></script>
</head>
<body>
	<%@ include file="Header.jspf"%>
	<div id="main">
		<h1>Ihre gebuchten Flüge</h1>
		<table>
			<tr class="ueberschriftbuchung">
				<th>Buchungsnummer</th>
				<th>Buchungdatum</th>
				<th>Zahlungsart</th>
				<th>Gesamtpreis</th>
			</tr>
			<tr class="buchung" id="buchung1234" onclick="switchDetails('1234')">
					<td>1234</td>
					<td>01.01.2017</td>
					<td>Kredikarte</td>
					<td>130,00 €</td>
				</tr>
			<tr class="detail">
			<td colspan="4" id="detail1234" class="unsichtbar"><table>
				
				<tr class="ueberschriftSitzplatz">
					<th>Positionsnummer</th>
					<th>Flugnr.</th>
					<th>Flug</th>
					<th>Zeit</th>
					<th>Sitzplatz</th>
					<th>Reisender</th>
					<th>Positionspreis</th>
				</tr>
				<tr class="positionSitzplatz">
					<td>1231</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td>A5</td>
					<td>Geyer, Andreas</td>
					<td>55,00 €</td>
				</tr>
				<tr class="positionSitzplatz">
					<td>1232</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td>A4</td>
					<td>Fresia, Jessica</td>
					<td>55,00 €</td>
				</tr>
				<tr class="ueberschriftZusatzleistung">
					<th>Positionsnummer</th>
					<th>Flugnr.</th>
					<th>Flug</th>
					<th>Zeit</th>
					<th colspan="2">Zusatzleistung</th>
					<th>Positionspreis</th>
				</tr>
				<tr class="positionZusatzleistung">
					<td>1233</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td colspan="2">Frühstück</td>
					<td>10,00 €</td>
				</tr>
				<tr class="positionZusatzleistung">
					<td>1234</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td colspan="2">Frühstück</td>
					<td>10,00 €</td>
				</tr>
				</table>
				</td>
			</tr>
			<tr class="buchung" id="buchung1235" onclick="switchDetails('1235')">
					<td>1235</td>
					<td>01.01.2017</td>
					<td>Kredikarte</td>
					<td>130,00 €</td>
				</tr>
			<tr class="detail">
			<td colspan="4" id="detail1235" class="unsichtbar"><table>
				
				<tr class="ueberschriftSitzplatz">
					<th>Positionsnummer</th>
					<th>Flugnr.</th>
					<th>Flug</th>
					<th>Zeit</th>
					<th>Sitzplatz</th>
					<th>Reisender</th>
					<th>Positionspreis</th>
				</tr>
				<tr class="positionSitzplatz">
					<td>1231</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td>A5</td>
					<td>Geyer, Andreas</td>
					<td>55,00 €</td>
				</tr>
				<tr class="positionSitzplatz">
					<td>1232</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td>A4</td>
					<td>Fresia, Jessica</td>
					<td>55,00 €</td>
				</tr>
				<tr class="ueberschriftZusatzleistung">
					<th>Positionsnummer</th>
					<th>Flugnr.</th>
					<th>Flug</th>
					<th>Zeit</th>
					<th colspan="2">Zusatzleistung</th>
					<th>Positionspreis</th>
				</tr>
				<tr class="positionZusatzleistung">
					<td>1233</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td colspan="2">Frühstück</td>
					<td>10,00 €</td>
				</tr>
				<tr class="positionZusatzleistung">
					<td>1234</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td colspan="2">Frühstück</td>
					<td>10,00 €</td>
				</tr>
				</table>
				</td>
			</tr>
			<tr class="buchung" id="buchung1236" onclick="switchDetails('1236')">
					<td>1236</td>
					<td>01.01.2017</td>
					<td>Kredikarte</td>
					<td>130,00 €</td>
				</tr>
			<tr class="detail">
			<td colspan="4" id="detail1236" class="unsichtbar"><table>
				
				<tr class="ueberschriftSitzplatz">
					<th>Positionsnummer</th>
					<th>Flugnr.</th>
					<th>Flug</th>
					<th>Zeit</th>
					<th>Sitzplatz</th>
					<th>Reisender</th>
					<th>Positionspreis</th>
				</tr>
				<tr class="positionSitzplatz">
					<td>1231</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td>A5</td>
					<td>Geyer, Andreas</td>
					<td>55,00 €</td>
				</tr>
				<tr class="positionSitzplatz">
					<td>1232</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td>A4</td>
					<td>Fresia, Jessica</td>
					<td>55,00 €</td>
				</tr>
				<tr class="ueberschriftZusatzleistung">
					<th>Positionsnummer</th>
					<th>Flugnr.</th>
					<th>Flug</th>
					<th>Zeit</th>
					<th colspan="2">Zusatzleistung</th>
					<th>Positionspreis</th>
				</tr>
				<tr class="positionZusatzleistung">
					<td>1233</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td colspan="2">Frühstück</td>
					<td>10,00 €</td>
				</tr>
				<tr class="positionZusatzleistung">
					<td>1234</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td colspan="2">Frühstück</td>
					<td>10,00 €</td>
				</tr>
				</table>
				</td>
			</tr>
			<tr class="buchung" id="buchung12323" onclick="switchDetails('12323')">
					<td>12323</td>
					<td>01.01.2017</td>
					<td>Kredikarte</td>
					<td>130,00 €</td>
				</tr>
			<tr class="detail">
			<td colspan="4" id="detail12323" class="unsichtbar"><table>
				
				<tr class="ueberschriftSitzplatz">
					<th>Positionsnummer</th>
					<th>Flugnr.</th>
					<th>Flug</th>
					<th>Zeit</th>
					<th>Sitzplatz</th>
					<th>Reisender</th>
					<th>Positionspreis</th>
				</tr>
				<tr class="positionSitzplatz">
					<td>1231</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td>A5</td>
					<td>Geyer, Andreas</td>
					<td>55,00 €</td>
				</tr>
				<tr class="positionSitzplatz">
					<td>1232</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td>A4</td>
					<td>Fresia, Jessica</td>
					<td>55,00 €</td>
				</tr>
				<tr class="ueberschriftZusatzleistung">
					<th>Positionsnummer</th>
					<th>Flugnr.</th>
					<th>Flug</th>
					<th>Zeit</th>
					<th colspan="2">Zusatzleistung</th>
					<th>Positionspreis</th>
				</tr>
				<tr class="positionZusatzleistung">
					<td>1233</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td colspan="2">Frühstück</td>
					<td>10,00 €</td>
				</tr>
				<tr class="positionZusatzleistung">
					<td>1234</td>
					<td>abs123</td>
					<td>Berlin nach München</td>
					<td>7:30 - 8:45</td>
					<td colspan="2">Frühstück</td>
					<td>10,00 €</td>
				</tr>
				</table>
				</td>
			</tr>
		</table>
	</div>
	<%@ include file="Footer.jspf"%>
</body>
</html>