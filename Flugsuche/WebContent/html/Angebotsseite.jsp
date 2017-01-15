<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/main.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/Angebotsseite.css" />
		<!-- Autor Magdalena Hora -->
	</head>
	<body>
		<%@ include file="Header.jspf" %>
	<div id="main">
	<div id="ueberschrift">
	<h1> Unsere beliebsteten Reiseziele </h1>
	</div>
	
	<form action="${pageContext.request.contextPath}/AngeboteLaden"  method="POST">
	<div id="angebote">
	
		
		<button class="fotoButton" id="moskau" formaction="/Flugsuche/Flugbuchung?hinflug=Moskau" formmethod="get">
		<div id= "Bezeichnung">
		<b>nach Moskau</b>
		</div><br>
		<div class= "Beschreibung">
		<c>In Moskau sind von den schier unzähligen Sehenswürdigkeiten sind der Kreml, die Altstadt, die Einkaufsstraße "Arbat", die Basilius-Kathedrale, das Bolschoitheater und die Christ-Erlöser-Kathedrale besonders hervorzuheben.</c>
		</div>
		</button>
		<button class="fotoButton" id="düsseldorf" formaction="/Flugsuche/Flugbuchung?hinflug=Düsseldorf" formmethod="get">
		<b>nach Düsseldorf</b>
		<div class= "Beschreibung">
		<c>Düsseldorf ist Regierungssitz des bevölkerungsreichsten deutschen Bundeslandes Nordrhein-Westfalen. Die Rheinmetropole liegt mitten im Herzen der Wirtschaftsregion Rhein-Ruhr. Es gibt viel zu endecken.</c>
		</div></button>
		<button class="fotoButton" id="rom" formaction="/Flugsuche/Flugbuchung?hinflug=Rom" formmethod="get">
		<b>nach Rom</b>
		<div class= "Beschreibung">
		<c>Rom ist die grösste Stadt Italiens mit aktuell etwa 2,8 Mio. Einwohnern. Rom liegt im Herzen Italiens direkt am Tiber. Die Altstadt Roms, die Vatikanstadt und der Petersdom wurden von der UNESCO zum Weltkulturerbe erklärt.</c>
		</div>
		</button>
		<button class="fotoButton" id="paris" formaction="/Flugsuche/Flugbuchung?hinflug=Paris" formmethod="get">
		<b>nach Paris</b>
		<div class= "Beschreibung">
		<c>Paris ist ein Abenteuer- an jeder Ecke atmet man die jahrhundertealte Geschichte der Stadt und kann sich in den unzähligen Straßen in der Betrachtung der traumhaft schönen Fassaden stundenlang verlieren.</c>
		</div>
		</button>
	
		<button class="fotoButton" id="dublin" formaction="/Flugsuche/Flugbuchung?hinflug=Dublin" formmethod="get">
		<b>nach Dublin</b>
		<div class= "Beschreibung">
		<c>wenn wir uns die Insel im Atlantik als grünes Paradies vorstellen, dann ist die Hauptstadt im Osten vielleicht der Ort, wo die Paradiesfrucht hängt. Die wirtschaftliche Versuchung ist dort genauso zu Hause wie die Moderne und das pulsierende Leben. </c>
		</div>
		</button>
		<button class="fotoButton" id="sideny" formaction="/Flugsuche/Flugbuchung?hinflug=Sidney" formmethod="get">
		<b>nach Sidney</b>
		<div class= "Beschreibung">
		<c>Sydney ist unzweifelhaft eine der schönsten Städte der Welt mit einer phantastischen Lage an einem weit ausladenen Naturhafenbecken. Sie wurde von der Natur verwöhnt: z.B. durch kilometerlange weiße Sandstrände direkt vor der Haustüre.</c>
		</div>
		</button>
		<button class="fotoButton" id="side" formaction="/Flugsuche/Flugbuchung?hinflug=Side" formmethod="get">
		<b>nach Side</b>
		<div class= "Beschreibung">
		<c>Side liegt auf einer Halbinsel an der Mittelmeerküste und die Gebiete um Side herum sich mit vielen Hotels und Unterkünften touristisch erschlossen. Side ist ein sehr beliebten Ausflugsziel mit vielen Restaurants, Bars und Textil- bzw. Souveniergeschäften entwickelt.</c>
		</div>
		</button>
		<button class="fotoButton" id="barcelona" formaction="/Flugsuche/Flugbuchung?hinflug=Barcelona" formmethod="get">
		<b>nach Barcelona</b>
		<div class= "Beschreibung">
		<c>Direkt am Mittelmeer gelegen bietet die Barcelona eine perfekte Kombination von Städtereise und Urlaub am Meer. Die Arbeiten des katalanischen Architekten Antonio Gaudí zählen zum Weltkulturerbe.</c>
		</div>
		</button>
	
		<button class="fotoButton" id="bali" formaction="/Flugsuche/Flugbuchung?hinflug=Bali" formmethod="get">
		<b>nach Bali</b>
		<div class= "Beschreibung">
		<c>Berühmt ist dieses kleine Eiland wegen seiner einzigartigen Kultur und seiner liebenswerten Bevölkerung. Die Balinesen sind noch tief verwurzelt in ihrer Religion.</c>
		</div>
		</button>
		<button class="fotoButton" id="miami" formaction="/Flugsuche/Flugbuchung?hinflug=Miami" formmethod="get">
		<b>nach Miami</b>
		<div class= "Beschreibung">
		<c>Miami ist an der Atlantikküste, an der Südspitze von Florida, gelegen. Es ist dort das ganze Jahr über warm und üblicherweise in den Sommermonaten heiß und feucht.</c>
		</div>
		</button>
		<button class="fotoButton" id="lissabon" formaction="/Flugsuche/Flugbuchung?hinflug=Lissabon" formmethod="get">
		<b>nach Lissabon</b>
		<div class= "Beschreibung">
		<c>Die muntere Lebhaftigkeit dieser Stadt am Meer und deren faszinierende Schönheiten verlocken zu ausgedehnten Streifzügen. Verborgene Reize und der zärtliche Charme verleiten zum stillen Genießen, zu Ruhe und Erholung.</c>
		</div>
		</button>
		<button class="fotoButton" id="hamburg" formaction="/Flugsuche/Flugbuchung?hinflug=Hamburg" formmethod="get">
		<b>nach Hamburg</b>
		<div class= "Beschreibung">
		<c>Hamburg, Deutschlands bedeutendste Hafenstadt, ist auch ein Magnet für Touristen.Mit dem größten Überseehafen des Landes verbindet sich automatisch die Vorstellung, in eine Stadt am Meer zu kommen.</c>
		</div>
		</button>
		
		
	
	</div>
	</form>
	
		</div>		
		<%@ include file="Footer.jspf" %>
	</body>
</html>

