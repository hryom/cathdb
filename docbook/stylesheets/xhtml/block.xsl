<?xml version="1.0" encoding="ASCII"?><!--This file was created automatically by html2xhtml--><!--from the HTML stylesheets.--><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="d" version="1.0">
  
  <xsl:template match="d:statute/d:para[1]">
    <xsl:call-template name="paragraph">
      <xsl:with-param name="class">
        <xsl:if test="@role and $para.propagates.style != 0">
          <xsl:value-of select="@role"/>
        </xsl:if>
        <xsl:text> first</xsl:text>
      </xsl:with-param>
      <xsl:with-param name="content">
        <xsl:if test="position() = 1 and parent::d:listitem">
          <xsl:call-template name="anchor">
            <xsl:with-param name="node" select="parent::d:listitem"/>
          </xsl:call-template>
        </xsl:if>
        
        <xsl:call-template name="anchor"/>
        <xsl:apply-templates/>
      </xsl:with-param>
    </xsl:call-template>
    
  </xsl:template>
  
</xsl:stylesheet>