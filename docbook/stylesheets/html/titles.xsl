<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:exsl="http://exslt.org/common"
                xmlns:d="http://docbook.org/ns/docbook"
                version="1.0" exclude-result-prefixes="exsl">

  <xsl:template match="d:statute" mode="title.markup">
    <xsl:param name="allow-anchors" select="0"/>
    <xsl:variable name="title" select="d:info/d:title"/>
    <xsl:apply-templates select="$title" mode="title.markup">
      <xsl:with-param name="allow-anchors" select="$allow-anchors"/>
    </xsl:apply-templates>
  </xsl:template>
  
  <xsl:template match="d:title" mode="title.markup">
    <xsl:param name="allow-anchors" select="0"/>
    
    <xsl:choose>
      <xsl:when test="$allow-anchors != 0">
        <xsl:apply-templates select="*|text()|processing-instruction()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates mode="no.anchor.mode"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  
</xsl:stylesheet>
