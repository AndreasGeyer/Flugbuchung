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
	href="${pageContext.request.contextPath}/style/Angebotsseite.css" />
<!-- Autor Magdalena Hora -->
</head>
<body>
	<%@ include file="Header.jspf"%>
	<div id="main">
		<div id="ueberschrift">
			<h1>Unsere beliebsteten Reiseziele</h1>
		</div>

		<form action="/Flugsuche/Flugbuchung"
			method="POST">
			<div id="angebote">

				<c:forEach items="${listAngebote}" var="angebot">
	
					<button 
						class="fotoButton angebot" id="${angebot.bezeichnung}"
						formaction="/Flugsuche/Flugbuchung?ankunft=${angebot.bezeichnung}"
						formmethod="POST">
						<img src="${pageContext.request.contextPath}/AngebotsBildLaden?angebotid=${angebot.id}" width="300" height="320"
							 /> 
						
				
						<div id="Bezeichnung">
							<b>${angebot.bezeichnung}</b>
						</div>
						<br>
						<div class="Beschreibung">
							<c>${angebot.beschreibung}</c>
						</div>
					</button>

				</c:forEach>
	


			</div>
		</form>

	</div>
	<%@ include file="Footer.jspf"%>
</body>
</html>

