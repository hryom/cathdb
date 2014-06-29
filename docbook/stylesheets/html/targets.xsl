<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:d="http://docbook.org/ns/docbook"
  xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
  xmlns:exsl="http://exslt.org/common"
  exclude-result-prefixes="doc exsl d"
  version='1.0'>

  <xsl:template match="d:statute" mode="olink.mode">
    <xsl:call-template name="div"/>
  </xsl:template>
  

</xsl:stylesheet>