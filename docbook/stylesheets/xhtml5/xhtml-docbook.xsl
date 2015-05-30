<?xml version="1.0" encoding="utf-8"?>
<!--This file was created automatically by xhtml2xhtml5.xsl from the xhtml stylesheet.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="d" version="1.0">

  <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/1.78.1/xhtml/docbook-no-doctype.xsl"/>
  
  <xsl:include href="../xhtml/param.xsl"/>
  <xsl:include href="../common/labels.xsl"/>
  <xsl:include href="../common/gentext.xsl"/>
  <xsl:include href="../xhtml/autotoc.xsl"/>
  <xsl:include href="../xhtml/block.xsl"/>
  <xsl:include href="../xhtml/component.xsl"/>
  <xsl:include href="../xhtml/division.xsl"/>
  
  <xsl:include href="../xhtml/targets.xsl"/>
  <xsl:include href="../xhtml/titlepage.templates.xsl"/>
  <xsl:include href="../xhtml/titlepage.xsl"/>
  <xsl:include href="../xhtml/titles.xsl"/>
  <xsl:include href="../xhtml/xref.xsl"/>

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