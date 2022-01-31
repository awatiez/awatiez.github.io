<?xml version="1.0" encoding="utf-8"?>
<iso:schema xmlns:iso="http://purl.oclc.org/dsdl/schematron">
  <iso:pattern>
    <iso:rule xml:lang="fr" context="title | summary"
      role="contraintes de localisation sur éléments répétés">

      <iso:report test="@xml:lang = preceding-sibling::*[local-name(.)=local-name(current())]/@xml:lang">
  '<iso:value-of select="normalize-space(.)"/>'
  La langue "<iso:value-of select="@xml:lang" />" doit être unique dans un ensemble d'éléments '<iso:value-of select="name(.)" />' consécutifs.
      </iso:report>

      <iso:report test="lang('any') and preceding-sibling::*[local-name(.)=local-name(current())][lang('any') or not(@xml:lang)]">
  '<iso:value-of select="normalize-space(.)"/>'
  La langue par défaut doit être unique dans un ensemble d'éléments '<iso:value-of select="name(.)" />' consécutifs.
      </iso:report>

      <iso:report test="not(@xml:lang) and preceding-sibling::*[local-name(.)=local-name(current())][not(@xml:lang)]">
  '<iso:value-of select="normalize-space(.)"/>'
  La langue de chacun des éléments '<iso:value-of select="name(.)" />' consécutifs doit être définie par un attribut 'xml:lang'.
      </iso:report>
 
    </iso:rule>
  </iso:pattern>
</iso:schema>
