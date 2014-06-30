<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  exclude-result-prefixes="d"
  version='1.0'>
  
  <xsl:template match="d:chapter" mode="label.markup">
    <xsl:choose>
      <xsl:when test="@label">
        <xsl:value-of select="@label"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="d:division" mode="label.markup">
    <xsl:choose>
      <xsl:when test="@label">
        <xsl:value-of select="@label"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="d:divisionintro" mode="label.markup">
    <!-- no label -->
  </xsl:template>
  
</xsl:stylesheet>