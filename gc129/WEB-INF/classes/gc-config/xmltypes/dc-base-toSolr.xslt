<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
xmlns:dc="http://purl.org/dc/elements/1.1/" 
xmlns:dct="http://purl.org/dc/terms/" 
xmlns:dcmiBox="http://dublincore.org/documents/2000/07/11/dcmi-box/" 
xmlns:ows="http://www.opengis.net/ows" 
xmlns:pod='http://project-open-data.cio.gov/v1.1/schema' 
xmlns:dcat='http://www.w3.org/ns/dcat#' 
xmlns:dctype='http://purl.org/dc/dcmitype/' 
xmlns:foaf='http://xmlns.com/foaf/0.1/' 
xmlns:org='http://www.w3.org/ns/org#' 
xmlns:rdfs='http://www.w3.org/2000/01/rdf-schema#' 
xmlns:skos='http://www.w3.org/2004/02/skos/core#' 
xmlns:vcard='http://www.w3.org/2006/vcard/ns#' >
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>
	<xsl:strip-space elements="*"/>
	<xsl:template name="writeBaseInfo">
		<xsl:call-template name="writeGeneralInfo"/>
		<xsl:call-template name="writeSpatialInfo"/>
		<xsl:call-template name="writeTemporalInfo"/>
		<xsl:call-template name="writeServiceInfo"/>
	</xsl:template>
	
	<xsl:template name="writeGeometry">
		<!--
	minx	<xsl:value-of select="substring-after(substring-before(./extent/text(),','),'[[')"/>
	miny	<xsl:value-of select="substring-before(substring-after(./extent/text(),','),']')"/>
	maxx	<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(./extent/text(),'['),'['),'['),',')"/>
	maxy	<xsl:value-of select="substring-before(substring-after(substring-after(substring-after(substring-after(./extent/text(),'['),'['),'['),','),']]')"/>
