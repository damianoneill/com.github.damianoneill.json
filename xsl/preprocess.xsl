<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" version="2.0">
    <xsl:strip-space elements="*" />
    <xsl:output method="xml"/>
    
  <xsl:template match="/">
	  <extracts>
	  <xsl:for-each select="(//topic-map | //task | //concept | //section | //subsection)[title]">
        <xsl:variable name="newstring">
            <xsl:apply-templates select="tmbody/*"/>
            <xsl:apply-templates select="conbody/*"/>
            <xsl:apply-templates select="taskbody/*"/>
            <xsl:apply-templates select="refbody/*"/>
            <xsl:apply-templates select="p"/>
        </xsl:variable>
	<extract>
        <xsl:if test="@oid">
            <oid><xsl:value-of select="@oid"/></oid>
        </xsl:if>
		<type><xsl:value-of select ="local-name()"/></type>
		<title><xsl:value-of select="title"/></title>
		<text><xsl:value-of select="$newstring"/></text>
	</extract>
    </xsl:for-each>
	  </extracts>
  </xsl:template>

  <xsl:template match="text()"><xsl:value-of select="normalize-space(.)"/></xsl:template>

  <xsl:template match="*[contains(@class, 'p')]"><xsl:choose><xsl:when test="parent::li"><xsl:apply-templates/></xsl:when><xsl:otherwise>&lt;p><xsl:apply-templates/>&lt;/p></xsl:otherwise></xsl:choose></xsl:template>

  
</xsl:stylesheet>

