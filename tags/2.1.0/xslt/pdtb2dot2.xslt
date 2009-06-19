<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" indent="yes"/>

<xsl:variable name="newline">
<xsl:text>
</xsl:text>
</xsl:variable>

<xsl:variable name="corpus_id" select="/corpus/@id" />

<!-- This stylesheet output every relatin in a XML file into a different digraph file.
    (XSLT processor supporting XSLT 2.0, such as saxon, is required ) -->

<xsl:template match="/corpus">
    <xsl:for-each select="Relations//Relation">
    <xsl:variable name="filename" select="concat($corpus_id,'/',@id,'.dot')" />
    <xsl:result-document href="{$filename}">
digraph G
{
        <xsl:text>/* Relation </xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>,  </xsl:text>
        <xsl:value-of select="@Class"/>
        <xsl:text> */</xsl:text>
        <xsl:value-of select="$newline" />

            <xsl:if test = "ConnHead">
                <xsl:apply-templates select='ConnHead'/>
            </xsl:if>

            <xsl:if test = "Sup1">
                <xsl:apply-templates select='Sup1'/>
            </xsl:if>

            <xsl:if test = "Arg1">
                <xsl:apply-templates select='Arg1'/>
            </xsl:if>

            <xsl:if test = "Arg2">
                <xsl:apply-templates select='Arg2'/>
            </xsl:if>

            <xsl:if test = "Sup2">
                <xsl:apply-templates select='Sup2'/>
            </xsl:if>
}
    </xsl:result-document>
    </xsl:for-each>
</xsl:template>

<xsl:template match="ConnHead">  
    <xsl:if test = "Attribution">
        <xsl:text> /* ConnHead Attribution, color=lightpink */ </xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:apply-templates select="Attribution/TreeRef/tr">  
            <xsl:with-param name="color">lightpink</xsl:with-param>
        </xsl:apply-templates>  
    </xsl:if>

    <xsl:if test = "TreeRef">
        <xsl:text> /* ConnHead, color=red */ </xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:apply-templates select="TreeRef/tr">  
            <xsl:with-param name="color">red</xsl:with-param>
        </xsl:apply-templates>  
    </xsl:if>
</xsl:template>

<xsl:template match="Sup1">  
    <xsl:text> /* Sup1, color=grey */ </xsl:text>
    <xsl:value-of select="$newline" />
    <xsl:apply-templates select="TreeRef/tr">  
        <xsl:with-param name="color">grey</xsl:with-param>
    </xsl:apply-templates>  
</xsl:template>

<xsl:template match="Arg1">  
    <xsl:if test = "Attribution">
        <xsl:text> /* Arg1 Attribution, color=tan1 */ </xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:apply-templates select="Attribution/TreeRef/tr">  
            <xsl:with-param name="color">tan1</xsl:with-param>
        </xsl:apply-templates>  
    </xsl:if>
    <xsl:text> /* Arg1, color=yellow */ </xsl:text>
    <xsl:value-of select="$newline" />
    <xsl:apply-templates select="TreeRef/tr">  
        <xsl:with-param name="color">yellow</xsl:with-param>
    </xsl:apply-templates>  
</xsl:template>

<xsl:template match="Arg2">  
    <xsl:if test = "Attribution">
        <xsl:text> /* Arg2 Attribution, color=purple */ </xsl:text>
        <xsl:value-of select="$newline" />
        <xsl:apply-templates select="Attribution/TreeRef/tr">  
            <xsl:with-param name="color">purple</xsl:with-param>
        </xsl:apply-templates>  
    </xsl:if>
    <xsl:text> /* Arg2, color=cornflowerblue */ </xsl:text>
    <xsl:value-of select="$newline" />
    <xsl:apply-templates select="TreeRef/tr">  
        <xsl:with-param name="color">cornflowerblue</xsl:with-param>
    </xsl:apply-templates>  
</xsl:template>

<xsl:template match="Sup2">  
    <xsl:text> /* Sup2, color=green */ </xsl:text>
    <xsl:value-of select="$newline" />
    <xsl:apply-templates select="TreeRef/tr">  
        <xsl:with-param name="color">green</xsl:with-param>
    </xsl:apply-templates>  
</xsl:template>

<xsl:template match="tr">  
    <xsl:param name="color"/>
    <!-- select <b> element -->
    <xsl:apply-templates select="id(@idref)">  
        <xsl:with-param name="left" select="@idref" />
        <xsl:with-param name="color" select="$color" />
    </xsl:apply-templates>  
</xsl:template>

<!-- in favor of clarity, this part isn't efficient -->
<!-- every node should have a uniq id, but labels might be the same -->
<xsl:template match="b">  
        <xsl:param name="left"/>
        <xsl:param name="color"/>
        <xsl:if test = "id(@idref)/@cat">
            <!-- nonterminal: label for the left -->
            <xsl:value-of select="$left"/>
            <xsl:text> [style = filled, color = </xsl:text>
            <xsl:value-of select="$color"/>
            <xsl:text>, label = "</xsl:text>
            <xsl:value-of select="id(id($left)/@idref)/@cat"/>
            <xsl:text>"] </xsl:text>
            <xsl:text> ; </xsl:text>
            <xsl:value-of select="$newline" />
            <!-- nonterminal: label for the right -->
            <xsl:value-of select="@id"/>
            <xsl:text> [style = filled, color = </xsl:text>
            <xsl:value-of select="$color"/>
            <xsl:text>, label = "</xsl:text>
            <xsl:value-of select="id(@idref)/@cat"/>
            <xsl:text>"] </xsl:text>
            <xsl:text> ; </xsl:text>
            <xsl:value-of select="$newline" />
        </xsl:if>

        <xsl:if test = "id(@idref)/@pos">
            <!-- terminal: label for the middle -->
            <xsl:value-of select="@id"/>
            <xsl:text> [style = filled, color = </xsl:text>
            <xsl:value-of select="$color"/>
            <xsl:text>, label = "</xsl:text>
            <xsl:value-of select="id(@idref)/@pos"/>
            <xsl:text>"] </xsl:text>
            <xsl:text> ; </xsl:text>
            <xsl:value-of select="$newline" />

            <!-- terminal: label for the right -->
            <xsl:value-of select="@idref"/>
            <xsl:text> [style = filled, color = </xsl:text>
            <xsl:value-of select="$color"/>
            <xsl:text>, label = "</xsl:text>
            <xsl:value-of select="id(@idref)/@word"/>
            <xsl:text>"] </xsl:text>
            <xsl:text> ; </xsl:text>
            <xsl:value-of select="$newline" />
        </xsl:if>

        <xsl:if test = "id(@idref)/@cat">
            <xsl:apply-templates select="b">  
                <xsl:with-param name="left" select="@id" />
                <xsl:with-param name="color" select="$color" />
            </xsl:apply-templates>  
        </xsl:if>
</xsl:template>




</xsl:stylesheet>

<!-- java -cp /home/xcyao/xml/saxon9/saxon9.jar net.sf.saxon.Transform  -s:dtd.xml -xsl:pdtb2dot2.xslt  -->
<!-- dot -Tpng dtd_pdtb.dot > dtd_pdtb.png -->
