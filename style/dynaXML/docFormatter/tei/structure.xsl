<!--
   Copyright (c) 2005, Regents of the University of California
   All rights reserved.
 
   Redistribution and use in source and binary forms, with or without 
   modification, are permitted provided that the following conditions are 
   met:

   - Redistributions of source code must retain the above copyright notice, 
     this list of conditions and the following disclaimer.
   - Redistributions in binary form must reproduce the above copyright 
     notice, this list of conditions and the following disclaimer in the 
     documentation and/or other materials provided with the distribution.
   - Neither the name of the University of California nor the names of its
     contributors may be used to endorse or promote products derived from 
     this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
   POSSIBILITY OF SUCH DAMAGE.
-->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://www.tei-c.org/ns/1.0">

<!-- Removed call to "book.autotoc" below -->

<xsl:template match="TEI">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="teiHeader"/>

<xsl:template match="text">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="front">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="body">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="back">
  <xsl:apply-templates/>
</xsl:template>

<!-- <xsl:template match="div1[@type='dedication']">
	<xsl:apply-templates/>
</xsl:template> -->
 
<!-- Correct symbol is &#x2766 -->

<xsl:template match="div|div1|div2|div3|div4|div5|div6">
    <xsl:choose>
      <xsl:when test="@type='textbreak'">
        <xsl:choose>
          <xsl:when test="@rend='ornament'">
            <div class="center">
              <table border="0" width="40%"><tr class="center"><td>&#x2022;</td><td>&#x2022;</td><td>&#x2022;</td></tr></table>
            </div>
          </xsl:when>
          <xsl:otherwise>
            <table border="0" width="40%"><tr><td>&#160;</td><td>&#160;</td><td>&#160;</td></tr></table>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="@rend and not(child::head)">
      	<div class="{@rend}"><xsl:apply-templates/></div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="@rend='ornament'">
          <div class="center">
            <table border="0" width="40%"><tr class="center"><td>&#x2022;</td><td>&#x2022;</td><td>&#x2022;</td></tr></table>
          </div>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="ab">

  <xsl:variable name="class">
    <xsl:choose>
      <xsl:when test="@rend">
        <xsl:value-of select="@rend"/>
      </xsl:when>
      <xsl:otherwise>normal</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <div class="{$class}">
    <xsl:apply-templates/>
  </div>
</xsl:template>

</xsl:stylesheet>

