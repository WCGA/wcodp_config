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
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="no" encoding="UTF-8" omit-xml-declaration="yes"/>
    <xsl:variable name="keyword" select="/GetRecords/KeyWord"/>
    <xsl:variable name="minX" select="/GetRecords/Envelope/MinX"/>
    <xsl:template match="/">
    
        <xsl:element name="csw:GetRecords" use-attribute-sets="GetRecordsAttributes" xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:ogc="http://www.opengis.net/ogc" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:gml="http://www.opengis.net/gml">
            <csw:Query  typeNames="gmd:MD_Metadata">
                <csw:ElementSetName>full</csw:ElementSetName>
                <csw:Constraint version="1.1.0">
                    <ogc:Filter xmlns="http://www.opengis.net/ogc">
<!--
                       <xsl:if test="normalize-space($keyword)!='' or normalize-space($minX) != ''" >
-->
                         <ogc:And>
                            <ogc:Or>
                              <!-- Oregon Coastal Atlas -->
                                <ogc:PropertyIsEqualTo>
                                    <!-- Fiber Optic Cables off the Oregon Coast, OFCC, 2012 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>d24d8a50-5cfd-40bb-9fd1-e8c189d23293</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- 25 Meter Depth Contour off Oregon, OSU ATSML, 2008 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>6ae33dbc-2ea1-4160-8f72-2a0ce4fb9f4b</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--25 Meter Interval Depth Contours off Oregon, OSU ATSML, 2008 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>cabc9d89-bea3-4be9-8a32-e87482ec4324</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Astoria All Fishing Sectors Fisheries Uses and Values Grid, Ecotrust, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>af79ecb7-4d55-4c42-86db-4dd9ac0acb85</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Brookings, Gold Beach All Fishing Sectors Fisheries Uses and Values Grid, Ecotrust, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>6e5d6e7b-12ff-49bb-8a82-8f008eea06fa</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Cape Falcon Final Marine Reserve, ODFW, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>abf72bbc-82a3-4fef-a1d6-7b52d5166581</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Cape Perpetua Final Marine Reserve,ODFW, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>ea97b7fb-3913-47f3-8ab8-bddf6bff9842</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Cascade Head Final Marine Reserve, ODFW, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>26211896-705a-4e6a-ad6c-eeae8887d4e4</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Dredge Material Disposal Site, ACOE, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>d13fc13b-8597-4fa9-af79-7b3a7cb0e0d3</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Fiber Optic Cables off the Oregon Coast, OFCC, 2012  -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>d24d8a50-5cfd-40bb-9fd1-e8c189d23293</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Florence All Fishing Sectors Fisheries Uses and Values Grid, Ecotrust, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>5c303ecc-cd97-43c4-ab4d-dd828ec2e0d3</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Garibaldi All Fishing Sectors Fisheries Uses and Values Grid, Ecotrust, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>59a0d964-33f2-401a-ae5e-6c6314f98dd5</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Historic Oregon Territorial Sea Bottom Sediment Samples from NOS Hydrographic Survey Smooth Sheets, 1868-1958 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>dab53257-bfb2-4c4c-acf1-6c444911ff16</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Lithology Map for the Oregon Territorial Sea, OSU ATSML, 2008 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>df15ed7d-cf1e-4220-a9fa-099c4478039c</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Newport All Sector Fisheries Uses Grid, Ecotrust, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>931fb31c-9757-451e-8a19-ff39f164037d</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- NNMREC Renewable Energy Ocean Test Site, OSU, 2012 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>c85543ae-d186-4137-b588-a7f3e8c01881</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- NRI Marine Research Areas, OCMP, 2012 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>3a0d6796-53a6-43db-bca4-210db614f118</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- NRI Marine Research Lines, OCMP, 2012-->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>c54700d5-3786-4bcc-b55f-21d6a23801ec</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- NRI Marine Research Points, OCMP, 2012 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>a1d763e9-7198-436c-9695-7c3c4398f934</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- NRI Marine Research Stations, OCMP, 2012 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>99bd4051-7e51-4841-8f55-c18cf21394d0</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- NRI Marine Research Transects, OCMP, 2012 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>abb7bb41-e69b-425b-a366-7cd82a738e47</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Ocean Observing Initiative Cables, OCMP, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>800fffe4-05fa-4c32-a222-1bae2e064de6</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Ocean Recreation Boating Activities, Last Trip Panel Responses as Points, Surfrider, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>ef5a8125-9345-4e51-8277-e25579680e21</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Ocean Recreation Human Powered Ocean Activities, Last Trip Panel Responses as Points, Surfrider, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>d01eba6f-4881-42a0-9b0f-b7d345b45ab2</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Ocean Recreation Shore Activities, Last Trip Panel Responses as Points, Surfrider, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>18c65f46-3e97-46ba-b50c-d9e2efcea466</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Ocean Recreation Wildlife Viewing, Last Trip Panel Responses as Points, Surfrider, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>41a2a055-d929-480e-8dc1-7a23fd0747de</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Offshore sand, gravel and shell deposits off Oregon, USGS, 1980 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>5fd367b4-a823-4c32-a617-92837d5d529e</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- OPT License Area Location for Single Wave Energy Buoy, FERC, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>4f056b71-8813-4f3f-a374-e497a7c1b548</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- OPT Wave Energy Lease Area 15MW, FERC, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>5bea1c2b-9ce2-4083-83a2-3cc3c5fb5c62</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Oregon Coastal Zone, OCMP, 2001 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>21229dbe-37c5-4545-a61b-c0d5896c521f</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Oregon Statutory Vegetation Line, 1967 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>96d4cd09-49b3-4038-bbea-23d82305ec3a</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Oregon Territorial Sea 3nm Line, OCMP, 200 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>43fa5330-2b6b-11e2-81c1-0800200c9a66</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Oregon Territorial Sea Polygon, OCMP, 2008 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>14bc2a25-92b9-4214-b915-4e01aec65163</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Redfish Rocks Final Marine Reserve, ODFW, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>e6fb9bd7-858c-403a-bba7-4b9ea70224c5</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Shoreline Classified by Geomorphology and Energy for Sensitivity Indexing, NOAA, 1996 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>66d741bc-dcea-43a6-b14b-8160c52f3971</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Otter Rock Final Marine Reserve, ODFW, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>248cee87-0393-4ba0-ac22-6205bcbf21e6</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Shoreside Infrastructure - Bait and Tackle Businesses, Ecotrust, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>0cb3e6ce-0973-42ee-b988-9661268aaebc</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Shoreside Infrastructure - Marinas, Ecotrust, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>e4665f84-d4fc-4db4-bfe6-4f7a189f87d6</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Shoreside Infrastructure - Marine Supply Businesses, Ecotrust, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>b53dd976-4b51-45d5-b0b5-1b7ebde67aa6</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Shoreside Infrastructure - Maritime Commerce Businesses, Ecotrust, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>0ebffcaf-b9ad-4c8b-8ab1-a8b0b414ba13</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Shoreside Infrastructure - Non-Consumptive Recreational Businesses, Ecotrust, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>fd659dcf-cef5-458f-b940-c77c92a81a29</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Shoreside Infrastructure - Oregon State Parks, Ecotrust, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>4420b510-3549-49c9-8e0e-2b6e15920802</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Shoreside Infrastructure - Ports, Ecotrust, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>660ef230-5489-49a7-84ea-c8291ad5b411</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Shoreside Infrastructure - Recreational Charter Businesses, Ecotrust, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>93333be5-9b76-44c3-be78-1ec5861011b7</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Shoreside Infrastructure - Research Institutions, Ecotrust, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>e094674e-e450-4ddb-aec3-4a06734efb87</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Shoreside Infrastructure - Seafood Processors and Distributors, Ecotrust, 2011 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>63ab376e-b5e9-406e-ae6f-e4511645d3c7</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- SOORC Commercial Fishing Fisheries Uses and Values Grid, Ecotrust, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>9bb6d77e-23b0-4d43-910e-9ed89b0c4fa2</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Submarine Cable Corridors, OFCC, 2012 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>fd14cc0f-75f5-4cc2-b696-0edde687bd46</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Territorial Sea Plan Part V Plan Map Index, DLCD, 2013 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>ade9a197-d414-4b33-bcbe-ca7490706a4d</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Tow Boat Lanes, WA Sea Grant, 2007 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>e274b8bc-7788-4631-ad32-74467087b16d</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!-- Coastal Vulnerability to Sea-Level Rise: A Preliminary Database for the U.S. Pacific Coast, USGS, 2001 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>1d9e9a7e-72fc-4ca5-bd24-1621a45a41a1</ogc:Literal>
                                </ogc:PropertyIsEqualTo>

             <!-- /Oregon Coastal Atlas -->
                           </ogc:Or> 
                         </ogc:And>
