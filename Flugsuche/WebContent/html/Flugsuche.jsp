<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.text.*"%>


<%@ page import="java.util.*"%>
<%@ page import="flugsuche.bean.*"%>
<%@ page import="flugsuche.bean.*"%>
<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/booking.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/flightSearch.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/kalender.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/airportAutocomplet.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/user.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Flugsuche.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/Flugsuche2.js"></script>
<title>Flugsuche</title>
</head>
<body>
	<%@ include file="Header.jspf"%>

	<%
		List<Flug> direktflug = (List<Flug>) session.getAttribute("direktflug");
		List<Flug> direktflugRueck = (List<Flug>) session.getAttribute("direktflugRueck");
		DateFormat simDateFormat = new SimpleDateFormat("HH:mm");
		Date flugHin = (Date) session.getAttribute("datumHin");
		boolean onlyHinflug = (boolean) session.getAttribute("onlyHinflug");
		Date flugdauerHinMin = new Date(86400000L);
		Date flugdauerHinMax = new Date(1L);
		Date abflugHinMin = new Date(100 * 365 * 86400000L);
		Date abflugHinMax = new Date(1L);
		double minPrice = 99999999;
		double maxPrice = 0;
		Date flugdauerRueckMin = new Date(86400000L);
		Date flugdauerRueckMax = new Date(1L);
		Date abflugRueckMin = new Date(100 * 365 * 86400000L);
		Date abflugRueckMax = new Date(1L);
		double minPriceRueck = 99999999;
		double maxPriceRueck = 0;
		List<Fluggesellschaft> gesellschaftList = new ArrayList<>();
		if(direktflug != null)
		for (Flug flug : direktflug) {
			if (flugdauerHinMin.after(flug.getFlugdauer()))
				flugdauerHinMin = flug.getFlugdauer();
			if (flugdauerHinMax.before(flug.getFlugdauer()))
				flugdauerHinMax = flug.getFlugdauer();
			if (abflugHinMax.before(flug.getAbflugzeit()))
				abflugHinMax = flug.getAbflugzeit();
			if (abflugHinMin.after(flug.getAbflugzeit()))
				abflugHinMin = flug.getAbflugzeit();
			if (minPrice > flug.getPreis())
				minPrice = flug.getPreis();
			if (maxPrice < flug.getPreis())
				maxPrice = flug.getPreis();
			if (!gesellschaftList.contains(flug.getFlugzeugtyp().getGesellschaft())) {
				gesellschaftList.add(flug.getFlugzeugtyp().getGesellschaft());
			}
		}
		if (direktflugRueck != null)
			for (Flug flug : direktflugRueck) {
				if (flugdauerRueckMin.after(flug.getFlugdauer()))
					flugdauerRueckMin = flug.getFlugdauer();
				if (flugdauerRueckMax.before(flug.getFlugdauer()))
					flugdauerRueckMax = flug.getFlugdauer();
				if (abflugRueckMax.before(flug.getAbflugzeit()))
					abflugRueckMax = flug.getAbflugzeit();
				if (abflugRueckMin.after(flug.getAbflugzeit()))
					abflugRueckMin = flug.getAbflugzeit();
				if (minPriceRueck > flug.getPreis())
					minPriceRueck = flug.getPreis();
				if (maxPriceRueck < flug.getPreis())
					maxPriceRueck = flug.getPreis();
				if (!gesellschaftList.contains(flug.getFlugzeugtyp().getGesellschaft())) {
					gesellschaftList.add(flug.getFlugzeugtyp().getGesellschaft());
				}
			}
	%>



	<div id="navigation">
		<nav>
			<ul>
				<li><a href="${pageContext.request.contextPath}/Flugbuchung">Flug wählen</a></li>
				<li><a href="../html/Serviceleistungen.jsp">Serviceleistungen</a></li>
				<li><a href="../html/Passagier.jsp">Passagierdaten</a></li>
				<li><a href="../html/Zahlungsart.jsp">Zahlung</a></li>
				<li><a href="#">Bestätigung</a></li>
			</ul>
		</nav>
	</div>

	<main>
	<form id="suchForm" method="POST" action="/Flugsuche/Flugbuchung">
		<%
			if (direktflug!= null &&  direktflug.size() > 0) {
		%>
		<div class="mainField">
			<div id="filter">

				<div class="stopps">

					<h4>Anzahl Stopps</h4>

					<div>
						<input id="nonStopp" type="checkbox" name="stopp" checked>
						<label for="nonStopp">Non Stopp</label>
					</div>
					<div>
						<input id="oneStopp" type=checkbox name="stopp" checked> <label
							for="oneStopp">1 Stopp</label>
					</div>


				</div>

				<div class="maxPrice">
					<h4>Preis</h4>



					<div>
						<div>
							<span class="info" id="maxPriceHin_span"><strong><%=minPrice + " € bis " + maxPrice + "€"%></strong>
							</span>
						</div>
						<input id="maxPriceHin_input" name="maxPriceHin"
							oninput="displayFlyTime(event)" min="<%=minPrice%>"
							max="<%=maxPrice%>" step="0.01" value="<%=maxPrice%>"
							type="range"> <span class="abstand">Hinflug</span>
					</div>

					<%
						if (direktflugRueck != null && direktflugRueck.size() > 0) {
					%>
					<div>
						<div>
							<span class="info" id="maxPriceRueck_span"><strong><%=minPriceRueck + " € bis " + maxPriceRueck%></strong>
							</span>
						</div>
						<input id="maxPriceRueck_input" oninput="displayFlyTime(event)"
							min="<%=minPriceRueck%>" max="<%=maxPriceRueck%>" step="0.01"
							value="<%=maxPriceRueck%>" type="range"> <span
							class="abstand">Rueckflug</span>
					</div>
					<%
						}
					%>

				</div>

				<div class="dauer">
					<h4>Uhrzeit</h4>


					<div>
						<div>
							<span id="UhrzeitHin_span"><strong><%=simDateFormat.format(abflugHinMin) + "Uhr bis " + simDateFormat.format(abflugHinMax) + "Uhr"%></strong>
							</span>
						</div>
						<input id="UhrzeitHin_input" oninput="displayFlyTime(event)"
							type="range" min="<%=abflugHinMin.getTime()%>"
							max="<%=abflugHinMax.getTime()%>" step="1"
							value="<%=abflugHinMax.getTime()%>"> <span
							class="abstand">Hinflug</span>
					</div>

					<%
						if (direktflugRueck != null && direktflugRueck.size() > 0) {
					%>
					<div>
						<div>
							<span class="with"><strong id="UhrzeitRueck_span"><%=simDateFormat.format(abflugRueckMin) + "Uhr bis " + simDateFormat.format(abflugRueckMax)
							+ "Uhr"%></strong> </span>
						</div>
						<input id="UhrzeitRueck_input" oninput="displayFlyTime(event)"
							type="range" min="<%=abflugRueckMin.getTime()%>"
							max="<%=abflugRueckMax.getTime()%>" step="1"
							value="<%=abflugRueckMax.getTime()%>"> <span
							class="abstand">Rückflug</span>
					</div>
					<%
						}
					%>

				</div>

				<div class="zeit">
					<h4>Flugdauer</h4>


					<div>
						<div>
							<span id="zeitHin_span"><strong><%=simDateFormat.format(flugdauerHinMin) + "h bis " + simDateFormat.format(flugdauerHinMax) + "h"%></strong>
							</span>
						</div>
						<input id="zeitHin_input" oninput="displayFlyTime(event)"
							type="range" min="<%=flugdauerHinMin.getTime()%>"
							max="<%=flugdauerHinMax.getTime()%>" step="1"
							value="<%=flugdauerHinMax.getTime()%>"><span
							class="abstand">Hinflug</span>
					</div>
					<%
						if (direktflugRueck != null && direktflugRueck.size() > 0) {
					%>
					<div>
						<div>
							<span id="zeitRueck_span"><strong><%=simDateFormat.format(flugdauerRueckMin) + "h bis "
							+ simDateFormat.format(flugdauerRueckMax) + "h"%></strong> </span>

						</div>
						<input id="zeitRueck_input" oninput="displayFlyTime(event)"
							type="range" min="<%=flugdauerRueckMin.getTime()%>"
							max="<%=flugdauerRueckMax.getTime()%>" step="1"
							value="<%=flugdauerRueckMax.getTime()%>"> <span
							class="abstand">Rückflug</span>
					</div>
					<%
						}
					%>
				</div>

				<div class="airline">

					<h4>Fluggesellschaft</h4>

					<%
						for (Fluggesellschaft gesellschaft : gesellschaftList) {
					%>

					<div>
						<input oninput="ajax('HinRueck')"
							id="<%=gesellschaft.getBezeichnung()%> " type="checkbox"
							name="fluggesellschaft" checked> <label for="lh"><%=gesellschaft.getBezeichnung()%></label>
					</div>
					<%
						}
					%>


				</div>
			</div>

			<%
				}
			%>

			<div id="main">


				<div id="flightInfo">



					<section class="flightSearchWindow">

						<div class=switchFlight>

							<input type="radio" class="FlugartRadio" id="HinUndRückRadio"
								name="Flugart" value=1 required
								<c:if test="${!onlyHinflug}"> checked </c:if>> <label
								onclick="displayRueckflug(event)" class="flugLabel"
								id="HinUndRück" for="HinUndRückRadio""> Hin-/ Rückflug </label>
							<input id="HinflugRadio" type="radio" class="FlugartRadio"
								name="Flugart" value=2 required
								<c:if test="${onlyHinflug}"> checked </c:if>> <label
								class="flugLabel" id="Hinflug" for="HinflugRadio"
								onclick="displayRueckflug(event)"> nur Hinflug </label>
						</div>
						<div id="flugWrapper">
							<div class="Flug">
								<div class="imageDiv">
									<img
										src="${pageContext.request.contextPath}/img/Flugsuche/planeUp.png"
										alt="plane" style="width: 20px; height: 20px;">
									<h4>von</h4>
								</div>
								<input placeholder="Abflughafen" type="text" id="ablflug"
									onkeyup="loadAirports(event)" autocomplete="off" name="abflug"
									value="${abflughafen.ort}" required>
								<div class="autocompletAirport" id="ablflugAutocomplet"></div>
								<table class="tables" id="möglicheFlüge"></table>
								<div class="imageDiv">
									<img
										src="${pageContext.request.contextPath}/img/Flugsuche//planeDown.png"
										alt="plane" style="width: 20px; height: 20px;">
									<h4>nach</h4>
								</div>
								<input autocomplete="off" placeholder="Ankunftshafen"
									type="text" id="ankunft" name="ankunft"
									onkeyup="loadAirports(event)" value="${ankufthafen.ort}"
									required>
								<div class="autocompletAirport" id="ankunftAutocomplet"></div>
								<table class="tables" id="möglicheFlüge"></table>
							</div>
							<div class="kalender">
								<div class="flyDate" id="hinFly">
									<h4>Hinflug</h4>
									<%
										DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
										String hinDate = "";
										if (flugHin != null)
											hinDate = dateFormat.format(flugHin);
									%>
									<input type="date" id="calendarHin" name="DateHinflug"
										class="Date" placeholder="TT.MM.JJJJ"
										onclick="currentMonthName(calendarHin.id)"
										value="<%=hinDate%>" readonly>

								</div>

								<%
									String id = "";
									if (onlyHinflug == true) {
										id = "rueckFlyNone";
									} else {
										id = "rueckFly";
									}
								%>

								<div class="flyDate" id="<%=id%>">
									<h4>Rückflug</h4>
									<%
										Date flugRueck = (Date) session.getAttribute("datumRueck");
										String rueckDate = "";
										if (flugRueck != null)
											rueckDate = dateFormat.format(flugRueck);
									%>
									<input type="date" id="calendarRueck" class="Date"
										name="DateRueckflug" placeholder="TT.MM.JJJJ"
										onclick="currentMonthName(calendarRueck.id)"
										value="<%=rueckDate%>" pattern="\d{1,2}.\d{1,2}.\d{4}"
										readonly>



								</div>
							</div>
							<div class="passengers">
								<h4>Passagiere</h4>


								<select class="selectPassenger" id="erwachsen" name="adults">
									<optgroup label="Erwachsene(>18 Jahre)">
										<%
											int adults = (int) session.getAttribute("erwachsener");
											int kind = (int) session.getAttribute("childs");
											int baby = (int) session.getAttribute("babies");
											System.out.println(adults);
											for (int i = 1; i <= 5; i++) {
										%>

										<option <%if (adults == i) {%> selected="selected" <%}%>><%=i%>
											Erwachsener
										</option>
										<%
											}
										%>



									</optgroup>
								</select> <select class="selectPassenger" id="kind" name="children">
									<optgroup label="Kinder (2 bis 18 Jahre)">
										<%
											for (int i = 0; i <= 5; i++) {
										%>

										<option <%if (kind == i) {%> selected="selected" <%}%>><%=i%>
											Kind<%
											if (i != 1) {
										%>er<%
											}
										%>
										</option>
										<%
											}
										%>


									</optgroup>

								</select> <select class="selectPassenger" id="babie" name="babies">
									<optgroup label="Baby (bis 2 Jahre)">
										<%
											for (int i = 0; i <= 5; i++) {
										%>

										<option <%if (baby == i) {%> selected="selected" <%}%>><%=i%>
											Baby<%
											if (i != 1) {
										%>s<%
											}
										%>
										</option>
										<%
											}
										%>



									</optgroup>
								</select>




							</div>
						</div>
						<button id="suchButton" type="submit" onclick="checkValidity()"
							formaction="/Flugsuche/Flugbuchung" formmethod="post">Suchen</button>

					</section>




				</div>
				<div id="hinflug">
					<img
						src="${pageContext.request.contextPath}/img/Flugusuche/planeUp.png"
						style="width: 50px; height: 50px;">
					<h1>
						Ihr Hinflug: <span>${abflughafen.ort} - ${ankufthafen.ort}</span>

					</h1>
				</div>
				<%
					TreeMap<Date, Double> map = (TreeMap) session.getAttribute("map");
					DecimalFormat df = new DecimalFormat("#.##");
					int counter = 1;
					if (map.size() > 0) {
				%>
				<div class="wrapper_flugtage">
					<ul>

						<li class="arrow-flugtag" onclick="shiftDate('links','Hin')"><span><</span></li>
						<%
							for (Date date : map.keySet()) {
									String selectedDate = date.toLocaleString().substring(0, 10);
						%>

						<li onclick="submitDate('<%=selectedDate%>','Hin')"
							class="element" id="HinElement_<%=counter++%>"
							<%if (date.compareTo(Utils.getNearestDate(map, flugHin)) == 0) {%>
							name="nearestHin" <%}%>>

							<p>
								<b><%=selectedDate%></b>
							</p>
							<p>
								ab
								<%=df.format(map.get(date))%>
								€
							</p>
						</li>
						<%
							}
						%>
						<li class="arrow-flugtag" onclick="shiftDate('rechts','Hin')"><span>></span></li>

					</ul>
				</div>
				<%
					}
				%>





				<div class="flightPlan">
					<%
						if (direktflug != null && direktflug.size() > 0) {
					%>
					<table id="hinTable">
						<colgroup>
							<col width="60%">

							<col width="20%">
							<col width="20%">

						</colgroup>

						<thead>
							<tr>
							<tr>
								<th>
									<div class="flug_column">
										<p>
											<span>Sortieren nach</span>
										</p>
										<div class="Sortieren">


											<input class="FlugartRadio" id="PreisHin" name="Preis"
												value="1" checked type="radio" onclick="ajax('Hin')">
											<label for="PreisHin"> Preis </label> <input
												onclick="ajax('Hin')" class="FlugartRadio" id="Dauer"
												name="Preis" value="2" type="radio"> <label
												for="Dauer"> Flugdauer </label> <input onclick="ajax('Hin')"
												class="FlugartRadio" id="Stopp" name="Preis" value="3"
												type="radio"> <label for="Stopp"> Abflugzeit
											</label>

										</div>
								</th>
								<th class="flugKlasse" id="economy">Economy Class</th>
								<th class="flugKlasse" id="business">Business Class</th>
							</tr>
						</thead>


						<%
							for (Flug flug : direktflug) {
									int flugid = flug.getId();
						%>
						<tr id="<%=flugid%>">

							<td class="flug_row" colspan="1">
								<div class="wrapper_flugplan">

									<p class="flugplan">
										<%
											String UhrzeitAbflug = simDateFormat.format(flug.getAbflugzeit());
										%>
										<span id="<%=flugid + "_abflugzeit"%>"><strong><%=UhrzeitAbflug%>
												Uhr:&nbsp;</strong></span> <span id="<%=flugid + "_abflugort"%>">
											${abflughafen.ort} (<%=flug.getAbFlughafen().getKuerzel()%>)
										</span>
									</p>
									<%
										String UhrzeitAnkunft = simDateFormat.format(flug.calculateAnkunftZeit());
									%>
									<p class="flugplan">
										<span id="<%=flugid + "_ankunftzeit"%>"><strong><%=UhrzeitAnkunft%>
												Uhr:&nbsp;</strong></span> <span id="<%=flugid + "_ankunftort"%>">
											${ankufthafen.ort} (<%=flug.getAnFlughafen().getKuerzel()%>)
										</span>
									</p>

								</div>
								<div class="wrapper_flugdetail">
									<p class="flugdetails">
										<%
											String reisedauer = simDateFormat.format(flug.getFlugdauer());
										%>
										<span><strong>Reisedauer:&nbsp;</strong></span> <span><%=reisedauer + " h"%></span>
									</p>
									<p class="flugdetails">
										<span><strong>Stopps:&nbsp;</strong>0</span>
									</p>

								</div>



							</td>
							<td>
								<div class="priceField">
									<%
										String preis = "zu wenige Plätze";
												int anzahl_firstClassPlätze = flug.freeSeats(true);
												int anzahl_ecoPlätze = flug.freeSeats(false);
												int passagierZahl = baby + adults + kind;
												if (flug.getPreis() == minPrice) {
									%>
									<div>
										<span class="cheapest">Günstigster Preis</span>
									</div>
									<%
										}
									%>
									<div class="selectorPrice">
										<span class="price"> <%
 	if (anzahl_ecoPlätze > passagierZahl) {
 				preis = df.format(flug.getPreis()) + "€";
 %> <input type="radio" onclick="displayFlightDetails(event,'Hin')"
											name="HinflugInput" id="<%=flugid + "_preisEco"%>"> <%
 	}
 %> <strong> <%=preis%>
										</strong>
										</span>
									</div>
									<%
										if (anzahl_ecoPlätze <= passagierZahl + 4) {
									%>
									<div>
										<span class="lastSeats">Noch <%=anzahl_ecoPlätze%>
											Plätze
										</span>
									</div>
									<%
										}
									%>
								</div>
							</td>
							<td>
								<div class="priceField">
									<div></div>
									<div class="selectorPrice">
										<span class="price"> <%
 	if (anzahl_firstClassPlätze > passagierZahl) {
 				preis = df.format(flug.getPreis() * 3) + "€";
 %> <input type="radio" name="HinflugInput"
											onclick="displayFlightDetails(event,'Hin')"
											id="<%=flugid + "_preisFirst"%>"> <%
 	}
 %><strong> <%=preis%>
										</strong>
										</span>
									</div>

									<%
										if (anzahl_firstClassPlätze <= passagierZahl + 4) {
									%>
									<div>
										<span class="lastSeats">Noch <%=anzahl_firstClassPlätze%>
											Plätze
										</span>
									</div>
									<%
										}
									%>
								</div>
							</td>

						</tr>

						<tr class="unvisibleHin" id="<%=flug.getId() + "_detail"%>">
							<td colspan="4">
								<table id="detail">
									<thead>
										<tr>
											<th>Airline</th>
											<th>Flug</th>
											<th>Abflug</th>
											<th>Ankunft</th>
											<th>Reisedauer</th>

										</tr>
									</thead>
									<tbody>
										<tr>
	

											<% 
												UhrzeitAbflug = UhrzeitAbflug + " Uhr: " + flug.getAbFlughafen().getOrt();
														UhrzeitAnkunft = UhrzeitAnkunft + " Uhr: " + flug.getAnFlughafen().getOrt();
														String flugnr = flug.getFlugzeugtyp().getGesellschaft().getBezeichnung().substring(0, 2)
																+ flug.getId();
														if (flugnr.length() > 5)
															flugnr = flugnr.substring(0, 4);
											%>
											<td><p><%=flug.getFlugzeugtyp().getGesellschaft().getBezeichnung()%></p></td>
											<td><p><%=flugnr%></p></td>
											<td><p><%=UhrzeitAbflug%></p></td>
											<td><p><%=UhrzeitAnkunft%></p></td>
											<td><p><%=reisedauer + " h"%></p></td>
											<td><p></p></td>
										</tr>

									</tbody>
								</table> <%
 	}
 %>
							
						</tbody>
					</table>
					<%
						} else {
					%>
					<p class="fehler">
						<span> <%
 	if (map.size() == 0) {
 %>Es existiert kein Flug von ${abflughafen.ort} nach
							${ankufthafen.ort}! <%
 	} else {
 %>Es konnte leider am <%=hinDate%> kein passender Flug gefunden werden!<%
 	}
 %>
						</span>
					</p>
					<%
						}
					%>
				</div>

				<%
					if (direktflugRueck != null && direktflugRueck.size() > 0) {
				%>

				<div id="rueckflug">
					<img
						src="${pageContext.request.contextPath}/img/Flugusuche/planeUp.png"
						style="width: 50px; height: 50px;">
					<h1>
						Ihr Rückflug: <span>${ankufthafen.ort} - ${abflughafen.ort}</span>

					</h1>
				</div>

				<%
					map = (TreeMap) session.getAttribute("mapRueck");
						if (map != null && map.size() > 0) {
				%>
				<div class="wrapper_flugtage">
					<ul>

						<li class="arrow-flugtag" onclick="shiftDate('links','Rueck')"><span><</span></li>
						<%
							counter = 0;
									for (Date date : map.keySet()) {
										String selectedDate = date.toLocaleString().substring(0, 10);
						%>

						<li onclick="submitDate('<%=selectedDate%>','Rueck')"
							class="element" id="RueckElement_<%=counter++%>"
							<%if (date.compareTo(Utils.getNearestDate(map, flugRueck)) == 0) {%>
							name="nearestRueck" <%}%>>

							<p>
								<b><%=date.toLocaleString().substring(0, 10)%></b>
							</p>
							<p>
								ab
								<%=map.get(date)%>
								€
							</p>
						</li>
						<%
							}
						%>
						<li class="arrow-flugtag" onclick="shiftDate('rechts','Rueck')"><span>></span></li>

					</ul>
				</div>



				<%
					if (direktflugRueck != null && direktflugRueck.size() > 0) {
				%>

				<div class="flightPlan">

					<table id="rueckTable">
						<colgroup>
							<col width="60%">

							<col width="20%">
							<col width="20%">

						</colgroup>

						<thead>
							<tr>
							<tr>
								<th>
									<div class="flug_column">
										<p>
											<span>Sortieren nach</span>
										</p>
										<div class="Sortieren">


											<input class="FlugartRadio" id="PreisRueck" name="inputRueck"
												value="1" checked type="radio" onclick="ajax('Rueck')">
											<label for="PreisRueck"> Preis </label> <input
												class="FlugartRadio" id="DauerRueck" name="inputRueck"
												value="2" type="radio" onclick="ajax('Rueck')"> <label
												for="DauerRueck"> Flugdauer </label> <input
												class="FlugartRadio" id="StoppRueck" name="inputRueck"
												value="3" type="radio"> <label for="StoppRueck"
												onclick="ajax('Rueck')"> Abflugzeit </label>

										</div>
								</th>
								<th class="flugKlasse" id="economy">Economy Class</th>
								<th class="flugKlasse" id="business">Business Class</th>
							</tr>
						</thead>


						<%
							for (Flug flug : direktflugRueck) {
											int flugid = flug.getId();
						%>
						<tr id="<%=flugid%>">

							<td class="flug_row" colspan="1">
								<div class="wrapper_flugplan">

									<p class="flugplan">
										<%
											String UhrzeitAbflug = simDateFormat.format(flug.getAbflugzeit());
										%>
										<span id="<%=flugid + "_abflugzeit"%>"><strong><%=UhrzeitAbflug%>
												Uhr:&nbsp;</strong></span> <span id="<%=flugid + "_abflugort"%>">
											${ankufthafen.ort} (<%=flug.getAbFlughafen().getKuerzel()%>)
										</span>
									</p>
									<%
										String UhrzeitAnkunft = simDateFormat.format(flug.calculateAnkunftZeit());
									%>
									<p class="flugplan">
										<span id="<%=flugid + "_ankunftzeit"%>"><strong><%=UhrzeitAnkunft%>
												Uhr:&nbsp;</strong></span> <span id="<%=flugid + "_ankunftort"%>">
											${abflughafen.ort} (<%=flug.getAnFlughafen().getKuerzel()%>)
										</span>
									</p>

								</div>
								<div class="wrapper_flugdetail">
									<p class="flugdetails">
										<%
											String reisedauer = simDateFormat.format(flug.getFlugdauer());
										%>
										<span><strong>Reisedauer:&nbsp;</strong></span> <span><%=reisedauer%>h</span>
									</p>
									<p class="flugdetails">
										<span><strong>Stopps:&nbsp;</strong>0</span>
									</p>

								</div>



							</td>
							<td>
								<div class="priceField">
									<%
										String preis = "nicht genügend Plätze";
														int anzahl_ecoPlätze = flug.freeSeats(false);
														int anzahl_FirstClassPlätze = flug.freeSeats(true);
														int passagierZahl = baby + kind + adults;
														if (flug.getPreis() == minPriceRueck) {
									%>
									<div>
										<span class="cheapest">Günstigster Preis</span>
									</div>
									<%
										}
									%>
									<div class="selectorPrice">
										<span class="price"> <%
 	if (anzahl_ecoPlätze > passagierZahl) {
 						preis = df.format(flug.getPreis()) + "€";
 %> <input type="radio" onclick="displayFlightDetails(event,'Rueck')"
											name="RueckflugInput" id="<%=flugid + "_preisEco"%>">
											<%
												}
											%> <strong> <%=preis%>
										</strong>
										</span>
									</div>

									<%
										preis = "nicht genügend Plätze";
														if (anzahl_ecoPlätze <= passagierZahl + 4) {
									%>
									<div>
										<span class="lastSeats">Noch <%=anzahl_ecoPlätze%>
											Plätze
										</span>
									</div>
									<%
										}
									%>
								</div>
							</td>
							<td>
								<div class="priceField">
									<div></div>
									<div class="selectorPrice">
										<span class="price"> <%
 	if (anzahl_FirstClassPlätze > passagierZahl) {
 						preis = df.format(flug.getPreis()) + "€";
 %> <input type="radio" name="RueckflugInput"
											onclick="displayFlightDetails(event,'Rueck')"
											id="<%=flugid + "_preisFirst"%>"> <%
 	}
 %> <strong> <%=preis%></strong>
										</span>
									</div>
									<%
										preis = "nicht genügend Plätze";
														if (anzahl_FirstClassPlätze <= passagierZahl + 4) {
									%>
									<div>
										<span class="lastSeats">Noch <%=anzahl_FirstClassPlätze%>
											Plätze
										</span>
									</div>
									<%
										}
									%>
								</div>
							</td>

						</tr>

						<tr class="unvisibleHin" id="<%=flug.getId() + "_detail"%>">
							<td colspan="4">
								<table id="detail">
									<thead>
										<tr>
											<th>Airline</th>
											<th>Flug</th>
											<th>Abflug</th>
											<th>Ankunft</th>
											<th>Reisedauer</th>

										</tr>
									</thead>
									<tbody>
										<tr>


											<%
												UhrzeitAbflug = UhrzeitAbflug + " Uhr: " + flug.getAbFlughafen().getOrt();
																UhrzeitAnkunft = UhrzeitAnkunft + " Uhr: " + flug.getAnFlughafen().getOrt();
																String flugnr = flug.getFlugzeugtyp().getGesellschaft().getBezeichnung().substring(0, 1)
																		+ flug.getId();
																if (flugnr.length() > 5)
																	flugnr = flugnr.substring(0, 4);
											%>
											<td><p><%=flug.getFlugzeugtyp().getGesellschaft().getBezeichnung()%></p></td>

											<td><p><%=flugnr%></p></td>
											<td><p><%=UhrzeitAbflug%></p></td>
											<td><p><%=UhrzeitAnkunft%></p></td>
											<td><p><%=reisedauer + " h"%></p></td>
											<td><p></p></td>
										</tr>

									</tbody>
								</table>
						</tbody>
					</table>

				</div>



				<%
					}
				%>

				<%
					} else {
				%>
				<p class="fehler">
					<span> <%
 	if (map.size() == 0) {
 %>Es existiert kein Flug von ${abflughafen.ort} nach
						${ankufthafen.ort}! <%
 	} else {
 %>Es konnte leider am <%=hinDate%> kein passender Flug gefunden werden!<%
 	}
 			}
 %>
					</span>
				</p>

				<%
					}
				%>


			</div>
			<%
				}
				if (onlyHinflug == true) {
			%>
		</div>
		<%
			}
			if (direktflug != null && direktflug.size() > 0) {
		%>
		<div id="preis">

			<div class="Rechnung" id="RechnungHin">

				<span>HINFLUG</span>
				<p>Bitte wählen sie einen Hinflug aus</p>
			</div>
			<%
				if (direktflugRueck != null && direktflugRueck.size() > 0) {
			%>
			<div class="Rechnung" id="RechnungRueck">

				<span>RÜCKFLUG</span>
				<p>Bitte wählen sie einen Hinflug aus</p>
			</div>
			<%
				}
			%>
			<button id="weiterButton" type="submit" onclick="return g()"
				formaction="/Flugsuche/ServiceLaden" formmethod="post">Weiter</button>
		</div>

		<%
			}
		%>

	</form>

	</main>

	<footer>
		<p>Copyright: THI</P>
	</footer>
</body>
</html>