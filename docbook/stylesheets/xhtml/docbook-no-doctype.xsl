<?xml version="1.0" encoding="ASCII"?><!--This file was created automatically by html2xhtml--><!--from the HTML stylesheets.--><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="d" version="1.0">

  <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/1.78.1/xhtml/docbook.xsl"/>
  
  <xsl:include href="param.xsl"/>
  <xsl:include href="../common/labels.xsl"/>
  <xsl:include href="../common/gentext.xsl"/>
  <xsl:include href="autotoc.xsl"/>
  <xsl:include href="block.xsl"/>
  <xsl:include href="component.xsl"/>
  <xsl:include href="division.xsl"/>
  
  <xsl:include href="targets.xsl"/>
  <xsl:include href="titlepage.templates.xsl"/>
  <xsl:include href="titlepage.xsl"/>
  <xsl:include href="titles.xsl"/>
  <xsl:include href="xref.xsl"/>

  <xsl:template match="d:cover">
    <div class="cover">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="d:poetry">
    <div class="poetry">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="d:line">
    <div class="line">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <!-- xsl:template match="d:milestone"/ --> 
  
  <xsl:template name="statute.title">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>