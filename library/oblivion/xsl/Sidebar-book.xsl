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
<xsl:value-of select="@title"/>
</title>
</head>
<body>
<center>
		<table class="content" cellspacing="1">
			<tr>
				<td class="banner" colspan="2">
				</td>
			</tr>
		<tr>
			<td class="side" valign="top">
			<div>
				<ul class="side">
				<li><a href="../index/index.xml">Startseite</a></li>
				<li><a href="../skl/index.xml">Lehrbücher</a></li>
				<li><a href="../clutter/index.xml">Kram</a></li>
				<li><a href="../book/index.xml">Lesebücher</a></li>
				<li><a href="../mq/index.xml">Hauptquest</a></li>
				<li><a href="../ms/index.xml">Nebenquests</a></li>
				<li><a href="../broad/index.xml">Rappenkurier</a></li>
				<li><a href="../house/index.xml">Hausausbau</a></li>
				<li><a href="../dark/index.xml">D. Bruderschaft</a></li>
				<li><a href="../tg/index.xml">Diebes-Gilde</a></li>
				<li><a href="../mg/index.xml">Kampfer-Gilde</a></li>
				<li><a href="../mg/index.xml">Magier-Gilde</a></li>
				<li><a href="../other/index.xml">Sonstige</a></li>
				<li><a href="../se/index.xml">Zitternde Inseln</a></li>
				<li><a href="../knight/index.xml">Ritter der Neun</a></li>
				<li><a href="../frost/index.xml">Eiszack-Turm</a></li>
				</ul>
			</div>
		</td>
		<td class="main" valign="top">
		<xsl:apply-templates select="h1" />
		<div>
			<table>
			<tr>
			<td valign="top">
			<xsl:if test="//@icon = 'iconbroadsheet.png'">
				<center><img src="../pic/broadsheetheader01.png" alt="Der Rappenkurier"/></center><br />
			</xsl:if>
			<xsl:choose>
				<xsl:when test="//@type">
				</xsl:when>
				<xsl:otherwise>
				<table class="inner">
				<tr>
				<td class="head" align="center">
					<h2>
					<xsl:value-of select="@title"/>
					</h2>
				</td>
					<xsl:if test="@icon">
					<td align="right">
						<xsl:element name="img">
				        <xsl:attribute name="class">icon</xsl:attribute>
				        <xsl:attribute name="src">
							../pic/<xsl:value-of select="@icon"/>
						</xsl:attribute>
				        <xsl:attribute name="align">bottom</xsl:attribute>
				        <xsl:attribute name="alt"></xsl:attribute>
						</xsl:element>
						</td>
				  	</xsl:if>
					</tr>
					</table>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:apply-templates select="div"/>
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
	<xsl:copy-of select="."/>
</xsl:template>

</xsl:stylesheet>
