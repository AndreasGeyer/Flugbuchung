<%-- Geyer Andreas --%>
<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Mein Bereich</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/main.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/user.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/user.js"></script>
</head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<body>
	<%@ include file="Header.jspf"%>
	<div id="main">
		<article>
			<h1>Ihre Daten</h1>
			<ul>
				<li class="anzeigen" onclick="oeffneAendern('Name')">
					<h2>Name</h2> <span class="inhalt">${kunde.anrede}
						<c:if test="${kunde.titel != 'null'}"> ${kunde.titel} </c:if>${kunde.vorname} ${kunde.nachname}</span><span
					class="bearbeiten">Bearbeiten</span>
				</li>
				<li id="Name" class="aendern">
					<form action="${pageContext.request.contextPath}/UserAendern"
						method="post">
						<table>
							<tr>
								<td><label>Anrede</label></td>
								<td><select name="anrede">
										<option value="Herr"
											<c:if test="${kunde.anrede == 'Herr'}">
												 selected="selected"
											</c:if>>Herr</option>
										<option value="Frau"
											<c:if test="${kunde.anrede == 'Frau'}">
												selected="selected"
											</c:if>>Frau</option>
								</select></td>
							</tr>
							<tr>
								<td><label>Titel</label></td>
								<td><select name="titel">
										<option value=null
											<c:if test="${kunde.titel == null}">
												 selected="selected"
											</c:if>>-</option>
										<option value="Dr."
											<c:if test="${kunde.titel == 'Dr.'}">
												 selected="selected"
											</c:if>>Dr.</option>
										<option value="Prof."
											<c:if test="${kunde.titel == 'Prof.'}">
												 selected="selected"
											</c:if>>Prof.</option>
										<option value="Prof. Dr."
											<c:if test="${kunde.titel == 'Prof. Dr.'}">
												 selected="selected"
											</c:if>>Prof.
											Dr.</option>
								</select></td>
							</tr>
							<tr>
								<td><label>Vorname</label></td>
								<td><input name="vorname" type="text"
									value="${kunde.vorname}" /></td>
							</tr>
							<tr>
								<td><label>Nachname</label></td>
								<td><input name="nachname" type="text"
									value="${kunde.nachname}" /></td>
							</tr>
							<tr>
								<td><input onclick="schlieseAendern('Name')" type="button"
									value="Abbrechen"></td>
								<td><button type="submit" class="submitButton">Speichern</button></td>
							</tr>
						</table>

					</form>
				</li>
				<li class="anzeigen" onclick="oeffneAendern('Adresse')">
					<h2>Adresse</h2> <span class="inhalt">${kunde.strasse}
						${kunde.hausnummer}, ${kunde.PLZ} ${kunde.ort}</span><span
					class="bearbeiten">Bearbeiten</span>
				</li>
				<li id="Adresse" class="aendern">
					<form action="${pageContext.request.contextPath}/UserAendern"
						method="post">
						<table>
							<tr>
								<td><label>Straße</label></td>
								<td><input name="strasse" type="text"
									value="${kunde.strasse}" /></td>
							</tr>
							<tr>
								<td><label>Hausnummer</label></td>
								<td><input name="hausnummer" type="text"
									value="${kunde.hausnummer}" /></td>
							</tr>
							<tr>
								<td><label>Postleitzahl</label></td>
								<td><input name="postleitzahl" type="text"
									value="${kunde.PLZ}" /></td>
							</tr>
							<tr>
								<td><label>Ort</label></td>
								<td><input name="ort" type="text" value="${kunde.ort}" /></td>
							</tr>
							<tr>
								<td><input type="button"
									onclick="schlieseAendern('Adresse')" value="Abbrechen"></td>
								<td><button type="submit" class="submitButton">Speichern</button></td>
							</tr>
						</table>

					</form>
				</li>
				<li class="anzeigen" onclick="oeffneAendern('Geburtsdatum')">
					<h2>Geburtsdatum</h2> <span class="inhalt"><fmt:formatDate value="${kunde.geburtsdatum}" pattern="dd.MM.yyyy" /></span><span
					class="bearbeiten">Bearbeiten</span>
				</li>
				<li id="Geburtsdatum" class="aendern">
					<form action="${pageContext.request.contextPath}/UserAendern"
						method="post">
						<table>
							<tr>
								<td><label>Geburtsdatum</label></td>
								<td><input name="geburtsdatum" type="date"
									value='<fmt:formatDate value="${kunde.geburtsdatum}" pattern="dd.MM.yyyy" />'  pattern="\d{1,2}.\d{1,2}.\d{4}"/></td>
							</tr>
							<tr>
								<td><input type="button"
									onclick="schlieseAendern('Geburtsdatum')" value="Abbrechen"></td>
								<td><button type="submit" class="submitButton">Speichern</button></td>
							</tr>
						</table>

					</form>
				</li>
				<li class="anzeigen" onclick="oeffneAendern('Email')">
					<h2>E-Mail</h2> <span class="inhalt">${kunde.mail}</span><span
					class="bearbeiten">Bearbeiten</span>
				</li>
				<li id="Email" class="aendern">
					<form action="${pageContext.request.contextPath}/UserAendern"
						method="post">
						<table>
							<tr>
								<td><label>E-Mail</label></td>
								<td><input name="email" type="email" value="${kunde.mail}" /></td>
							</tr>
							<tr>
								<td><input type="button" onclick="schlieseAendern('Email')"
									value="Abbrechen" ></td>
								<td><button type="submit" class="submitButton">Speichern</button></td>
							</tr>
						</table>

					</form>
				</li>
				<li class="anzeigen" onclick="oeffneAendern('Passwort')">
					<h2>Passwort</h2> <span class="inhalt">Hier können Sie Ihr
						Passwort ändern</span><span class="bearbeiten">Bearbeiten</span>
				</li>
				<li id="Passwort" class="aendern">
					<form action="${pageContext.request.contextPath}/UserAendern"
						method="post" id="passwortForm">
						<input type="hidden" name="altespasswortAbgleich" id="altespasswortAbgleich"
							value="${kunde.passwort }" />
						<table>
							<tr>
								<td><label>Altes Passwort</label></td>
								<td><input name="altespasswort" type="password" id="altespasswort"/></td>
							</tr>
							<tr class="" id="msgaltespasswort">
								<td colspan="2">Das alte Passwort ist falsch!</td>
							</tr>
							<tr>
								<td><label>Neues Passwort</label></td>
								<td><input name="passwort" type="password" id="neuespasswort"/></td>
							</tr>
							<tr>
								<td><label>Neues Passwort (wdh)</label></td>
								<td><input name="passwortwdh" type="password" id="neuespasswortwdh"/></td>
							</tr>
							<tr class="" id="msgneuespasswort">
								<td colspan="2">Die eingegebenen Passwörter stimmen nicht überein!</td>
							</tr>
							<tr>
								<td><input type="button"
									onclick="schlieseAendern('Passwort')" value="Abbrechen"></td>
								<td><button type="button" class="submitButton" onclick="checkPasswort()">Speichern</button></td>
							</tr>
						</table>

					</form>
				</li>
				<li class="anzeigen" onclick="oeffneAendern('Profilbild')">
					<h2>Profilbild</h2> <span class="inhalt">Altes Profilbild
						durch ein neues ersetzen</span><span class="bearbeiten">Bearbeiten</span>
				</li>
				<li id="Profilbild" class="aendern">
					<form action="${pageContext.request.contextPath}/UserBildAendern"
						method="post" enctype="multipart/form-data">
						<table>
							<tr>
								<td><label>Altes Profilbild</label></td>
								<td><img src="${pageContext.request.contextPath}/UserBildLaden"
									width="300" height="300" /></td>
							</tr>
							<tr>
								<td><label>Neues Profilbild</label></td>
								<td><input type="file" name="nutzerbild" accept="image/*" /></td>
							</tr>
							<tr>
								<td><input type="button"
									onclick="schlieseAendern('Profilbild')" value="Abbrechen"></td>
								<td><button type="submit" class="submitButton">Speichern</button></td>
							</tr>
						</table>

					</form>
				</li>
				<c:choose>
					<c:when test="${kunde.premium == false}">
						<li class="anzeigen" onclick="openPremium()">
							<h2>Account</h2> <span class="inhalt">Sie benutzen den
								Standard Account</span><span class="bearbeiten">Bearbeiten</span>
						</li>
					</c:when>
					<c:otherwise>
						<li class="anzeigen">
							<h2>Premium</h2> <span class="inhalt">Sie haben bereits
								Premium!</span> <span class="bearbeiten">Bearbeiten</span>
						</li>

					</c:otherwise>
				</c:choose>

			</ul>

		</article>
	</div>
	<%@ include file="Footer.jspf"%>
</body>
</html>