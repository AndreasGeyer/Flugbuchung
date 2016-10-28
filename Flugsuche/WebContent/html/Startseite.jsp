<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="../style/main.css" />
		<link rel="stylesheet" type="text/css" href="../style/startseite.css" />
	</head>
	<body>
		<%@ include file="Header.jspf" %>
		<div>
			<article id="Suche">
				<div>
					<h1>Finden Sie schnell und einfach Ihren Flug!</h1>
					<form>
						<table>
							<tr>
								<th>Von</th>					<th>Nach</th>					<th>Am</th>
							</tr>
							<tr>
								<td><input type="text"/></td>	<td><input type=text" /></td>	<td><input type="date"/></td>
							</tr>
						</table>
						<button type="submit">Suchen</button>
					</form>
				</div>
			</article>
			<article id="Angebote">
				<h1>Angebote</h1>
				<p>Finden Sie schnell und einfach Ihren Flug!</p>
				<form>
					<p>Abflughafen</p><select><option>1</option><option>2</option></select>
				</form>
			</article>
		</div>		
	</body>
</html>