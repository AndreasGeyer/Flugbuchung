<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="../style/main.css" />
		<link rel="stylesheet" type="text/css" href="../style/Serviceleistungen.css" />
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
		
			
			<h1>Bitte Wählen Sie Ihre zusätzlichen Serviceleistungen</h1>
			
			<div class="aufTeilung">
		<div class="service">
			<img src="../img/Serviceleistungen/versicherung.jpg" style="width: 20%; height: 23%;">
			<div id="insurance">
				<h2>Reiseversicherung</h2>

				<div id="kindInsurance">
					<div id="sonder">

						<h3>
							<strong>Empfehlung:</strong><br>Reiseschutzversicherung
						</h3>
						<ul>
							<li>Stornokosten</li>
							<li>Reiseabbruch</li>

							<li>Reisegepäckversicherung</li>
							<li>Reisekranken Versicherung</li>
							<li>First Class Behandlung</li>

						</ul>
						<div>
							<input type="checkbox">
							<p>
								nur <span>30 €</span>pro Person
						</div>
					</div>

					<div id="normal">

						<h3>Reiserücktrittsverischerung</h3>
						<ul>
							<li>Stornokosten</li>
							<li>Reiseabbruch</li>
							<li>Reisegepäckversicherung</li>
						</ul>
						<div>
							<input type="checkbox">
							<p>
								nur <span>30 €</span>pro Person
							</p>
						</div>
					</div>


				</div>


			</div>
		</div>

		<div id="food">

			<img src="../img/Serviceleistungen/Service.jpg" style="width: 30%; height: 33%;">
			<div id="insurance">
				<h2>Reiseversicherung</h2>
				<div id="a">
					<div id="description">
						<h3>Mittag</h3>
						<h4>Vegetarisches Essen</h4>
						<br>
						<label id="foodPrice">nur 13,99 €</label>
						<p>Fleischlos  aber totzdem Lecker!</p>
					</div>
					<img src="../img/Serviceleistungen/Essen.jpg" style="width: 20%; height: 20%;">

					<div class="auswahl">
						<div id="selector">
							<div>
								<h4>Passagier</h4>

								<select class="selectFood" id="pass">

									<option>1. Erwachsener</option>
									<option>2. Erwachsener</option>
									<option>1. Kind</option>
									<option>2. Kind</option>
									<option>1. Baby</option>



								</select>
							</div>


							<div>
								<h4>Essenstyp</h4>
								<select class="selectFood" id="typ">

									<option>Frühstück</option>
									<option>Mittagessen</option>
									<option>Abendessen</option>

								</select>
							</div>

							<div>
								<h4>Flug</h4>
								<select class="selectFood" id="flyt">

									<option>Flug1</option>
									<option>Flug2</option>
									<option>Flug3</option>

								</select>
							</div>
						</div>
						
					</div>
				</div>
				<br> <br>
			<button type="submit" >weiter</button>
			</div>
		</div>
	</div>
		

		</main>


		<%@ include file="Footer.jspf" %>
	</body>
</html>