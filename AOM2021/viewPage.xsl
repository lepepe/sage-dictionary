<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/html4/loose.dtd" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

  <!-- Template for printing out the View summary. This must call all other templates. -->
  <xsl:template match="view">
    <div>
      <h1>View: <xsl:value-of select="title"/></h1>
      <b>RotoID: </b>
      <xsl:value-of select="rotoid"/>
      <br />
      <xsl:choose>
        <xsl:when test="count(./tablelist/table) = 1">
          <b>Table: </b>
        </xsl:when>
        <xsl:when test="count(./tablelist/table) &gt; 1">
          <b>Tables: </b>
        </xsl:when>
      </xsl:choose>
      <xsl:for-each select="tablelist/table">
        <a href="{@name}.xml" title="Table: {@desc}">
          <xsl:value-of select="@name"/>
        </a>
        <xsl:if test="position()!=last()">,<xsl:text>&#xA0;</xsl:text></xsl:if>
      </xsl:for-each>
      <br />
      <b>Protocol: </b>
      <xsl:for-each select="protocollist/protocol">
        <xsl:value-of select="."/>
        <xsl:if test="position()!=last()">,<xsl:text>&#xA0;</xsl:text></xsl:if>
      </xsl:for-each>
      <br />
      <b>DLL:</b>
      <xsl:value-of select="dllname"/>
      <br />
      <xsl:apply-templates select="compositionlist"/>
      <xsl:apply-templates select="keylist"/>
      <xsl:apply-templates select="fieldlist"/>
    </div>
  </xsl:template>

  <!-- Template for printing out the Composition table -->
  <xsl:template match="view/compositionlist">
    <h3>
      Compositions: <xsl:value-of select="count(composition)"/>
    </h3>
    <table border ="0" cellpadding="2" cellspacing="0">
      <thead class="aom">
        <tr align="left">
          <th class="aom">RotoID</th>
          <th class="aom">Tables</th>
          <th class="aom">Title</th>
          <th class="aom">DLL</th>
        </tr>
        <tr>
          <td colspan="4">
            <hr class="aom" />
          </td>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="composition">
          <tr align="left">
            <td>
              <a href="{comprotoid}.xml" title="View: {compdesc}">
                <xsl:value-of select="comprotoid"/>
              </a>
            </td>
            <td>
              <xsl:for-each select="comptablelist/comptable">
                <a href="{./@name}.xml" title="Table: {./@desc}">
                  <xsl:value-of select="./@name"/>
                </a>
              </xsl:for-each>
            </td>
            <td style="white-space: nowrap;">
              <xsl:value-of select="compdesc"/>
            </td>
            <td>
              <xsl:value-of select="compdll"/>
            </td>
          </tr>
        </xsl:for-each>
        <tr>
          <td colspan="4">
            <hr class="aom" />
          </td>
        </tr>
      </tbody>
    </table>
  </xsl:template>

  <!-- Template for the list of Keys. -->
  <xsl:template match="view/keylist">
    <h3>
      Keys: <xsl:value-of select="count(key)"/>
    </h3>
    <table border="0" cellpadding="2" cellspacing="0">
      <thead class="aom">
        <tr align="left">
          <th class="aom">Title</th>
          <th class="aom">Fields</th>
        </tr>
        <tr>
          <td colspan="2">
            <hr class="aom" />
          </td>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="key">
          <tr valign="top" align="left">
            <td>
              <xsl:value-of select="keytitle"/>
            </td>
            <td>
              <xsl:for-each select="keyfieldlist/keyfield">
                <a href="#{.}">
                  <xsl:value-of select="."/>
                </a>
                <xsl:if test="position()!=last()">,<xsl:text>&#xA0;</xsl:text></xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </xsl:for-each>
        <tr>
          <td colspan="2">
            <hr class="aom" />
          </td>
        </tr>
      </tbody>
    </table>
  </xsl:template>

  <!-- Template for the list of View Fields. -->
  <xsl:template match="view/fieldlist">
    <h3>
      Fields: <xsl:value-of select="count(field)"/>
    </h3>
    <table border="0" cellpadding="2" cellspacing="0">
      <thead class="aom">
        <tr align="left">
          <th class="aom">Field </th>
          <th class="aom">Index </th>
          <th class="aom">Type </th>
          <th class="aom">Title </th>
          <th class="aom">Attributes </th>
          <th class="aom">Presentation</th>
        </tr>
        <tr>
          <td colspan="6">
            <hr class="aom" />
          </td>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="field">
          <tr valign="top" align="left">
            <td>
              <a name="{fieldname}">
                <xsl:value-of select="fieldname"/>
              </a>
            </td>
            <td>
              <xsl:value-of select="fieldindex"/>
            </td>

            <td>
              <xsl:value-of select="fieldtype"/>
            </td>
            <td style="white-space: nowrap">
              <xsl:value-of select="fielddesc"/>
            </td>
            <td>
              <xsl:for-each select="./attributeflaglist/attributeflag">
                <a href="EndNotes.xml#{@type}_{@desc}" title="{@desc}">
                  <xsl:value-of select="@value"/>
                </a>
                <xsl:text>&#xA0;</xsl:text>
              </xsl:for-each>
            </td>
            <td style="white-space: nowrap">
              <xsl:if test="count(./fieldpresentlist/fieldpresent) &gt; 0">
                <b>List:</b> <xsl:value-of select="count(fieldpresentlist/fieldpresent)"/> entries<br />
                <table border="0" cellspacing="0" cellpadding="0">
                  <xsl:for-each select="fieldpresentlist/fieldpresent">
                    <tr>
                      <td align="right">
                        <xsl:value-of select="./@index"/>
                      </td>
                      <td>=</td>
                      <td align="left" style="white-space: nowrap">
                        <xsl:value-of select="./@value"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
              </xsl:if>
              <xsl:if test="count(./mask) &gt; 0">
                <b>Mask: </b>
                <xsl:value-of select="mask"/>
              </xsl:if>
            </td>
          </tr>
        </xsl:for-each>
        <tr>
          <td colspan="6">
            <hr class="aom" />
          </td>
        </tr>
      </tbody>
    </table>
  </xsl:template>

</xsl:stylesheet>