--> 
  
    <xsl:param name="fieldName"/>
    <xsl:for-each select="/rdf:RDF/rdf:Description/ows:WGS84BoundingBox">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="$fieldName"/>
        </xsl:attribute>
        <xsl:attribute name="gc-instruction">
          <xsl:value-of select="'checkGeoEnvelope'"/>
        </xsl:attribute>
        <xsl:value-of select="normalize-space(substring-before(ows:LowerCorner,' '))"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space(substring-after(ows:LowerCorner,' '))"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space(substring-before(ows:UpperCorner,' '))"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space(substring-after(ows:UpperCorner,' '))"/>
      </field>
    </xsl:for-each>
     <xsl:for-each select="/rdf:RDF/dcat:dataset/ows:WGS84BoundingBox">
      <field>
        <xsl:attribute name="name">
          <xsl:value-of select="$fieldName"/>
        </xsl:attribute>
        <xsl:attribute name="gc-instruction">
          <xsl:value-of select="'checkGeoEnvelope'"/>
        </xsl:attribute>
        <xsl:value-of select="normalize-space(substring-before(ows:LowerCorner,','))"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space(substring-after(ows:LowerCorner,','))"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space(substring-before(ows:UpperCorner,','))"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="normalize-space(substring-after(ows:UpperCorner,','))"/>
      </field>
    </xsl:for-each>
    
     
  </xsl:template>
  
  <xsl:template name="writeGeneralInfo">
    <!--  id.fileid_s ??-->
    <field name="title"> <!-- _txt -->
      <xsl:value-of select="/rdf:RDF/rdf:Description/dc:title | /rdf:RDF/dcat:dataset/dct:title"/>
    </field>
    <field name="description"><!-- _t -->
      <xsl:value-of select="/rdf:RDF/rdf:Description/dct:abstract | /rdf:RDF/dcat:dataset/dct:description"/>
    </field>
    <xsl:for-each select="/rdf:RDF/rdf:Description/dct:references | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:downloadURL">
      <xsl:if test="string-length(current())>0">
		  <field name="links"><!-- _ss -->
			<xsl:value-of select="current()"/>
		  </field>
		</xsl:if>
    </xsl:for-each>
    <field name="url.thumbnail_s">
      <xsl:value-of select="/rdf:RDF/rdf:Description/dct:references[@scheme='urn:x-esri:specification:ServiceType:ArcIMS:Metadata:Thumbnail']"/>
    </field>
    <field name="keywords">
      <xsl:for-each select="/rdf:RDF/rdf:Description/dc:subject | /rdf:RDF/dcat:dataset/dcat:keyword">
        <xsl:value-of select="current()"/>
        <xsl:text> </xsl:text>
      </xsl:for-each>
    </field>
    <xsl:for-each select="/rdf:RDF/rdf:Description/dc:subject | /rdf:RDF/dcat:dataset/dcat:keyword">
      <field name="keywords_ss">
        <xsl:value-of select="current()"/>
      </field>
    </xsl:for-each>    
     <xsl:for-each select="/rdf:RDF/rdf:Description/dc:creator | /rdf:RDF/dcat:dataset/dct:publisher/foaf:name">
      <field name="contact.organizations_ss">
        <xsl:value-of select="current()"/>
      </field>
    </xsl:for-each>
     <xsl:for-each select="/rdf:RDF/rdf:Description/dc:creator | /rdf:RDF/dcat:dataset/dct:publisher/foaf:name">
      <field name="contact.people_ss">
        <xsl:value-of select="current()"/>
      </field>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="writeSpatialInfo">
   <xsl:call-template name="writeGeometry">
      <xsl:with-param name="fieldName">envelope_geo</xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="writeTemporalInfo">
    <field name="apiso.TempExtent_begin_dts" gc-instruction="checkIsoDateTime">
      <xsl:value-of select="/rdf:RDF/rdf:Description/dc:date"/>
    </field>
    <field name="apiso.TempExtent_end_dts" gc-instruction="checkIsoDateTime">
      <xsl:value-of select="/rdf:RDF/rdf:Description/dc:date"/>
    </field>
  </xsl:template>
	<xsl:template name="writeServiceInfo">
		<xsl:for-each select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'MAPSERV', 'mapserv'),'mapserver')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'MAPSERV', 'mapserv'),'mapserver')]">
			<field name="dataAccessType_ss">ESRI REST</field>
			<field name="url.mapserver_ss">
				<xsl:value-of select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'MAPSERV', 'mapserv'),'mapserver')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'MAPSERV', 'mapserv'),'mapserver')]"/>
			</field>
		</xsl:for-each>
		<xsl:for-each select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'WMS', 'wms'),'wms')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'WMS', 'wms'),'wms')]">
			<field name="dataAccessType_ss">OGC WMS</field>
			<field name="url.wms_ss">
				<xsl:value-of select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'WMS', 'wms'),'wms')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'WMS', 'wms'),'wms')]"/>
			</field>
		</xsl:for-each>
		<xsl:for-each select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'WFS', 'wfs'),'wfs')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'WFS', 'wfs'),'wfs')]">
			<field name="dataAccessType_ss">OGC WFS</field>
			<field name="url.wfs_ss">
				<xsl:value-of select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'WFS', 'wfs'),'wfs')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'WFS', 'wfs'),'wfs')]"/>
			</field>
		</xsl:for-each>
		
		<xsl:for-each select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'KML', 'kml'),'kml')] | /rdf:RDF/rdf:Description/dct:references[contains(translate(.,'KMZ', 'kmz'),'kmz')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'KMZ', 'kmz'),'kmz')]">
			<field name="dataAccessType_ss">OGC KML</field>
			<field name="url.kml_ss">
				<xsl:value-of select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'KML', 'kml'),'kml')] | /rdf:RDF/rdf:Description/dct:references[contains(translate(.,'KMZ', 'kmz'),'kmz')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'KMZ', 'kmz'),'kmz')]"/>
			</field>
		</xsl:for-each>
		

		<xsl:for-each select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'SO', 'so'),'sos')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'SO', 'so'),'sos')]">
			<field name="dataAccessType_ss">OGC SOS</field>
			<field name="url.sos_ss">
				<xsl:value-of select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'SO', 'so'),'sos')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'SO', 'so'),'sos')]"/>
			</field>
		</xsl:for-each>
		<xsl:for-each select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'THREDS', 'threds'),'thredds')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'THREDS', 'threds'),'thredds')]">
			<field name="dataAccessType_ss">THREDDS</field>
			<field name="url.thredds_ss">
				<xsl:value-of select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'THREDS', 'threds'),'thredds')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'THREDS', 'threds'),'thredds')]"/>
			</field>
		</xsl:for-each>

    <xsl:for-each select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'.PDF', '.pdf'),'.pdf')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'.PDF', '.pdf'),'.pdf')]">
      <field name="dataAccessType_ss">PDF</field>
      <field name="url.pdf_ss">
        <xsl:value-of select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'.PDF', '.pdf'),'.pdf')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'.PDF', '.pdf'),'.pdf')]"/>
      </field>
    </xsl:for-each> 
    
    <xsl:for-each select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'.ZIP', '.zip'),'.zip')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'.ZIP', '.zip'),'.zip')]">
      <field name="dataAccessType_ss">ZIP</field>
      <field name="url.zip_ss">
        <xsl:value-of select="/rdf:RDF/rdf:Description/dct:references[contains(translate(.,'.ZIP', '.zip'),'.zip')] | /rdf:RDF/dcat:dataset/dcat:distribution/dcat:accessURL[contains(translate(.,'.ZIP', '.zip'),'.zip')]"/>
      </field>  
    </xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
