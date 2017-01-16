<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
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
				<li><a
					href="${pageContext.request.contextPath}/html/Serviceleistungen.jsp">Serviceleistungen</a></li>
				<li><a
					href="${pageContext.request.contextPath}/html/Passagier.jsp">Passagierdaten</a></li>
				<li><a
					href="${pageContext.request.contextPath}/html/Zahlungsart.jsp">Zahlung</a></li>
				<li><a href="#">Bestätigung</a></li>
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

		<%
			if (hinflug.getVersicherung() != null || (rueckflug != null && rueckflug.getVersicherung() != null)) {
		%>
		<div class="service">
			<img
				src="${pageContext.request.contextPath}/img/Serviceleistungen/versicherung.jpg"
				style="width: 20%; height: 23%;">
			<div id="insurance">
				<h2>Reiseversicherung</h2>
				<%
					if (hinflug.getVersicherung() != null) {
							Zusatzleistung vers = hinflug.getVersicherung();
				%>
				<div id="kindInsurance">
					<div id="sonder">

						<h3>
							<strong></strong><br><%=vers.getBezeichnung()%>
						</h3>
						<ul>
							<%
								for (String string : hinflug.getTextZusatzleistung(vers)) {
							%>
							<li><%=string%></li>
							<%
								}
							%>



						</ul>
						<div>
							<input type="checkbox">
							<p>
								nur <span><%=vers.getPreis()%> € </span>pro Person
						</div>
					</div>
					<%
						}
							if (rueckflug != null && rueckflug.getVersicherung() != null) {
								Zusatzleistung vers = rueckflug.getVersicherung();
					%>
					<div id="normal">

						<h3><%=vers.getBezeichnung()%></h3>
						<ul>
							<%
								for (String string : hinflug.getTextZusatzleistung(vers)) {
							%>
							<li><%=string%></li>
							<%
								}
							%>
						</ul>
						<div>
							<input type="checkbox">
							<p>
								nur <span><%=vers.getPreis()%> €</span>pro Person
							</p>
						</div>
					</div>
					<%
						}
					%>


				</div>


			</div>
		</div>
		<%
			}
		%>
		<%
			if ((hinflug.getMahlzeiten() != null && hinflug.getMahlzeiten().size() > 0) || (rueckflug != null
					&& rueckflug.getMahlzeiten() != null && rueckflug.getMahlzeiten().size() > 0)) {
		%>
		<div id="food">

			<img
				src="${pageContext.request.contextPath}/img/Serviceleistungen/Service.jpg"
				style="width: 30%; height: 33%;">
			<div id="insurance">
				<h2>Verpflegung</h2>
				<div id="a">
					<%
						DecimalFormat df = new DecimalFormat("#.##");
							List<Zusatzleistung> hinZus = hinflug.getMahlzeiten();
							int sizehinZus = hinZus.size();
							int counter = 0;
							if (rueckflug != null) {
								hinZus.addAll(rueckflug.getMahlzeiten());
							}
							for (Zusatzleistung leistung : hinZus) {
								String zusatz = "";

								String[] beschreibung = null;
								if (counter < sizehinZus) {
									zusatz = "Hin";
									beschreibung = hinflug.getTextZusatzleistung(leistung);
								} else {
									zusatz = "Rueck";
									beschreibung = rueckflug.getTextZusatzleistung(leistung);
								}
								String description = "description unvisible";
								if (counter == 0) {
									description = "description visible";
								}
								counter++;
					%>


					<div class="<%=description%>"
						id="<%=leistung.getId() + "_" + zusatz%>">
						<h3><%=beschreibung[0]%></h3>
						<h4 id="<%=leistung.getId() + "_" + zusatz + "_Bez"%>"><%=leistung.getBezeichnung()%></h4>
						<br> <label
							id="<%=leistung.getId() + "_" + zusatz + "_Preis"%>">nur <%=df.format(leistung.getPreis())%>
							€
						</label>
						<p><%=beschreibung[1]%></p>
					</div>

					<%
						}
					%>

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

									<option selected><%="Hinflug: " + hinflug.getAbFlughafen().getOrt() + " nach " + hinflug.getAnFlughafen().getOrt()%></option>
									<%
										if (rueckflug != null) {
									%>
									<option><%="Rückflug: " + rueckflug.getAbFlughafen().getOrt() + " nach "
							+ rueckflug.getAnFlughafen().getOrt()%></option>
									<%
										}
									%>


								</select>
							</div>
						</div>


					</div>
				</div>
				<br> <br>
				<div>
					<button type="submit" onclick="move('weiter')">weiter</button>
					<button type="submit" onclick="move('zurück')">zurück</button>
					<button type="submit" onclick="select()">wählen</button>
				</div>
			</div>
		</div>
		<br>

	</div>
	<%
		}
	%>

	<div id="price">

		<h1>Gewählte Zusatzleistung:</h1>

		<h2 id="restSumme"></h2>
		<form method="post">
			<button id="weiterPass" formaction="/Flugsuche/Flugbuchung"
				formmethod="post" type="submit" onclick="sub()">Weiter zu
				den Passagieren</button>
		</form>
	</div>

	</main>


	<%@ include file="Footer.jspf"%>
</body>
</html>