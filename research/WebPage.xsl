<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:wp="http://graphics.cs.ucdavis.edu/~gregorsk/research/WebPage"
>

<xsl:apply-templates xsl:match="wp:webpage"/>
<!--
<xsl:template match="/">
-->

<!--
   Match a web page and process the elements inside it
-->
<xsl:template match="wp:webpage" >
<html>
<head><title>
<xsl:value-of select="wp:pagename"/>
</title></head>
<body bgcolor="#ffffff" text="#000000" link="#440000" vlink="#660000">
<xsl:apply-templates/>


<!-- footer image and context imformation -->
<center>
<font SIZE="-1">This page is maintained by: <A HREF="mailto:bfgregorski@ucdavis.edu">Benjamin Gregorski</A></font>
<br/>
<font SIZE="-1"><A HREF="http://graphics.cipic.ucdavis.edu/~gregorsk">Homepage</A></font>
<br/>
</center>

</body>
</html>
</xsl:template>

<!--
   A project formatting environment
-->
<xsl:template match="project">
<table BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="{@width}" >
<tr>
<td colspan="1">
<b><xsl:apply-templates select="title"/></b>
<br/>
<xsl:value-of select="authors"/>
<br/>

<xsl:variable name="projectPageXML" select="projectpage/xml"/>
<xsl:variable name="projectPageHTML" select="projectpage/html"/>
<xsl:if test="$projectPageXML != ''">
<!-- <b>Project Page(XML): </b> -->
<a href="{projectpage/xml}"><xsl:value-of select="projectpage/xml"/></a>
</xsl:if>
<br/>
<xsl:if test="$projectPageHTML != ''">
<!-- <b>Project Page(HTML): </b> -->
<a href="{projectpage/html}"><xsl:value-of select="projectpage/html"/></a>
</xsl:if>
</td>
</tr>
<tr>
<td> 
<!--
<a href="{image/file}">
</a> 
-->
<img align="left" src="{image/file}" width="{image/@width}" height="{image/@height}" alt="{image/file}"/>
<xsl:value-of select="abstract"/> </td>
</tr>
</table>

</xsl:template>

<!--
   Create an overall title for the page
-->
<xsl:template match="wp:title">
<center>
<b><xsl:apply-templates/></b>
</center>
</xsl:template>

<!--
   Empty placeholder so that pagename
   is not displayed twice b/c of apply-templates.
   I think this should eventually be replaced with a sort.
-->
<xsl:template match="wp:pagename">
</xsl:template>

<!--
   An image is a picture file associated with a possible link.
   For example a thumbnail image can be linked to a full resolution image.
-->
<xsl:template match="image">
<a href="{link}">
<img align="center" src="{file}" width="{file/@width}" height="{file/@height}"/>
</a>
</xsl:template>

<!--
  A pictureRow is a row of pictures with associated captions
  is stored horizontally.
-->
<xsl:template match="pictureRow">
<p/>

<!-- get the width of the image -->
<xsl:variable name="tableWidth" xsl:as="xs:integer" select="sum(image/file/@width)"/>

<!-- get the width of the image -->
<xsl:variable name="borderSize" xsl:as="xs:integer">
7
</xsl:variable>

<center>
<table BORDER="{border}" CELLPADDING="0" CELLSPACING="0" WIDTH="{width}" >

<tr align="center">
<xsl:apply-templates select="image"/>

<!--
<xsl:for-each select="image">
<td align="center">
<a href="{link}">
<img align="center" src="{file}" width="{file/@width}" height="{file/@height}"/>
</a>
</td>
</xsl:for-each>
-->
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

<!-- 
   Links are translated into html links 
-->
<xsl:template match="link">
<a href="{@target}"><xsl:value-of select="@text"/></a>
</xsl:template>

<!--
   Horizontal Line
-->
<xsl:template match="hl">
<hr/>
</xsl:template>

<!--
   Paragraph Breaks
-->
<xsl:template match="p">
<p/>
</xsl:template>

<!--
   Newline breaks
-->
<xsl:template match="br">
<br/>
</xsl:template>

<!-- 
   Bold faced text 
-->
<xsl:template match="bf">
<b><xsl:apply-templates/></b>
</xsl:template>

<!-- 
   italic emphasized text 
-->
<xsl:template match="em">
<em><xsl:apply-templates/></em>
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


<xsl:template match="center">
<center><xsl:apply-templates/></center>
</xsl:template>


<xsl:template match="defaultBorder">
</xsl:template>

</xsl:stylesheet>

