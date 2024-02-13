<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:saxon="http://saxon.sf.net/" version="1.0">
  <xsl:output method="text"/>
  <xsl:variable name="new-line" select="'&#10;'"/>
  <xsl:variable name="tab" select="'&#9;'"/>
  <xsl:variable name="output-serialization-parameters" as="element()">
    <output:serialization-parameters xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization">
      <output:method value="xml"/>
    </output:serialization-parameters>
  </xsl:variable>

  <xsl:template match="/extracts">
	  <xsl:text>{
	"extracts": [
  </xsl:text>	  
    <xsl:for-each select="extract">
      <xsl:if test="position()&gt;1">
        <xsl:text>,</xsl:text>
      </xsl:if>
      <xsl:text>
{
	      "type": "</xsl:text><xsl:value-of select="type"/><xsl:text>",</xsl:text>
          <xsl:if test="oid"><xsl:text>
              "oid": "</xsl:text><xsl:value-of select="oid"/><xsl:text>",</xsl:text>
          </xsl:if>
          <xsl:text>
	      "title": "</xsl:text><xsl:value-of select="replace(replace(title, $new-line, '\\n'), $tab, '\\t')"/><xsl:text>",
	      "text": "</xsl:text><xsl:value-of select="replace(replace(text, $new-line, '\\n'), $tab, '\\t')" /><xsl:text>"
}
</xsl:text>
    </xsl:for-each>
    <xsl:text>]
    }
</xsl:text>	  
  </xsl:template>


  <!--  <xsl:template match="*[contains(@class,' topic/topic ')]/*[contains(@class,' topic/title ')]">
    <xsl:text>
"title": "</xsl:text><xsl:apply-templates/><xsl:text>",
</xsl:text>
  </xsl:template>

  <xsl:template match="*[contains(@class,' topic/linktext ')]">
    <xsl:text>
RELATED LINK: </xsl:text><xsl:apply-templates/><xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="*[contains(@class,' topic/author ')]">
  </xsl:template>

  <xsl:template match="*[contains(@class,' topic/body ')]">
    <xsl:text>
"body": "</xsl:text><xsl:apply-templates/><xsl:text>"
</xsl:text>
  </xsl:template> -->
</xsl:stylesheet>

