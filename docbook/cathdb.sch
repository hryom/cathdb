<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <ns prefix="db" uri="http://docbook.org/ns/docbook"/>
  
  <let name="docid" value="/*/@xml:id"/>
  
  <pattern>
    <rule context="*[@xml:id]">
      <assert test="starts-with(@xml:id, $docid)">ID's should start with documentid [<value-of select="$docid"/>]</assert>
    </rule>
  </pattern>

  <pattern>
    <rule context="db:statute[not(ancestor::db:appendix)][count(preceding::db:statute[not(ancestor::db:appendix)]) = 0]">
      <assert test="number(db:info/db:title) = 1">The first statute in a document should have # 1</assert>
    </rule>
    <rule context="db:statute[not(ancestor::db:appendix)][count(preceding::db:statute[not(ancestor::db:appendix)]) &gt; 0]">
      <assert test="number(db:info/db:title) = number(preceding::db:statute[1]/db:info/db:title) + 1">The number of a statute should be equal to the number of the previous statute + 1</assert>
    </rule>
  </pattern> 
  
  <pattern>
    <rule context="db:statute[ancestor::db:appendix][count(preceding::db:statute[ancestor::db:appendix]) = 0]">
      <assert test="number(db:info/db:title) = 1">The first statute in a document should have # 1</assert>
    </rule>
    <rule context="db:statute[ancestor::db:appendix][count(preceding::db:statute[ancestor::db:appendix]) &gt; 0]">
      <assert test="number(db:info/db:title) = number(preceding::db:statute[1]/db:info/db:title) + 1">The number of a statute should be equal to the number of the previous statute + 1</assert>
    </rule>
  </pattern>  
  
</schema>