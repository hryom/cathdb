<?xml version="1.0" encoding="ASCII"?><!--This file was created automatically by html2xhtml--><!--from the HTML stylesheets.--><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" xmlns="http://www.w3.org/1999/xhtml" version="1.0" exclude-result-prefixes="d">

  <xsl:template match="d:statute">
    <!-- xsl:call-template name="id.warning"/ -->
    
    <div>
      <xsl:call-template name="common.html.attributes">
      	 <xsl:with-param name="inherit" select="0"/>
      </xsl:call-template>
	      <xsl:attribute name="id">
	        <xsl:call-template name="object.id"/>
	      </xsl:attribute>
      
      <xsl:call-template name="statute.titlepage"/>
     
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="d:statute/d:info/d:title" mode="titlepage.mode" priority="2">
    <xsl:call-template name="component.title">
      <xsl:with-param name="node" select="ancestor::d:statute[1]"/>
    </xsl:call-template>
  </xsl:template>

  <!-- xsl:template match="d:paragraph/d:subtitle
		       |d:paragraph/d:paragraphinfo/d:subtitle
		       |d:paragraph/d:info/d:subtitle
		       |d:paragraph/d:artheader/d:subtitle"
		mode="titlepage.mode" priority="2">
    <xsl:call-template name="component.subtitle">
      <xsl:with-param name="node" select="ancestor::d:paragraph[1]"/>
    </xsl:call-template>
  </xsl:template-->

  <xsl:template match="d:statute/d:info"/>  

</xsl:stylesheet>