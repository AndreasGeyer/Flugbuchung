<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/bestaetigung.css" />



<title>Bestellbestätigung</title>

</head>
<jsp:useBean id="buchung" class="flugsuche.bean.Buchung" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>
	<%@ include file="Header.jspf"%>
	<div id="main">
		<article>
		<h1>Bestellbestätigung für ihre Bestellung</h1>
		<div id="allgDaten">
			<h2>Allgemeine Daten</h2>
			<table>
				<tr class="nr">
					<td>Bestellnummer:</td>
					<td><c:out value="${buchungb.id}" /></td>
				</tr>
				<tr>
					<td>Buchungsdatum:</td>
					<td><fmt:formatDate value="${buchungb.timestamp}" pattern="dd.MM.yyyy" /></td>
				</tr>
				<tr>
					<td>Zahlungsart:</td>
					<td><c:out value="${buchungb.zahlungsart}" /></td>
				</tr>
				<tr>
					<td>Nummer</td>
					<td><c:out value="${buchungb.zahlungsnummer}" /></td>
				</tr>
				<tr>
					<td>Gesamtpreis:</td>
					<fmt:setLocale value="de_DE" scope="session"/>
					<td><fmt:formatNumber value="${buchungb.gesamtPreis}" type="currency"/></td>
				</tr>
			</table>
		</div>
		<div id="bestellpositionen">
			<h2>Bestellpositionen</h2>
			<table>
				<c:forEach items="${buchungb.positionen}" var="position">
					<c:if test="${position.sitzplatz.id != 0}">
						<tr class ="nr">
							<td>Positiosnummer:</td>
							<td><c:out value="${position.positionid}" /></td>
						</tr>
						<tr>
							<td>Flugnummer:</td>
							<td><c:out value="${position.flug.id}" /></td>
						</tr>
						<tr>
							<td>Von:</td>
							<td><c:out value="${position.flug.abFlughafen.ort}" /> 
							(<c:out value="${position.flug.abFlughafen.kuerzel}" />), 
							<c:out value="${position.flug.abFlughafen.land}" /></td>
						</tr>
						<tr>
							<td>Nach:</td>
							<td><c:out value="${position.flug.anFlughafen.ort}" /> 
							 (<c:out value="${position.flug.anFlughafen.kuerzel}" /> ),
							  <c:out value="${position.flug.anFlughafen.land}" /> </td>
						</tr>
						<tr>
							<td>Abflug:</td>
							<td><fmt:formatDate value="${position.flug.abflugzeit}" pattern="HH:mm - dd.MM.yyyy" /></td>
						</tr>
						<tr>
							<td>Flugdauer:</td>
							<td><fmt:formatDate value="${position.flug.abflugzeit}" pattern="HH:mm" /> h</td>
						</tr>
						<tr>
							<td>Sitzplatz:</td>
							<td><c:out value="${position.sitzplatz.id}" /></td>
						</tr>
						<tr>
							<td>Klasse:</td>
							<td><c:if test="${position.sitzplatz.firstClass }">
								Erste Klasse
							</c:if>
							<c:if test="${!position.sitzplatz.firstClass }">
								Economy Klasse
							</c:if>
							</td>
						</tr>
						<tr>
							<td>Vorname des Reisenden:</td>
							<td><c:out value="${position.passagierVorname}" /></td>
						</tr>
						<tr>
							<td>Nachname des Reisenden:</td>
							<td><c:out value="${position.passagierNachname}" /></td>
						</tr>
						<tr>
							<td>Geburtsdatum:</td>
							<td><fmt:formatDate value="${position.geburtsdatum}" pattern="dd.MM.yyyy" /></td>
						</tr>
						<tr>
							<td>Positionspreis</td>
							<td><fmt:formatNumber value="${position.preis}" type="currency"/></td>
						</tr>
					</c:if>
				</c:forEach>
				<c:forEach items="${buchungb.positionen}" var="position">
					<c:if test="${position.sitzplatz.id == 0}">
						<tr class ="nr">
							<td>Positiosnummer:</td>
							<td><c:out value="${position.positionid}" /></td>
						</tr>
						<tr>
							<td>Flugnummer:</td>
							<td><c:out value="${position.flug.id}" /></td>
						</tr>
						<tr>
							<td>Von:</td>
							<td><c:out value="${position.flug.abFlughafen.ort}" /> 
							(<c:out value="${position.flug.abFlughafen.kuerzel}" />), 
							<c:out value="${position.flug.abFlughafen.land}" /></td>
						</tr>
						<tr>
							<td>Nach:</td>
							<td><c:out value="${position.flug.anFlughafen.ort}" /> 
							 (<c:out value="${position.flug.anFlughafen.kuerzel}" /> ),
							  <c:out value="${position.flug.anFlughafen.land}" /> </td>
						</tr>
						<tr>
							<td>Abflug:</td>
							<td><fmt:formatDate value="${position.flug.abflugzeit}" pattern="HH:mm - dd.MM.yyyy" /></td>
						</tr>
						<tr>
							<td>Flugdauer:</td>
							<td><fmt:formatDate value="${position.flug.abflugzeit}" pattern="HH:mm" /> h</td>
						</tr>
						<tr>
							<td>Zusatzleistung:</td>
							<td><c:out value="${position.zusatzleistung.bezeichnung}"  /></td>
						</tr>
						<tr>
							<td>Positionspreis</td>
							<td><fmt:formatNumber value="${position.preis}" type="currency"/></td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
		</article>
	</div>
	<%@ include file="Footer.jspf"%>

</body>
</html>