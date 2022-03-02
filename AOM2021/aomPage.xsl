<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/html4/loose.dtd" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>
  <!-- Template for summary information of this application. -->
  <xsl:template match="aom">
    <div>
    <h1>Sage 300 ERP 2021 <br />Application Object Models</h1>
      <xsl:apply-templates select="applicationlist" />
    </div>
  </xsl:template>
  <!-- Template to list the Views of this application. -->
  <xsl:template match="aom/applicationlist">
    <table border="0" cellpadding="2" cellspacing="0">
      <thead class="aom">
        <tr align="left">
          <th class="aom">Prefix </th>
          <th class="aom">Application Name </th>
          <th class="aom">Version </th>
        </tr>
        <tr>
          <td colspan="5"><hr class="aom" /></td>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="./application">
          <tr align="left" valign="top">
            <td>
              <a href="{@prefix}.xml" title="{@name}"><xsl:value-of select="@prefix"/></a>
            </td>
            <td>
              <xsl:value-of select="@name"/>
            </td>
            <td>
              <xsl:value-of select="@version"/>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
    </xsl:template>
</xsl:stylesheet>
