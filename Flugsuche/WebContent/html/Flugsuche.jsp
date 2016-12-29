

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.*"%>


<%@ page import="java.util.*"%>
<%@ page import="flugsuche.bean.*"%>
<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/prozess.css">
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
<title>Flugsuche</title>
</head>
<body>
	<%@ include file="Header.jspf"%>

	<%
		List<Flug> direktflug = (List<Flug>) session.getAttribute("direktflug");

		DateFormat simDateFormat = new SimpleDateFormat("HH:mm");
		Date flugHin = (Date) request.getAttribute("datumHin");

		Date flugdauerHinMin = new Date(86400000L);
		Date flugdauerHinMax = new Date(1L);
		Date abflugHinMin = new Date(100 * 365 * 86400000L);
		Date abflugHinMax = new Date(1L);
		double minPrice = 99999999;
		double maxPrice = 0;

		List<Fluggesellschaft> gesellschaftList = new ArrayList<>();

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
			if (maxPrice < flug.getPreis() * 3)
				maxPrice = flug.getPreis() * 3;

			if (!gesellschaftList.contains(flug.getFlugzeugtyp().getGesellschaft())) {
				gesellschaftList.add(flug.getFlugzeugtyp().getGesellschaft());
			}

		}
		if (direktflug.size() > 0) {
	%>

	<div id="main">
		<form method="POST">
			<div class="mainField">
				<div id="filter">

					<div class="stopps">

						<h4>Anzahl Stopps</h4>

						<div>
							<input id="nonStopp" type="checkbox" name="stopp"> <label
								for="nonStopp">Non Stopp</label>
						</div>
						<div>
							<input id="oneStopp" type=checkbox name="stopp"> <label
								for="oneStopp">1 Stopp</label>
						</div>


					</div>

					<div class="maxPrice">
						<h4>Preis</h4>



						<div>
							<span class="info" id="maxPrice_span"><strong> <%=minPrice + " € bis " + maxPrice + " €"%></strong></span>
						</div>
						<input id="maxPrice_input" oninput="displayPrice(event)"
							type="range" min="<%=minPrice%>" max="<%=maxPrice%>" step="1"
							value="<%=maxPrice%>">

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
						<div>
							<div>
								<span class="with"><strong>6 Uhr bis 20 Uhr</strong> </span>
							</div>
							<input id="zeitHin_input" oninput="displayFlyTime(event)"
								type="range" min="<%=flugdauerHinMin.getTime()%>"
								max="<%=flugdauerHinMax.getTime()%>" step="1"
								value="<%=flugdauerHinMax.getTime()%>"> <span
								class="abstand">Rückflug</span>
						</div>

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
						<div>
							<div>
								<span id="zeitRueck_span"><strong>2h 10min bis
										10h 35min</strong> </span>

							</div>
							<input id="zeitRueck_input" oninput="displayFlyTime(event)"
								type="range" min="1" max="<%=flugdauerHinMax.getTime()%>"
								step="1" value="<%=flugdauerHinMax.getTime()%>"> <span
								class="abstand">Rückflug</span>
						</div>

					</div>

					<div class="airline">

						<h4>Fluggesellschaft</h4>

						<%
							for (Fluggesellschaft gesellschaft : gesellschaftList) {
						%>

						<div>
							<input id="lh" type="checkbox" name="fluggesellschaft"> <label
								for="lh"><%=gesellschaft.getBezeichnung()%></label>
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
									class="flugLabel" id="HinUndRück" for="HinUndRückRadio"
									onclick="displayRueckflug(event)"> Hin-/ Rückflug </label> <input
									type="radio" class="FlugartRadio" id="HinflugRadio"
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
											value="<%=hinDate%>" required>

									</div>



									<div class="flyDate" id="rückFly"
										<c:if test="${onlyHinflug ==true}"> visibility ="hidden"</c:if>>
										<h4>Rückflug</h4>
										<%
											Date flugRueck = (Date) request.getAttribute("datumRueck");

											String rueckDate = "";
											if (flugRueck != null)
												rueckDate = dateFormat.format(flugRueck);
										%>
										<input type="date" id="calendarRueck" class="Date"
											name="DateRueckflug" placeholder="TT.MM.JJJJ"
											onclick="currentMonthName(calendarRueck.id)"
											value="<%=rueckDate %>"
											<c:if test="${onlyHinflug ==false}"> required </c:if>>
									</div>
								</div>
								<div class="passengers">
									<h4>Passagiere</h4>


									<select class="selectPassenger" id="erwachsen" name="adults">
										<optgroup label="Erwachsene(>18 Jahre)">
											<%
												int adults = (int) request.getAttribute("erwachsener");
												int kind = (int) request.getAttribute("childs");
												int baby = (int) request.getAttribute("babies");
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
							<button type="submit" formaction="/Flugsuche/Flugbuchung"
								formmethod="post">Suchen</button>

						</section>




					</div>
					<div id="hinflug">
						<img src="../images/planeUp.png"
							style="width: 50px; height: 50px;">
						<h1>
							Ihr Hinflug: <span>${abflughafen.ort} - ${ankufthafen.ort}</span>

						</h1>
					</div>


					<!-- 			<div id="s"> -->
					<!-- 				<div id="prev"> -->
					<!-- 					<p><</p> -->
					<!-- 				</div> -->
					<!-- 				<div class="datum" id="hinFlug"> -->

					<%-- 										<% --%>
					<!-- 					// HashMap -->
					<!-- 					<Date , Double> map = (HashMap) session.getAttribute("map"); -->
					<%-- 					// for (Date date : map.keySet()) { // System.out.println(date); 					%> --%>
					<%-- 					<!-- 					<div id="ab"> --> 						<p><%=date.toLocaleString().substring(0, 9)%></p> --%>
					<%-- 					<!-- 						<p> --> <!-- 							ab --> 							<%=map.get(date)%> --%>
					<%-- 					<!-- 							€ --> <!-- 						</p> --> <!-- 					</div> --> 					<% --%>
					<%-- 					// } 					%> --%>
					<!-- 				</div> -->



					<!-- 				<div id="back"> -->
					<!-- 					<p><</p> -->
					<!-- 				</div> -->
					<!-- 			</div> -->

					<div class="wrapper_flugtage">
						<ul>

							<li class="arrow-flugtag"><span><</span></li>
							<%
								HashMap<Date, Double> map = (HashMap) session.getAttribute("map");
								for (Date date : map.keySet()) {
									System.out.println(date);
							%>

							<li class="element">

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
							<li class="arrow-flugtag"><span>></span></li>

						</ul>
					</div>





					<div class="flightPlan">
						<%
							if (direktflug.size() > 0) {
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
													value="1" checked type="radio"> <label
													for="PreisHin"> Preis </label> <input class="FlugartRadio"
													id="Dauer" name="Preis" value="2" type="radio"> <label
													for="Dauer"> Flugdauer </label> <input class="FlugartRadio"
													id="Stopp" name="Preis" value="3" type="radio"> <label
													for="Stopp"> Stopps </label>

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
											<span><strong>Reisedauer:&nbsp;</strong></span> <span><%=reisedauer%>h</span>
										</p>
										<p class="flugdetails">
											<span><strong>Stopps:&nbsp;</strong>0</span>
										</p>
										<p class="flugdetails">
											<span><strong>Anschluss:</strong></span> <span> </span>
										</p>
									</div>



								</td>
								<td>
									<div class="priceField">
										<%
											DecimalFormat df = new DecimalFormat("#.##");
													String preis = df.format(flug.getPreis()) + "€";

													if (flug.getPreis() == minPrice) {
										%>
										<div>
											<span class="cheapest">Günstigster Preis</span>
										</div>
										<%
											}
										%>
										<div class="selectorPrice">
											<span class="price"> <input type="radio"
												onclick="displayFlightDetails(event,'Hin')" name="A"
												id="<%=flugid + "_preisEco"%>"> <strong> <%=preis%>
											</strong>
											</span>
										</div>
										<div>
											<span class="lastSeats">Noch 4 Plätze</span>
										</div>
									</div>
								</td>
								<td>
									<div class="priceField">
										<div></div>
										<div class="selectorPrice">
											<span class="price"> <input type="radio" name="A"
												onclick="displayFlightDetails(event,'Hin')"
												id="<%=flugid + "_preisFirst"%>"> <strong>
													<%=df.format(flug.getPreis() * 3)%></strong>
											</span>
										</div>
										<div>
											<span class="lastSeats">Noch 4 Plätze</span>
										</div>
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
												<th>Transitzeit</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><img
													src="https://lh6.googleusercontent.com/-lITucNA2MiM/AAAAAAAAAAI/AAAAAAAAFK8/pbNj2KQLkOM/photo.jpg"
													alt="pl" width="35" height="35"></td>

												<%
													UhrzeitAbflug = UhrzeitAbflug + " Uhr: " + flug.getAbFlughafen().getOrt();
															UhrzeitAnkunft = UhrzeitAnkunft + " Uhr: " + flug.getAnFlughafen().getOrt();
												%>

												<td><p>LH14775</p></td>
												<td><p><%=UhrzeitAbflug%></p></td>
												<td><p><%=UhrzeitAnkunft%></p></td>
												<td><p><%=reisedauer%></p></td>
												<td><p></p></td>
											</tr>
											<tr>
												<td><img
													src="https://lh6.googleusercontent.com/-lITucNA2MiM/AAAAAAAAAAI/AAAAAAAAFK8/pbNj2KQLkOM/photo.jpg"
													alt="pl" width="35" height="35"></td>

												<td><p>LH4752</p></td>
												<td><p>8:00 Uhr Berlin</p></td>
												<td><p>9:00 Uhr München</p></td>
												<td><p>1h 00min</p></td>
												<td><p>2h 00min</p></td>
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
							<span>Es konnte leider am <%=hinDate%> kein passender Flug gefunden werden!
							</span>
						</p>
						<%
							}
						%>
					</div>

				</div>
				<%
					if (direktflug.size() > 0) {
				%>
				<div id="preis">

					<div class="Rechnung" id="RechnungHin">

						<span>HINFLUG</span>
						<p>Bitte wählen sie einen Hinflug aus</p>
						<!-- 				<p>10:50 München (MUC)</p> -->
						<!-- 				<p>10:50 New York (MUC)</p> -->

						<div>
							<!-- 					<div class="posten"> -->
							<!-- 						<p>1 Erwachsener á 45€</p> -->
							<!-- 						<p>45</p> -->
							<!-- 					</div> -->
							<!-- 					<div class="posten"> -->
							<!-- 						<p>1 Kind á 30€</p> -->
							<!-- 						<p>405€</p> -->
							<!-- 					</div> -->
						</div>
					</div>
				</div>

			</div>
			<%
				}
			%>
		</form>
	</div>


	<footer>
		<p>Copyright: THI</P>
	</footer>
</body>
</html>