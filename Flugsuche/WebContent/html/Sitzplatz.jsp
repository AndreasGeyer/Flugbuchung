<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/sitzplatz.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/sitzplatz.js"></script>

<title>Insert title here</title>
</head>
<body>
	<%@ include file="Header.jspf"%>
	<div id=main>
		<h1>Sitzplatzbuchung</h1>
		<form action="SitzplatzSpeichern" method="post">
			<c:forEach begin="1" end="${erwachsener}" var="val">
				<div id="Erwachsener${val}">
					<h4>
						Erwachsener
						<c:out value="${val}" />
						:
					</h4>
					<div class="Eingabe">
						<select name="Sitzplatz${val}H">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
						</select>
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
						<label for="vornameK${val}">Vorname:</label><br> <input
							type="text" name="vornameK${val}" id="vornameK${val}"
							maxlength="30" required> <br> <label
							for="nachnameK${val}">Nachname:</label><br> <input
							type="text" name="nachnameK${val}" id="nachnameK${val}"
							maxlength="30" required> <br> <label
							for="gebdatK${val}">Geburtsdatum:</label><br> <input
							type="date" name="GebdatumK${val}" id="GebdatumK${val}"
							pattern="\d{1,2}.\d{1,2}.\d{4}">
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
						<label for="vornameB${val}">Vorname:</label><br> <input
							type="text" name="vornameB${val}" id="vornameB${val}"
							maxlength="30" required> <br> <label
							for="nachnameB${val}">Nachname:</label><br> <input
							type="text" name="nachnameB${val}" id="nachnameB${val}"
							maxlength="30" required> <br> <label
							for="gebdatB${val}">Geburtsdatum:</label><br> <input
							type="date" name="GebdatumB${val}" id="GebdatumB${val}"
							pattern="\d{1,2}.\d{1,2}.\d{4}">
					</div>
					<br> <br>
				</div>
			</c:forEach>
			<button type="submit">Weiter</button>
		</form>
	</div>
	<%@ include file="Footer.jspf"%>

</body>
</html>