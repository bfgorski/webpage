<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
   QUick reminder
   {@width}: gets attribute from a tag
   {projectpage/xml}: gets child tag from a tag
-->

<!-- <xsl:template match="/">
<xsl:apply-templates xsl:match="researchproject" />
-->

<!-- 
   Match the research project element and process all nodes within it.
   Create the head of the document and the title 
-->
<xsl:template match="researchproject">
<html>
<head><title>
<xsl:value-of select="title"/></title></head>
<body bgcolor="#ffffff" text="#000000" link="#660000" vlink="#330000">
<center>

<xsl:comment> header image with cipic logo </xsl:comment>
<img src="../pictures/homepage/cipic-header.png" alt=""></img>
<br/>

<!-- process the tags in the research project -->
<xsl:apply-templates/>

<!-- 
   special link for the paper if it exists
-->
<xsl:variable name="paperLocation" select="paper/@file" />
<xsl:choose>
<xsl:when test="$paperLocation != ''">
<p>
A copy of the paper can be found <a href="{paper/@file}">here</a>
</p>
</xsl:when>
<xsl:otherwise>
<p></p>
</xsl:otherwise>
</xsl:choose>

<!--
   Above paper link written with an if instead of a choose
-->
<xsl:comment>
<xsl:if test="$paperLocation != ''">
<p>
A copy of the paper can be found <a href="{paper/@file}">here</a>
</p>
</xsl:if>
</xsl:comment>

<!-- footer image and context imformation -->
<font SIZE="-1">This page is maintained by: <A HREF="mailto:bfgregorski@ucdavis.edu">Benjamin Gregorski</A></font>
<br/>
<font SIZE="-1"><A HREF="http://graphics.cipic.ucdavis.edu/~gregorsk">Homepage</A></font>
<br/>
<img SRC="../pictures/homepage/cipic-footer.png" BORDER="0" ALT=""></img>

</center>
</body>
</html>
</xsl:template>

<!-- process sections of the research project -->
<xsl:template match="researchproject/section">
<!-- 
   put all section contents in a table 
   that can potentially have nested tables 
-->

<table BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="700" >

<!--
<xsl:variable name="sectionLabel" select="@label"/>
<xsl:choose>
<xsl:when test="$sectionLabel != ''">
<a name="$sectionLabel"><xsl:value-of select="$sectionLabel"/></a>
</xsl:when>
<xsl:otherwise>
</xsl:otherwise>
</xsl:choose>
-->

<!-- 
title child tag is no longer used 
<xsl:variable name="titletag" select="child::title"/>
<xsl:when test="$titletag != ''">
<h3><xsl:value-of select="$titletag"/></h3>
</xsl:when>
-->

<xsl:variable name="sct" select="@title"/>
<a name="$sct"></a>
<xsl:choose>
<xsl:when test="$sct != ''">
<tr align="center">
<td align="center">
<h3><xsl:value-of select="$sct"/></h3>
</td>
</tr>
</xsl:when>
<xsl:otherwise>
<tr align="center">
<td align="center">
<h3></h3>
</td>
</tr>
</xsl:otherwise>
</xsl:choose>

<tr>
<td>
<xsl:comment>Apply templates to the section</xsl:comment>
<xsl:apply-templates/> 
</td>
</tr>
</table>
</xsl:template>

<!--
   Templates for different features of a section tag.
   This tag is no longer necessary for each section
-->
<xsl:template match="researchproject/section/text">
<xsl:apply-templates/> 
</xsl:template>

<!-- Insert images into the current stream as a hyperlink to the full image -->
<xsl:template match="image">
<a href="{file}">
<img src="{file}" width="{file/@width}" height="{file/@height}"/>
</a>
</xsl:template>

<!-- 
   Process figures which can have images in a row and a text caption 
-->
<xsl:template match="figure">
<p/>

<!-- get the width of the image -->
<xsl:variable name="tableWidth" select="sum(image/file/@width)"/>

<!--
<xsl:for-each select="image">
<xsl:variable name="temp" as="xs:integer" select="number(file/@width)"/>
<xsl:value-of select="$temp"/>
</xsl:for-each>
<xsl:value-of select="$tableWidth"/>
-->

<center>
<table BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="700" >
<tr align="center">
<xsl:for-each select="image">
<td align="center">
<a href="{file}">
<img align="center" src="{file}" width="{file/@width}" height="{file/@height}"/>
</a>
</td>
</xsl:for-each>
</tr>

<tr>
<td align="center" colspan="100">
<xsl:apply-templates select="caption"/>
</td>
</tr>
</table>
</center>
<p/>
</xsl:template>

<!-- Process tables on information
<xsl:template match="table">
<xsl:apply-templates/>
</xsl:template>
-->

<!-- Process an enumeration as an ordered list -->
<xsl:template match="enumerate">
<ol>
<xsl:for-each select="item">
<li><xsl:apply-templates/></li>
</xsl:for-each>
</ol>
</xsl:template>

<!-- 
   Process an unordered list of elements
-->
<xsl:template match="list">
<ul>
<xsl:for-each select="item">
<li><xsl:apply-templates/></li>
</xsl:for-each>
</ul>
</xsl:template>


<!-- Process an included link -->
<xsl:template match="link">
<a href="{@target}"><xsl:value-of select="@text"/></a>
</xsl:template>

<xsl:template match="p">
<p/>
</xsl:template>

<xsl:template match="br">
<br/>
</xsl:template>

<!-- Bold faced text -->
<xsl:template match="bf">
<b><xsl:apply-templates/></b>
</xsl:template>

<!-- italic emphasized text -->
<xsl:template match="em">
<em><xsl:apply-templates/></em>
</xsl:template>

<!-- references to labels
<xsl:variable name="sct" select="@title"/>
<xsl:template match="ref">
<xsl:variable name="refLabel" select="@label"/>
<a href="#{$refLabel}">Reference</a>
</xsl:template>
 -->

<xsl:template match="abstract"> 
<h3>Abstract</h3>
<table BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="700" >
<tr>
<td>
<xsl:apply-templates/>
</td>
</tr>
</table>
</xsl:template>

<xsl:template match="authors"> 
<table>
<tr> 
<td><center>
<xsl:apply-templates/>
</center></td>
</tr>
</table>
</xsl:template>

<!--
   The document's title
-->
<xsl:template match="title"> 
<table border="0" cellpadding="0" cellspacing="0" width="700">
<tr> 
<td><center><h2> 
<xsl:apply-templates/>
</h2></center></td>
</tr>
</table>
</xsl:template>

<!--
   Special table enclosed figure
-->
<xsl:template match="teaser">
<table border="0" cellpadding="0" cellspacing="0" width="700" >
<tr>
<td>
<xsl:apply-templates select="figure"/>
</td>
</tr>
</table>
</xsl:template>

<!-- 
   Super and sub scripts
-->
<xsl:template match="sub">
<sub><xsl:apply-templates/></sub>
</xsl:template>

<xsl:template match="sup">
<sup><xsl:apply-templates/></sup>
</xsl:template>

</xsl:stylesheet>


