<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output doctype-public=".//W3C//DTD XHTML 1.0 Transitional//EN" />
<xsl:template match="buch">
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="charset=utf-8" />
<link rel='shortcut icon' href="ico.png" type='image/x-icon' />
<style type="text/css">
* {font-family: "MPlantin" "MinionPro-It" "Sylfaen" "Palatino Linotype" "Pescadero" "Calligraphic 421 BT", serif;}
body {color: orange; background-color: black;}
p {margin-bottom: 2px; text-align: justify; width: 960px; font-size: 15pt;}
span {text-align: right; font-size: 90%; color: grey;}
</style>
<link rel="stylesheet" media="print" type="text/css" href="print.css" />
<title>
<xsl:value-of select="@name" />
</title>
</head>
<body>
<center>
	<table class="content" cellspacing="0">
		<tr>
			<td>
			<h1><xsl:value-of select="@name" /></h1>
			<span>Wert: <xsl:value-of select="@preis" /> | Gewicht: <xsl:value-of select="@gewicht" /></span>
			<xsl:apply-templates />
			</td>
		</tr>
	</table>
</center>
</body>
</html>
</xsl:template>

<xsl:template match="p">
	<xsl:copy-of select="." />
</xsl:template>

<!--<xsl:template match="img">
	<center>
	<img>
	<xsl:attribute name="src">pic/<xsl:value-of select="@src" /></xsl:attribute>
	<xsl:attribute name="width"><xsl:value-of select="@width" /></xsl:attribute>
	<xsl:attribute name="height"><xsl:value-of select="@height" /></xsl:attribute>
	</img>
	</center>
</xsl:template>-->

</xsl:stylesheet>