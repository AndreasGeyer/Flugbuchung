
<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../style/prozess.css">
<link rel="stylesheet" href="../style/booking.css">
<link rel="stylesheet" href="../style/flightSearch.css">
<script type="text/javascript" src="../js/kalender.js"></script>
<script type="text/javascript" src="../js/airportAutocomplet.js"></script>

<title>Insert title here</title>
</head>
<body>
	<%@ include file="Header.jspf"%>
	<div id="main">
		<div class="mainField">
			<div id="filter">

				<div class="stopps">

					<h4>Anzahl Stopps</h4>
					<form></form>
					<div>
						<input id="nonStopp" type="radio" name="stopp"> <label
							for="nonStopp">Nonstopp</label>
					</div>
					<div>
						<input id="oneStopp" type="radio" name="stopp"> <label
							for="oneStopp">1 Stopp</label>
					</div>
					<div>
						<input id="moreStopp" type="radio" name="stopp"> <label
							for="moreStopp">mehr als 1 Stopp</label>
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
						<input id="airfrance" type="radio"> <label for="airfrance">Air
							France</label>
					</div>
					<div>
						<input id="chinaair" type="radio"> <label for="chinaair">China
							Air</label>
					</div>

				</div>
			</div>



			<div id="main">


				<div id="flightInfo">
					<form class="J">

						<section class="flightSearchWindow">

							<div class=switchFlight>
								<input type="radio" class="FlugartRadio" id="HinUndRückRadio"
									name="Flugart" value=1> <label class="flugLabel"
									id="HinUndRück" for="HinUndRückRadio"> Hin-/ Rückflug </label>
								<input type="radio" class="FlugartRadio" id="HinflugRadio"
									name="Flugart" value=2> <label class="flugLabel"
									id="Hinflug" for="HinflugRadio"> nur Hinflug </label>
							</div>

							<div id="flugWrapper">
								<div class="Flug">
									<div class="imageDiv">
										<img src="../images/planeUp.png" alt="plane"
											style="width: 20px; height: 20px;">
										<h4>von</h4>
									</div>
									<input placeholder="Abflughafen" type="text" id="ablflug"
										 onclick = "loadAirports()">
									<div class="autocompletAirport">
										<ul class ="listAirportAuto">
										<li> ffsdfsdfsdfs</li>
										<li> ffsdfsdfsdfs</li>
										<li> ffsdfsdfsdfs</li>
										<li> ffsdfsdfsdfs</li>
										</ul>
									</div>



									<table class="tables" id="möglicheFlüge"></table>
									<div class="imageDiv">
										<img src="../images/planeDown.png" alt="plane"
											style="width: 20px; height: 20px;">
										<h4>nach</h4>
									</div>
									<select placeholder="Ankunftshafen" type="text" id="ankunft"
										autofocus>
										<option></option>
										<option>Barcelona</option>
										<option>Bali</option>
										<option>Paris</option>
									</select>
									<table class="tables" id="möglicheFlüge"></table>

								</div>


								<div class="kalender">
									<div class="flyDate" id="hinFly">
										<h4>Hinflug</h4>
										<input type="date" id="calendarHin" class="Date"
											placeholder="TT.MM.JJJJ"
											onclick="currentMonthName(calendarHin.id)">

									</div>



									<div class="flyDate" id="rückFly">
										<h4>Rückflug</h4>
										<input type="date" id="calendarRueck" class="Date"
											placeholder="TT.MM.JJJJ"
											onclick="currentMonthName(calendarRueck.id)">
									</div>
								</div>

								<div class="passengers">
									<h4>Passagiere</h4>


									<select class="selectPassenger" id="erwachsen">
										<optgroup label="Erwachsene(>18 Jahre)">

											<option>1 Erwachsener</option>
											<option>2 Erwachsener</option>
											<option>3 Erwachsener</option>
											<option>4 Erwachsener</option>
											<option>5 Erwachsener</option>


										</optgroup>
									</select> <select class="selectPassenger">
										<optgroup label="Kinder (2 bis 18 Jahre)">
											<option>0 Kinder</option>
											<option>1 Kind</option>
											<option>2 Kinder</option>
											<option>3 Kinder</option>
											<option>4 Kinder</option>
											<option>5 Kinder</option>


										</optgroup>

									</select> <select class="selectPassenger">
										<optgroup label="Baby (bis 2 Jahre)">
											<option>0 Babys</option>
											<option>1 Baby</option>
											<option>2 Babys</option>
											<option>3 Babys</option>



										</optgroup>
									</select>




								</div>
							</div>

						</section>


					</form>

				</div>
				<div id="hinflug">
					<img src="../images/planeUp.png" style="width: 50px; height: 50px;">
					<h1>
						Ihr Hinflug: <span>München - New York</span>
					</h1>
				</div>
				<div id="s">
					<div id="prev">
						<p><</p>
					</div>
					<div class="datum" id="hinFlug">

						<div id="ab">
							<p>Di ,22.03.2016</p>
							<p>ab 200</p>
						</div>
						<div id="ab">
							<p>Mi,23.03.2016</p>
							<p>ab 200</p>
						</div>
						<div id="ab">
							<p>Do ,24.03.2016</p>
							<p>ab 200</p>
						</div>
						<div id="ab">
							<p>Fr ,25.03.2016</p>
							<p>ab 200</p>
						</div>
						<div id="ab">
							<p>Di ,22.03.2016</p>
							<p>ab 200</p>
						</div>
						<div id="ab">
							<p>Mi,23.03.2016</p>
							<p>ab 200</p>
						</div>
						<div id="ab">
							<p>Do ,24.03.2016</p>
							<p>ab 200</p>
						</div>
						<div id="ab">
							<p>Fr ,25.03.2016</p>
							<p>ab 200</p>
						</div>
						<div id="ab">
							<p>Di ,22.03.2016</p>
							<p>ab 200</p>
						</div>
						<div id="ab">
							<p>Mi,23.03.2016</p>
							<p>ab 200</p>
						</div>
						<div id="ab">
							<p>Do ,24.03.2016</p>
							<p>ab 200</p>
						</div>
						<div id="ab">
							<p>Fr ,25.03.2016</p>
							<p>ab 200</p>
						</div>


					</div>



					<div id="back">
						<p><</p>
					</div>
				</div>



				<div class="flightPlan">
					<table id="hinTable">
						<colgroup>
							<col width="51%">

							<col width="17%">
							<col width="17%">
							<col width="17%">
						</colgroup>


						<thead>
							<tr>
							<tr>
								<th></th>
								<th class="flugKlasse" id="economy">Economy Class</th>
								<th class="flugKlasse" id="business">Business Class</th>
								<th class="flugKlasse" id="first">First Class</th>
							</tr>
						</thead>
						<tr id="test">

							<td>
								<div id="row">

									<p>
										<strong>8:00 Uhr:&nbsp;</strong>Berlin (THX)
									</p>
									<p>
										<span>-></span>
									</p>
									<p>
										<strong>13:25 Uhr:&nbsp;</strong>New York (JFK)
									</p>

								</div>
								<p>Reisedauer: 12h 15 min, 1 Stopp</p>


							</td>
							<td><input type="radio" name="A"><span>500 €</span></td>
							<td><input type="radio" name="A"><span> 700 €</span></td>
							<td><input type="radio" name="A"><span>1000 €</span></td>
						</tr>
						<tr>
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

											<td><p>LH4752</p></td>
											<td><p>8:00 Uhr Berlin</p></td>
											<td><p>9:00 Uhr München</p></td>
											<td><p>1h 00min</p></td>
											<td><p>2h 00min</p></td>
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
								</table>
						</tr>

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