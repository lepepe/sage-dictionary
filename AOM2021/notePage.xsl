<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/html4/loose.dtd" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

  <!-- Template for summary information of this application. -->
  <xsl:template match="note">
    <div>
    <h1>End Notes</h1>
      <xsl:apply-templates select="fieldflaglist" />
      <xsl:apply-templates select="tableflaglist" />
      <xsl:apply-templates select="keyflaglist" />
    </div>
  </xsl:template>

  <!-- Template to list the Attributes section -->
  <xsl:template match="note/fieldflaglist">
  <a name="Attributes"></a>
  <h3>Attributes</h3>
  <p>Attributes indicate the current status of various characteristics of a field.
    <ul>
      <li>Bit numbers 0 to 15 are assigned specific meaning by the view API.</li>
      <li>Bit numbers 16 to 31 are reserved for view implementers to assign their own meaning.</li>
    </ul>
  </p>
  <p>The state of a static attribute does not change for the duration of the view handle instance being open. The state of a dynamic attribute can change at any time.</p>
  <p>The mask equals 1 shifted left by the bit number.</p>
    <table border="0" cellpadding="2" cellspacing="0">
      <thead class="aom">
        <tr align="left">
          <th class="aom">Attribute </th>
          <th class="aom">Kind </th>
          <th class="aom">Bit </th>
          <th class="aom">Mask </th>
          <th class="aom">Meaning When Set </th>
        </tr>
        <tr>
          <td colspan="5"><hr class="aom" /></td>
        </tr>
      </thead>
      <tbody>
        <xsl:for-each select="./fieldflag">
          <tr align="left" valign="top">
            <td><a name="Attribute_{@name}"></a><xsl:value-of select="@name" /></td>
            <td><xsl:value-of select="@type" /></td>
            <td><xsl:value-of select="@bit" /></td>
            <td><xsl:value-of select="@mask" /></td>
            <td><xsl:value-of select="@meaning" /></td>
          </tr>
        </xsl:for-each>
        <tr>
          <td colspan="5"><hr class="aom" /></td>
        </tr>
      </tbody>
    </table>
  </xsl:template>

  <xsl:template match="note/tableflaglist">
    <a name="Protocols"></a>
    <h3>Protocols</h3>
    <h3>Table Flags</h3>
      <table border="0" cellpadding="2" cellspacing="0">
        <thead class="aom">
          <tr align="left">
            <th class="aom">Flag </th>
            <th class="aom">Meaning When Set </th>
          </tr>
          <tr>
            <td colspan="5"><hr class="aom" /></td>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="./tableflag">
            <tr align="left" valign="top">
              <td><a name="Table_{@name}"></a><xsl:value-of select="@name" /></td>
              <td><xsl:value-of select="@meaning" /></td>
            </tr>
          </xsl:for-each>
        <tr>
          <td colspan="2"><hr class="aom" /></td>
        </tr>
        </tbody>
      </table>
  </xsl:template>

  <xsl:template match="note/keyflaglist">
    <h3>Key Flags</h3>
      <table border="0" cellpadding="2" cellspacing="0">
        <thead class="aom">
          <tr align="left">
            <th class="aom">Flag </th>
            <th class="aom">Meaning When Set </th>
          </tr>
          <tr>
            <td colspan="5"><hr class="aom" /></td>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="./keyflag">
            <tr align="left" valign="top">
              <td><a name="Key_{@name}"></a><xsl:value-of select="@name" /></td>
              <td><xsl:value-of select="@meaning" /></td>
            </tr>
          </xsl:for-each>
        <tr>
          <td colspan="2"><hr class="aom" /></td>
        </tr>
        </tbody>
      </table>
  </xsl:template>

</xsl:stylesheet>