<!--
                       </xsl:if> 
-->
                    </ogc:Filter>
                </csw:Constraint>
            </csw:Query>
        </xsl:element>
    </xsl:template>

    <!-- key word search -->
    <xsl:template match="/GetRecords/KeyWord" xmlns:ogc="http://www.opengis.net/ogc">
        <xsl:if test="normalize-space(.)!=''">
            <ogc:PropertyIsLike wildCard="%" escapeChar="_" singleChar="\">
                <ogc:PropertyName>AnyText</ogc:PropertyName>
                <ogc:Literal>%<xsl:value-of select="."/>%</ogc:Literal>
            </ogc:PropertyIsLike>
        </xsl:if>
    </xsl:template>

    <!-- LiveDataOrMaps search -->
    <xsl:template match="/GetRecords/LiveDataMap" xmlns:ogc="http://www.opengis.net/ogc">
        <xsl:if test=".='True'">
            <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>Format</ogc:PropertyName>
                <ogc:Literal>liveData</ogc:Literal>
            </ogc:PropertyIsEqualTo>
        </xsl:if>
    </xsl:template>

    <!-- envelope search -->
    <xsl:template match="/GetRecords/Envelope" xmlns:ogc="http://www.opengis.net/ogc">
        <!-- generate BBOX query if minx, miny, maxx, maxy are provided -->
        <xsl:if test="./MinX and ./MinY and ./MaxX and ./MaxY">
            <ogc:BBOX xmlns:gml="http://www.opengis.net/gml">
                <ogc:PropertyName>iso:BoundingBox</ogc:PropertyName>
                <gml:Box>
                    <gml:coordinates>
                        <xsl:value-of select="MinX"/>,<xsl:value-of select="MinY"/>,<xsl:value-of select="MaxX"/>,<xsl:value-of select="MaxY"/>
                    </gml:coordinates>
                </gml:Box>
            </ogc:BBOX>
        </xsl:if>
    </xsl:template>

    <!--
    <xsl:attribute-set name="GetRecordsAttributes">
		<xsl:attribute name="version">2.0.1</xsl:attribute>
		<xsl:attribute name="service">CSW</xsl:attribute>
		<xsl:attribute name="resultType">RESULTS</xsl:attribute>
		<xsl:attribute name="startPosition"><xsl:value-of select="/GetRecords/StartPosition"/></xsl:attribute>
		<xsl:attribute name="maxRecords"><xsl:value-of select="/GetRecords/MaxRecords"/></xsl:attribute>
		<xsl:attribute name="outputSchema">csw:Record</xsl:attribute>
	</xsl:attribute-set>
    -->
    <xsl:attribute-set name="GetRecordsAttributes">
		<xsl:attribute name="outputSchema">http://www.isotc211.org/2005/gmd</xsl:attribute>
        <xsl:attribute name="version">2.0.2</xsl:attribute>
        <xsl:attribute name="service">CSW</xsl:attribute>
        <xsl:attribute name="resultType">results</xsl:attribute>
        <xsl:attribute name="startPosition">
            <xsl:value-of select="/GetRecords/StartPosition"/>
        </xsl:attribute>
        <xsl:attribute name="maxRecords">
            <xsl:value-of select="/GetRecords/MaxRecords"/>
        </xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>
