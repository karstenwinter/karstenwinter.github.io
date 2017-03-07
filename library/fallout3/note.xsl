<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output doctype-public=".//W3C//DTD XHTML 1.0 Transitional//EN" />

<xsl:template match="note">

<xsl:variable name="zufall">
	<xsl:value-of select="translate(generate-id(.), 'abcdefixABCDEFGHIJKLMNOPQRSTUVWXYZ','5649781320913764825031097648251937') mod 21" />
</xsl:variable>

<html lang="de">
<head>
<meta http-equiv="Content-Type" content="charset=utf-8" />
<link rel='shortcut icon' href='ico.png' type='image/x-icon' />
<title><xsl:value-of select="@title" /></title>
<style type="text/css">
body {text-align: left; font-size: 12pt; margin: 0px; background-color: black; background-image: url('bg.jpg'); background-attachment: fixed; background-position: 50% 0%; background-repeat: no-repeat; color: rgb(160,255,160);}
* {font-family: 'Dejavu Sans Mono' 'Lucida Console' 'Courier New' monospace;}
div {text-align: justify; font-size: 13pt; margin-bottom: 12px;}

#content {width: 1000px;}
#banner {height: 95px; margin: 0px;}
#main {padding: 0px 2px 0px 20px; width: 670px; height: 420px; overflow: auto; overflow-x: hidden;}
#power {height: 100px; padding: 64px 257px 0px 0px;}
#button {background-image: url('button.jpg'); width: 54px; height: 52px; display: block; background-position: 0% 0%;}
#button:hover {background-position: 100% 0%;}

a {color: rgb(180,255,180); text-decoration: none;}
a[href="start.xml"] img {border: none;}
a:hover {color: rgb(60,255,60);}

#liste a:before {content: "&gt; "}
#liste a {display: block; list-style-type: disc;}
h1 {margin: 0px; padding: 0px; font-size: 16pt; line-height: 27px;}
q {quotes: "»" "«";}
</style>
</head>
<body>
<center>
		<table id="content" cellspacing="0">
		<tr>
			<td id="banner" align="center" colspan="2">
				<!-- Spruch -->
				<!--
