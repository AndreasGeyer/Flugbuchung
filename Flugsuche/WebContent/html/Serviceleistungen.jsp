<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.text.*"%>


<%@ page import="java.util.*"%>
<%@ page import="flugsuche.bean.*"%>
<%@ page import="flugsuche.bean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Flugsuche THI</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/Serviceleistungen.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/startseite.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/serviceleistung.js"></script>
</head>
<body>
	<%@ include file="Header.jspf"%>

	<main>

	<div id="navigation">
		<nav>
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/html/Flugsuche.jsp">Flug
						wählen</a></li>
				<li><a>Serviceleistungen</a></li>
				<li><a>Passagierdaten</a></li>
				<li><a>Zahlung</a></li>
				<li><a>Bestätigung</a></li>
			</ul>
		</nav>
	</div>

	<%
		List<Zusatzleistung> leistungHin = (ArrayList) session.getAttribute("serviceHin");
		List<Zusatzleistung> leistungRueck = (ArrayList) session.getAttribute("serviceRueck");
		Flug hinflug = (Flug) request.getAttribute("hinflug");
		Flug rueckflug = (Flug) request.getAttribute("rueckFlug");
	%>


	<h1>Bitte Wählen Sie Ihre zusätzlichen Serviceleistungen</h1>

	<div class="aufTeilung">


		<c:set var="hinflugVers" value="${hinflug.getVersicherung()}"  scope="request"/>
		<c:set var="rueckflugVers" value="${rueckFlug.getVersicherung()}" scope="request" />
		<c:if test="${not empty hinflugVers || not empty rueckflugVers }">

			<div class="service">
				<img
					src="${pageContext.request.contextPath}/img/Serviceleistungen/versicherung.jpg"
					style="width: 20%; height: 23%;">
				<div id="insurance">
					<h2>Reiseversicherung</h2>

					<c:if test="${not empty hinflugVers }">

						<div id="kindInsurance">
							<div id="sonder">

								<h3>
									<strong>${hinflugVers.bezeichnung }</strong>
								</h3>
								<ul>


									<c:forEach
										items="${hinflug.getTextZusatzleistung(hinflug.getVersicherung())}"
										var="parameter">

										<li>${parameter}</li>
									</c:forEach>




								</ul>
								<div>

									<input type="checkbox"
										id="${hinflugVers.id}_${hinflugVers.preis}-${hinflugVers.bezeichnung}"
										onclick="selectVersicherung(event)">
									<p>
										nur <span><strong> <fmt:formatNumber type="number"
												pattern="#.##" value="${hinflugVers.preis}" /> &#8364;
										</strong></span>pro Person
								</div>
							</div>
					</c:if>


					<c:if test="${not empty rueckflugVers }">
						<c:if test=""></c:if>
						<div id="normal">

							<h3>${rueckflugVers.bezeichnung}</h3>
							<ul>


								<c:forEach
									items="${rueckFlug.getTextZusatzleistung(rueckFlug.getVersicherung())}"
									var="parameter">

									<li>${parameter}</li>
								</c:forEach>



							</ul>
							<div>
								<input type="checkbox"  			id="${rueckflugVers.id}_${rueckflugVers.preis}-${rueckflugVers.bezeichnung}" onclick="selectVersicherung(event)">
								<p>
									nur <span><strong><fmt:formatNumber type="number"
												pattern="#.##" value="${rueckflugVers.preis}" /> &#8364; </strong> </span>pro Person
								</p>
							</div>
						</div>
					</c:if>

				</div>


			</div>
		</c:if>
	</div>


	<%-- 	<%
		if ((hinflug.getMahlzeiten() != null && hinflug.getMahlzeiten().size() > 0) || (rueckflug != null
				&& rueckflug.getMahlzeiten() != null && rueckflug.getMahlzeiten().size() > 0)) {
	%>  --%> <c:set var="hinMahlzeiten" value="${hinflug.getMahlzeiten()}" scope="request" />
	<c:set var="rueckMahlzeiten" value="${rueckFlug.getMahlzeiten()}" scope="request" /> <c:if
		test="${not empty hinMahlzeiten  || not empty rueckMahlzeiten }">

		<div id="food">

			<img
				src="${pageContext.request.contextPath}/img/Serviceleistungen/Service.jpg"
				style="width: 30%; height: 33%;">
			<div id="insurance">
				<h2>Verpflegung</h2>
				<div id="a">
					<%

							List<Zusatzleistung> hinZus = hinflug.getMahlzeiten();

							if (rueckflug != null) {
								hinZus.addAll(rueckflug.getMahlzeiten());
							}

					%>
					<c:set var="Mahlzeitenangebot" value="<%=hinZus%>" scope="request" />
					<c:set var="sizeHin" value="${fn:length(hinMahlzeiten)}" scope="request" />
					<c:set var="counter" value="0" scope="request" />

					<c:forEach items="${Mahlzeitenangebot}" var="mahlzeit">


						<c:choose>
							<c:when test="${counter < sizeHin}">
								<c:set var="zusatz" value="Hin" scope="request" />
								<c:set var="beschreibung"
									value="${hinflug.getTextZusatzleistung(mahlzeit) }" scope="request"/>
							</c:when>

							<c:otherwise>
								<c:set var="zusatz" value="Rueck" scope="request"/>
								<c:set var="beschreibung"
									value="${rueckFlug.getTextZusatzleistung(mahlzeit) }" scope="request"/>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${counter == 0}">
								<c:set var="descrption" value="description visible" scope="request"/>
							</c:when>
							<c:when test="${counter > 0}">
								<c:set var="descrption" value="description unvisible" scope="request" />
							</c:when>
						</c:choose>


						<div class="${descrption}" id="${mahlzeit.id}_${zusatz}">

							<h3>
								<c:out value="${beschreibung[0]}" />
							</h3>

							<h4 id="${mahlzeit.id}_${zusatz}_Bez">${mahlzeit.bezeichnung}</h4>
							<br> <label id="${mahlzeit.id}_${zusatz}_Preis">nur
								<fmt:formatNumber type="number" pattern="#.##"
									value="${mahlzeit.preis}" /> &#8364;
							</label>
							<p>
								<c:out value="${beschreibung[1]}" />
							</p>
						</div>
						<c:set var="counter" value="${counter+1}" />
					</c:forEach>

					<img
						src="${pageContext.request.contextPath}/img/Serviceleistungen/Essen.jpg"
						style="width: 20%; height: 20%;">


					<div class="auswahl">
						<div id="selector">
							<div>
								<h4>Passagier</h4>

								<select class="selectFood" id="pass">

									<%
										int adults = (int) session.getAttribute("erwachsener");
											int kind = (int) session.getAttribute("childs");
											int baby = (int) session.getAttribute("babies");
											int[] arrayPassanger = { adults, kind, baby };
											String[] stringPassenger = { ". Erwachsener", ". Kind", ". Baby" };
											for (int i = 0; i < arrayPassanger.length; i++) {
												for (int j = 1; j <= arrayPassanger[i]; j++) {
									%>
									<option><%=j + " " + stringPassenger[i]%></option>
									<%
										}
											}
									%>



								</select>
							</div>



							<div>
								<h4>Flug</h4>
								<select class="selectFood" id="flyt" onchange="switchFlight()">

									<option selected><c:out
											value="Hinflug: ${hinflug.abFlughafen.ort} nach ${hinflug.anFlughafen.ort}" /></option>



									<c:if test="${not empty rueckFlug}">
										<option>
											<c:out
												value="Rückflug: ${rueckFlug.abFlughafen.ort} nach ${rueckFlug.anFlughafen.ort}" /></option>
									</c:if>
								</select>
							</div>
						</div>


					</div>
				</div>
				<br> <br>
				<div>
					<button class = "submitButton" type="submit" onclick="move('weiter')">weiter</button>
					<button class = "submitButton" type="submit" onclick="move('zurueck')">zurück</button>
					<button class = "submitButton" type="submit" onclick="select()">wählen</button>
					<button class = "submitButton" type="submit" onclick="deleteMeal()">löschen</button>
				</div>
			</div>
		</div>
		<br>
		</div>
	</c:if>

	<div id="price">

		<h1>Gewählte Zusatzleistung:</h1>

		<h2 id="restSumme"></h2>
		<form method="post">
			<button id="weiterPass" class="submitButton"
				formaction="/Flugsuche/ServiceSpeichern" formmethod="post"
				type="submit" onclick="sub()">Weiter zu den Passagieren</button>
		</form>
	</div>

	</main>


	<%@ include file="Footer.jspf"%>
</body>
</html>