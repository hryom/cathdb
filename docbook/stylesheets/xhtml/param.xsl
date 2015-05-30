<?xml version="1.0" encoding="ASCII"?><!--This file was created automatically by html2xhtml--><!--from the HTML stylesheets.--><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="d" version="1.0">
  
  <xsl:variable name="docid" select="/*/@xml:id"/>

  <xsl:param name="base.dir" select="concat('../output/html/', $docid)"/>
  <xsl:param name="chunk.first.sections" select="1"/>
  <xsl:param name="chunk.section.depth" select="0"/>
  <xsl:param name="chunk.tocs.and.lots" select="1"/>
  <xsl:param name="division.autolabel">I</xsl:param>
  <xsl:param name="generate.toc">
    article toc,title
    book    toc,title
    set     toc,title
  </xsl:param>
  <xsl:param name="html.stylesheet" select="'../css/cathdb.css ../css/eccdoc.css'"/>
  <xsl:param name="local.l10n.xml" select="document('../common/l10n.xml')"/>
  <xsl:param name="use.id.as.filename" select="1"/>
  <xsl:param name="root.filename" select="$docid"/>
  <xsl:param name="current.docid" select="$docid"/>

</xsl:stylesheet>