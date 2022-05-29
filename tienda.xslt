<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">

    <html>
        <body>
            <head>
                <title>Trabajo XML XSD XSLT</title>
            </head>
<!-- En esta tabla practicamos el FOR-EACH Y EL SORT  -->
            <!-- <xsl:for-each select="//oms:pivotTable[@subType='Frequencies']">
            <xsl:for-each select="oms:dimension[@axis='row']"> -->
            <h2 align="center">Libros FOR-EACH</h2>
            <table border="1" align="center">
                <tr bgcolor="#a0a0ff">
                    <th>Título_Libro</th>
                    <th>Libro_id</th>
                    <th>Fecha_Publicación</th>
                    <th>Precio</th>
                    <th>categoria</th>
                    <th>UnidadesDiponibles</th>
                </tr>
                <xsl:for-each select="//libro">
                
                <!-- le indicamos que los datos que muestre los ordene de manera descendiente 
                tomando el "precio" como valor de referencia -->
                <xsl:sort select="precio" order="descending"/>
                <tr>
                    <td><xsl:value-of select="nombre"/></td>
                    <td><xsl:value-of select="codigo"/></td>
                    <td><xsl:value-of select="fecha"/></td>
                    <td><xsl:value-of select="precio"/></td>
                    <td><xsl:value-of select="categoria"/></td>
                    <td><xsl:value-of select="unidadesDisponibles"/></td>
                <!-- </xsl:for-each> -->
                </tr>
                </xsl:for-each>
                
            </table>
<!-- En esta tabla utilizamos el IF -->

            <h2 align="center">Libros con un coste superior a 15 euros FOR-EACH/IF</h2>
            <table border="1" align="center">
                <tr bgcolor="#a0a0ff">
                    <th>Título_Libro</th>
                    <th>Libro_id</th>
                    <th>Fecha_Publicación</th>
                    <th>Precio</th>
                    <th>categoria</th>
                    <th>UnidadesDiponibles</th>
                </tr>
                <xsl:for-each select="//libro">
                <xsl:sort select="precio" order="descending"/>
                <!-- Le indicamos la condicion que nos muestre los  elementos con un precio superior a 15 -->
                <xsl:if test="precio > 15">
                <tr>
                    <td><xsl:value-of select="nombre"/></td>
                    <td><xsl:value-of select="codigo"/></td>
                    <td><xsl:value-of select="fecha"/></td>
                    <td><xsl:value-of select="precio"/></td>
                    <td><xsl:value-of select="categoria"/></td>
                    <td><xsl:value-of select="unidadesDisponibles"/></td>
                </tr>
                </xsl:if>
                </xsl:for-each>
            </table>

<!--  En esta tabla sustituimos el IF por el CHOOSE-->

            <h2 align="center">Libros  CHOOSE</h2>
            <table border="1" align="center">
                <tr bgcolor="#a0a0ff">
                    <th>Título_Libro</th>
                    <th>Libro_id</th>
                    <th>Fecha_Publicación</th>
                    <th>Precio</th>
                    <th>categoria</th>
                    <th>UnidadesDiponibles</th>
                </tr>
                <xsl:for-each select="//libro">
                <!-- le indicamos que los datos que muestre los ordene de manera descendiente 
                tomando el "precio" como valor de referencia -->
                <xsl:sort select="precio" order="descending"/>
                <tr>
                    <td><xsl:value-of select="nombre"/></td>
                    <td><xsl:value-of select="codigo"/></td>
                    <td><xsl:value-of select="fecha"/></td>
                    <td><xsl:value-of select="precio"/></td>
                    <td><xsl:value-of select="categoria"/></td>
                    <td><xsl:value-of select="unidadesDisponibles"/></td>
                    <td bgcolor="#6DC36D">
                        <!-- Según la expresion en este caso la categoria 
                        colocaremos un contenido dentro del "when" -->
                        <xsl:choose>
                            <xsl:when test="categoria='Terror'">Mayores de edad</xsl:when>
                            <xsl:when test="categoria='Infantil'">Menores de edad</xsl:when>
                            <!-- cuando ninguno de los test anteriores se estan cumpliento le pasaremos el "otherwise" -->
                            <xsl:otherwise>Todos los públicos</xsl:otherwise>
                    </xsl:choose>
                    </td>

                </tr>
                </xsl:for-each>
            </table>

            <h2 align="center">Clientes   FOR-EACH</h2>
            <table border="1" align="center">
                <tr bgcolor="#a0a0ff">
                    <th>Nombre_Cliente</th>
                    <th>Cliente_id</th>
                    <th>Fecha_Compra</th>
                    <th>Apellido</th>
                    <th>Edad</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Dirección</th>
                </tr>
                <xsl:for-each select="//cliente">
                <tr>
                    <td><xsl:value-of select="nombre"/></td>
                    <td><xsl:value-of select="codigo"/></td>
                    <td><xsl:value-of select="fecha"/></td>
                    <td><xsl:value-of select="apellidos"/></td>
                    <td><xsl:value-of select="edad"/></td>
                    <td><xsl:value-of select="email"/></td>
                    <td><xsl:value-of select="telefono"/></td>
                    <td><xsl:value-of select="direccion"/></td>
                </tr>
                </xsl:for-each>
            </table>
            <h2 align="center">Clientes menores de 25 FOR-EACH</h2>
            <table border="1" align="center">
                <tr bgcolor="#a0a0ff">
                    <th>Nombre_Cliente</th>
                    <th>Cliente_id</th>
                    <th>Fecha_Compra</th>
                    <th>Apellido</th>
                    <th>Edad</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Dirección</th>
                </tr>
                <xsl:for-each select="//cliente">
                <!--&gt -> mayor que , &lt -> menor que , != -> distinto  -->
                <xsl:if test="edad &lt; 25">
                <tr>
                    <td><xsl:value-of select="nombre"/></td>
                    <td><xsl:value-of select="codigo"/></td>
                    <td><xsl:value-of select="fecha"/></td>
                    <td><xsl:value-of select="apellidos"/></td>
                    <td><xsl:value-of select="edad"/></td>
                    <td><xsl:value-of select="email"/></td>
                    <td><xsl:value-of select="telefono"/></td>
                    <td><xsl:value-of select="direccion"/></td>
                </tr>
                </xsl:if>
                </xsl:for-each>
            </table>
            
        </body>
    </html>
    </xsl:template>
</xsl:stylesheet>
