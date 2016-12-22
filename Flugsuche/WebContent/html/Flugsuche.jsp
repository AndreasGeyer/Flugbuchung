
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
	src="${pageContext.request.contextPath}/js/Flugsuche.js"></script>
<title>Flugsuche</title>
</head>
<body>
	<%@ include file="Header.jspf"%>
	<div id="main">
		<div class="mainField">
			<div id="filter">
				<form action="">
					<div class="stopps">

						<h4>Anzahl Stopps</h4>
						<form></form>
						<div>
							<input id="nonStopp" type="radio" name="stopp"> <label
								for="nonStopp">Non Stopp</label>
						</div>
						<div>
							<input id="oneStopp" type="radio" name="stopp"> <label
								for="oneStopp">1 Stopp</label>
						</div>


					</div>

					<div class="maxPrice">
						<h4>Preis</h4>

						<form>
							<div>
								<span class="info"><strong>400-2000 Euro</strong></span>
							</div>
							<input type="range">
						</form>
					</div>

					<div class="dauer">
						<h4>Uhrzeit</h4>

						<form>
							<div>
								<div>
									<span><strong>6 Uhr bis 20 Uhr</strong> </span>
								</div>
								<input type="range"> <span class="abstand">Hinflug</span>
							</div>
							<div>
								<div>
									<span class="with"><strong>6 Uhr bis 20 Uhr</strong> </span>
								</div>
								<input type="range"> <span class="abstand">Rückflug</span>
							</div>
						</form>
					</div>

					<div class="zeit">
						<h4>Flugdauer</h4>

						<form>
							<div>
								<div>
									<span><strong>2h 10min bis 10h 35min</strong> </span>
								</div>
								<input type="range"><span class="abstand">Hinflug</span>
							</div>
							<div>
								<div>
									<span><strong>2h 10min bis 10h 35min</strong> </span>

								</div>
								<input type="range"> <span class="abstand">Rückflug</span>
							</div>
						</form>
					</div>

					<div class="airline">

						<h4>Anzahl Stopps</h4>
						<form></form>
						<div>
							<input id="lh" type="radio"> <label for="lh">Lufthansa</label>
						</div>
						<div>
							<input id="airfrance" type="radio"> <label
								for="airfrance">Air France</label>
						</div>
						<div>
							<input id="chinaair" type="radio"> <label for="chinaair">China
								Air</label>
						</div>
				</form>
			</div>
		</div>



		<div id="main">


			<div id="flightInfo">



				<section class="flightSearchWindow">
					<form class="J" method="POST">
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
								<input placeholder="Ankunftshafen" type="text" id="ankunft"
									name="ankunft" onkeyup="loadAirports(event)"
									value="${ankufthafen.ort}" required>
								<div class="autocompletAirport" id="ankunftAutocomplet"></div>

								<table class="tables" id="möglicheFlüge"></table>

							</div>


							<div class="kalender">
								<div class="flyDate" id="hinFly">
									<h4>Hinflug</h4>
									<%
										Date hinflug = (Date) session.getAttribute("datumHin");
										String hinDate = "";
										hinDate = "17.02.2017";
									%>
									<input type="date" id="calendarHin" name="DateHinflug"
										class="Date" placeholder="TT.MM.JJJJ"
										onclick="currentMonthName(calendarHin.id)" value=<%=hinDate%>
										required>

								</div>



								<div class="flyDate" id="rückFly"
									<c:if test="${onlyHinflug ==true}"> visibility ="hidden"</c:if>>
									<h4>Rückflug</h4>
									<input type="date" id="calendarRueck" class="Date"
										name="DateRueckflug" placeholder="TT.MM.JJJJ"
										onclick="currentMonthName(calendarRueck.id)"
										<c:if test="${onlyHinflug ==false}"> required </c:if>>
								</div>
							</div>
							<div class="passengers">
								<h4>Passagiere</h4>


								<select class="selectPassenger" id="erwachsen" name="adults">
									<optgroup label="Erwachsene(>18 Jahre)">
										<%
											for (int i = 1; i <= 5; i++) {
										%>

										<option><%=i%> Erwachsener
										</option>
										<%
											}
										%>



									</optgroup>
								</select> <select class="selectPassenger" name="children">
									<optgroup label="Kinder (2 bis 18 Jahre)">
										<%
											for (int i = 0; i <= 5; i++) {
										%>

										<option><%=i%> Kind<%
											if (i != 1) {
										%>er<%
											}
										%>
										</option>
										<%
											}
										%>


									</optgroup>

								</select> <select class="selectPassenger" name="babies">
									<optgroup label="Baby (bis 2 Jahre)">
										<%
											for (int i = 0; i <= 5; i++) {
										%>

										<option><%=i%> Baby<%
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
					</form>
				</section>




			</div>
			<div id="hinflug">
				<img src="../images/planeUp.png" style="width: 50px; height: 50px;">
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
											value="1" checked type="radio"> <label for="PreisHin">
											Preis </label> <input class="FlugartRadio" id="Dauer" name="Preis"
											value="2" type="radio"> <label for="Dauer">
											Flugdauer </label> <input class="FlugartRadio" id="Stopp"
											name="Preis" value="3" type="radio"> <label
											for="Stopp"> Stopps </label>

									</div>
							</th>
							<th class="flugKlasse" id="economy">Economy Class</th>
							<th class="flugKlasse" id="business">Business Class</th>
						</tr>
					</thead>


					<%
						List<Flug> direktflug = (List<Flug>) session.getAttribute("direktflug");

						Date flugdauerHinMin = new Date(86400000L);
						Date flugdauerHinMax = new Date(1L);
						Date abflugHinMin = new Date(2030 * 365 * 86400000L);
						Date abflugHinMax = new Date(1990 * 365 * 86400000L);

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

							if (!gesellschaftList.contains(flug.getFlugzeugtyp().getGesellschaft())) {
								gesellschaftList.add(flug.getFlugzeugtyp().getGesellschaft());
							}
					%>
					<tr>

						<td class="flug_row" colspan="1">
							<div class="wrapper_flugplan">

								<p class="flugplan">
									<%
										DateFormat simDateFormat = new SimpleDateFormat("HH:mm");
											String UhrzeitAbflug = simDateFormat.format(flug.getAbflugzeit());
									%>
									<span><strong><%=UhrzeitAbflug%> Uhr:&nbsp;</strong></span> <span>
										${abflughafen.ort} (<%=flug.getAbFlughafen().getKuerzel() %>) </span>
								</p>
								<%
									String UhrzeitAnkunft = simDateFormat.format(flug.calculateAnkunftZeit());
								%>
								<p class="flugplan">
									<span><strong><%=UhrzeitAnkunft%> Uhr:&nbsp;</strong></span> <span>
										${ankufthafen.ort} (<%=flug.getAnFlughafen().getKuerzel() %>) </span>
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
										String preis = df.format(flug.getPreis());

									//	Double minPreis = map.get(hinflug);
									//	minPreis = 12.2;
// 										for (Date datum : map.keySet()) {
// 											if (hinflug.toLocaleString().equals(datum.toLocaleString())) {
// 												minPreis = map.get(datum);
// 											}
// 										}
// 										if (minPreis != null)
// 											preis = minPreis.toString();
										
											
								%>
								<div>
									<span class="cheapest">Günstigster Preis</span>
								</div>
								<div class="selectorPrice">
									<span class="price"> <input type="radio" name="A">
										<strong> <%=preis%>
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
								<div>
									<span class="cheapest">Günstigster Preis</span>
								</div>
								<div class="selectorPrice">
									<span class="price"> <input type="radio" name="A">
										<strong> <%=df.format(flug.getPreis() *3)%></strong>
									</span>
								</div>
								<div>
									<span class="lastSeats">Noch 4 Plätze</span>
								</div>
							</div>
						</td>

					</tr>

					<tr class="unvisible">
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
											
											<%UhrzeitAbflug = UhrzeitAbflug+" Uhr: " +flug.getAbFlughafen().getOrt();
											UhrzeitAnkunft = UhrzeitAnkunft+" Uhr: " +flug.getAnFlughafen().getOrt();%>

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
			</div>


		</div>
		<div id="preis">

			<div class="Rechnung">
				<span>HINFLUG</span>
				<p>Mo,17.03.2018</p>
				<p>10:50 München (MUC)</p>
				<p>10:50 New York (MUC)</p>

				<div>
					<div class="posten">
						<p>1 Erwachsener á 45€</p>
						<p>45</p>
					</div>
					<div class="posten">
						<p>1 Kind á 30€</p>
						<p>45</p>
					</div>
				</div>
			</div>
		</div>

	</div>
	</div>
	<footer>
		<p>Copyright: THI</P>
	</footer>
</body>
</html>