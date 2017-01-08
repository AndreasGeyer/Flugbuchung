<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Flugsuche THI</title>
		<link rel="stylesheet" type="text/css" href="../style/main.css" />
		<link rel="stylesheet" type="text/css" href="../style/Angebotsseite.css" />
		<script type="text/javascript" src="../js/startseite.js"></script>
	</head>
	<body>
		<%@ include file="Header.jspf" %>
	<div id="main">
	<div id="ueberschrift">
	<h1> Unsere beliebsteten Reiseziele </h1>
	</div>
	
	<form method="POST">
	<div id="angebote">
	
		
		<button class="fotoButton" id="moskau" formaction="/Angebotsseite/Flugsuche/ankunft=Moskau" formmethod="post">
		<b>nach Moskau</b><br>
		<div id= "Beschreibung">
		<c>In Moskau sind von den schier unzähligen Sehenswürdigkeiten sind der Kreml, die Altstadt, die Einkaufsstraße "Arbat", die Basilius-Kathedrale, das Bolschoitheater und die Christ-Erlöser-Kathedrale besonders hervorzuheben.</c>
		</div>
		</button>
		<button class="fotoButton" id="düsseldorf" formaction="/Angebotsseite/Flugsuche/ankunft=Düsseldorf" formmethod="post">
		<b>nach Düsseldorf</b>
		<div id= "Beschreibung">
		<c>Düsseldorf ist Regierungssitz des bevölkerungsreichsten deutschen Bundeslandes Nordrhein-Westfalen. Die Rheinmetropole liegt mitten im Herzen der Wirtschaftsregion Rhein-Ruhr. Es gibt viel zu endecken.</c>
		</div></button>
		<button class="fotoButton" id="rom" formaction="/Angebotsseite/Flugsuche/ankunft=Rom" formmethod="post">
		<b>nach Rom</b>
		<div id= "Beschreibung">
		<c>Rom ist die grösste Stadt Italiens mit aktuell etwa 2,8 Mio. Einwohnern. Rom liegt im Herzen Italiens direkt am Tiber. Die Altstadt Roms, die Vatikanstadt und der Petersdom wurden von der UNESCO zum Weltkulturerbe erklärt.</c>
		</div>
		</button>
		<button class="fotoButton" id="paris" formaction="/Angebotsseite/Flugsuche/ankunft=Paris" formmethod="post">
		<b>nach Paris</b>
		<div id= "Beschreibung">
		<c>Paris ist ein Abenteuer- an jeder Ecke atmet man die jahrhundertealte Geschichte der Stadt und kann sich in den unzähligen Straßen in der Betrachtung der traumhaft schönen Fassaden stundenlang verlieren.</c>
		</div>
		</button>
	
		<button class="fotoButton" id="dublin" formaction="/Angebotsseite/Flugsuche/ankunft=Dublin" formmethod="post">
		<b>nach Dublin</b>
		<div id= "Beschreibung">
		<c>wenn wir uns die Insel im Atlantik als grünes Paradies vorstellen, dann ist die Hauptstadt im Osten vielleicht der Ort, wo die Paradiesfrucht hängt. Die wirtschaftliche Versuchung ist dort genauso zu Hause wie die Moderne und das pulsierende Leben. </c>
		</div>
		</button>
		<button class="fotoButton" id="sideny" formaction="/Angebotsseite/Flugsuche/ankunft=Sidney" formmethod="post">
		<b>nach Sidney</b>
		<div id= "Beschreibung">
		<c>Sydney ist unzweifelhaft eine der schönsten Städte der Welt mit einer phantastischen Lage an einem weit ausladenen Naturhafenbecken. Sie wurde von der Natur verwöhnt: z.B. durch kilometerlange weiße Sandstrände direkt vor der Haustüre.</c>
		</div>
		</button>
		<button class="fotoButton" id="side" formaction="/Angebotsseite/Flugsuche/ankunft=Side" formmethod="post">
		<b>nach Side</b>
		<div id= "Beschreibung">
		<c>Side liegt auf einer Halbinsel an der Mittelmeerküste und die Gebiete um Side herum sich mit vielen Hotels und Unterkünften touristisch erschlossen. Side ist ein sehr beliebten Ausflugsziel mit vielen Restaurants, Bars und Textil- bzw. Souveniergeschäften entwickelt.</c>
		</div>
		</button>
		<button class="fotoButton" id="barcelona" formaction="/Angebotsseite/Flugsuche/ankunft=Barcelona" formmethod="post">
		<b>nach Barcelona</b>
		<div id= "Beschreibung">
		<c>Direkt am Mittelmeer gelegen bietet die Barcelona eine perfekte Kombination von Städtereise und Urlaub am Meer. Die Arbeiten des katalanischen Architekten Antonio Gaudí zählen zum Weltkulturerbe.</c>
		</div>
		</button>
	
		<button class="fotoButton" id="bali" formaction="/Angebotsseite/Flugsuche/ankunft=Bali" formmethod="post">
		<b>nach Bali</b>
		<div id= "Beschreibung">
		<c>Berühmt ist dieses kleine Eiland wegen seiner einzigartigen Kultur und seiner liebenswerten Bevölkerung. Die Balinesen sind noch tief verwurzelt in ihrer Religion.</c>
		</div>
		</button>
		<button class="fotoButton" id="miami" formaction="/Angebotsseite/Flugsuche/ankunft=Miami" formmethod="post">
		<b>nach Miami</b>
		<div id= "Beschreibung">
		<c>Miami ist an der Atlantikküste, an der Südspitze von Florida, gelegen. Es ist dort das ganze Jahr über warm und üblicherweise in den Sommermonaten heiß und feucht.</c>
		</div>
		</button>
		<button class="fotoButton" id="lissabon" formaction="/Angebotsseite/Flugsuche/ankunft=Lissabon" formmethod="post">
		<b>nach Lissabon</b>
		<div id= "Beschreibung">
		<c>Die muntere Lebhaftigkeit dieser Stadt am Meer und deren faszinierende Schönheiten verlocken zu ausgedehnten Streifzügen. Verborgene Reize und der zärtliche Charme verleiten zum stillen Genießen, zu Ruhe und Erholung.</c>
		</div>
		</button>
		<button class="fotoButton" id="hamburg" formaction="/Angebotsseite/Flugsuche/ankunft=Hamburg" formmethod="post">
		<b>nach Hamburg</b>
		<div id= "Beschreibung">
		<c>Hamburg, Deutschlands bedeutendste Hafenstadt, ist auch ein Magnet für Touristen.Mit dem größten Überseehafen des Landes verbindet sich automatisch die Vorstellung, in eine Stadt am Meer zu kommen.</c>
		</div>
		</button>
		
		
	
	</div>
	</form>
	
		</div>		
		<%@ include file="Footer.jspf" %>
	</body>
</html>

