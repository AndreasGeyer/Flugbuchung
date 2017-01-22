<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Flugsuche THI</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/Passagier.css" />
<!-- Autor Magdalena Hora -->
</head>
<body>
	<%@ include file="Header.jspf"%>

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

	<article>
		<form action="PassagierSpeichern" method="post">
		<fieldset>
			<legend>Passagierdaten</legend>
			<c:forEach begin="1" end="${erwachsener}" var="val">
				<div id="Erwachsener${val}">
					<h4>
						Erwachsener
						<c:out value="${val}" />
						:
					</h4>
					<div class="Eingabe">
						<label for="vornameE${val}">Vorname:</label><br> <input type="text"
							name="vornameE${val}" id="vornameE${val}" maxlength="30" required> <br>
						<label for="nachnameE${val}">Nachname:</label><br> <input
							type="text" name="nachnameE${val}" id="nachnameE${val}" maxlength="30" required>
						<br> <label for="gebdatE${val}">Geburtsdatum:</label><br> <input
							type="date" name="GebdatumE${val}" id="GebdatumE${val}" pattern="\d{1,2}.\d{1,2}.\d{4}">
					</div>
					<br> <br>
				</div>
			</c:forEach>
			<c:forEach begin="1" end="${childs}" var="val">
				<div id="Kind${val}">
					<h4>
						Kind
						<c:out value="${val}" />
						:
					</h4>
					<div class="Eingabe">
						<label for="vornameK${val}">Vorname:</label><br> <input type="text"
							name="vornameK${val}" id="vornameK${val}" maxlength="30" required> <br>
						<label for="nachnameK${val}">Nachname:</label><br> <input
							type="text" name="nachnameK${val}" id="nachnameK${val}" maxlength="30" required>
						<br> <label for="gebdatK${val}">Geburtsdatum:</label><br> <input
							type="date" name="GebdatumK${val}" id="GebdatumK${val}" pattern="\d{1,2}.\d{1,2}.\d{4}">
					</div>
					<br> <br>
				</div>
			</c:forEach>

			<c:forEach begin="1" end="${babies}" var="val">
				<div id="Baby${val}">
					<h4>
						Baby
						<c:out value="${val}" />
						:
					</h4>
					<div class="Eingabe">
						<label for="vornameB${val}">Vorname:</label><br> <input type="text"
							name="vornameB${val}" id="vornameB${val}" maxlength="30" required> <br>
						<label for="nachnameB${val}">Nachname:</label><br> <input
							type="text" name="nachnameB${val}" id="nachnameB${val}" maxlength="30" required>
						<br> <label for="gebdatB${val}">Geburtsdatum:</label><br> <input
							type="date" name="GebdatumB${val}" id="GebdatumB${val}" pattern="\d{1,2}.\d{1,2}.\d{4}">
					</div>
					<br> <br>
				</div>
			</c:forEach>

			<button type="submit">weiter</button>
		</fieldset>
		</form>
	</article>


	</main>


	<%@ include file="Footer.jspf"%>
</body>
</html>