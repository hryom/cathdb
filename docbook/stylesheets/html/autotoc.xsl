<?xml version='1.0'?>
<xsl:stylesheet exclude-result-prefixes="d"
                 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:d="http://docbook.org/ns/docbook"
version='1.0'>

<!-- ====================================================================== -->

<xsl:template name="division.toc">
  <xsl:param name="toc-context" select="."/>
  <xsl:param name="toc.title.p" select="true()"/>

  <xsl:call-template name="make.toc">
    <xsl:with-param name="toc-context" select="$toc-context"/>
    <xsl:with-param name="toc.title.p" select="$toc.title.p"/>
    <xsl:with-param name="nodes" select="d:part|d:reference
                                         |d:preface|d:chapter|d:appendix
                                         |d:article
                                         |d:topic
                                         |d:bibliography|d:glossary|d:index
                                         |d:refentry
                                         |d:bridgehead[$bridgehead.in.toc != 0]
                                         |d:division"/>

  </xsl:call-template>
</xsl:template>

<xsl:template match="d:book" mode="toc">
  <xsl:param name="toc-context" select="."/>

  <xsl:call-template name="subtoc">
    <xsl:with-param name="toc-context" select="$toc-context"/>
    <xsl:with-param name="nodes" select="d:part|d:reference
                                         |d:preface|d:chapter|d:appendix
                                         |d:article
                                         |d:topic
                                         |d:bibliography|d:glossary|d:index
                                         |d:refentry
                                         |d:bridgehead[$bridgehead.in.toc != 0]
                                         |d:division"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="d:part|d:reference" mode="toc">
  <xsl:param name="toc-context" select="."/>

  <xsl:call-template name="subtoc">
    <xsl:with-param name="toc-context" select="$toc-context"/>
    <xsl:with-param name="nodes" select="d:appendix|d:chapter|d:article|d:topic
                                         |d:index|d:glossary|d:bibliography
                                         |d:preface|d:reference|d:refentry
                                         |d:bridgehead[$bridgehead.in.toc != 0]
                                         |d:division"/>
  </xsl:call-template>
</xsl:template>

  <xsl:template match="d:division" mode="toc">
    <xsl:param name="toc-context" select="."/>
    
    <xsl:call-template name="subtoc">
      <xsl:with-param name="toc-context" select="$toc-context"/>
      <xsl:with-param name="nodes" select="d:appendix|d:chapter|d:article|d:topic
        |d:index|d:glossary|d:bibliography
        |d:preface|d:reference|d:refentry
        |d:bridgehead[$bridgehead.in.toc != 0]"/>
    </xsl:call-template>
  </xsl:template>
  
</xsl:stylesheet>

