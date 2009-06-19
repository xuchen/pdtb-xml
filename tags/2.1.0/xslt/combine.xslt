<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" doctype-system="../schema/pdtb.dtd" />
<xsl:param name="file" />
<xsl:variable name="externalFile">generated_header.xml</xsl:variable>

<xsl:template match="/corpus">

<corpus  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../schema/TigerXML.xsd">
    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute> 
    <xsl:element name="head"> 
        <xsl:apply-templates select="head/@external"/>  
        <!-- <xsl:attribute name="external">generated_header.xml</xsl:attribute> -->
    </xsl:element> 
    <!-- Help xslt to indent properly -->
    <body>
        <xsl:copy-of select="body/*"/>  
    </body>
    <Relations>
    <xsl:copy-of select="document($file)/Relations/*"/>
    </Relations>
</corpus>

</xsl:template>

<!-- redefine header -->
<xsl:template match="head/@external">  
    <!--<xsl:attribute name="external"><xsl:value-of select="."/></xsl:attribute> -->
    <xsl:attribute name="external"><xsl:value-of select="$externalFile"/></xsl:attribute> 
</xsl:template>

</xsl:stylesheet>

<!-- xsltproc  -o a.xml  - -stringparam file pdtb.xml/00/wsj_0001.pdtb.xml combine.xslt ptb.xml/00/wsj_0001.xml-->
<!-- java -cp /home/xcyao/xml/saxon9/saxon9.jar net.sf.saxon.Transform  -s:ptb.xml/00/wsj_0001.xml -xsl:combine.xslt file=pdtb.xml/00/wsj_0001.pdtb.xml -->
