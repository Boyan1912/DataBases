<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method='html' version='1.0' encoding='UTF-8' indent='yes'/>

    <xsl:template match="/">
      <html>
        <body>
          <h2 style="color:maroon;">Albums Catalogue</h2>
          <table border="1" style="padding:4px;4px;4px;4px;">
            <tr bgcolor="#CCCCCC">
              <th align="center">Name</th>
              <th align="center">Artist</th>
              <th align="center">Year</th>
              <th align="center">Producer</th>
              <th align="center">Price</th>
              <th align="center">Songs</th>
            </tr>
              <xsl:for-each select="catalog/albums/album">
              <tr>
                <td>
                  <xsl:value-of select="name"/>
                </td>
                <td>
                  <xsl:value-of select="artist"/>
                </td>
                <td style="padding:8px;0px;8;0px;">
                  <xsl:value-of select="year"/>
                </td>
                <td style="padding:8px;0px;8;0px;">
                  <xsl:value-of select="producer"/>
                </td>
                <td style="background-color:maroon; color:white; text-align:center;">
                  <xsl:value-of select="price"/>
                </td>
                <td>
                  <div style="overflow-y:scroll; max-height:50px; ">
                  <ol type="1">
                  <xsl:for-each select="songs/song">
                    <li>
                      <xsl:value-of select="title"/>
                      <span style="margin-left:8px; color:blue;"><xsl:value-of select="duration"/></span>
                    </li>
                  </xsl:for-each>
                  </ol>
                 </div>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </body>

      </html>

    </xsl:template>
</xsl:stylesheet>
