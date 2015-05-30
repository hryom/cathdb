<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:exsl="http://exslt.org/common"
  xmlns:cf="http://docbook.sourceforge.net/xmlns/chunkfast/1.0"
  xmlns:ng="http://docbook.org/docbook-ng"
  xmlns:db="http://docbook.org/ns/docbook"
  version="1.0"
  exclude-result-prefixes="exsl cf ng db d">
  
  <!-- ********************************************************************
    $Id: chunk-common.xsl 9717 2013-01-25 18:13:36Z bobstayton $
    ********************************************************************
    
    This file is part of the XSL DocBook Stylesheet distribution.
    See ../README or http://docbook.sf.net/release/xsl/current/ for
    copyright and other information.
    
    ******************************************************************** -->
  
  <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/1.78.1/html/chunk-common.xsl"/>
  
  <xsl:template name="chunk-first-section-with-parent">
    <xsl:param name="content">
      <xsl:apply-imports/>
    </xsl:param>
    
    <!-- These xpath expressions are really hairy. The trick is to pick sections -->
    <!-- that are not first children and are not the children of first children -->
    
    <!-- Break these variables into pieces to work around
      http://nagoya.apache.org/bugzilla/show_bug.cgi?id=6063 -->
    
    <xsl:variable name="prev-v1"
      select="(ancestor::d:sect1[$chunk.section.depth &gt; 0 
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect1][1]
              |ancestor::d:sect2[$chunk.section.depth &gt; 1
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect2
               and parent::d:sect1[preceding-sibling::d:sect1]][1]
              |ancestor::d:sect3[$chunk.section.depth &gt; 2
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect3
               and parent::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]
              |ancestor::d:sect4[$chunk.section.depth &gt; 3
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect4
               and parent::d:sect3[preceding-sibling::d:sect3]
               and ancestor::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]
              |ancestor::d:sect5[$chunk.section.depth &gt; 4
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect5
               and parent::d:sect4[preceding-sibling::d:sect4]
               and ancestor::d:sect3[preceding-sibling::d:sect3]
               and ancestor::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]
              |ancestor::d:section[$chunk.section.depth &gt; count(ancestor::d:section)
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and not(ancestor::d:section[not(preceding-sibling::d:section)])][1]
              |ancestor::d:section[child::d:section[@conformance = 'in-brief']][1])[last()]"/>
    
    <xsl:variable name="prev-v2"
      select="(preceding::d:sect1[$chunk.section.depth &gt; 0
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect1][1]
              |preceding::d:sect2[$chunk.section.depth &gt; 1
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect2
               and parent::d:sect1[preceding-sibling::d:sect1]][1]
              |preceding::d:sect3[$chunk.section.depth &gt; 2
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect3
               and parent::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]
              |preceding::d:sect4[$chunk.section.depth &gt; 3
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect4
               and parent::d:sect3[preceding-sibling::d:sect3]
               and ancestor::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]
              |preceding::d:sect5[$chunk.section.depth &gt; 4
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect5
               and parent::d:sect4[preceding-sibling::d:sect4]
               and ancestor::d:sect3[preceding-sibling::d:sect3]
               and ancestor::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]
              |preceding::d:section[$chunk.section.depth &gt; count(ancestor::d:section)
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:section
               and not(ancestor::d:section[not(preceding-sibling::d:section)])][1]
              |preceding::d:section[child::d:section[@conformance = 'in-brief']][1])[last()]"/>
    
    <xsl:variable name="prev"
      select="(preceding::d:book[1]
              |preceding::d:preface[1]
              |preceding::d:chapter[1]
              |preceding::d:appendix[1]
              |preceding::d:part[1]
              |preceding::d:reference[1]
              |preceding::d:refentry[1]
              |preceding::d:colophon[1]
              |preceding::d:article[1]
              |preceding::d:topic[1]
              |preceding::d:division[1]
              |preceding::d:bibliography[parent::d:article or parent::d:book or parent::d:part][1]
              |preceding::d:glossary[parent::d:article or parent::d:book or parent::d:part][1]
              |preceding::d:index[$generate.index != 0][parent::d:article or parent::d:book or parent::d:part][1]
              |preceding::d:setindex[$generate.index != 0][1]
              |ancestor::d:set
              |ancestor::d:book[1]
              |ancestor::d:preface[1]
              |ancestor::d:chapter[1]
              |ancestor::d:appendix[1]
              |ancestor::d:part[1]
              |ancestor::d:reference[1]
              |ancestor::d:article[1]
              |ancestor::d:topic[1]
              |ancestor::d:division[1]
              |$prev-v1
              |$prev-v2)[last()]"/>
    
    <xsl:variable name="next-v1"
      select="(following::d:sect1[$chunk.section.depth &gt; 0
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect1][1]
              |following::d:sect2[$chunk.section.depth &gt; 1
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect2
               and parent::d:sect1[preceding-sibling::d:sect1]][1]      
              |following::d:sect3[$chunk.section.depth &gt; 2
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect3
               and parent::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]  
              |following::d:sect4[$chunk.section.depth &gt; 3
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect4
               and parent::d:sect3[preceding-sibling::d:sect3]
               and ancestor::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]      
              |following::d:sect5[$chunk.section.depth &gt; 4
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect5
               and parent::d:sect4[preceding-sibling::d:sect4]
               and ancestor::d:sect3[preceding-sibling::d:sect3]
               and ancestor::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]      
              |following::d:section[$chunk.section.depth &gt; count(ancestor::d:section)
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:section 
               and not(ancestor::d:section[not(preceding-sibling::d:section)])][1]
              |following::d:section[child::d:section[@conformance = 'in-brief']][1])[1]"/>
    
    <xsl:variable name="next-v2"
      select="(descendant::d:sect1[$chunk.section.depth &gt; 0
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect1][1]      
              |descendant::d:sect2[$chunk.section.depth &gt; 1
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect2
               and parent::d:sect1[preceding-sibling::d:sect1]][1]      
              |descendant::d:sect3[$chunk.section.depth &gt; 2
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect3
               and parent::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]      
              |descendant::d:sect4[$chunk.section.depth &gt; 3
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect4
               and parent::d:sect3[preceding-sibling::d:sect3]
               and ancestor::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]      
              |descendant::d:sect5[$chunk.section.depth &gt; 4
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:sect5
               and parent::d:sect4[preceding-sibling::d:sect4]
               and ancestor::d:sect3[preceding-sibling::d:sect3]
               and ancestor::d:sect2[preceding-sibling::d:sect2]
               and ancestor::d:sect1[preceding-sibling::d:sect1]][1]
              |descendant::d:section[$chunk.section.depth &gt; count(ancestor::d:section)
               and not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])
               and preceding-sibling::d:section
               and not(ancestor::d:section[not(preceding-sibling::d:section)])]
              |descendant::d:section[child::d:section[@conformance = 'in-brief']][1])[1]"/>
    
    <xsl:variable name="next"
      select="(following::d:book[1]
              |following::d:preface[1]
              |following::d:chapter[1]
              |following::d:appendix[1]
              |following::d:part[1]
              |following::d:reference[1]
              |following::d:refentry[1]
              |following::d:colophon[1]
              |following::d:bibliography[parent::d:article or parent::d:book or parent::d:part][1]
              |following::d:glossary[parent::d:article or parent::d:book or parent::d:part][1]
              |following::d:index[$generate.index != 0][parent::d:article or parent::d:book or parent::d:part][1]
              |following::d:article[1]
              |following::d:topic[1]
              |following::d:setindex[$generate.index != 0][1]
              |following::d:division[1]
              |descendant::d:book[1]
              |descendant::d:preface[1]
              |descendant::d:chapter[1]
              |descendant::d:appendix[1]
              |descendant::d:article[1]
              |descendant::d:topic[1]
              |descendant::d:bibliography[parent::d:article or parent::d:book or parent::d:part][1]
              |descendant::d:glossary[parent::d:article or parent::d:book or parent::d:part][1]
              |descendant::d:index[$generate.index != 0][parent::d:article or parent::d:book or parent::d:part][1]
              |descendant::d:colophon[1]
              |descendant::d:setindex[$generate.index != 0][1]
              |descendant::d:part[1]
              |descendant::d:reference[1]
              |descendant::d:refentry[1]
              |descendant::d:division[1]
              |$next-v1
              |$next-v2)[1]"/>
    
    <xsl:call-template name="process-chunk">
      <xsl:with-param name="prev" select="$prev"/>
      <xsl:with-param name="next" select="$next"/>
      <xsl:with-param name="content" select="$content"/>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="chunk-all-sections">
    <xsl:param name="content">
      <xsl:apply-imports/>
    </xsl:param>
    
    <xsl:variable name="prev-v1"
      select="(preceding::d:sect1[$chunk.section.depth &gt; 0 and
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |preceding::d:sect2[$chunk.section.depth &gt; 1 and
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |preceding::d:sect3[$chunk.section.depth &gt; 2 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |preceding::d:sect4[$chunk.section.depth &gt; 3 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |preceding::d:sect5[$chunk.section.depth &gt; 4 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |preceding::d:section[$chunk.section.depth &gt; count(ancestor::d:section) and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |preceding::d:section[child::d:section[@conformance='in-brief']][1])[last()]"/>
    
    <xsl:variable name="prev-v2"
      select="(ancestor::d:sect1[$chunk.section.depth &gt; 0 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |ancestor::d:sect2[$chunk.section.depth &gt; 1 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |ancestor::d:sect3[$chunk.section.depth &gt; 2 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |ancestor::d:sect4[$chunk.section.depth &gt; 3 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |ancestor::d:sect5[$chunk.section.depth &gt; 4 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |ancestor::d:section[$chunk.section.depth &gt; count(ancestor::d:section) and  
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |ancestor::d:section[child::d:section[@conformance = 'in-brief']][1])[last()]"/>
    
    <xsl:variable name="prev"
      select="(preceding::d:book[1]
              |preceding::d:preface[1]
              |preceding::d:chapter[1]
              |preceding::d:appendix[1]
              |preceding::d:part[1]
              |preceding::d:reference[1]
              |preceding::d:refentry[1]
              |preceding::d:colophon[1]
              |preceding::d:article[1]
              |preceding::d:topic[1]
              |preceding::d:bibliography[parent::d:article or parent::d:book or parent::d:part][1]
              |preceding::d:glossary[parent::d:article or parent::d:book or parent::d:part][1]
              |preceding::d:index[$generate.index != 0][parent::d:article or parent::d:book or parent::d:part][1]
              |preceding::d:setindex[$generate.index != 0][1]
              |preceding::d:division[1]
              |ancestor::d:set
              |ancestor::d:book[1]
              |ancestor::d:preface[1]
              |ancestor::d:chapter[1]
              |ancestor::d:appendix[1]
              |ancestor::d:part[1]
              |ancestor::d:reference[1]
              |ancestor::d:article[1]
              |ancestor::d:topic[1]
              |ancestor::d:division[1]
              |$prev-v1
              |$prev-v2)[last()]"/>
    
    <xsl:variable name="next-v1"
      select="(following::d:sect1[$chunk.section.depth &gt; 0 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |following::d:sect2[$chunk.section.depth &gt; 1 and
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |following::d:sect3[$chunk.section.depth &gt; 2 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |following::d:sect4[$chunk.section.depth &gt; 3 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |following::d:sect5[$chunk.section.depth &gt; 4 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |following::d:section[$chunk.section.depth &gt; count(ancestor::d:section) and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |following::d:section[child::d:section[@conformance='in-brief']][1])[1]"/>
    
    <xsl:variable name="next-v2"
      select="(descendant::d:sect1[$chunk.section.depth &gt; 0 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |descendant::d:sect2[$chunk.section.depth &gt; 1 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |descendant::d:sect3[$chunk.section.depth &gt; 2 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |descendant::d:sect4[$chunk.section.depth &gt; 3 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |descendant::d:sect5[$chunk.section.depth &gt; 4 and 
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |descendant::d:section[$chunk.section.depth &gt; count(ancestor::d:section) and
               not(ancestor::*/processing-instruction('dbhtml')[normalize-space(.) ='stop-chunking'])][1]
              |descendant::d:section[child::d:section[@conformance = 'in-brief']][1])[1]"/>
    
    <xsl:variable name="next"
      select="(following::d:book[1]
              |following::d:preface[1]
              |following::d:chapter[1]
              |following::d:appendix[1]
              |following::d:part[1]
              |following::d:reference[1]
              |following::d:refentry[1]
              |following::d:colophon[1]
              |following::d:bibliography[parent::d:article or parent::d:book or parent::d:part][1]
              |following::d:glossary[parent::d:article or parent::d:book or parent::d:part][1]
              |following::d:index[$generate.index != 0][parent::d:article or parent::d:book][1]
              |following::d:article[1]
              |following::d:topic[1]
              |following::d:setindex[$generate.index != 0][1]
              |following::d:division[1]
              |descendant::d:book[1]
              |descendant::d:preface[1]
              |descendant::d:chapter[1]
              |descendant::d:appendix[1]
              |descendant::d:article[1]
              |descendant::d:topic[1]
              |descendant::d:bibliography[parent::d:article or parent::d:book][1]
              |descendant::d:glossary[parent::d:article or parent::d:book or parent::d:part][1]
              |descendant::d:index[$generate.index != 0][parent::d:article or parent::d:book][1]
              |descendant::d:colophon[1]
              |descendant::d:setindex[$generate.index != 0][1]
              |descendant::d:part[1]
              |descendant::d:reference[1]
              |descendant::d:refentry[1]
              |descendant::d:division[1]
              |$next-v1
              |$next-v2)[1]"/>
    
    <xsl:call-template name="process-chunk">
      <xsl:with-param name="prev" select="$prev"/>
      <xsl:with-param name="next" select="$next"/>
      <xsl:with-param name="content" select="$content"/>
    </xsl:call-template>
  </xsl:template>
  
  <!-- ====================================================================== -->
  
  <xsl:template name="chunk">
    <xsl:param name="node" select="."/>
    <!-- returns 1 if $node is a chunk -->
    
    <!-- ==================================================================== -->
    <!-- What's a chunk?
      
      The root element
      appendix
      article
      bibliography  in article or part or book
      book
      chapter
      colophon
      glossary      in article or part or book
      index         in article or part or book
      part
      preface
      refentry
      reference
      sect{1,2,3,4,5}  if position()>1 && depth < chunk.section.depth
      section          if position()>1 && depth < chunk.section.depth
      set
      setindex
      topic
    -->
    <!-- ==================================================================== -->
    
    <!--
      <xsl:message>
      <xsl:text>chunk: </xsl:text>
      <xsl:value-of select="name($node)"/>
      <xsl:text>(</xsl:text>
      <xsl:value-of select="$node/@id"/>
      <xsl:text>)</xsl:text>
      <xsl:text> csd: </xsl:text>
      <xsl:value-of select="$chunk.section.depth"/>
      <xsl:text> cfs: </xsl:text>
      <xsl:value-of select="$chunk.first.sections"/>
      <xsl:text> ps: </xsl:text>
      <xsl:value-of select="count($node/parent::d:section)"/>
      <xsl:text> prs: </xsl:text>
      <xsl:value-of select="count($node/preceding-sibling::d:section)"/>
      </xsl:message>
    -->
    
    <xsl:choose>
      <xsl:when test="$node/parent::*/processing-instruction('dbhtml')[normalize-space(.) = 'stop-chunking']">0</xsl:when>
      <xsl:when test="not($node/parent::*)">1</xsl:when>
      
      <xsl:when test="local-name($node) = 'sect1'
        and $chunk.section.depth &gt;= 1
        and ($chunk.first.sections != 0
        or count($node/preceding-sibling::d:sect1) &gt; 0)">
        <xsl:text>1</xsl:text>
      </xsl:when>
      <xsl:when test="local-name($node) = 'sect2'
        and $chunk.section.depth &gt;= 2
        and ($chunk.first.sections != 0
        or count($node/preceding-sibling::d:sect2) &gt; 0)">
        <xsl:call-template name="chunk">
          <xsl:with-param name="node" select="$node/parent::*"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="local-name($node) = 'sect3'
        and $chunk.section.depth &gt;= 3
        and ($chunk.first.sections != 0
        or count($node/preceding-sibling::d:sect3) &gt; 0)">
        <xsl:call-template name="chunk">
          <xsl:with-param name="node" select="$node/parent::*"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="local-name($node) = 'sect4'
        and $chunk.section.depth &gt;= 4
        and ($chunk.first.sections != 0
        or count($node/preceding-sibling::d:sect4) &gt; 0)">
        <xsl:call-template name="chunk">
          <xsl:with-param name="node" select="$node/parent::*"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="local-name($node) = 'sect5'
        and $chunk.section.depth &gt;= 5
        and ($chunk.first.sections != 0
        or count($node/preceding-sibling::d:sect5) &gt; 0)">
        <xsl:call-template name="chunk">
          <xsl:with-param name="node" select="$node/parent::*"/>
        </xsl:call-template>
      </xsl:when>

      <xsl:when test="$node/d:section[@conformance='in-brief']">1</xsl:when>
      <!-- xsl:when test="following-sibling::d:section[@conformance='in-brief']">1</xsl:when -->

      <xsl:when test="local-name($node) = 'section'
        and $chunk.section.depth &gt;= count($node/ancestor::d:section)+1
        and ($chunk.first.sections != 0
        or count($node/preceding-sibling::d:section) &gt; 0)">
        <xsl:call-template name="chunk">
          <xsl:with-param name="node" select="$node/parent::*"/>
        </xsl:call-template>
      </xsl:when>
      
        
      <xsl:when test="local-name($node)='preface'">1</xsl:when>
      <xsl:when test="local-name($node)='chapter'">1</xsl:when>
      <xsl:when test="local-name($node)='appendix'">1</xsl:when>
      <xsl:when test="local-name($node)='article'">1</xsl:when>
      <xsl:when test="local-name($node)='topic'">1</xsl:when>
      <xsl:when test="local-name($node)='part'">1</xsl:when>
      <xsl:when test="local-name($node)='reference'">1</xsl:when>
      <xsl:when test="local-name($node)='refentry'">1</xsl:when>
      <xsl:when test="local-name($node)='index' and ($generate.index != 0 or count($node/*) > 0)
        and (local-name($node/parent::*) = 'article'
        or local-name($node/parent::*) = 'book'
        or local-name($node/parent::*) = 'part'
        )">1</xsl:when>
      <xsl:when test="local-name($node)='bibliography'
        and (local-name($node/parent::*) = 'article'
        or local-name($node/parent::*) = 'book'
        or local-name($node/parent::*) = 'part'
        )">1</xsl:when>
      <xsl:when test="local-name($node)='glossary'
        and (local-name($node/parent::*) = 'article'
        or local-name($node/parent::*) = 'book'
        or local-name($node/parent::*) = 'part'
        )">1</xsl:when>
      <xsl:when test="local-name($node)='colophon'">1</xsl:when>
      <xsl:when test="local-name($node)='book'">1</xsl:when>
      <xsl:when test="local-name($node)='set'">1</xsl:when>
      <xsl:when test="local-name($node)='setindex'">1</xsl:when>
      <xsl:when test="local-name($node)='legalnotice'
        and $generate.legalnotice.link != 0">1</xsl:when>
      <xsl:when test="local-name($node)='division'">1</xsl:when>
      <xsl:otherwise>0</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="process-chunk-element">
    <xsl:param name="content">
      <xsl:apply-imports/>
    </xsl:param>
    
    <xsl:choose>
      <xsl:when test="$chunk.fast != 0 and $exsl.node.set.available != 0">
        <xsl:variable name="chunks" select="exsl:node-set($chunk.hierarchy)//cf:div"/>
        <xsl:variable name="genid" select="generate-id()"/>
        
        <xsl:variable name="div" select="$chunks[@id=$genid or @xml:id=$genid]"/>
        
        <xsl:variable name="prevdiv"
          select="($div/preceding-sibling::cf:div|$div/preceding::cf:div|$div/parent::cf:div)[last()]"/>
        <xsl:variable name="prev" select="key('genid', ($prevdiv/@id|$prevdiv/@xml:id)[1])"/>
        
        <xsl:variable name="nextdiv"
          select="($div/following-sibling::cf:div|$div/following::cf:div|$div/cf:div)[1]"/>
        <xsl:variable name="next" select="key('genid', ($nextdiv/@id|$nextdiv/@xml:id)[1])"/>
        
        <xsl:choose>
          <xsl:when test="$onechunk != 0 and parent::*">
            <xsl:copy-of select="$content"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="process-chunk">
              <xsl:with-param name="prev" select="$prev"/>
              <xsl:with-param name="next" select="$next"/>
              <xsl:with-param name="content" select="$content"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$onechunk != 0 and not(parent::*)">
            <xsl:call-template name="chunk-all-sections">
              <xsl:with-param name="content" select="$content"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$onechunk != 0">
            <xsl:copy-of select="$content"/>
          </xsl:when>
          <xsl:when test="$chunk.first.sections = 0">
            <xsl:call-template name="chunk-first-section-with-parent">
              <xsl:with-param name="content" select="$content"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="chunk-all-sections">
              <xsl:with-param name="content" select="$content"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="process-chunk">
    <xsl:param name="prev" select="."/>
    <xsl:param name="next" select="."/>
    <xsl:param name="content">
      <xsl:apply-imports/>
    </xsl:param>
    
    <xsl:variable name="ischunk">
      <xsl:call-template name="chunk"/>
    </xsl:variable>
    
    <xsl:variable name="chunkfn">
      <xsl:if test="$ischunk='1'">
        <xsl:apply-templates mode="chunk-filename" select="."/>
      </xsl:if>
    </xsl:variable>
    
    <xsl:if test="$ischunk='0'">
      <xsl:message>
        <xsl:text>Error </xsl:text>
        <xsl:value-of select="name(.)"/>
        <xsl:text> is not a chunk!</xsl:text>
      </xsl:message>
    </xsl:if>
    
    <xsl:variable name="filename">
      <xsl:call-template name="make-relative-filename">
        <xsl:with-param name="base.dir" select="$chunk.base.dir"/>
        <xsl:with-param name="base.name" select="$chunkfn"/>
      </xsl:call-template>
    </xsl:variable>
    
    <xsl:call-template name="write.chunk">
      <xsl:with-param name="filename" select="$filename"/>
      <xsl:with-param name="content">
        <xsl:call-template name="chunk-element-content">
          <xsl:with-param name="prev" select="$prev"/>
          <xsl:with-param name="next" select="$next"/>
          <xsl:with-param name="content" select="$content"/>
        </xsl:call-template>
      </xsl:with-param>
      <xsl:with-param name="quiet" select="$chunk.quietly"/>
    </xsl:call-template>
  </xsl:template>
  
  
  <!-- ==================================================================== -->
  
  <xsl:template name="html.head">
    <xsl:param name="prev" select="/d:foo"/>
    <xsl:param name="next" select="/d:foo"/>
    <xsl:variable name="this" select="."/>
    <xsl:variable name="home" select="/*[1]"/>
    <xsl:variable name="up" select="parent::*"/>
    
    <head>
      <xsl:call-template name="system.head.content"/>
      <xsl:call-template name="head.content"/>
      
      <!-- home link not valid in HTML5 -->
      <xsl:if test="$home and $div.element != 'section'">
        <link rel="home">
          <xsl:attribute name="href">
            <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="$home"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:apply-templates select="$home"
              mode="object.title.markup.textonly"/>
          </xsl:attribute>
        </link>
      </xsl:if>
      
      <!-- up link not valid in HTML5 -->
      <xsl:if test="$up and $div.element != 'section'">
        <link rel="up">
          <xsl:attribute name="href">
            <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="$up"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:apply-templates select="$up" mode="object.title.markup.textonly"/>
          </xsl:attribute>
        </link>
      </xsl:if>
      
      <xsl:if test="$prev">
        <link rel="prev">
          <xsl:attribute name="href">
            <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="$prev"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:apply-templates select="$prev" mode="object.title.markup.textonly"/>
          </xsl:attribute>
        </link>
      </xsl:if>
      
      <xsl:if test="$next">
        <link rel="next">
          <xsl:attribute name="href">
            <xsl:call-template name="href.target">
              <xsl:with-param name="object" select="$next"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:apply-templates select="$next" mode="object.title.markup.textonly"/>
          </xsl:attribute>
        </link>
      </xsl:if>
      
      <xsl:if test="$html.extra.head.links != 0">
        <xsl:for-each select="//d:part
          |//d:reference
          |//d:preface
          |//d:chapter
          |//d:article
          |//d:refentry
          |//d:appendix[not(parent::d:article)]|d:appendix
          |//d:glossary[not(parent::d:article)]|d:glossary
          |//d:index[not(parent::d:article)]|d:index
          |//d:division">
          <link rel="{local-name(.)}">
            <xsl:attribute name="href">
              <xsl:call-template name="href.target">
                <xsl:with-param name="context" select="$this"/>
                <xsl:with-param name="object" select="."/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:apply-templates select="." mode="object.title.markup.textonly"/>
            </xsl:attribute>
          </link>
        </xsl:for-each>
        
        <xsl:for-each select="d:section|d:sect1|d:refsection|d:refsect1">
          <link>
            <xsl:attribute name="rel">
              <xsl:choose>
                <xsl:when test="local-name($this) = 'section'
                  or local-name($this) = 'refsection'">
                  <xsl:value-of select="'subsection'"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="'section'"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            <xsl:attribute name="href">
              <xsl:call-template name="href.target">
                <xsl:with-param name="context" select="$this"/>
                <xsl:with-param name="object" select="."/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:apply-templates select="." mode="object.title.markup.textonly"/>
            </xsl:attribute>
          </link>
        </xsl:for-each>
        
        <xsl:for-each select="d:sect2|d:sect3|d:sect4|d:sect5|d:refsect2|d:refsect3">
          <link rel="subsection">
            <xsl:attribute name="href">
              <xsl:call-template name="href.target">
                <xsl:with-param name="context" select="$this"/>
                <xsl:with-param name="object" select="."/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:apply-templates select="." mode="object.title.markup.textonly"/>
            </xsl:attribute>
          </link>
        </xsl:for-each>
      </xsl:if>
      
      <!-- * if we have a legalnotice and user wants it output as a -->
      <!-- * separate page and $html.head.legalnotice.link.types is -->
      <!-- * non-empty, we generate a link or links for each value in -->
      <!-- * $html.head.legalnotice.link.types -->
      <xsl:if test="//d:legalnotice
        and not($generate.legalnotice.link = 0)
        and not($html.head.legalnotice.link.types = '')">
        <xsl:call-template name="make.legalnotice.head.links"/>
      </xsl:if>
      
      <xsl:call-template name="user.head.content"/>
    </head>
  </xsl:template>
  
</xsl:stylesheet>