<xsl:if test="$zufall = 0">Ob man aus einer Wasserquelle trinken will, ist immer eine taktische Frage. Normalerweise stellt man die angeschlagene Gesundheit wieder her, erhöht aber zugleich die eigene Strahlenbelastung.</xsl:if>
<xsl:if test="$zufall = 1">Beim Laufen sind Sie lauter als beim Gehen und können selbst dann, wenn Sie schleichen, leichter entdeckt werden.</xsl:if>
<xsl:if test="$zufall = 2">Wenn Sie die Schwierigkeit verändern, wird der Kampf dementsprechend schwerer oder leichter. Die Anzahl an EP, die Sie für das Töten von Feinden bekommen, wird dementsprechend an die Schwierigkeit angepasst.</xsl:if>
<xsl:if test="$zufall = 3">Möchten Sie einen Gegner an der Flucht hindern? Dann verkrüppeln Sie seine Beine.</xsl:if>
<xsl:if test="$zufall = 4">Tenpenny Tower wurde von Allistair Tenpenny, einem britischen Flüchtling, geschaffen, der ins Ödland der Hauptstadt gekommen war, um sein Glück zu finden.</xsl:if>
<xsl:if test="$zufall = 5">Allistair Tenpenny verlässt jetzt nur noch selten den Komfort und die Sicherheit seiner Penthousesuite. Er frönt einem Wahnsinn, der den Stinkreichen vorbehalten ist.</xsl:if>
<xsl:if test="$zufall = 6">In der Mitte des Kraters von Megaton liegt eine nicht detonierte Atombombe, ein Überbleibsel aus dem großen Krieg, der die Welt zerstört hat.</xsl:if>
<xsl:if test="$zufall = 7">Einige der ersten Siedler von Megaton wurden von der trügerischen Hoffnung angezogen, eines Tages in den nahegelegenen Vault 101 eingelassen zu werden.</xsl:if>
<xsl:if test="$zufall = 8">Viele Bewohner fragen sich, wer in Megaton wirklich das Sagen hat - Sheriff Simms oder Colin Moriarty, der örtliche Saloon-Besitzer.</xsl:if>
<xsl:if test="$zufall = 9">Die Anhänger der Kirche 'Kinder des Atoms' verehren die Atombombe von Megaton.</xsl:if>
<xsl:if test="$zufall = 10">Es wird gemunkelt, dass Moira Brown, die exzentrische Besitzerin des Craterside-Lagerraums, Helfer für ein neues Projekt sucht.</xsl:if>
<xsl:if test="$zufall = 11">Die Bewohner von Megaton fühlen sich hinter ihren Mauern aus Metall sicher, was paradox ist, wenn man bedenkt, dass sie in unmittelbarer Nähe einer scharfen Atombombe leben.</xsl:if>
<xsl:if test="$zufall = 12">Der vordere Abschnitt von Rivet City ist vom Rest des Flugzeugträgers abgetrennt und von feindlichen Mirelurks besetzt.</xsl:if>
<xsl:if test="$zufall = 13">Was einst eine kleine wissenschaftliche Gemeinschaft war, hat sich allmählich zu Rivet City, der größten menschlichen Siedlung im Ödland der Hauptstadt ,entwickelt.</xsl:if>
<xsl:if test="$zufall = 14">Doktor Madison Li, Mitglied von Rivet Citys Stadtrat, ist eine der größten Wissenschaftlerinnen ihrer Generation.</xsl:if>
<xsl:if test="$zufall = 15">Rivet City hat keine Haftmöglichkeiten für Kriminelle und toleriert keinerlei Verbrechen.</xsl:if>
<xsl:if test="$zufall = 16">Underworld ist zu einem Zufluchtsort für entrechtete Ghule aus dem ganzen Ödland der Hauptstadt geworden.</xsl:if>
<xsl:if test="$zufall = 17">Underworld entstand in den Überresten einer Sonderausstellung des Geschichtsmuseums, in der gezeigt wurde, wie sich die Menschen verschiedener Zivilisationen das Leben nach dem Tod vorgestellt haben.</xsl:if>
<xsl:if test="$zufall = 18">Die Ghule von?Underworld fühlen sich im Allgemeinen durch die Supermutanten von Washington DC nicht gestört, nehmen es aber der stählernen Bruderschaft übel, ihre Spielwiese in ein Kriegsgebiet verwandelt zu haben.</xsl:if>
<xsl:if test="$zufall = 19">Wenn Sie jemandem heimlich in die Tasche greifen und eine Mine oder eine Granate in seinem Inventar ablegen, wird der Sprengstoff ausgelöst, was verheerende Folgen hat.</xsl:if>
<xsl:if test="$zufall = 20">Das Ödland der Hauptstadt hat keine vereinte Regierung und weder ein System noch entsprechende Einrichtungen zur Verbrechensbekämpfung und -bestrafung. Wenn Sie jemandem ein Unrecht zufügen, müssen Sie darauf gefasst sein, mit Ihrem Leben dafür zu bezahlen.</xsl:if>
		-->
		<!-- Spruch -->
		
	</td>
		</tr>
		<tr>
		<td valign="top" align="center">
		<h1><xsl:value-of select="@title" />
		<xsl:if test="@title = 'Übersicht'">
		<xsl:text> </xsl:text>
		{<xsl:value-of select="count(//div/a)" /> Einträge}
		</xsl:if>
		</h1>
		<div id="main">
			<xsl:apply-templates />
		</div>
		</td>
		</tr>
		<tr>
		<td id="power" align="right" valign="bottom">
		<a href="start.xml"><span id="button"></span></a>
		</td>
		</tr>
	</table>
</center>
</body>
</html>
</xsl:template>

<xsl:template match="p|div|a">
	<xsl:copy-of select="." />
</xsl:template>

</xsl:stylesheet>