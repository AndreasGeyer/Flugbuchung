<!-- Author Bauer Jürgen -->

<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.text.*"%>



<%@ page import="java.util.*"%>
<%@ page import="flugsuche.bean.*"%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta content="content-type" content="text/html; charset=utf-8">

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
	%>

	<fmt:requestEncoding value="utf-8" />
	<fmt:setLocale value="de_DE" />

	<div id="navigation">
		<nav>
			<ul>
				<li><a class="selectedA" href="${pageContext.request.contextPath}/Flugbuchung">Flug
						wählen</a></li>
				<li><a>Serviceleistungen</a></li>
				<li><a>Passagierdaten</a></li>
				<li><a>Sitzplatz</a></li>
				<li><a>Zahlung</a></li>
				<li><a>Bestätigung</a></li>
			</ul>
		</nav>
	</div>

	<main>
	<form id="suchForm" method="POST" action="/Flugsuche/Flugbuchung">

		<div class="mainField">

			<div id="filter">

				<c:if test="${not empty direktflug}">
					<div class="stopps">

						<h4>Anzahl Stopps</h4>

						<div>
							<input id="nonStopp" type="checkbox" name="stopp" checked>
							<label for="nonStopp">Non Stopp</label>
						</div>



					</div>

					<div class="maxPrice">
						<h4>Preis</h4>



						<div>
							<div>
								<span class="info" id="maxPriceHin_span"><strong>
										<fmt:formatNumber minFractionDigits="2" value="${minPrice}"
											type="currency" pattern="#.##" /> € bis <fmt:formatNumber
											minFractionDigits="2" type="currency" pattern="#.##"
											value="${maxPrice}" /> €
								</strong> </span>
							</div>
							<input id="maxPriceHin_input" name="maxPriceHin"
								oninput="displayFlyTime(event)" min="${minPrice}"
								max="${maxPrice}" step="0.01" value="${maxPrice}" type="range">
							<span class="abstand">Hinflug</span>
						</div>

						<c:if test="${not empty direktflugRueck}">
							<div>
								<div>

									<span class="info" id="maxPriceRueck_span"><strong>
											<fmt:formatNumber minFractionDigits="2" type="currency"
												pattern="#.##" value="${minPriceRueck}" /> € bis <fmt:formatNumber
												minFractionDigits="2" type="currency" pattern="#.##"
												value="${maxPriceRueck} " /> €
									</strong> </span>
								</div>
								<input id="maxPriceRueck_input" oninput="displayFlyTime(event)"
									min="${minPriceRueck}" max="${maxPriceRueck}" step="0.01"
									value="${maxPriceRueck}" type="range"> <span
									class="abstand">Rückflug</span>
							</div>

						</c:if>
					</div>

					<div class="dauer">
						<h4>Uhrzeit</h4>


						<div>
							<div>

								<span id="UhrzeitHin_span"> <strong> <fmt:formatDate
											value="${abflugHinMin}" pattern="HH:mm" /> Uhr bis <fmt:formatDate
											value="${abflugHinMax}" pattern="HH:mm" /> Uhr
								</strong>
								</span>
							</div>
							<input id="UhrzeitHin_input" oninput="displayFlyTime(event)"
								type="range" min="${abflugHinMin.getTime()}"
								max="${abflugHinMax.getTime()}" step="1"
								value="${abflugHinMax.getTime()}"> <span class="abstand">Hinflug</span>
						</div>

						<c:if test="${not empty direktflugRueck}">
							<div>
								<div>

									<span class="with"><strong id="UhrzeitRueck_span">
											<fmt:formatDate value="${abflugRueckMin}" pattern="HH:MM" />
											Uhr bis <fmt:formatDate value="${abflugRueckMax}"
												pattern="HH:MM" /> Uhr
									</strong> </span>
								</div>
								<input id="UhrzeitRueck_input" oninput="displayFlyTime(event)"
									type="range" min="${abflugRueckMin.getTime()}"
									max="${abflugRueckMax.getTime()}" step="1"
									value="${abflugRueckMax.getTime()}"> <span
									class="abstand">Rückflug</span>
							</div>

						</c:if>
					</div>

					<div class="zeit">
						<h4>Flugdauer</h4>


						<div>
							<div>
								<span id="zeitHin_span"><strong> <fmt:formatDate
											value="${flugdauerHinMin}" pattern="HH:mm" /> h bis <fmt:formatDate
											value="${flugdauerHinMax}" pattern="HH:mm" /> h
								</strong> </span>
							</div>
							<input id="zeitHin_input" oninput="displayFlyTime(event)"
								type="range" min="${flugdauerHinMin.getTime()}"
								max="${flugdauerHinMax.getTime()}" step="1"
								value="${flugdauerHinMax.getTime()}"><span
								class="abstand">Hinflug</span>
						</div>

						<c:if test="${not empty direktflugRueck}">
							<div>
								<div>
									<span id="zeitRueck_span"><strong><fmt:formatDate
												value="${flugdauerRueckMin}" pattern="HH:mm" /> h bis <fmt:formatDate
												value="${flugdauerRueckMax}" pattern="HH:mm" /> h</strong> </span>

								</div>
								<input id="zeitRueck_input" oninput="displayFlyTime(event)"
									type="range" min="${flugdauerRueckMin.getTime()}"
									max="${flugdauerRueckMax.getTime()}" step="1"
									value="${flugdauerRueckMax.getTime()}"> <span
									class="abstand">Rückflug</span>
							</div>

						</c:if>
					</div>

					<div class="airline">

						<h4>Fluggesellschaft</h4>


						<c:forEach items="${gesellschaftList}" var="gesellschaft">
							<div>
								<input oninput="ajax('HinRueck')"
									id="${gesellschaft.bezeichnung } " type="checkbox"
									name="fluggesellschaft" checked> <label for="lh">${gesellschaft.bezeichnung }</label>
							</div>

						</c:forEach>

					</div>

				</c:if>
			</div>



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

									<fmt:formatDate pattern="dd.MM.yyy" value="${datumHin}"
										var="hinDate" scope="session" />
									<input type="date" id="calendarHin" name="DateHinflug"
										class="Date" placeholder="TT.MM.JJJJ"
										onclick="currentMonthName(calendarHin.id)" value="${hinDate }"
										readonly>

								</div>



								<c:choose>

									<c:when test="${onlyHinflug == true}">
										<c:set var="id" value="rueckFlyNone" scope="session" />
									</c:when>
									<c:otherwise>
										<c:set var="id" value="rueckFly" scope="session" />
									</c:otherwise>

								</c:choose>

								<div class="flyDate" id="${id }">
									<h4>Rückflug</h4>
									<%
										Date flugRueck = (Date) session.getAttribute("datumRueck");
										//	String rueckDate = "";
										//	if (flugRueck != null)
										//		rueckDate = dateFormat.format(flugRueck);
									%>
									<fmt:formatDate pattern="dd.MM.yyyy" value="${datumRueck}"
										var="rueckDate" />
									<input type="date" id="calendarRueck" class="Date"
										name="DateRueckflug" placeholder="TT.MM.JJJJ"
										onclick="currentMonthName(calendarRueck.id)"
										value="${rueckDate}" pattern="\d{1,2}.\d{1,2}.\d{4}" readonly>



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
						<button id="suchButton" class="submitButton" type="submit"
							onclick="return check()" formaction="/Flugsuche/Flugbuchung"
							formmethod="post">Suchen</button>

					</section>




				</div>
				<%
					TreeMap<Date, Double> map = (TreeMap) session.getAttribute("map");
					DecimalFormat df = new DecimalFormat("#.##");
					int counter = 1;
					//if (map != null && map.size() > 0) {
				%>
				<c:set var="counter" value="1" scope="session" />
				<c:if test="${not empty map }">
					<div id="hinflug">
						<img
							src="${pageContext.request.contextPath}/img/Flugsuche/planeUp.png"
							style="width: 50px; height: 50px;">
						<h1>
							Ihr Hinflug: <span>${abflughafen.ort} - ${ankufthafen.ort}</span>

						</h1>
					</div>

					<div class="wrapper_flugtage">
						<ul>

							<li class="arrow-flugtag" onclick="shiftDate('links','Hin')"><span><</span></li>

							<c:forEach items="${map.keySet()}" var="dateMapHin">

								<li
									onclick="submitDate('${dateMapHin.toLocaleString().substring(0, 10)}','Hin')"
									class="element" id="HinElement_${counter}"
									<%Date dateUtils = Utils.getNearestDate(map, flugHin);
									request.setAttribute("dateUtils", dateUtils);%>
									<c:if test="${dateMapHin.compareTo(dateUtils) == 0}">
									
								name="nearestHin"
								 </c:if>>

									<p>
										<b>${dateMapHin.toLocaleString().substring(0, 10)}</b>
									</p>
									<p>
										ab
										<fmt:formatNumber minFractionDigits="2" type="currency"
											pattern="#.##" value="${map.get(dateMapHin)}" />
										€


									</p>
								</li>

								<c:set var="counter" value="${counter +1 }" scope="session" />
							</c:forEach>
							<li class="arrow-flugtag" onclick="shiftDate('rechts','Hin')"><span>></span></li>

						</ul>
					</div>

				</c:if>


				<div class="flightPlan">

					<c:choose>
						<c:when test="${not empty direktflug}">
							<table id="hinTable">
								<colgroup>
									<col width="60%">

									<col width="20%">
									<col width="20%">

								</colgroup>

								<thead>

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
														for="Dauer"> Flugdauer </label> <input
														onclick="ajax('Hin')" class="FlugartRadio" id="Stopp"
														name="Preis" value="3" type="radio"> <label
														for="Stopp"> Abflugzeit </label>

												</div>
											</div>
										</th>
										<th class="flugKlasse">Economy Class</th>
										<th class="flugKlasse">First Class</th>
									</tr>
								</thead>

								<c:forEach items="${direktflug}" var="flug">
									<tr id="${flug.id}">

										<td class="flug_row" colspan="1">
											<div class="wrapper_flugplan">

												<p class="flugplan">

													<fmt:formatDate pattern="HH:mm" value="${flug.abflugzeit}"
														var="UhrzeitAbflug" scope="session" />
													<span id="${flug.id}_abflugzeit"><strong>${UhrzeitAbflug}
															Uhr:&nbsp;</strong></span> <span id="${flug.id}_abflugort">
														${abflughafen.ort} (${flug.abFlughafen.kuerzel}) </span>
												</p>

												<fmt:formatDate pattern="HH:mm"
													value="${flug.calculateAnkunftZeit()}" var="UhrzeitAnkunft"
													scope="session" />
												<p class="flugplan">
													<span id="${flug.id}_ankunftzeit"><strong>${UhrzeitAnkunft}
															Uhr:&nbsp;</strong></span> <span id="${flug.id}_ankunftort">
														${ankufthafen.ort} (${flug.anFlughafen.kuerzel}) </span>
												</p>

											</div>
											<div class="wrapper_flugdetail">
												<p class="flugdetails">
													<%-- 													<%
														String reisedauer = simDateFormat.format(flug.getFlugdauer());
													%> --%>
													<fmt:formatDate pattern="HH:mm" value="${flug.flugdauer}"
														var="reisedauer" scope="session" />
													<span><strong>Reisedauer:&nbsp;</strong></span> <span>${reisedauer }
														h</span>
												</p>
												<p class="flugdetails">
													<span><strong>Stopps:&nbsp;</strong>0</span>
												</p>

											</div>

										</td>
										<td>
											<div class="priceField">


												<c:set var="preisHinflug" value="zu wenige Plätze"
													scope="session" />
												<c:set var="anzahl_firstClassPlätze"
													value="${flug.freeSeats(true)}" scope="session" />
												<c:set var="anzahl_ecoPlätze"
													value="${flug.freeSeats(false)}" scope="session" />
												<c:set var="passagierZahl"
													value="${babies+childs+erwachsener}" scope="session" />


												<c:if test="${flug.preis == minPrice}">
													<div>
														<span class="cheapest">Günstigster Preis</span>
													</div>
												</c:if>
												<div class="selectorPrice">
													<span class="price"> <c:if
															test="${anzahl_ecoPlätze >= passagierZahl}">

															<fmt:formatNumber minFractionDigits="2" pattern="#.##"
																value="${flug.preis} " type="currency"
																var="preisHinflug" scope="session" />
															<input type="radio"
																onclick="displayFlightDetails(event,'Hin')"
																name="HinflugInput" id="${flug.id}_preisEco">
														</c:if> <strong> ${preisHinflug} € </strong>
													</span>
												</div>

												<c:if test="${anzahl_ecoPlätze <= passagierZahl + 4}">
													<div>
														<span class="lastSeats">Noch ${anzahl_ecoPlätze}
															Plätze </span>
													</div>

												</c:if>
											</div>
										</td>
										<td>
											<div class="priceField">
												<div></div>
												<div class="selectorPrice">
													<span class="price"> <c:set var="preisHinflug"
															value="zu wenige Plätze" scope="session" /> <c:if
															test="${anzahl_firstClassPlätze >= passagierZahl}">
															<fmt:formatNumber minFractionDigits="2" pattern="#.##"
																value="${flug.preis*3} " type="currency"
																var="preisHinflug" scope="session" />
															<input type="radio" name="HinflugInput"
																onclick="displayFlightDetails(event,'Hin')"
																id="${flug.id}_preisFirst">
														</c:if><strong> ${preisHinflug} €</strong>
													</span>
												</div>

												<c:if test="${anzahl_firstClassPlätze <= passagierZahl + 4}">
													<div>
														<span class="lastSeats">Noch
															${anzahl_firstClassPlätze} Plätze </span>
													</div>

												</c:if>
											</div>
										</td>

									</tr>

									<tr class="unvisibleHin" id="${flug.id}_detail">

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

														<c:set var="flugnr"
															value="${flug.flugzeugtyp.gesellschaft.bezeichnung.substring(0, 2)}${flug.id}"
															scope="session" />
														<c:if test="${fn:length(flugnr)>5 }">
															<c:set var="flugnr" value="${flugnr.substring(0,4)}"
																scope="session" />
														</c:if>

														<td><p>${flug.flugzeugtyp.gesellschaft.bezeichnung }</p></td>
														<td><p>${flugnr }</p></td>
														<td><p>${UhrzeitAbflug}Uhr:
																${flug.abFlughafen.ort}</p></td>
														<td><p>${UhrzeitAnkunft}Uhr:
																${flug.anFlughafen.ort}</p></td>
														<td><p>${reisedauer}h</p></td>
														<td><p></p></td>
													</tr>

												</tbody>
											</table>
								</c:forEach>

								</tbody>
							</table>
						</c:when>
						<c:otherwise>

							<c:if test="${not empty abflughafen &&  not empty ankufthafen }">
								<p class="fehler">
									<span> <c:choose>
											<c:when test="${ empty map}">
					Es existiert kein Flug von ${abflughafen.ort} nach
							${ankufthafen.ort}!
					</c:when>
											<c:otherwise>
					Es konnte leider am ${hinDate } kein passender Flug gefunden werden!
					</c:otherwise>
										</c:choose>
									</span>
								</p>

							</c:if>
						</c:otherwise>
					</c:choose>
				</div>



				<c:if test="${onlyHinflug == false  }">

					<div id="rueckflug">
						<img
							src="${pageContext.request.contextPath}/img/Flugsuche/planeDown.png"
							style="width: 50px; height: 50px;">
						<h1>
							Ihr Rückflug: <span>${ankufthafen.ort} -
								${abflughafen.ort}</span>

						</h1>
					</div>

					<%
						map = (TreeMap) session.getAttribute("mapRueck");
							if (map != null && map.size() > 0) {
					%>

					<div class="wrapper_flugtage">
						<ul>

							<li class="arrow-flugtag" onclick="shiftDate('links','Rueck')"><span><</span></li>
		
							<c:set var="counter" value="1" scope="session" />
							<c:forEach items="${mapRueck.keySet()}" var="mapRueckDate">

								<li
									onclick="submitDate('${mapRueckDate.toLocaleString().substring(0, 10)}','Rueck')"
									class="element" id="RueckElement_${counter}"
									<%Date dateUtils = Utils.getNearestDate(map, flugRueck);
									request.setAttribute("dateUtils", dateUtils);%>
									<c:if test="${mapRueckDate.compareTo(dateUtils) == 0}">
									
								name="nearestRueck"
								 </c:if>>





									<p>
										<b>${mapRueckDate.toLocaleString().substring(0, 10)}</b>
									</p>
									<p>
										ab

										<fmt:formatNumber minFractionDigits="2" pattern="#.##"
											value="${mapRueck.get(mapRueckDate)}" type="currency" /> €

									</p>
								</li>
								<%-- 						<%
							}
						%> --%>
								<c:set var="counter" value="${counter+1}" scope="session" />
							</c:forEach>
							<li class="arrow-flugtag" onclick="shiftDate('rechts','Rueck')"><span>></span></li>

						</ul>
					</div>





					<div class="flightPlan">
						<%
							if (direktflugRueck != null && direktflugRueck.size() > 0) {
						%>



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


												<input class="FlugartRadio" id="PreisRueck"
													name="inputRueck" value="1" checked type="radio"
													onclick="ajax('Rueck')"> <label for="PreisRueck">
													Preis </label> <input class="FlugartRadio" id="DauerRueck"
													name="inputRueck" value="2" type="radio"
													onclick="ajax('Rueck')"> <label for="DauerRueck">
													Flugdauer </label> <input class="FlugartRadio" id="StoppRueck"
													name="inputRueck" value="3" type="radio"> <label
													for="StoppRueck" onclick="ajax('Rueck')">
													Abflugzeit </label>


											</div>
										</div>
									</th>
									<th class="flugKlasse">Economy Class</th>
									<th class="flugKlasse">First Class</th>
								</tr>
							</thead>


							<%
								//	for (Flug flug : direktflugRueck) {
											//								int flugid = flug.getId();
							%>
							<fmt:setLocale value="de_DE" />
							<c:forEach items="${direktflugRueck}" var="flug">


								<tr id="${flug.id}">

									<td class="flug_row" col span="1">
										<div class="wrapper_flugplan">

											<p class="flugplan">
												<%
													//	String UhrzeitAbflug = simDateFormat.format(flug.getAbflugzeit());
												%>
												<fmt:formatDate pattern="HH:mm" value="${flug.abflugzeit}"
													var="UhrzeitAbflug" scope="session" />

												<span id="${flug.id}_abflugzeit"><strong>${UhrzeitAbflug}
														Uhr:&nbsp;</strong></span> <span id="${flug.id }_abflugort">
													${ankufthafen.ort} (${ankufthafen.kuerzel}) </span>
											</p>
											<%
												//	String UhrzeitAnkunft = simDateFormat.format(flug.calculateAnkunftZeit());
											%>
											<fmt:formatDate pattern="HH:mm"
												value="${flug.calculateAnkunftZeit()}" var="UhrzeitAnkunft"
												scope="session" />
											<p class="flugplan">
												<span id="${flug.id}_ankunftzeit"><strong>${UhrzeitAnkunft}
														Uhr:&nbsp;</strong></span> <span id="${flug.id}_ankunftort">
													${abflughafen.ort} (${abflughafen.kuerzel}) </span>
											</p>

										</div>
										<div class="wrapper_flugdetail">
											<p class="flugdetails">
												<%
													//		String reisedauer = simDateFormat.format(flug.getFlugdauer());
												%>
												<fmt:formatDate pattern="HH:mm" value="${flug.flugdauer}"
													var="reisedauer" scope="session" />
												<span><strong>Reisedauer:&nbsp;</strong></span> <span>${reisedauer}
													h</span>
											</p>
											<p class="flugdetails">
												<span><strong>Stopps:&nbsp;</strong>0</span>
											</p>

										</div>



									</td>
									<td>
										<div class="priceField">
			

											<c:set var="preisRueckflug" value="zu wenige Plätze"
												scope="session" />
											<c:set var="anzahl_firstClassPlätze"
												value="${flug.freeSeats(true)}" scope="session" />
											<c:set var="anzahl_ecoPlätze"
												value="${flug.freeSeats(false)}" scope="session" />
											<c:set var="passagierZahl"
												value="${babies+childs+erwachsener}" scope="session" />

											<c:if test="${flug.preis == minPriceRueck}">
												<div>
													<span class="cheapest">Günstigster Preis</span>
												</div>
												<%-- 										<%
											}
										%> --%>
											</c:if>
											<div class="selectorPrice">
												<span class="price"> <c:if
														test="${anzahl_ecoPlätze > passagierZahl }">
														<fmt:formatNumber minFractionDigits="2" pattern="#.##"
															value="${flug.preis} " type="currency"
															var="preisRueckflug" scope="session" />
														<input type="radio"
															onclick="displayFlightDetails(event,'Rueck')"
															name="RueckflugInput" id="${flug.id }_preisEco">
					
													</c:if> <strong> ${preisRueckflug} €</strong>
												</span>
											</div>

											<c:set var="preisRueckflug" value="zu wenige Plätze"
												scope="session" />
											<c:if test="${anzahl_ecoPlätze <= passagierZahl + 4 }">
												<div>
													<span class="lastSeats">Noch ${anzahl_ecoPlätze }
														Plätze </span>
												</div>
											</c:if>
										</div>
									</td>
									<td>
										<div class="priceField">
											<div></div>
											<div class="selectorPrice">
												<span class="price"> <c:if
														test="${anzahl_firstClassPlätze >= passagierZahl}">

														<fmt:formatNumber minFractionDigits="2" pattern="#.##"
															value="${flug.preis*3} " type="currency"
															var="preisRueckflug" scope="session" />
														<input type="radio" name="RueckflugInput"
															onclick="displayFlightDetails(event,'Rueck')"
															id="${flug.id}_preisFirst">

													</c:if><strong> ${preisRueckflug} €</strong>
												</span>
											</div>


											<c:set var="preisRueckflug" value="nicht genügend Plätze"
												scope="session" />

											<c:if test="${anzahl_firstClassPlätze <= passagierZahl + 4}">

												<div>
													<span class="lastSeats">Noch
														${anzahl_firstClassPlätze} Plätze </span>
												</div>
												<%-- 										<%
											}
										%> --%>
											</c:if>
										</div>
									</td>

								</tr>

								<tr class="unvisibleHin" id="${flug.id}_detail">
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


													<c:set var="flugnr"
														value="${flug.flugzeugtyp.gesellschaft.bezeichnung.substring(0, 2)}${flug.id}"
														scope="session" />
													<c:if test="${fn:length(flugnr)>5 }">
														<c:set var="flugnr" value="${flugnr.substring(0,4)}"
															scope="session" />
													</c:if>
													<td><p>${flug.flugzeugtyp.gesellschaft.bezeichnung }</p></td>
													<td><p>${flugnr }</p></td>
													<td><p>${UhrzeitAbflug} Uhr: ${flug.abFlughafen.ort}</p></td>
													<td><p>${UhrzeitAnkunft} Uhr: ${flug.anFlughafen.ort}</p></td>
													<td><p>${reisedauer}h</p></td>
													<td><p></p></td>
												</tr>

											</tbody>
										</table> 
							</c:forEach>


							</tbody>
						</table>

					</div>





					<%
						} else {
					%>
					<p class="fehler">
						<span> <c:choose>
								<c:when test="${empty mapRueck }"> Es existiert kein Flug von ${abflughafen.ort} nach
							${ankufthafen.ort}!</c:when>
								<c:otherwise>
							Es konnte leider am ${rueckDate } kein passender Flug gefunden
							werden!
							</c:otherwise>

							</c:choose>

						</span>
					</p>
			</div>

			<%
				}
					} else {
			%>
			<p class="fehler">
				<span> Es existiert kein Flug von ${abflughafen.ort} nach
					${ankufthafen.ort}! </span>
			</p>
			<%
				}
			%>
			</c:if>

		</div>



		<div id="preis">
			<%-- 			<%
				if (direktflug != null && direktflug.size() > 0) {
			%> --%>
			<c:if test="${not empty direktflug}">
				<div class="Rechnung" id="RechnungHin">

					<span>HINFLUG</span>
					<p>Bitte wählen sie einen Hinflug aus</p>
				</div>
				<%-- 			<%
				if (onlyHinflug == false) {
			%> --%>
				<c:if test="${onlyHinflug == false}">
					<div class="Rechnung" id="RechnungRueck">

						<span>RÜCKFLUG</span>
						<p>Bitte wählen sie einen Hinflug aus</p>
					</div>
					<%-- 			<%
				}
			%> --%>
				</c:if>
				<button class="submitButton" id="weiterButton" type="submit"
					onclick="return g()" formaction="/Flugsuche/ServiceLaden"
					formmethod="post">Weiter</button>

				<%-- 			<%
				}
			%>
 --%>
			</c:if>
		</div>
	</form>

	</main>
	<div class="space">
		<%@ include file="Footer.jspf"%>
</body>
</html>