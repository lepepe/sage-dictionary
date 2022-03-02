<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/html4/loose.dtd" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

  <!-- Template for summary information of this application. -->
  <xsl:template match="application">
    <div>
      <h1>Application: <xsl:value-of select="@name"/><xsl:text>&#xA0;</xsl:text><xsl:value-of select="@version"/></h1>
      <a href="#Views">Views</a><br />
      <a href="#Tables">Tables</a><br />
      <a href="#Objects">Objects</a><br />
      <xsl:apply-templates select="viewlist" />
      <xsl:apply-templates select="tablelist" />
      <xsl:apply-templates select="objectlist" />
    </div>
  </xsl:template>

  <!-- Template to list the Views of this application. -->
  <xsl:template match="application/viewlist">
    <h3><a name="Views">Views: <xsl:value-of select="count(view)"/></a></h3>
    <table border="0" cellpadding="2" cellspacing="0">
      <thead class="aom">
        <tr align="left">
          <th class="aom">RotoID </th>
          <th class="aom">Tables </th>
          <th class="aom">Title </th>
          <th class="aom">DLL </th>
          <th class="aom">Compositions</th>
        </tr>
        <tr>
          <td colspan="5"><hr class="aom" /></td>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="view">
          <tr align="left" valign="top">
            <td>
              <a href="{@name}.xml" title="View: {@desc}"><xsl:value-of select="@name"/></a>
            </td>
            <td>
              <xsl:for-each select="viewtablelist/table">
              <a href="{./@name}.xml" title="Table: {./@desc}"><xsl:value-of select="./@name"/></a>
              <xsl:if test="count(.) &gt; 1"><br /></xsl:if>
              </xsl:for-each>
            </td>
            <td style="white-space: nowrap;"><xsl:value-of select="./@desc"/><xsl:text>&#xA0;</xsl:text></td>
            <td><xsl:value-of select="./@dllname"/></td>
            <td>
              <xsl:for-each select="viewcomplist/viewcomp">
                <a href="{@name}.xml" title="{@desc}"><xsl:value-of select="@name"/></a>
                <xsl:if test="position()!=last()">,<xsl:text>&#xA0;</xsl:text></xsl:if>
              </xsl:for-each>
            </td>
          </tr>
          </xsl:for-each>
      </tbody>
    </table>
    </xsl:template>

  <!-- Template to list the Tables of this application. -->
  <xsl:template match="tablelist">
    <h3><a name="Tables">Tables: <xsl:value-of select="count(table)"/></a></h3>
    <table border="0" cellpadding="2" cellspacing="0">
      <thead class="aom">
        <tr align="left">
          <th class="aom">Table </th>
          <th class="aom">RotoID </th>
          <th class="aom">Title </th>
        </tr>
        <tr>
          <td colspan="5">
            <hr class="aom" />
          </td>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="./table">
          <tr align="left" valign="top">
            <td>
              <a href="{@name}.xml" title="Table: {@desc}">
                <xsl:value-of select="@name"/>
              </a>
            </td>
            <td>
              <a href="{./view/@name}.xml" title="View: {./view/@desc}">
                <xsl:value-of select="./view/@name"/>
              </a>
            </td>
            <td style="white-space: nowrap;"><xsl:value-of select="@desc"/><xsl:text>&#xA0;</xsl:text></td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>

<!-- Template to list the Objects of this application. -->
  <xsl:template match="objectlist">
    <h3><a name="Objects">Objects: <xsl:value-of select="count(object)"/></a></h3>
    <table border="0" cellpadding="2" cellspacing="0">
      <thead class="aom">
        <tr align="left">
          <th class="aom">Object</th>
          <th class="aom">Protocol</th>
          <th class="aom">Views</th>
        </tr>
        <tr>
          <td colspan="5"><hr class="aom" /></td>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="./object">
          <tr align="left" valign="top">
            <td><xsl:value-of select="@name"/></td>
            <td>
              <a href="EndNotes.xml#{protocolflag/@type}_{protocolflag/@desc}" title="{protocolflag/@desc}">
                <xsl:value-of select="protocolflag/@value"/>
              </a>
              <xsl:text>&#xA0;</xsl:text>
            </td>
            <td>
              <xsl:for-each select="objectviewlist/objectview">
                <a href="{@name}.xml" title="{@desc}">
                  <xsl:value-of select="@name"/>
                </a>
                <xsl:if test="position()!=last()">,<xsl:text>&#xA0;</xsl:text></xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>

</xsl:stylesheet>
