<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:students="urn:students.com"
>
    <xsl:template match="/">

      <html>
        <head>
          
        </head>
        <body>
          <table bgcolor="green" cellspacing="7" border="1px solid black" cellpadding="5" border-radius="10px">
            <thead>
              <tr>
                <th color="white">
                  Students
                </th>
              </tr>
              <tr bgcolor="aqua">
                <td>Name</td>
                <td>Sex</td>
                <td>Birth Date</td>
                <td>Phone</td>
                <td>E-mail</td>
                <td>Course</td>
                <td>Specialty</td>
                <td>Faculty Number</td>
                <td>Exams</td>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="students/student">
                <tr>
                  <td>
                    <xsl:value-of select="name"/>
                  </td>
                  <td>
                    <xsl:value-of select="sex"/>
                  </td>
                  <td>
                    <xsl:value-of select="birthDate"/>
                  </td>
                  <td>
                    <xsl:value-of select="phone"/>
                  </td>
                  <td>
                    <xsl:value-of select="email"/>
                  </td>
                  <td>
                    <xsl:value-of select="course"/>
                  </td>
                  <td>
                    <xsl:value-of select="specialty"/>
                  </td>
                  <td>
                    <xsl:value-of select="facultyNumber"/>
                  </td>
                  <td bgcolor="maroon">
                    <xsl:for-each select="exams/exam">
                      <xsl:value-of select="name"/><br />
                      tutor: <xsl:value-of select="tutor"/><br />
                      score: <xsl:value-of select="score"/><br />
                    </xsl:for-each>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </body>
      </html>
    </xsl:template>
</xsl:stylesheet>
