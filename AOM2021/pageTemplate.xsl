<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="aomPage.xsl" />
  <xsl:import href="notePage.xsl" />
  <xsl:import href="appPage.xsl" />
  <xsl:import href="viewPage.xsl" />
  <xsl:import href="tablePage.xsl" />
  <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/html4/loose.dtd" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <xsl:apply-templates/>
    </html>
  </xsl:template>
  <!-- Template for html head section. -->
  <xsl:template match="pagehead">
    <head>
      <meta name="generator" content="{generator}" />
      <meta name="keywords" content="{keywords}" />
      <title>
        <xsl:value-of select="pagetitle"/>
      </title>
      <link rel="stylesheet" type="text/css" media="screen,print" href="base_portal.css" />
    </head>
  </xsl:template>
  <!-- Template to match the main body of the html file -->
  <xsl:template match="pagebody">
    <body>
      <xsl:apply-imports/>
    </body>
  </xsl:template>
  <!-- Template for boilerplate header info. Not to confuse with "pagehead" which is the html head. -->
  <xsl:template match="header">
    <!-- <img height="67" src="/irj/go/km/docs/sageKM/Assets/header.gif" width="594" /> -->
  </xsl:template>
  <!-- Template for boilerplate footer info. -->
  <xsl:template match="footer">
    <!-- <img height="24" alt=" " src="/irj/go/km/docs/sageKM/Assets/sage_25.gif" width="594" /> -->
    <p class="footer">
        This page was generated on <xsl:value-of select="/page/pagehead/pagedate"/>
    </p>
    <p class="footer">
      © 2020 Sage Software, Inc. All rights reserved. Reproduction of
      part or all of the contents in any form is prohibited unless for personal use.
      None of the content of this article may be copied or otherwise incorporated into
      any other document, publication or other work in any form (whether written,
      electronic or other format).
    </p>
    <p class="footer">
      Sage Software, Inc. makes no warranties, representations or
      undertakings about any of the content of articles (including, without
      limitation, any as to the quality, accuracy, completeness or fitness for any
      particular purpose of such content).
    </p>
    <!-- <img height="23" src="/irj/go/km/docs/sageKM/Assets/sage_29.gif" width="594" /> -->
    <xsl:comment> START OF SmartSource Data Collector TAG </xsl:comment>
    <xsl:comment> Copyright (c) 1996-2006 WebTrends Inc.  All rights reserved. </xsl:comment>
    <xsl:comment>$DateTime: 2006/03/01 12:51:54 $ </xsl:comment>
    <script type="text/javascript">
      <xsl:comment>
        var gDomain="webtrack.bestsoftware.com";
        var gDcsId="dcs9oujaa1000043l9dkb2tq6_7i6e";
        var gFpc="WT_FPC";
        var gConvert=true;
        if ((typeof(gConvert)!="undefined")&amp;&amp;gConvert&amp;&amp;(document.cookie.indexOf(gFpc+"=")==-1)&amp;&amp;(document.cookie.indexOf("WTLOPTOUT=")==-1)){document.write("&lt;SCR"+"IPT TYPE='text/javascript' SRC='"+"http"+(window.location.protocol.indexOf('https:')==0?'s':'')+"://"+gDomain+"/"+gDcsId+"/wtid.js"+"'&gt;&lt;/SCR"+"IPT>");
        }
      </xsl:comment>
    </script>
    <script src="/irj/go/km/docs/sageKM/Assets/dcs_tag.js" type="text/javascript">
    </script>
    <noscript>
      <img ALT="" BORDER="0" NAME="DCSIMG" WIDTH="1" HEIGHT="1" SRC="https://webtrack.bestsoftware.com/dcs9oujaa1000043l9dkb2tq6_7i6e/njs.gif?dcsuri=/nojavascript&amp;WT.js=No" />
    </noscript>
    <xsl:comment> END OF SmartSource Data Collector TAG </xsl:comment>
  </xsl:template>
</xsl:stylesheet>
