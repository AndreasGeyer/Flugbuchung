<%-- Geyer Andreas --%>
<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Meine gebuchten Flüge</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/meineFluege.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/meineFluege.js"></script>
</head>
<jsp:useBean id="buchung" class="flugsuche.bean.Buchung" />
<jsp:useBean id="flug" class="flugsuche.bean.Flug" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			
			<c:forEach items="${buchungen}" var="buchung">
				<tr class="buchung" id="buchung${buchung.id}" onclick="switchDetails('${buchung.id}')">
					<td><c:out value="${buchung.id}" /></td>
					<td><fmt:formatDate value="${buchung.timestamp}" pattern="dd.MM.yyyy" /></td>
					<td><c:out value="${buchung.zahlungsart}" /></td>
					<fmt:setLocale value="de_DE" scope="session"/>

					<td><fmt:formatNumber value="${buchung.gesamtPreis}" type="currency"/></td>
				</tr>
				<tr class="detail">
				<td colspan="4" id="detail${buchung.id}" class="unsichtbar">
				<table>
					<tr class="ueberschriftSitzplatz">
						<th>Positionsnummer</th>
						<th>Flugnr.</th>
						<th>Flug</th>
						<th>Abflug</th>
						<th>Sitzplatz</th>
						<th>Reisender</th>
						<th>Positionspreis</th>
					</tr>
					<c:forEach items="${buchung.positionen}" var="position">
					<c:if test="${position.sitzplatz.id != 0}">
					<tr class="positionSitzplatz">
						<td><c:out value="${position.positionid}" /></td>
						<td><c:out value="${position.flug.id}" /></td>
						<td><c:out value="${position.flug.abFlughafen.ort}" /> 
							(<c:out value="${position.flug.abFlughafen.kuerzel}" />)
							nach 
							<c:out value="${position.flug.anFlughafen.ort}" /> 
							(<c:out value="${position.flug.anFlughafen.kuerzel}" />)</td>
						<td><fmt:formatDate value="${position.flug.abflugzeit}" pattern="HH:mm - dd.MM.yyyy" />
						(Dauer: <fmt:formatDate value="${position.flug.abflugzeit}" pattern="HH:mm" />)</td>
						<td><c:out value="${position.sitzplatz.id}" /></td>
						<td><c:out value="${position.passagierNachname}" />, <c:out value="${position.passagierVorname}" /></td>
						<td><c:out value="${position.preis}" /> €</td>
					</tr>
					</c:if>
					</c:forEach>
					<tr class="ueberschriftZusatzleistung">
						<th>Positionsnummer</th>
						<th>Flugnr.</th>
						<th>Flug</th>
						<th>Abflug</th>
						<th colspan="2">Zusatzleistung</th>
						<th>Positionspreis</th>
					</tr>
					<c:forEach items="${buchung.positionen}" var="position">
					<c:if test="${position.sitzplatz.id == 0}">
					<tr class="positionZusatzleistung">
						<td><c:out value="${position.positionid}" /></td>
						<td><c:out value="${position.flug.id}" /></td>
						<td><c:out value="${position.flug.abFlughafen.ort}" /> 
							(<c:out value="${position.flug.abFlughafen.kuerzel}" />)
							nach 
							<c:out value="${position.flug.anFlughafen.ort}" /> 
							(<c:out value="${position.flug.anFlughafen.kuerzel}" />)</td>
						<td><fmt:formatDate value="${position.flug.abflugzeit}" pattern="HH:mm - dd.MM.yyyy" />
						(Dauer: <fmt:formatDate value="${position.flug.abflugzeit}" pattern="HH:mm" />)</td>
						<td colspan="2"><c:out value="${position.zusatzleistung.bezeichnung}" /></td>
						<td><c:out value="${position.preis}" /> €</td>
					</tr>
					</c:if>
					</c:forEach>
				</table></td></tr>
			</c:forEach>
		</table>
	</div>
	<%@ include file="Footer.jspf"%>
</body>
</html>