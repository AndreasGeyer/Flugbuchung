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

		<c:if test="${onlyHinflug }">
			<p>
				Anzahl noch zu vergebener Plätze: <span id="countHin"> <c:out
						value="${erwachsener + childs + babies }"></c:out>
				</span>
				<c:if test="${hinFirstClass }">
				(First Class)
				</c:if>
				<c:if test="${!hinFirstClass }">
				(Economy Class)
				</c:if>
			</p>

			<div id="grundriss">

				<table class="Sitzplatz">
					<c:forEach begin="1" end="4" var="row">
						<tr>
							<c:forEach begin="1" end="12" var="col">
								<td><c:set var="platzBesetzt" value="false" /> <c:forEach
										items="${sitzplaetzeHin}" var="sitzHin">
										<c:if test="${sitzHin.id == ((row-1)*12  + col) }">
											<c:set var="platzBesetzt" value="true" />
										</c:if>
									</c:forEach> <c:if test="${platzBesetzt == true }">
										<c:if test="${col <= 3 }">
											<c:if test="${hinFirstClass }">
												<button type="button" class="besetzt firstClass"
													id="FC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled/>
											</c:if>
											<c:if test="${!hinFirstClass }">
												<button type="button" class="besetzt firstClass"
													id="FC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled />
											</c:if>
										</c:if>
										<c:if test="${col > 3 }">
											<c:if test="${hinFirstClass }">
												<button type="button" class="besetzt economyClass"
													id="EC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled/>
											</c:if>
											<c:if test="${!hinFirstClass }">
												<button type="button" class="besetzt economyClass"
													id="EC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled />
											</c:if>
										</c:if>
									</c:if> <c:if test="${platzBesetzt == false }">
										<c:if test="${col <= 3 }">
											<c:if test="${hinFirstClass }">
												<button type="button" class="frei firstClass"
													id="FC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)" />
											</c:if>
											<c:if test="${!hinFirstClass }">
												<button type="button" class="frei firstClass"
													id="FC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled />
											</c:if>
										</c:if>
										<c:if test="${col > 3 }">
											<c:if test="${!hinFirstClass }">
												<button type="button" class="frei economyClass"
													id="EC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)" />
											</c:if>
											<c:if test="${hinFirstClass }">
												<button type="button" class="frei economyClass"
													id="EC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled />
											</c:if>

										</c:if>
									</c:if></td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
				<form method="post" action="/Flugsuche/SitzplatzSpeichern"
					id="hinForm">
			<button type="submit" class="submitButton" id="submitHin">Weiter</button>
				</form>
			</div>
		</c:if>
		<c:if test="${!onlyHinflug }">
			<p>
				Anzahl noch zu vergebener Plätze: <span id="countHin"> <c:out
						value="${erwachsener + childs + babies }"></c:out>
				</span>
				<c:if test="${hinFirstClass }">
				(First Class)
				</c:if>
				<c:if test="${!hinFirstClass }">
				(Economy Class)
				</c:if>
			</p>

			<div id="grundriss">

				<table class="Sitzplatz">
					<c:forEach begin="1" end="4" var="row">
						<tr>
							<c:forEach begin="1" end="12" var="col">
								<td><c:set var="platzBesetzt" value="false" /> <c:forEach
										items="${sitzplaetzeHin}" var="sitzHin">
										<c:if test="${sitzHin.id == ((row-1)*12  + col) }">
											<c:set var="platzBesetzt" value="true" />
										</c:if>
									</c:forEach> <c:if test="${platzBesetzt == true }">
										<c:if test="${col <= 3 }">
											<c:if test="${hinFirstClass }">
												<button type="button" class="besetzt firstClass"
													id="FC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled/>
											</c:if>
											<c:if test="${!hinFirstClass }">
												<button type="button" class="besetzt firstClass"
													id="FC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled />
											</c:if>
										</c:if>
										<c:if test="${col > 3 }">
											<c:if test="${hinFirstClass }">
												<button type="button" class="besetzt economyClass"
													id="EC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled/>
											</c:if>
											<c:if test="${!hinFirstClass }">
												<button type="button" class="besetzt economyClass"
													id="EC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled />
											</c:if>
										</c:if>
									</c:if> <c:if test="${platzBesetzt == false }">
										<c:if test="${col <= 3 }">
											<c:if test="${hinFirstClass }">
												<button type="button" class="frei firstClass"
													id="FC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)" />
											</c:if>
											<c:if test="${!hinFirstClass }">
												<button type="button" class="frei firstClass"
													id="FC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled />
											</c:if>
										</c:if>
										<c:if test="${col > 3 }">
											<c:if test="${!hinFirstClass }">
												<button type="button" class="frei economyClass"
													id="EC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)" />
											</c:if>
											<c:if test="${hinFirstClass }">
												<button type="button" class="frei economyClass"
													id="EC${(row-1)*12 + col}H" onclick="changeSitzplatz(this)"
													disabled />
											</c:if>

										</c:if>
									</c:if></td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
				<form method="post" action="/Flugsuche/SitzplatzSpeichern"
					id="hinForm">
			<button type="submit" class="submitButton" id="submitHin">Weiter</button>
				</form>
			</div>
		</c:if>
	</div>
	<%@ include file="Footer.jspf"%>

</body>
</html>