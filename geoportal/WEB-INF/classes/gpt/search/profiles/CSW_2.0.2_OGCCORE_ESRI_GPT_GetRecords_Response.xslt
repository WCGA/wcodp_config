<?xml version="1.0" encoding="UTF-8"?>
<!--
 See the NOTICE file distributed with
 this work for additional information regarding copyright ownership.
 Esri Inc. licenses this file to You under the Apache License, Version 2.0
 (the "License"); you may not use this file except in compliance with
 the License.  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
-->
<xsl:stylesheet version="1.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:dct="http://purl.org/dc/terms/" xmlns:ows="http://www.opengis.net/ows" xmlns:dc="http://purl.org/dc/elements/1.1/" exclude-result-prefixes="csw dc dct ows">
  <xsl:output method="xml" indent="no"  encoding="UTF-8" omit-xml-declaration="yes" />
  <xsl:template match="/">
 <xsl:choose>
  <xsl:when test="/ows:ExceptionReport">
        <exception>
          <exceptionText>
            <xsl:for-each select="/ows:ExceptionReport/ows:Exception">
              <xsl:value-of select="ows:ExceptionText"/>
            </xsl:for-each>
          </exceptionText>
        </exception>
   </xsl:when>
   <xsl:otherwise>
    <Records>
      <xsl:attribute name="maxRecords">
        <xsl:value-of select="/csw:GetRecordsResponse/csw:SearchResults/@numberOfRecordsMatched"/>
      </xsl:attribute>
      <xsl:for-each select="/csw:GetRecordsResponse/csw:SearchResults/csw:Record | /csw:GetRecordsResponse/csw:SearchResults/csw:BriefRecord | /csw:GetRecordByIdResponse/csw:Record | /csw:GetRecordsResponse/csw:SearchResults/csw:SummaryRecord">
        <Record>
          <ID>
            <xsl:choose>
                  <xsl:when test="string-length(normalize-space(dc:identifier[@scheme='urn:x-esri:specification:ServiceType:ArcIMS:Metadata:DocID']/text())) > 0">
                    <xsl:value-of select="normalize-space(dc:identifier[@scheme='urn:x-esri:specification:ServiceType:ArcIMS:Metadata:DocID'])"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="normalize-space(dc:identifier)"/>
                  </xsl:otherwise>
             </xsl:choose>
          </ID>
          <Title>
            <xsl:value-of select="dc:title"/>
          </Title>
          <Abstract>
            <xsl:value-of select="dct:abstract"/>
          </Abstract>
          <Type>
            <xsl:value-of select="dc:type"/>
          </Type>
          <LowerCorner>
          <xsl:value-of select="ows:WGS84BoundingBox/ows:LowerCorner"/>
          </LowerCorner>
          <UpperCorner>
          <xsl:value-of select="ows:WGS84BoundingBox/ows:UpperCorner"/>
          </UpperCorner>
          <MaxX>
            <xsl:value-of select="normalize-space(substring-before(ows:WGS84BoundingBox/ows:UpperCorner, ' '))"/>
          </MaxX>
          <MaxY>
            <xsl:value-of select="normalize-space(substring-after(ows:WGS84BoundingBox/ows:UpperCorner, ' '))"/>
          </MaxY>
          <MinX>
            <xsl:value-of select="normalize-space(substring-before(ows:WGS84BoundingBox/ows:LowerCorner, ' '))"/>
          </MinX>
          <MinY>
            <xsl:value-of select="normalize-space(substring-after(ows:WGS84BoundingBox/ows:LowerCorner, ' '))"/>
          </MinY>
          <ModifiedDate>
            <xsl:value-of select="./dct:modified"/>
          </ModifiedDate>
          <References>
            <xsl:for-each select="./dct:references">
              <xsl:value-of select="."/>
              <xsl:text>&#x2714;</xsl:text>
              <xsl:value-of select="@scheme"/>
              <xsl:text>&#x2715;</xsl:text>
            </xsl:for-each>
          </References>
          <Types>
            <xsl:for-each select="./dc:type">
              <xsl:value-of select="."/>
              <xsl:text>&#x2714;</xsl:text>
              <xsl:value-of select="@scheme"/>
              <xsl:text>&#x2715;</xsl:text>
            </xsl:for-each>
          </Types>
          <Links>
		  
		  
            <Link label="catalog.property.customLink.label.esri.csv-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.csv-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.wms-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.wms-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.zip-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.zip-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.ftp-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.ftp-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.html-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.html-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.img-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.img-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.kml-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.kml-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.kmz-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.kmz-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.pdf-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.pdf-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.shp-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.shp-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.tar-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.tar-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.tiff-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.tiff-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.txt-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.txt-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.wcs-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.wcs-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.wfs-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.wfs-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.xls-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.xls-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.xlsx-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.xlsx-2']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.esri_rest-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.esri_rest-2']"/>
            </Link>
			<Link label="catalog.property.customLink.label.esri.opendap_thredds-2">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.opendap_thredds-2']"/>
            </Link>

		  
		  
		  
		  
            <Link label="catalog.property.customLink.label.esri.csv">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.csv']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.wms">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.wms']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.zip">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.zip']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.ftp">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.ftp']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.html">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.html']"/>
            </Link>
			 <Link label="catalog.property.customLink.label.esri.asp">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.asp']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.img">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.img']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.kml">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.kml']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.kmz">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.kmz']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.pdf">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.pdf']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.shp">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.shp']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.tar">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.tar']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.tiff">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.tiff']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.txt">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.txt']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.wcs">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.wcs']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.wfs">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.wfs']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.xls">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.xls']"/>
            </Link>
            <Link label="catalog.property.customLink.label.esri.xlsx">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.xlsx']"/>
            </Link>
            
            <Link label="catalog.property.customLink.label.esri.esri.rest">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:ArcGIS:MapServer']"/>
            </Link>

            <Link label="catalog.property.customLink.label.esri.networkr_ftp">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Networkr_ftp']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.networkr_zip">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:networkr_zip']"/>
            </Link>

		    <Link label="catalog.property.customLink.label.esri.esri_rest">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.esri_rest']"/>
            </Link>
			
			<Link label="catalog.property.customLink.label.esri.opendap_thredds">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:Gmd:URL.opendap_thredds']"/>
            </Link>
			
			<Link label="catalog.property.customLink.label.esri.onlink_wms">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_wms']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_csv">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_csv']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_ftp">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_ftp']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_html">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_html']"/>
            </Link>
			
			<Link label="catalog.property.customLink.label.esri.onlink_asp">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_asp']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_img">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_img']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_kmz">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_kmz']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_pdf">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_pdf']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_kml">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_kml']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_shp">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_shp']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_tiff">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_tiff']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_txt">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_txt']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_xls">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_xls']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_xlsx">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_xlsx']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.onlink_zip">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_zip']"/>
            </Link>
            
            <Link label="catalog.property.customLink.label.esri.onlink_tar">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_tar']"/>
            </Link>

			<Link label="catalog.property.customLink.label.esri.esri_wms">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:esri_wms']"/>
            </Link>
            
            <Link label="catalog.property.customLink.label.esri.onlink_esri_rest">
              <xsl:value-of select="./dct:references[@scheme='urn:x-esri:specification:ServiceType:onlink_esri_rest']"/>
            </Link>
			

            
          </Links>
        </Record>
      </xsl:for-each>

    </Records>
   </xsl:otherwise>
  </xsl:choose>
 </xsl:template>
</xsl:stylesheet>
