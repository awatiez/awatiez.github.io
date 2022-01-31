<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:param name="lang"><!--user custom--></xsl:param>
  
  <xsl:variable name="chars.lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
  <xsl:variable name="chars.upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
  
  <xsl:variable name="lang.wanted">
    <xsl:variable name="lang.custom" select="normalize-space($lang)"/>
    <xsl:variable name="lang.root" select="normalize-space(/*[1]/@xml:lang)"/>
    <xsl:choose>
      <xsl:when test="$lang.custom != ''">
        <xsl:value-of
          select="translate($lang.custom,$chars.upper,$chars.lower)"/>
      </xsl:when>
      <xsl:when test="$lang.root != ''">
        <xsl:value-of
          select="translate($lang.root,$chars.upper,$chars.lower)"/>
      </xsl:when>
      <xsl:otherwise>any</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  
  <xsl:template match="/*[1][not(@xml:lang!='')]">
    <xsl:variable name="message">
      ERROR: root element <xsl:value-of select="name()"/>
      does not specify any default lang. Add xml:lang="any" to fix it.
    </xsl:variable>
    <xsl:message>
      <xsl:value-of select="normalize-space($message)" />
    </xsl:message>
  </xsl:template>
  
  <xsl:template match="/*[1][@xml:lang!='']">
    <xsl:copy>
      <xsl:attribute name="xml:lang">
        <xsl:value-of select="$lang.wanted"/>
      </xsl:attribute>
      <xsl:copy-of select="@*[not(name()='xml:lang')]" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="*">
    <xsl:if test="lang($lang.wanted) or lang('any') or $lang.wanted='any'">
      <xsl:copy>
        <xsl:copy-of select="@*[not(name()='xml:lang')]" />
        <xsl:apply-templates />
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  
</xsl:transform>

