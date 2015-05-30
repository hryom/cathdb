<?xml version="1.0" encoding="ASCII"?><!--This file was created automatically by html2xhtml--><!--from the HTML stylesheets.--><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:d="http://docbook.org/ns/docbook" xmlns="http://www.w3.org/1999/xhtml" version="1.0" exclude-result-prefixes="exsl d">

<!-- This stylesheet was created by template/titlepage.xsl; do not edit it by hand. -->

<xsl:template name="book.titlepage.recto">
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:cover"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:cover"/>
  <xsl:choose>
    <xsl:when test="d:bookinfo/d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>

  <xsl:choose>
    <xsl:when test="d:bookinfo/d:subtitle">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:info/d:subtitle">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:subtitle">
      <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:subtitle"/>
    </xsl:when>
  </xsl:choose>

  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:corpauthor"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:corpauthor"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:authorgroup"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:authorgroup"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:author"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:author"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:othercredit"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:othercredit"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:releaseinfo"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:releaseinfo"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:copyright"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:copyright"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:legalnotice"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:legalnotice"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:pubdate"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:pubdate"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:revision"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:revision"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:revhistory"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:revhistory"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:bookinfo/d:abstract"/>
  <xsl:apply-templates mode="book.titlepage.recto.auto.mode" select="d:info/d:abstract"/>
</xsl:template>

<xsl:template name="book.titlepage.verso">
</xsl:template>

<xsl:template name="book.titlepage.separator"><hr/>
</xsl:template>

<xsl:template name="book.titlepage.before.recto">
</xsl:template>

<xsl:template name="book.titlepage.before.verso">
</xsl:template>

<xsl:template name="book.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="book.titlepage.before.recto"/>
      <xsl:call-template name="book.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="book.titlepage.before.verso"/>
      <xsl:call-template name="book.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="book.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="book.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="book.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:cover" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:title" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:subtitle" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:corpauthor" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:authorgroup" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:author" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:othercredit" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:releaseinfo" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:copyright" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:legalnotice" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:pubdate" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:revision" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:revhistory" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:abstract" mode="book.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="book.titlepage.recto.style">
<xsl:apply-templates select="." mode="book.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="division.titlepage.recto">
  <div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:call-template name="division.title">
<xsl:with-param name="node" select="ancestor-or-self::d:division[1]"/>
</xsl:call-template></div>
  <xsl:choose>
    <xsl:when test="d:divisioninfo/d:subtitle">
      <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:docinfo/d:subtitle">
      <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:info/d:subtitle">
      <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:subtitle">
      <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:subtitle"/>
    </xsl:when>
  </xsl:choose>

  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:corpauthor"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:corpauthor"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:corpauthor"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:authorgroup"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:authorgroup"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:authorgroup"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:author"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:author"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:author"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:othercredit"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:othercredit"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:othercredit"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:releaseinfo"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:releaseinfo"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:releaseinfo"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:copyright"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:copyright"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:copyright"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:legalnotice"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:legalnotice"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:legalnotice"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:pubdate"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:pubdate"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:pubdate"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:revision"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:revision"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:revision"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:revhistory"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:revhistory"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:revhistory"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:divisioninfo/d:abstract"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:docinfo/d:abstract"/>
  <xsl:apply-templates mode="division.titlepage.recto.auto.mode" select="d:info/d:abstract"/>
</xsl:template>

<xsl:template name="division.titlepage.verso">
</xsl:template>

<xsl:template name="division.titlepage.separator">
</xsl:template>

<xsl:template name="division.titlepage.before.recto">
</xsl:template>

<xsl:template name="division.titlepage.before.verso">
</xsl:template>

<xsl:template name="division.titlepage">
  <div class="titlepage">
    <xsl:variable name="recto.content">
      <xsl:call-template name="division.titlepage.before.recto"/>
      <xsl:call-template name="division.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="division.titlepage.before.verso"/>
      <xsl:call-template name="division.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="division.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="division.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="division.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:subtitle" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:corpauthor" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:authorgroup" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:author" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:othercredit" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:releaseinfo" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:copyright" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:legalnotice" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:pubdate" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:revision" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:revhistory" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:abstract" mode="division.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="division.titlepage.recto.style">
<xsl:apply-templates select="." mode="division.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="divisionintro.titlepage.recto">
  <xsl:choose>
    <xsl:when test="d:divisionintroinfo/d:title">
      <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:docinfo/d:title">
      <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>

  <xsl:choose>
    <xsl:when test="d:divisionintroinfo/d:subtitle">
      <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:docinfo/d:subtitle">
      <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:info/d:subtitle">
      <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:subtitle"/>
    </xsl:when>
    <xsl:when test="d:subtitle">
      <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:subtitle"/>
    </xsl:when>
  </xsl:choose>

  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:corpauthor"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:corpauthor"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:corpauthor"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:authorgroup"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:authorgroup"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:authorgroup"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:author"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:author"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:author"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:othercredit"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:othercredit"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:othercredit"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:releaseinfo"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:releaseinfo"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:releaseinfo"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:copyright"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:copyright"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:copyright"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:legalnotice"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:legalnotice"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:legalnotice"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:pubdate"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:pubdate"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:pubdate"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:revision"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:revision"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:revision"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:revhistory"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:revhistory"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:revhistory"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:divisionintroinfo/d:abstract"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:docinfo/d:abstract"/>
  <xsl:apply-templates mode="divisionintro.titlepage.recto.auto.mode" select="d:info/d:abstract"/>
