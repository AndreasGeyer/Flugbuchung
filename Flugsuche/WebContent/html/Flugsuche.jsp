<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="../style/main.css" />
		<link rel="stylesheet" type="text/css" href="../style/Flugsuche.css" />
		<script type="text/javascript" src="../js/startseite.js"></script>
	</head>
	<body>
		<%@ include file="Header.jspf" %>
			
	<main>
		
		<div id="navigation">
			<nav>
			 <ul>
				  <li><a href="../html/Flugsuche.jsp">Flug wählen</a></li>
				  <li><a href="../html/Serviceleistungen.jsp">Serviceleistungen</a></li>
				  <li><a href="../html/Passagier.jsp">Passagierdaten</a></li>
				  <li><a href="../html/Zahlungsart.jsp">Zahlung</a></li>
				  <li><a href="#">Bestätigung</a></li>
			 </ul>
		</nav>
		</div>


	<div class="mainField">
		<div id="filter">
		<aside id="sidebar">
			
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
						<span class="info">400-2000 Euro</span>
					</div>
					<input type="range">
				</form>
			</div>

			
			<div class="airline">

				<h4>Airlines</h4>
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
			</aside>
		</div>
		

		<div id="main">


			<div id="flightInfo">
				<form class="J">

					<section class="flightSearchWindow">

						<div class=switchFlight>
							 <button class="flugLabel" id="HinUndRück" for="HinUndRückRadio" onclick="sichthinrück()"> Hin-/ Rückflug </button>
							
							 <button class="flugLabel" id="Hinflug" for="HinflugRadio" onclick="sichthin()"> nur Hinflug </button>
						</div>

						<div id="flugWrapper">
							<div class="Flug">
								<div class="imageDiv">
									<img src="../img/Flugsuche/planeUp.png" alt="plane"
										style="width: 20px; height: 20px;">
									<h4>von</h4>
								</div>
								<select placeholder="Abflughafen" type="text" id="ablflug" >
									<option> </option>
									<option>München</option>
									<option>Hamburg</option>
									<option>Frankfurt</option>
								</select>
								<table class="tables" id="möglicheFlüge"></table>
								<div class="imageDiv">
									<img src="../img/Flugsuche/planeDown.png" alt="plane"
										style="width: 20px; height: 20px;">
									<h4>nach</h4>
								</div>
								<select placeholder="Ankunftshafen" type="text" id="ankunft" >
									<option> </option>
									<option>Barcelona</option>
									<option>Bali</option>
									<option>Paris</option>
								</select>
								<table class="tables" id="möglicheFlüge"></table>

							</div>


							<div class="kalender">
								<div class="flyDate" id="hinFly">
									<h4>Hinflug</h4>
									<input type="date" class="Date" placeholder="TT.MM.JJJJ">
									<table class="tables" id="hinTable">
										<thead>
											<tr>
												<td><</td>
												<td colspan="5">Juli</td>
												<td><</td>
											</tr>

											<tr>
												<tH>Mo</th>
												<th>Di</th>
												<th>Mi</th>
												<th>Do</th>
												<th>Fr</th>
												<th>Sa</th>
												<th>So</th>
											</tr>
										</thead>
										<tbody>

											<tr>

												<td></td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
											</tr>
											<tr>

												<td></td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
											</tr>
											<tr>

												<td></td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
											</tr>
											<tr>

												<td></td>
												<td>1</td>
												<td>2</td>
												<td>3</td>
												<td>4</td>
												<td>5</td>
												<td>6</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="flyDate" id="rückFly">
									<h4>Rückflug</h4>
									<input type="date" class="Date" placeholder="TT.MM.JJJJ">
									<table class="tables" id="rueckTable"></table>
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
				<img src="../img/Flugsuche/planeUp.png" style="width: 50px; height: 50px;">
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
					</colgroup>


					<thead>
						<tr>
						<tr>
							<th ></th>
							<th class="flugKlasse" id="economy">Economy Class</th>
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
		<div id = sidebar>
		<div id="preis">
		
			<div class="Rechnung">
				<h4>HINFLUG</h4>
				<p>Mo,17.03.2018</p>
				<p>10:50 München (MUC)</p>
				<p>10:50 New York (MUC)</p>

				<div>
					<div class="posten">
						<p>1 Erwachsener á 45€</p>
					</div>
					<div class="posten">
						<p>1 Kind á 30€</p>
					</div>
				</div>
			</div>
		</div>
		</div>

	</div>
			
			
			</main>


		<%@ include file="Footer.jspf" %>
	</body>
</html>