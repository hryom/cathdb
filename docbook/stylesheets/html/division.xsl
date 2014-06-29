<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  exclude-result-prefixes="d"
  version="1.0">
  
  <xsl:template match="d:division">
    <xsl:call-template name="id.warning"/>
    
    <div>
      <xsl:apply-templates select="." mode="common.html.attributes"/>
      <xsl:call-template name="id.attribute">
        <xsl:with-param name="conditional" select="0"/>
      </xsl:call-template>
      
      <xsl:call-template name="division.titlepage"/>
      
      <xsl:variable name="toc.params">
        <xsl:call-template name="find.path.params">
          <xsl:with-param name="table" select="normalize-space($generate.toc)"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="not(d:divisionintro) and contains($toc.params, 'toc')">
        <xsl:call-template name="division.toc"/>
      </xsl:if>
      <xsl:apply-templates/>
      
    </div>
  </xsl:template>
  
  <xsl:template match="d:division" mode="make.part.toc">
    <xsl:call-template name="division.toc"/>
  </xsl:template>
  
  <xsl:template match="d:reference" mode="make.part.toc">
    <xsl:call-template name="division.toc"/>
  </xsl:template>
  
  <xsl:template match="d:division/d:docinfo"></xsl:template>
  <xsl:template match="d:division/d:divisioninfo"></xsl:template>
  <xsl:template match="d:division/d:info"></xsl:template>
  <xsl:template match="d:division/d:title"></xsl:template>
  <xsl:template match="d:division/d:titleabbrev"></xsl:template>
  <xsl:template match="d:division/d:subtitle"></xsl:template>
  
  <xsl:template match="d:divisionintro">
    <xsl:call-template name="id.warning"/>
    
    <div>
      <xsl:call-template name="common.html.attributes"/>
      <xsl:call-template name="id.attribute">
        <xsl:with-param name="conditional" select="0"/>
      </xsl:call-template>
      
      <xsl:call-template name="divisionintro.titlepage"/>
      <xsl:apply-templates/>
      
      <xsl:variable name="toc.params">
        <xsl:call-template name="find.path.params">
          <xsl:with-param name="node" select="parent::*"/>
          <xsl:with-param name="table" select="normalize-space($generate.toc)"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:if test="contains($toc.params, 'toc')">
        <!-- not ancestor::part because partintro appears in reference -->
        <xsl:apply-templates select="parent::*" mode="make.division.toc"/>
      </xsl:if>
      <xsl:call-template name="process.footnotes"/>
    </div>
  </xsl:template>
  
  <xsl:template match="d:divisionintro/d:title"></xsl:template>
  <xsl:template match="d:divisionintro/d:titleabbrev"></xsl:template>
  <xsl:template match="d:divisionintro/d:subtitle"></xsl:template>
  
  <xsl:template match="d:divisionintro/d:title" mode="divisionintro.title.mode">
    <h2>
      <xsl:apply-templates/>
    </h2>
  </xsl:template>
  
  <xsl:template match="d:divisionintro/d:subtitle" mode="partintro.title.mode">
    <h3>
      <i><xsl:apply-templates/></i>
    </h3>
  </xsl:template>
  
  
  
</xsl:stylesheet>