</xsl:template>

<xsl:template name="divisionintro.titlepage.verso">
</xsl:template>

<xsl:template name="divisionintro.titlepage.separator">
</xsl:template>

<xsl:template name="divisionintro.titlepage.before.recto">
</xsl:template>

<xsl:template name="divisionintro.titlepage.before.verso">
</xsl:template>

<xsl:template name="divisionintro.titlepage">
  <div>
    <xsl:variable name="recto.content">
      <xsl:call-template name="divisionintro.titlepage.before.recto"/>
      <xsl:call-template name="divisionintro.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <div><xsl:copy-of select="$recto.content"/></div>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="divisionintro.titlepage.before.verso"/>
      <xsl:call-template name="divisionintro.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <div><xsl:copy-of select="$verso.content"/></div>
    </xsl:if>
    <xsl:call-template name="divisionintro.titlepage.separator"/>
  </div>
</xsl:template>

<xsl:template match="*" mode="divisionintro.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="divisionintro.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:title" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:subtitle" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:corpauthor" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:authorgroup" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:author" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:othercredit" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:releaseinfo" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:copyright" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:legalnotice" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:pubdate" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:revision" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:revhistory" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template match="d:abstract" mode="divisionintro.titlepage.recto.auto.mode">
<div xsl:use-attribute-sets="divisionintro.titlepage.recto.style">
<xsl:apply-templates select="." mode="divisionintro.titlepage.recto.mode"/>
</div>
</xsl:template>

<xsl:template name="statute.titlepage.recto">
  <xsl:choose>
    <xsl:when test="d:statuteinfo/d:title">
      <xsl:apply-templates mode="statute.titlepage.recto.auto.mode" select="d:statuteinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:docinfo/d:title">
      <xsl:apply-templates mode="statute.titlepage.recto.auto.mode" select="d:docinfo/d:title"/>
    </xsl:when>
    <xsl:when test="d:info/d:title">
      <xsl:apply-templates mode="statute.titlepage.recto.auto.mode" select="d:info/d:title"/>
    </xsl:when>
    <xsl:when test="d:title">
      <xsl:apply-templates mode="statute.titlepage.recto.auto.mode" select="d:title"/>
    </xsl:when>
  </xsl:choose>

</xsl:template>

<xsl:template name="statute.titlepage.verso">
</xsl:template>

<xsl:template name="statute.titlepage.before.recto">
</xsl:template>

<xsl:template name="statute.titlepage.before.verso">
</xsl:template>

<xsl:template name="statute.titlepage.separator">
</xsl:template>

<xsl:template name="statute.titlepage">
  <span>
    <xsl:variable name="recto.content">
      <xsl:call-template name="statute.titlepage.before.recto"/>
      <xsl:call-template name="statute.titlepage.recto"/>
    </xsl:variable>
    <xsl:variable name="recto.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($recto.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($recto.content) != '') or ($recto.elements.count &gt; 0)">
      <span><xsl:copy-of select="$recto.content"/></span>
    </xsl:if>
    <xsl:variable name="verso.content">
      <xsl:call-template name="statute.titlepage.before.verso"/>
      <xsl:call-template name="statute.titlepage.verso"/>
    </xsl:variable>
    <xsl:variable name="verso.elements.count">
      <xsl:choose>
        <xsl:when test="function-available('exsl:node-set')"><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:when test="contains(system-property('xsl:vendor'), 'Apache Software Foundation')">
          <!--Xalan quirk--><xsl:value-of select="count(exsl:node-set($verso.content)/*)"/></xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:if test="(normalize-space($verso.content) != '') or ($verso.elements.count &gt; 0)">
      <span><xsl:copy-of select="$verso.content"/></span>
    </xsl:if>
    <xsl:call-template name="statute.titlepage.separator"/>
  </span>
</xsl:template>

<xsl:template match="*" mode="statute.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="*" mode="statute.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<xsl:template match="d:title" mode="statute.titlepage.recto.auto.mode">
<span xsl:use-attribute-sets="statute.titlepage.recto.style" class="statutetitle">
<xsl:call-template name="statute.title">
<xsl:with-param name="node" select="ancestor-or-self::d:statute[1]"/>
</xsl:call-template>
</span>
</xsl:template>

</xsl:stylesheet>