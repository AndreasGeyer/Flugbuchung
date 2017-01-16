<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/main.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/ErrorPage.css" />
		<!-- Autor Magdalena Hora -->
	</head>
	<body>
		<%@ include file="Header.jspf" %>
	<div class="mainField">	
		<div id="main">
			<p>ErrorPage - PAGE NOT FOUND!!</p>
		</div>	
	
		<aside id="sidebar">
			<img alt="Error404" src="../img/ErrorPage/Error.png" style="width: 70%; height: 65%;">
		</aside>	
	
	</div>
	
	<div id="Beschreibung">
		<a>Bitte überprüfen Sie Ihre URL. Ist diese Richtig gehen Sie bitte zurück auf die Startseite und versuchen Sie es erneut.</a>
	</div>
		<%@ include file="Footer.jspf" %>
	</body>
</html>