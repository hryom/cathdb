<?xml version="1.0" encoding="ASCII"?><!--This file was created automatically by html2xhtml--><!--from the HTML stylesheets.--><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" xmlns="http://www.w3.org/1999/xhtml" version="1.0" exclude-result-prefixes="doc d">
  
  <!-- ********************************************************************
    $Id: onechunk.xsl 6910 2007-06-28 23:23:30Z xmldoc $
    ********************************************************************
    
    This file is part of the XSL DocBook Stylesheet distribution.
    See ../README or http://docbook.sf.net/release/xsl/current/ for
    copyright and other information.
    
    ******************************************************************** -->
  
  <!-- ==================================================================== -->
  
  <xsl:import href="docbook-no-doctype.xsl"/>
  <xsl:import href="chunk-common.xsl"/>
  <xsl:include href="chunk-code.xsl"/>
  
  <xsl:template name="breadcrumbs">
    <xsl:param name="this.node" select="."/>
    <div class="breadcrumbs">
      <xsl:for-each select="$this.node/ancestor::*">
        <span class="breadcrumb-link">
          <a>
            <xsl:attribute name="href">
              <xsl:call-template name="href.target">
                <xsl:with-param name="object" select="."/>
                <xsl:with-param name="context" select="$this.node"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:apply-templates select="." mode="title.markup"/>
          </a>
        </span>
        <xsl:text> &gt; </xsl:text>
      </xsl:for-each>
      <!-- And display the current node, but not as a link -->
      <span class="breadcrumb-node">
        <xsl:apply-templates select="$this.node" mode="title.markup"/>
      </span>
    </div>
  </xsl:template>
  
  <xsl:template name="minitoc">
    <xsl:param name="this.node" select="."/>
    <div class="minitoc">
      <xsl:for-each select="d:part|d:division|d:chapter|d:preface|d:appendix|d:article|d:section[d:section[@conformance='in-brief']]">
        <div class="minitoc-link">
          <a>
            <xsl:attribute name="href">
              <xsl:call-template name="href.target">
                <xsl:with-param name="object" select="."/>
                <xsl:with-param name="context" select="$this.node"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:apply-templates select="." mode="object.title.markup">
              <xsl:with-param name="allow-anchors" select="1"/>
            </xsl:apply-templates>
          </a>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>
  
  <xsl:template name="user.header.content">
    <xsl:if test="$onechunk = '0'">
      <xsl:call-template name="breadcrumbs"/>
    </xsl:if>
  </xsl:template>
  
  <xsl:template name="user.footer.content">
    <xsl:if test="$onechunk = '0'">
      <xsl:call-template name="minitoc"/>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>