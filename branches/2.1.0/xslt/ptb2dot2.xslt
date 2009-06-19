<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" indent="no"/>

<!-- write every tree into a different file (XSLT processor supporting XSLT 2.0, such as saxon, is required )-->

<xsl:variable name="corpus_id" select="/corpus/@id" />

<xsl:template match="/">
<xsl:for-each select='corpus/body/s'>
    <xsl:apply-templates select='tree'/>
</xsl:for-each>

</xsl:template>

<xsl:template match="tree">  
<xsl:variable name="filename" select="concat($corpus_id,'/',@id,'.dot')" />
<xsl:result-document href="{$filename}">
digraph G
{
<xsl:apply-templates select="b">  
    <xsl:with-param name="left" select="@id" />
</xsl:apply-templates>  
}
</xsl:result-document>
</xsl:template>

<!-- in favor of clarity, this part isn't efficient -->
<!-- every node should have a uniq id, but labels might be the same -->
<xsl:template match="b">  
        <xsl:param name="left"/>
        <xsl:value-of select="$left"/>
        <xsl:text> -> </xsl:text>
        <xsl:choose>
            <!-- nonterminal -->
            <xsl:when test = "id(@idref)/@cat">
                <xsl:value-of select="@id"/>
            </xsl:when>
            <!-- terminal -->
            <xsl:when test = "id(@idref)/@pos">
                <xsl:text>"</xsl:text>
                <xsl:value-of select="@id"/>
                <xsl:text>"</xsl:text>
                <xsl:text> -> </xsl:text>
                <xsl:text>"</xsl:text>
                <xsl:value-of select="@idref"/>
                <xsl:text>"</xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:text> ; </xsl:text>
        <!-- a line break -->
        <xsl:text>&#10;</xsl:text>

        <!-- nonterminal: label for the left -->
        <xsl:value-of select="$left"/>
        <xsl:text> [label = "</xsl:text>
        <xsl:value-of select="id(id($left)/@idref)/@cat"/>
        <xsl:text>"] </xsl:text>
        <xsl:text> ; </xsl:text>
        <!-- a line break -->
        <xsl:text>&#10;</xsl:text>

        <xsl:if test = "id(@idref)/@pos">
            <!-- terminal: label for the middle -->
            <xsl:value-of select="@id"/>
            <xsl:text> [label = "</xsl:text>
            <xsl:value-of select="id(@idref)/@pos"/>
            <xsl:text>"] </xsl:text>
            <xsl:text> ; </xsl:text>
            <!-- a line break -->
            <xsl:text>&#10;</xsl:text>

            <!-- terminal: label for the right -->
            <xsl:value-of select="@idref"/>
            <xsl:text> [label = "</xsl:text>
            <xsl:value-of select="id(@idref)/@word"/>
            <xsl:text>"] </xsl:text>
            <xsl:text> ; </xsl:text>
            <!-- a line break -->
            <xsl:text>&#10;</xsl:text>
        </xsl:if>

        <xsl:if test = "id(@idref)/@cat">
            <xsl:apply-templates select="b">  
                <xsl:with-param name="left" select="@id" />
            </xsl:apply-templates>  
        </xsl:if>
</xsl:template>

</xsl:stylesheet>

<!-- java -cp /home/xcyao/xml/saxon9/saxon9.jar net.sf.saxon.Transform  -s:dtd.xml -xsl:ptb2dot2.xslt-->
