<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output doctype-public=".//W3C//DTD XHTML 1.0 Transitional//EN" />
<xsl:template match="book">
<html lang="de">
<head>
<meta http-equiv="Content-Type" content="charset=utf-8" />
<link rel="stylesheet" href="../xsl/normal.css" />
<link rel="stylesheet" media="print" href="../xsl/print.css" />
<!--<link rel="stylesheet" media="handheld" href="../xsl/hand.css" />-->
<link rel='shortcut icon' href="../pic/ico.png" type='image/x-icon' />
<title>
<xsl:value-of select="@title" />
</title>
</head>
<body>
<center>
		<table class="content" cellspacing="0">
			<tr>
				<td class="banner" colspan="2">
				</td>
			</tr>
		<tr>
			<td class="side" valign="top"> ♦
				<a href="../alle.html">Übersicht</a> ♦
				<a href="../index/index.xml">Startseite</a> ♦
				<a href="../skl/index.xml">Lehrbücher</a> ♦
				<a href="../clutter/index.xml">Kram</a> ♦
				<a href="../book/index.xml">Lesebücher</a> ♦
				<a href="../mq/index.xml">Hauptquest</a> ♦
				<a href="../ms/index.xml">Nebenquests</a> ♦
				<a href="../broad/index.xml">Rappenkurier</a> ♦
				<a href="../house/index.xml">Hausausbau</a> ♦
				<a href="../dark/index.xml">D. Bruderschaft</a> ♦
				<a href="../tg/index.xml">Diebes-Gilde</a> ♦
				<a href="../mg/index.xml">Kämpfer- &amp; Magier-Gilde</a> ♦
				<a href="../other/index.xml">Sonstige</a> ♦
				<a href="../se/index.xml">Zitternde Inseln</a> ♦
				<a href="../knight/index.xml">Ritter der Neun</a> ♦
				<a href="../frost/index.xml">Eiszack-Turm</a> ♦
				<a href="../dlc/index.xml">andere Addons</a> ♦
		</td></tr><tr>
		<td class="main" valign="top">
		<xsl:apply-templates select="h1" />
		<div>
			<table>
			<tr>
			<td valign="top">
			<xsl:if test=" //@icon = 'iconbroadsheet.png'">
				<center><img src="../pic/broadsheetheader01.png" alt="Der Rappenkurier" /></center><br />
			</xsl:if>
			<xsl:choose>
				<xsl:when test=" //@type">
				</xsl:when>
				<xsl:otherwise>
				<table class="inner">
				<tr>
				<td class="head" align="center">
					<xsl:element name="h2">
					<xsl:if test="@icon">
					<xsl:attribute name="style">
						background-image: url("../pic/<xsl:value-of select="@icon" />");
					</xsl:attribute>
					</xsl:if>
					<xsl:value-of select="@title" />
					</xsl:element>
					</td>
					</tr>
					</table>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="div" />
			</td>
			</tr>
			</table>
		</div>
		</td>
		</tr>
	</table>
</center>
</body>
</html>
</xsl:template>

<xsl:template match="div">
	<xsl:copy-of select="." />
</xsl:template>

</xsl:stylesheet>