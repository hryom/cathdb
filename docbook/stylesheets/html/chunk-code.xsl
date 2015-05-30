<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:exsl="http://exslt.org/common"
  xmlns:cf="http://docbook.sourceforge.net/xmlns/chunkfast/1.0"
  xmlns:ng="http://docbook.org/docbook-ng"
  xmlns:db="http://docbook.org/ns/docbook"
  exclude-result-prefixes="exsl cf ng db d"
  version="1.0">
  
  <!-- ********************************************************************
    $Id: chunk-code.xsl 9328 2012-05-03 16:28:23Z bobstayton $
    ********************************************************************
    
    This file is part of the XSL DocBook Stylesheet distribution.
    See ../README or http://docbook.sf.net/release/xsl/current/ for
    copyright and other information.
    
    ******************************************************************** -->
  
  <!-- ==================================================================== -->
  
  <xsl:include href="http://docbook.sourceforge.net/release/xsl-ns/1.78.1/html/chunk-code.xsl"/>
  
  <xsl:template match="*" mode="chunk-filename" priority="1">
    <!-- returns the filename of a chunk -->
    <xsl:variable name="ischunk">
      <xsl:call-template name="chunk"/>
    </xsl:variable>
    
    <xsl:variable name="fn">
      <xsl:apply-templates select="." mode="recursive-chunk-filename"/>
    </xsl:variable>
    
    <!--
      <xsl:message>
      <xsl:value-of select="$ischunk"/>
      <xsl:text> (</xsl:text>
      <xsl:value-of select="local-name(.)"/>
      <xsl:text>) </xsl:text>
      <xsl:value-of select="$fn"/>
      <xsl:text>, </xsl:text>
      <xsl:call-template name="dbhtml-dir"/>
      </xsl:message>
    -->
    
    <!-- 2003-11-25 by ndw:
      The following test used to read test="$ischunk != 0 and $fn != ''"
      I've removed the ischunk part of the test so that href.to.uri and
      href.from.uri will be fully qualified even if the source or target
      isn't a chunk. I *think* that if $fn != '' then it's appropriate
      to put the directory on the front, even if the element isn't a
      chunk. I could be wrong. -->
    
    <xsl:if test="$fn != ''">
      <xsl:call-template name="dbhtml-dir"/>
    </xsl:if>
    
    <xsl:value-of select="$chunked.filename.prefix"/>
    
    <xsl:value-of select="$fn"/>
    <!-- You can't add the html.ext here because dbhtml filename= may already -->
    <!-- have added it. It really does have to be handled in the recursive template -->
  </xsl:template>
  
  <xsl:template match="*" mode="recursive-chunk-filename" priority="1">
    <xsl:param name="recursive" select="false()"/>
    
    <!-- returns the filename of a chunk -->
    <xsl:variable name="ischunk">
      <xsl:call-template name="chunk"/>
    </xsl:variable>
    
    <xsl:variable name="dbhtml-filename">
      <xsl:call-template name="pi.dbhtml_filename"/>
    </xsl:variable>
    
    <xsl:variable name="filename">
      <xsl:choose>
        <xsl:when test="$dbhtml-filename != ''">
          <xsl:value-of select="$dbhtml-filename"/>
        </xsl:when>
        <!-- if this is the root element, use the root.filename -->
        <xsl:when test="not(parent::*) and $root.filename != ''">
          <xsl:value-of select="$root.filename"/>
          <xsl:value-of select="$html.ext"/>
        </xsl:when>
        <!-- Special case -->
        <xsl:when test="self::d:legalnotice and not($generate.legalnotice.link = 0)">
          <xsl:choose>
            <xsl:when test="(@id or @xml:id) and not($use.id.as.filename = 0)">
              <!-- * if this legalnotice has an ID, then go ahead and use -->
              <!-- * just the value of that ID as the basename for the file -->
              <!-- * (that is, without prepending an "ln-" too it) -->
              <xsl:value-of select="(@id|@xml:id)[1]"/>
              <xsl:value-of select="$html.ext"/>
            </xsl:when>
            <xsl:otherwise>
              <!-- * otherwise, if this legalnotice does not have an ID, -->
              <!-- * then we generate an ID... -->
              <xsl:variable name="id">
                <xsl:call-template name="object.id"/>
              </xsl:variable>
              <!-- * ...and then we take that generated ID, prepend an -->
              <!-- * "ln-" to it, and use that as the basename for the file -->
              <xsl:value-of select="concat('ln-',$id,$html.ext)"/>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <!-- if there's no dbhtml filename, and if we're to use IDs as -->
        <!-- filenames, then use the ID to generate the filename. -->
        <xsl:when test="(@id or @xml:id) and $use.id.as.filename != 0">
          <xsl:value-of select="(@id|@xml:id)[1]"/>
          <xsl:value-of select="$html.ext"/>
        </xsl:when>
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    
    <xsl:choose>
      <xsl:when test="$ischunk='0'">
        <!-- if called on something that isn't a chunk, walk up... -->
        <xsl:choose>
          <xsl:when test="count(parent::*)>0">
            <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
              <xsl:with-param name="recursive" select="$recursive"/>
            </xsl:apply-templates>
          </xsl:when>
          <!-- unless there is no up, in which case return "" -->
          <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      
      <xsl:when test="not($recursive) and $filename != ''">
        <!-- if this chunk has an explicit name, use it -->
        <xsl:value-of select="$filename"/>
      </xsl:when>
      
      <xsl:when test="self::d:set">
        <xsl:value-of select="$root.filename"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:book">
        <xsl:text>bk</xsl:text>
        <xsl:number level="any" format="01"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:article">
        <xsl:if test="/d:set">
          <!-- in a set, make sure we inherit the right book info... -->
          <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
            <xsl:with-param name="recursive" select="true()"/>
          </xsl:apply-templates>
        </xsl:if>
        
        <xsl:text>ar</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:preface">
        <xsl:if test="/d:set">
          <!-- in a set, make sure we inherit the right book info... -->
          <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
            <xsl:with-param name="recursive" select="true()"/>
          </xsl:apply-templates>
        </xsl:if>
        
        <xsl:text>pr</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:chapter">
        <xsl:if test="/d:set">
          <!-- in a set, make sure we inherit the right book info... -->
          <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
            <xsl:with-param name="recursive" select="true()"/>
          </xsl:apply-templates>
        </xsl:if>
        
        <xsl:text>ch</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:appendix">
        <xsl:if test="/d:set">
          <!-- in a set, make sure we inherit the right book info... -->
          <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
            <xsl:with-param name="recursive" select="true()"/>
          </xsl:apply-templates>
        </xsl:if>
        
        <xsl:text>ap</xsl:text>
        <xsl:number level="any" format="a" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:part">
        <xsl:choose>
          <xsl:when test="/d:set">
            <!-- in a set, make sure we inherit the right book info... -->
            <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
              <xsl:with-param name="recursive" select="true()"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:text>pt</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:reference">
        <xsl:choose>
          <xsl:when test="/d:set">
            <!-- in a set, make sure we inherit the right book info... -->
            <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
              <xsl:with-param name="recursive" select="true()"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:text>rn</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:refentry">
        <xsl:choose>
          <xsl:when test="parent::d:reference">
            <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
              <xsl:with-param name="recursive" select="true()"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
            <xsl:if test="/d:set">
              <!-- in a set, make sure we inherit the right book info... -->
              <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
                <xsl:with-param name="recursive" select="true()"/>
              </xsl:apply-templates>
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:text>re</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:colophon">
        <xsl:choose>
          <xsl:when test="/d:set">
            <!-- in a set, make sure we inherit the right book info... -->
            <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
              <xsl:with-param name="recursive" select="true()"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:text>co</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:sect1
        or self::d:sect2
        or self::d:sect3
        or self::d:sect4
        or self::d:sect5
        or self::d:section">
        <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
          <xsl:with-param name="recursive" select="true()"/>
        </xsl:apply-templates>
        <xsl:text>s</xsl:text>
        <xsl:number format="01"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:bibliography">
        <xsl:choose>
          <xsl:when test="/d:set">
            <!-- in a set, make sure we inherit the right book info... -->
            <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
              <xsl:with-param name="recursive" select="true()"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:text>bi</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:glossary">
        <xsl:choose>
          <xsl:when test="/d:set">
            <!-- in a set, make sure we inherit the right book info... -->
            <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
              <xsl:with-param name="recursive" select="true()"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:text>go</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:index">
        <xsl:choose>
          <xsl:when test="/d:set">
            <!-- in a set, make sure we inherit the right book info... -->
            <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
              <xsl:with-param name="recursive" select="true()"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:text>ix</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:setindex">
        <xsl:text>si</xsl:text>
        <xsl:number level="any" format="01" from="d:set"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:topic">
        <xsl:choose>
          <xsl:when test="/d:set">
            <!-- in a set, make sure we inherit the right book info... -->
            <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
              <xsl:with-param name="recursive" select="true()"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:text>to</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:when test="self::d:division">
        <xsl:choose>
          <xsl:when test="/d:set">
            <!-- in a set, make sure we inherit the right book info... -->
            <xsl:apply-templates mode="recursive-chunk-filename" select="parent::*">
              <xsl:with-param name="recursive" select="true()"/>
            </xsl:apply-templates>
          </xsl:when>
          <xsl:otherwise>
          </xsl:otherwise>
        </xsl:choose>
        
        <xsl:text>di</xsl:text>
        <xsl:number level="any" format="01" from="d:book"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:when>
      
      <xsl:otherwise>
        <xsl:text>chunk-filename-error-</xsl:text>
        <xsl:value-of select="name(.)"/>
        <xsl:number level="any" format="01" from="d:set"/>
        <xsl:if test="not($recursive)">
          <xsl:value-of select="$html.ext"/>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!-- ====================================================================== -->
  
  <xsl:template match="d:set|d:book|d:part|d:preface|d:division|d:chapter|d:appendix
    |d:article
    |d:topic
    |d:reference|d:refentry
    |d:book/d:glossary|d:article/d:glossary|d:part/d:glossary
    |d:book/d:bibliography|d:article/d:bibliography|d:part/d:bibliography
    |d:colophon" priority="1">
   <xsl:choose>
      <xsl:when test="$onechunk != 0 and parent::*">
        <xsl:apply-imports/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="process-chunk-element"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="d:setindex
    |d:book/d:index
    |d:article/d:index
    |d:part/d:index
    |d:division/d:index" priority="1">
    <!-- some implementations use completely empty index tags to indicate -->
    <!-- where an automatically generated index should be inserted. so -->
    <!-- if the index is completely empty, skip it. -->
    <xsl:if test="count(*)>0 or $generate.index != '0'">
      <xsl:call-template name="process-chunk-element"/>
    </xsl:if>
  </xsl:template>
  
  <!-- ==================================================================== -->
  <xsl:template match="d:set|d:book|d:part|d:preface|d:chapter|d:appendix
    |d:article
    |d:topic
    |d:reference|d:refentry
    |d:sect1|d:sect2|d:sect3|d:sect4|d:sect5
    |d:section
    |d:book/d:glossary|d:article/d:glossary|d:part/d:glossary
    |d:book/d:bibliography|d:article/d:bibliography|d:part/d:bibliography
    |d:colophon
    |d:division"
    mode="enumerate-files" priority="1">
    <xsl:variable name="ischunk"><xsl:call-template name="chunk"/></xsl:variable>
    <xsl:if test="$ischunk='1'">
      <xsl:call-template name="make-relative-filename">
        <xsl:with-param name="base.dir">
          <xsl:if test="$manifest.in.base.dir = 0">
            <xsl:value-of select="$chunk.base.dir"/>
          </xsl:if>
        </xsl:with-param>
        <xsl:with-param name="base.name">
          <xsl:apply-templates mode="chunk-filename" select="."/>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:text>&#10;</xsl:text>
    </xsl:if>
    <xsl:apply-templates select="*" mode="enumerate-files"/>
  </xsl:template>
  
  <xsl:template match="d:book/d:index|d:article/d:index|d:part/d:index|d:division/d:index"
    mode="enumerate-files" priority="1">
    <xsl:if test="$htmlhelp.output != 1">
      <xsl:variable name="ischunk"><xsl:call-template name="chunk"/></xsl:variable>
      <xsl:if test="$ischunk='1'">
        <xsl:call-template name="make-relative-filename">
          <xsl:with-param name="base.dir">
            <xsl:if test="$manifest.in.base.dir = 0">
              <xsl:value-of select="$chunk.base.dir"/>
            </xsl:if>
          </xsl:with-param>
          <xsl:with-param name="base.name">
            <xsl:apply-templates mode="chunk-filename" select="."/>
          </xsl:with-param>
        </xsl:call-template>
        <xsl:text>&#10;</xsl:text>
      </xsl:if>
      <xsl:apply-templates select="*" mode="enumerate-files"/>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
