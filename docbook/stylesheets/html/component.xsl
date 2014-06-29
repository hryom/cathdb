<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'
                xmlns:d="http://docbook.org/ns/docbook"
  exclude-result-prefixes="d">

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

  <xsl:template name="component.title">
    <xsl:param name="node" select="."/>
    
    <!-- This handles the case where a component (bibliography, for example)
       occurs inside a section; will we need parameters for this? -->
    
    <!-- This "level" is a section level.  To compute <h> level, add 1. -->
    <xsl:variable name="level">
      <xsl:choose>
        <!-- chapters and other book children should get <h1> -->
        <xsl:when test="$node/parent::d:book">0</xsl:when>
        <xsl:when test="ancestor::d:section">
          <xsl:value-of select="count(ancestor::d:section)+1"/>
        </xsl:when>
        <xsl:when test="ancestor::d:sect5">6</xsl:when>
        <xsl:when test="ancestor::d:sect4">5</xsl:when>
        <xsl:when test="ancestor::d:sect3">4</xsl:when>
        <xsl:when test="ancestor::d:sect2">3</xsl:when>
        <xsl:when test="ancestor::d:sect1">2</xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:element name="h{$level+1}">
      <xsl:attribute name="class">title</xsl:attribute>
      <xsl:call-template name="anchor">
        <xsl:with-param name="node" select="$node"/>
        <xsl:with-param name="conditional" select="0"/>
      </xsl:call-template>
      <xsl:choose> 
        <xsl:when test="local-name($node) = 'chapter' or local-name($node) = 'appendix' or local-name($node) = 'part'">
          <xsl:if test="$node/@label != ''">
            <xsl:apply-templates select="$node" mode="label.markup"/>
            <xsl:text>. </xsl:text>
          </xsl:if>
          <xsl:apply-templates select="$node" mode="title.markup">
            <xsl:with-param name="allow-anchors" select="1"/>
          </xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="$node" mode="object.title.markup">
            <xsl:with-param name="allow-anchors" select="1"/>
          </xsl:apply-templates>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  

</xsl:stylesheet>