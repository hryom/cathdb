<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'
                xmlns:d="http://docbook.org/ns/docbook"
                exclude-result-prefixes="d">

  <xsl:template match="d:sref">
    <span class="sref">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>  
