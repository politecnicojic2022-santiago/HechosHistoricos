<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output version="5.0" method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/marcadores">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="Marcadores.css"/>
            </head>
            <body>
                <h1><xsl:value-of select="titulo"/></h1>
                <h2>Autor: <xsl:value-of select="@autor"/></h2>
                <h3><xsl:value-of select="pagina[2]/url"/></h3>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>URL</th>
                            <th>Año</th>
                            <th>Tipo de pagina</th>
                            <th>Correo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="pagina">
                            <xsl:sort select="url/@fuente" order="descending"/>
                            <tr>
                                <td><xsl:value-of select="nombre"/></td>
                                <td><xsl:value-of select="descripcion"/></td>
                                <td><xsl:value-of select="url"/> - <xsl:value-of select="url/@fuente"/></td>
                                <td>
                                    <!--<xsl:if test="año &lt; 2022">
                                        <xsl:value-of select="año"/>
                                    </xsl:if>-->
                                    <xsl:choose>
                                        <xsl:when test="año = 2000">
                                            <p style="color:blue"><xsl:value-of select="año"/></p>
                                        </xsl:when>
                                        <xsl:when test="año = 2005">
                                            <p style="color:red"><xsl:value-of select="año"/></p>
                                        </xsl:when>
                                        <xsl:when test="año = 2022">
                                            <p style="color:green"><xsl:value-of select="año"/></p>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            No existe el año
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                                <td><xsl:value-of select="tipo_pagina"/></td>
                                <td><xsl:value-of select="correo"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>