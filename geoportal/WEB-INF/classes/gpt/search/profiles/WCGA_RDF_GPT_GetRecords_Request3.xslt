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
   <!--
Globals
-->
 <xsl:param name="searchQueryDoHitsOnly" select="'false'"/>
 <xsl:variable name="numOfPrefetchRecords" select="500"/>
 <xsl:variable name="searchTextWildCardCharacter" select="'*'"/>
 <xsl:variable name="searchTextSingleCharacter" select="'%'"/>
 <xsl:variable name="searchTextEscapeCharacter" select="'\'"/> 
 <xsl:variable name="gmlBoxSrsName" select="'http://www.opengis.net/gml/srs/epsg.xml#4326'"/>
  <!--  **********************************************************************************************************************************************************
Template default 

****************************************************************************************************************************************************************-->
  <xsl:template match="/">
    <xsl:choose>
         
      <xsl:when test="count(/GetRecords) > 0">
       <!-- ******************************************************************************************************
       When the minimal xml criteria is given then this section is executed.  This will be given by the harvestor 
       Controlled by [Profiles.xml]/CSWProfiles/Profile/GetRecords/XSLTransformations@expectedGptXmlOutput="MINIMAL_LEGACY_CSWCLIENT"          
       *******************************************************************************************************-->
        <xsl:element name="csw:GetRecords" use-attribute-sets="GetRecordsAttributes" xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:ogc="http://www.opengis.net/ogc" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:gml="http://www.opengis.net/gml">
          <csw:Query typeNames="csw:Record">
            <csw:ElementSetName>full</csw:ElementSetName>
            <csw:Constraint version="1.0.0">
              <ogc:Filter xmlns="http://www.opengis.net/ogc">
                <ogc:And>
                  <!-- Key Word search -->
                  <xsl:apply-templates select="/GetRecords/KeyWord"/>
                  <!-- LiveDataOrMaps search -->
                  <xsl:apply-templates select="/GetRecords/LiveDataMap"/>
                  <!-- Envelope search, e.g. ogc:BBOX -->
                  <xsl:apply-templates select="/GetRecords/Envelope"/>
                  <!-- Date Range Search -->
                  <xsl:call-template name="tmpltDate"/>
                  <ogc:Or>

		    <!-- CALIFORNIA -->
                    <ogc:PropertyIsEqualTo>
                      <!-- CA MArine Refuges -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{3831745F-1A09-42EB-8CC2-BE1E34B2118A}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Marine Protected Areas California State -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{EF2D6FB7-0C82-4D78-A4D6-4CA57891DE4A}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- US Maritime Limits and Boundaries -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{89FFA1F0-F16E-44CD-8F49-E0EA8C3E3D00}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--CA State Park  Boundaries -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{95B66DB9-AA1B-49A5-96B6-F7229C864EC3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--Boundaries USBR Water Districts 2012 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B636E807-4673-48C4-9276-D508009DFF5D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--US State and Territorial Boundaries -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{FACFF73B-7534-4E91-8956-772DD097AEFF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--National Parks of california -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A7FA4A2E-0B78-4FE9-B2A5-8C9FFF6BF85B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--California State Parks -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{EDAB87D3-2C73-472D-9714-BFB5D3574100}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--CA Airports -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{2399406F-D01F-47F4-9534-99A2FE75ABAF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--Watershed Boundary -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7D3D2134-CAB7-4290-AA52-02168FF6D726}</ogc:Literal>
                    </ogc:PropertyIsEqualTo> 	
                    <ogc:PropertyIsEqualTo>
                      <!--Managed Area and Land Ownership -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{9B64422C-2D15-4318-B03B-B0A08393D7BF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Marine Ecoregions 2000 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{DBAB105A-F8FE-4240-AB1B-9517C9B993EB}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- CA Littoral Cells 2005 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8B7E304F-51DA-4200-AB8B-081BE1ECA177}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
		    <ogc:PropertyIsEqualTo>
		      <!-- Littoral Cells -->
		      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
		      <ogc:Literal>{1C1EF8DD-6DD0-4678-9923-750B6199960D}</ogc:Literal>
		    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Sediment placement Areas -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A87CB480-F1BB-44B5-A6F1-9BAC39257A7E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Sediment placement Areas 2012 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{159207BB-975B-4007-B9AB-B84C4201732A}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Harbor Borrow Sites -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>   
                      <ogc:Literal>{8E72BE54-40B6-4607-AF07-C260916D9198}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- BEach Errosion Concern Areas -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{FE456EDA-42A1-40BD-928F-D10F60FF69B3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- USACE Navigation Channels 2012 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{930A5BE1-6CDD-406C-ADCE-5934773F789D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- CA Counties with 3 mi offshore limit -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{41BEB4C0-A174-40E6-B389-D6571FE6386F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- CA Geologic Survey Map Index -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{806F0547-22C5-4243-9712-FBEFA2D7AAF6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- CA Bioregions -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{0DE9B557-D8DB-43CE-BA4E-E42651E58F63}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Benthic Habitat - GGNRA -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{780ADAF5-ADB9-4801-97C6-90CCDF2F3384}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Offshore Geology - GGNRA -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{3F16622D-CD70-4085-8C40-DDDC60D7919C}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Bird Species of Concern -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{04CD84FF-0740-4517-A303-2DC8193BC4C3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Oil Spill Incident Tracking [ds394] -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B65B8332-B6A3-4093-9DB2-BEEC5108D8F1}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- CA Fish Passage Assessment Database -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C4A94765-B1ED-475F-9E22-8998E2F5D2C2}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Fish Passage Assessment -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{651E5D25-BCF7-4993-BF7F-994141C6E7C9}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Kelp Canopy Map Data - 2009 - California Coast -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{4CD95BC4-4B4B-48D5-B73C-F003B20F0831}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Project_Marine/marine_eelgrass  -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{34C845E0-D059-4479-8818-A520574C87D6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Harbor Seals [ds106]  -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A27425E8-AE81-42E7-8AD9-52428094E2C8}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Winter Steelhead Range -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{25003CC7-0656-4452-A717-35DA54B032B6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Winter Steelhead Distribution -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C752D8C1-7A23-4E98-91C3-4DF64A697DA9}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                       <!-- California Aquatic Non-native Organism Database (CANOD) [ds503] -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{1CD7B74E-A730-43DC-A487-E46714B03687}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Steelhead and Chinook  Critical Habitat CA -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{2FD18A1D-3E9E-448D-AA72-34AFDD73500E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Project_Marine/marine_aquaculture -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C49EB03E-A916-4141-A1A5-E90CEFEB0D86}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Offshore Surficial Sediment -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7B82D65C-3A1B-473F-8F33-73C9DF3FB102}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Protected Spawning Areas - Fish and Game Code 1505 [ds647] -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{48E79F97-CE6B-441A-8653-8C5CAEAC9C5B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Protected Areas Database of the United States (PADUS) version 1.3 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{D053DD0A-D61C-47F7-BC08-2F24D4E8DA78}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Shipping Lanes -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{953E7DF6-987F-4613-8117-ADEDDBD4D21E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Chinook Abundance- Linear -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{6558CE76-E6F1-4D98-83CF-CEB941E9950F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Chinook Abundance - Point -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{FC51DA9E-539F-4535-80AC-6A08B8F337D4}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Non Salmonid Abundance -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{024397CB-856E-4842-85B3-D421FDC427FA}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Steelhead Abundance -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{BE16AD28-4EBD-478C-8460-05040A2A2F2E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coho Range -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{CA90ED00-DD04-40E7-8DA1-ACF0B682FD5B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Steelhead Abundance - Line -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A83B6318-9844-4CC7-822A-CDB57998820B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Offshore Substrate-North -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C78BA32B-DC74-4F90-92CA-9C9E2C28EBE6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Western Snowy Plover  Critical Habitat -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{AE9CEE8B-8A8F-4466-85E9-FE40BDF63763}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Shoreline Change - Central -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{9818E7F3-E2C9-4F6B-869E-C5A4DFB0EEB2}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Shoreline Change - North -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{DB41EF1D-947B-48CD-86AD-331DC2E8CD5B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Shoreline Change - South -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{64423681-2862-41F1-9AD0-DC4B17C8A74D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- SF Pinniped Sites -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{5E056CA6-B96E-423C-B2B7-10F451FE0549}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Erosion Armoring 2005 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{239AA309-837B-44D2-B811-3F19E4B14416}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Ports and Facilities -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A797BEBF-206B-49D7-BFCD-392E3A6BF87E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Conditions -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8A3261A5-FB06-470B-A2C7-1BBEA93F5D19}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Bluff Errosion -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{80744CF1-E44B-4462-A5BA-84F21A9B972C}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- California Coastal Zone Map -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{52947CEF-D7A6-4075-84A7-09EB433484D7}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Structures and barriers -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{087F5A1F-F658-43ED-B5DB-9FB3A8B92CFA}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- CSMW/Armoring -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{686DA9E0-1E5E-4B87-B496-461708595F4F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Sand Deposits -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A3A61AAC-7983-41A9-9A28-77A52FDE9E45}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                     <ogc:PropertyIsEqualTo>
                      <!-- Coastal Sand Deposits 2006 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{4019F903-3CC8-47DC-801C-3893D24B8B0E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Potential Coastal & Upland Sediment Sources -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{9F5AB023-3180-4959-B078-9F2079B424BE}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- CRSMP Potential Coastal and Upland Borrow Sites 2012 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{AFF22EF6-49D8-4867-B6C6-CD80020AB36B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- PWA Sea Level Rise -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{FA1AB0D1-98A5-408E-A430-503B0139DDCA}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Sea Level Rise -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{E8AB48A6-2C9E-43F5-B762-17F833318589}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Tsunami Risk CA -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{AC619DE4-2AF0-46DC-8839-D33661697FC0}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Offshore Substrate types -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{64A4D0D0-926C-47B6-827F-FEC4178C4F9F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- SF Bay Eelgrass -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8206404B-D152-45E6-9874-BDF0A37CA3F5}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
		    <ogc:PropertyIsEqualTo>
		      <!--Areas of Special Biological Significance-->
		      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
		      <ogc:Literal>{E30A8888-E8C5-4557-807B-4FE85F85A71D}</ogc:Literal>
		    </ogc:PropertyIsEqualTo> 
                    <ogc:PropertyIsEqualTo>
		      <!-- Impaired Water Body -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{11FD2B65-AB49-4763-A0AC-CAE269E5BC0F}</ogc:Literal>
		    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- BCDC Major Permits-->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8217CC72-8DAE-4CB8-BC58-C68FA1176FAA}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>


              <!-- /CALIFORNIA -->
  

                    <!-- Oregon Spatial Data Library -->
                    <ogc:PropertyIsEqualTo>
                      <!-- Oregon Wetlands -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{E89EEF3F-ABD7-479E-BD10-A2036B15C64C}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Oregon Hydrography Water Courses- PNW Hydrography Framework -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{255311EF-9E1E-4E4C-8FF2-FD8EF7B2D527}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Oregon Hydrological Units - 1st - 7th Field -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{9DB6F7F2-945D-4FA8-8FAE-04634736C421}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- State Parks -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7454C1CB-51D8-40CA-ABF0-318E4FF5AAB9}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Framework/Imagery_Mosaic2009 (WMS) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B797B409-9E0F-4968-816D-2264B6A04DC6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Framework/Imagery_Mosaic2005 (WMS) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{06C5B4F0-F12A-4B8C-8AE6-E7FF04699062}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Stellar Sea Lion Critical Habitat -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{6E6FE410-F22B-47C5-B58F-64A477F5B096}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Sandy Shoreine -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8BBB22D9-4844-4854-9E13-918DE0191B25}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                       <!-- Rocky  Shoreine -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{0BDEB489-7CDA-4A57-8BA2-DD79C751451D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Kelp Canopy -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8EBAF6AB-8A41-46C3-AAB6-EFF3D250B334}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Groundfish Areas of PArticular Concern -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{689DDC4E-7B27-4797-97B0-8086130E1B3B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Groundfish Areas of PArticular Concern Areas of Interest -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8E81A400-E579-4688-8832-4C260406F1BC}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!--Boundary for Pacific Northwest Ecoregion -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{4AD4A4D6-D8E2-4E6C-8483-39722B8BCD2E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Western Snowy Plover Critical Habitat -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{F4914131-942B-4F61-8690-2853258C6BF2}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>                                                                                                                                                                      <!--Pinniped Haulout -->                     
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{967927EE-32BA-4D92-BEF3-430474C2077D}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Marine Gardens -->                      
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{BD389D13-EB5C-4D36-8121-386BBD944F89}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>   
                    <!--Leatherback Turtle Critical Habitat -->  
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{126C36CD-35E1-461B-8D97-CD5D8C1CA3ED}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo> 
                    <!--Oregon Offshore Islands -->                      
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{2354F3F1-CED8-4566-96A2-EF4485EB11B6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>  
                    <!--Green Sturgeon Critical Habitat -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{B1924A9D-313A-42CC-A051-74DF91CE43A8}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo> 
                    <!--Green Sturgeon Critical Habitat - Streams -->  
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{6810E622-F4E3-4DCF-AF95-676A137CD264}</ogc:Literal>
                   </ogc:PropertyIsEqualTo>
                   <ogc:PropertyIsEqualTo> 
                   <!--Green Sturgeon Critical Habitat - marine -->  
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{6F3B5442-4BDC-4D5C-A384-F315A1513633}</ogc:Literal>
                   </ogc:PropertyIsEqualTo>
                   <ogc:PropertyIsEqualTo>
                   <!--Green Sturgeon Critical Habitat - head of tide -->   
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{798056E5-55DC-4168-9C11-D680C656612E}</ogc:Literal>
                   </ogc:PropertyIsEqualTo>
                   <ogc:PropertyIsEqualTo>
                   <!--Green Sturgeon Critical Habitat - estuaries -->    
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{03CB0A76-58B0-4F30-B288-1ACAF1043B9E}</ogc:Literal>
                   </ogc:PropertyIsEqualTo>
                   <ogc:PropertyIsEqualTo>
                   <!--Gray whale migration corridors -->  
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{337BFCF2-EFB6-4835-A62A-0C26F2318BCE}</ogc:Literal> 
                   </ogc:PropertyIsEqualTo>
                   <ogc:PropertyIsEqualTo>
                   <!--Interannual Demersal Fish Variability -->   
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{80AB38B4-3FE9-4FA1-9781-7FCEA87A15FA}</ogc:Literal>
                   </ogc:PropertyIsEqualTo>
                   <ogc:PropertyIsEqualTo>
                   <!-- EFH Conservation Areas --> 
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{1A1CCF93-7FDF-4B0A-9194-E5C32B654893}</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>  
                  <!-- Esturine Influence -->     
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{6B691ED4-19D6-415C-A431-D0297A6BE77F}</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>   
                  <!--Wave Energy PReliminary Permit -->  
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{317307A0-9443-4BBF-801A-582DEF42D9A6}</ogc:Literal>
                  </ogc:PropertyIsEqualTo>
                  <ogc:PropertyIsEqualTo>
                  <!--Tsunami Evaculation Routes 2013 -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{2A536E89-E9EA-4B20-AC3A-C424A44C92D2}</ogc:Literal>
                  </ogc:PropertyIsEqualTo>


                    <!-- /Oregon Spatial Data Library -->

                    <!-- Washington Geoportal -->
                    <ogc:PropertyIsEqualTo>
                      <!-- Forest Practices Wetlands -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B19D5945-ED94-4268-B202-A63CFE397982}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Coastal Washington Land Cover 2006 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7A3BCA83-00EA-451D-BB2C-9E0521E875D5}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Rivers and Streams of Washington State 1:24,000 - str24 -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{419786C1-D481-45A8-A66B-F952B1DB6934}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington State Levee Inventory  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{09317F9A-0156-4B4C-965A-D5836044D083}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
		    <ogc:PropertyIsEqualTo>
                      <!-- Washington State Levee Inventory  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{00334042-8F29-4B5A-A602-C93B25E1F9A9}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington State Levee Inventory  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{1CFE3397-2827-410E-BFD3-91ECA6A30CE6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington Shoreline Arc  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{56004969-19E4-4540-B0AE-E230159FA9D5}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington Coastal Land Cover  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7A127EAD-6907-465B-B19A-AF2700871B51}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                     <ogc:PropertyIsEqualTo>
                      <!-- Washington Estuaries  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{1828B630-EFD5-4A7F-9893-AB7FF5DB6AA6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington Littoral Drift  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{FE0C794A-4B9A-46E8-A352-092DC4CF1515}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington River  (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{419786C1-D481-45A8-A66B-F952B1DB6934}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington River  temp (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{789E2C0C-F9F9-4520-875F-30C1C80C89C3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington watershed (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{5C1CD50C-9BE1-49B8-BD9E-7E4213C81E17}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington Anadromous Fish Critical Habitat (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B2820417-B331-4012-8B9D-497D81784743}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Washington Pacific Herring Holding Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A88967C5-A13D-4B2C-A8DC-6F296C4E5E11}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                       <!-- Washington Pacific Herring Spawning Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C6920E4F-FCF6-4CF9-B759-7492DE0C0CEA}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Pacific SandLance Holding  Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{744135E5-3BA1-477C-852A-9CFE2966242F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Pacific SandLance Spawning  Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{CD53B7B1-8233-4C6B-8D00-D419EDED71E9}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Rock Sole Spawning  Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{26831785-DDD4-490B-8F18-47EE5C6857D1}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Surf Smelt Spawning  Areas (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{881B2DEE-BD3A-47CE-B33B-3DC639231FA5}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Oyster Beds (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{358C3206-4455-4F2E-A211-60A0F9916957}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Geoduck Locations (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{BED99236-D51D-443A-AFD6-6164D94A896C}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Sea Urchins (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{D5A23478-55D6-4FF8-B074-0374C6B1C648}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Abalone (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{9107C899-8BEB-45F0-AFB0-87163BFDFA78}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Marine Mammal Haulouts (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{856F5F1A-3EE4-4D7F-9134-55B03F2AB2F3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington City County Boundaries (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{1A1A2433-D5F6-4DC0-A749-40127719BFB2}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Tribal Reservations (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{2990B35D-7EFF-4B07-A4E8-6867E3E06659}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Park Districts (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{187CE5A6-716C-4912-A7A0-ED0C30B023C0}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Military Zones (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C5CBDA5B-1586-4A38-B4BD-7C4CBEF4D4EB}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Aquaculture Parcels (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{E7A40C02-48D4-4676-9777-CCE2BFC41A1B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Aquaculture Parcels (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{8A236ABD-AD5F-482E-96D0-33F58741B029}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                     <ogc:PropertyIsEqualTo>
                    <!-- Washington WDFW Lands (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{6C1A1432-179A-46EE-A296-8319135E9417}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Marine farms (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{F75C75A0-DFFC-4B80-9E0D-D6901D2A8762}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Spill Origins (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{DA51DF18-CB4E-4AB9-9B5B-E389E1148D3E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Dams (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{7898CD0A-B435-41BE-8B1E-A8D8FBB60825}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Public Utility Districts (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B8125FE1-5C8F-4F38-AE0D-9AC8CD81C958}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Impervious Structures (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{ADCC280D-8D7E-4985-9F3E-945F91EE8653}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Port Locations (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{85207800-4B2C-4315-AA90-0B1A58D6E51A}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Water Quality Monitoring Locations (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{38B7F747-3AD2-4ACD-B670-EA7F46799349}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Airports (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{9A4D3273-1A46-47AB-84A8-900498C4CB90}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Ferry Terminals (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{14B5E343-33DF-4A6A-8346-02A2344740BF}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Recreational Activities (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{15E330B1-DDEC-4B44-B26A-2F2ED69506E6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Public Access (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{21C5EA2B-14CE-4617-AAB5-A25DD218DB65}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Washington Public Utility District Names (Map service) -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{B8125FE1-5C8F-4F38-AE0D-9AC8CD81C958}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <!-- /Washington Geoportal -->
                    
                    <!-- National Ocean Service -->
                    
                    <ogc:PropertyIsEqualTo>
                      <!-- Shipping Lanes in US Waters -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{CABC254B-2FE4-4827-9C30-37914046DC29}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Restricted Areas in US Waters  -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{44BFD78-095F-4A05-9CDF-C941EB9A5E15}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Precautionary Areas in US Waters  -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{75300CD3-E3E6-4C54-A9B6-E48571F1A426}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- Disposal Areas in US Waters  -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{C92ACF76-B21F-40CF-943B-B0921778E79B}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- NOAA ENC  Direct to GIS -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{19CCB574-9923-4C0E-AD79-FCA672273433}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!-- ESI Threatned and Endagered Species -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{5885C707-2CBC-43E1-8A76-322DD7022C5F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--2013  Interagency Elevation Inventory -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{0DF6895A-87E3-42F0-8C67-76A9C8D6A33E}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--Anchorage Ares in US Waters -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{A6635717-F557-47D2-BC7F-A9C38A955F17}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                      <!--NOAA Seamless Raster Nautical Charts -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{4C0750F4-FC5E-4531-BDC3-71164AB72CEE}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>

                    <!--/ National Ocean Service -->

                    <!--National Geophysical Data Center -->

                    <ogc:PropertyIsEqualTo>
                    <!-- US Coastal  Relief Model for North Pacific -->
                      <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                      <ogc:Literal>{1651645C-B64A-4C54-AB39-A383D2CC29B1}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- HYCOM Global Ocean Model  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{A4DFF1CD-4FA1-4BA2-A0BD-364A638A25C0}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                     <!-- ROMS OR Coast  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{144F2437-30CA-4FBA-BC80-DF037C4730DE}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Chlorophyl A Modis Monthly  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{FAB60F64-B8C1-4AF6-997B-7B62DBFD6AF3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Chlorophyl A Modis 8 day  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{CE80E45C-3C94-4119-B15A-6BE299C2D99F}</ogc:Literal>
                     </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Chlorophyl A Modis 1 day  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{835424B6-2F0A-4F0E-93C7-D4E6AA3EACF7}</ogc:Literal>
                       </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Real Time Surface Currents 500m  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{DB08CE7B-2180-46B5-927E-63EB78ECD63A}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Real Time Surface Currents 6km -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{2284A114-0A0D-4733-A8CD-4204AA6ABE95}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Real Time Surface Currents 2km   -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{A8257658-A7BE-432B-A5BD-82BA13791E63}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!--Real Time Surface Currents 1km   -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{BEC0EDC6-23A0-4A1F-B5DC-C8953DFC1074}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>

                    <!-- /National Geophysical Data Center -->

                    <!-- OSU Active tectonics Lab -->
                    <ogc:PropertyIsEqualTo>
                    <!-- Physiographic -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{738A0937-3552-4C13-BF70-63F2C3679971}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Lithology -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{34984053-4171-4AB8-AC06-94416249BF56}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Induration -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{A3299765-3FE0-4421-8FDD-D2ABE8D1E3C6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Predicted Rock Outcrop -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{BCC6022C-6AF1-4FBF-863B-5670BB33783F}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Seabed Induration -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{A3299765-3FE0-4421-8FDD-D2ABE8D1E3C6}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Seabed Induration-CA  -->
                       <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                       <ogc:Literal>{82731A2C-5A22-4E87-8077-0B37DC5B2806}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>

                    <!--/ OSU Active tectonics Lab -->
                  
                    <!-- EPA Data Exchange -->
                    
                    <!-- Region 9 NPDES Outfalls 2012-->
                    <ogc:PropertyIsEqualTo>   
                        <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                        <ogc:Literal>{C3FAC902-FE2C-4488-853D-61B80FCBFBA8}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <ogc:PropertyIsEqualTo>
                    <!-- Region 9 NPDES Facilities 2012-->
                         <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                         <ogc:Literal>{72A3824E-72DF-416D-9FA7-B28ED18A10F9}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <!-- Region 9 Coal Fired Power Plants -->
                    <ogc:PropertyIsEqualTo>
                          <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                          <ogc:Literal>{80083F7E-F83B-46D9-A6B6-495122E409F3}</ogc:Literal>
                    </ogc:PropertyIsEqualTo>
                    <!-- Region 9 Superfund Sites -->
                    <ogc:PropertyIsEqualTo>
                           <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                           <ogc:Literal>{34A20A42-2191-4AEB-9215-2B291C1FA523}</ogc:Literal>
                    </ogc:PropertyIsEqualTo> 
                    <!-- Region 10 Superfund Sites -->
                     <ogc:PropertyIsEqualTo>
                            <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                            <ogc:Literal>{96EAA4CC-F9FB-4F5E-9ECF-17B2EC0AB04B}</ogc:Literal>
                     </ogc:PropertyIsEqualTo>
                     <!-- Region 10 Superfund Sites -->
                     <ogc:PropertyIsEqualTo>
                             <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                             <ogc:Literal>{4F627B7A-0727-4519-B988-885D837A2C1B}</ogc:Literal>
                      </ogc:PropertyIsEqualTo>
                        <!-- EPA Land Cover -->
                     <ogc:PropertyIsEqualTo>
                             <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                             <ogc:Literal>{235B12CF-9C83-47B8-B0BF-9AD89710F5C5}</ogc:Literal>
                     </ogc:PropertyIsEqualTo>

                    <!--/ EPA Data Exchange -->

                  </ogc:Or>
                </ogc:And>
              </ogc:Filter>
            </csw:Constraint>
          </csw:Query>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
       <!-- ******************************************************************************************************
       When the full xml criteria is given then this section is executed.  This will be given by the geoportal
       Controlled by [Profiles.xml]/CSWProfiles/Profile/GetRecords/XSLTransformations@expectedGptXmlOutput="FULL_NATIVE_GPTXML"          
       *******************************************************************************************************-->
        <xsl:element name="csw:GetRecords" use-attribute-sets="GetRecordsAttributes" xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:ogc="http://www.opengis.net/ogc" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:gml="http://www.opengis.net/gml">
          <csw:Query typeNames="csw:Record">
            <csw:ElementSetName>full</csw:ElementSetName>
            <csw:Constraint version="1.0.0">
              <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                <ogc:And>
                  <!-- Time Based Search -->
                  <xsl:call-template name="filterTemporal"/>
                  <!-- Key Word search -->
                  <xsl:call-template name="filterKeyword"/>
                  <!-- Content type search -->
                  <xsl:call-template name="filterContentTypes"/>
                  <!--  type search -->
                  <xsl:call-template name="filterThemeTypes"/>
                  <!-- Envelope search, e.g. ogc:BBOX -->
                  <xsl:call-template name="filterSpatial"/>
                </ogc:And>
              </ogc:Filter>
            </csw:Constraint>
            <xsl:call-template name="filterSort"/>
          </csw:Query>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- key word search -->
  <xsl:template match="/GetRecords/KeyWord" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:if test="normalize-space(.)!=''">
      <ogc:PropertyIsLike wildCard="" escape="" singleChar="">
        <ogc:PropertyName>AnyText</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="."/>
        </ogc:Literal>
      </ogc:PropertyIsLike>
    </xsl:if>
  </xsl:template>
  <!-- LiveDataOrMaps search -->
  <xsl:template match="/GetRecords/LiveDataMap" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:if test="translate(normalize-space(./text()),'true', 'TRUE') ='TRUE'">
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>dc:type</ogc:PropertyName>
        <ogc:Literal>liveData</ogc:Literal>
      </ogc:PropertyIsEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- envelope search -->
  <xsl:template match="/GetRecords/Envelope" xmlns:ogc="http://www.opengis.net/ogc">
    <!-- generate BBOX query if minx, miny, maxx, maxy are provided -->
    <xsl:if test="./MinX and ./MinY and ./MaxX and ./MaxY">
      <ogc:BBOX xmlns:gml="http://www.opengis.net/gml">
        <ogc:PropertyName>Geometry</ogc:PropertyName>
        <gml:Box srsName="http://www.opengis.net/gml/srs/epsg.xml#4326">
          <gml:coordinates>
            <xsl:value-of select="MinX"/>,<xsl:value-of select="MinY"/>,<xsl:value-of select="MaxX"/>,<xsl:value-of select="MaxY"/>
          </gml:coordinates>
        </gml:Box>
      </ogc:BBOX>
    </xsl:if>
  </xsl:template>
  <xsl:template name="tmpltDate" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:if test="string-length(normalize-space(/GetRecords/FromDate/text())) &gt; 0">
      <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="normalize-space(/GetRecords/FromDate/text())"/>
        </ogc:Literal>
      </ogc:PropertyIsGreaterThanOrEqualTo>
    </xsl:if>
    <xsl:if test="string-length(normalize-space(/GetRecords/ToDate/text())) &gt; 0">
      <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="normalize-space(/GetRecords/ToDate/text())"/>
        </ogc:Literal>
      </ogc:PropertyIsLessThanOrEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Utility Templates
 -->
  <!--  *******************************************************************************************************************************************************
Template   Tokenizes
WARNING: needs to be edited if you intend to use the templateName to call your template
@param sentence  The sentence to be tokenized
@param If you leave this out, the word will be printed instead. If you put in a new 
templatename, edit the function to add it in the if statement
@param delimeter Delimeter to be used in the sentence.  Default is space character.
     ************************************************************************************************************************************************************* -->
  <xsl:template name="tokenize">
    <xsl:param name="sentence"/>
    <xsl:param name="templateName"/>
    <xsl:param name="delimeter" select="' '"/>
    <xsl:param name="word"/>
    <xsl:param name="info"/>
    <!--
         If word more than 0 and template then call template otherwise print word -->
    <xsl:choose>
      <xsl:when test="string-length($word) > 0 and string-length(normalize-space($templateName)) > 0">
        <xsl:choose>
          <!-- For this function,important to modify this section if you are using this function so that your template gets called -->
          <xsl:when test="$templateName = 'filterKeywordLikeAnytext'">
            <xsl:call-template name="filterKeywordLikeAnytext">
              <xsl:with-param name="word" select="$word"/>
              <xsl:with-param name="wildcard" select="$info"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName= 'filterThemeType' ">
            <xsl:call-template name="filterThemeType">
              <xsl:with-param name="theme" select="$word"/>
            </xsl:call-template>
          </xsl:when>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="string-length($word) > 0">
        <xsl:value-of select="$word"/>
      </xsl:when>
    </xsl:choose>
    <!-- 
        If delimeter detected, curve sentence before and sentence after delimeter. -->
    <xsl:choose>
      <xsl:when test="contains($sentence, $delimeter)">
        <xsl:call-template name="tokenize">
          <xsl:with-param name="word" select="substring-before( $sentence,$delimeter)"/>
          <xsl:with-param name="sentence" select="substring-after( $sentence,$delimeter)"/>
          <xsl:with-param name="templateName" select="$templateName"/>
          <xsl:with-param name="delimeter" select="$delimeter"/>
          <xsl:with-param name="info" select="$info"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="string-length($sentence) > 0">
        <xsl:call-template name="tokenize">
          <xsl:with-param name="word" select="$sentence"/>
          <xsl:with-param name="templateName" select="$templateName"/>
          <xsl:with-param name="info" select="$info"/>
        </xsl:call-template>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: ContentType 
 -->
  <xsl:template name="filterContentTypes" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootContentType" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterContentTypes']"/>
    <xsl:variable name="contentType" select="normalize-space($rootContentType/param[@name='selectedContentType']/@value)"/>
    <xsl:if test="string-length(normalize-space($contentType)) > 0">
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>Format</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$contentType"/>
        </ogc:Literal>
      </ogc:PropertyIsEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: ThemeType 
 -->
  <xsl:template name="filterThemeType" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:param name="theme"/>
    <xsl:param name="lTheme" select="normalize-space($theme)"/>
    <xsl:if test="string-length($lTheme) > 0">
      <ogc:PropertyIsEqualTo>
        <ogc:PropertyName>Subject</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$lTheme"/>
        </ogc:Literal>
      </ogc:PropertyIsEqualTo>
    </xsl:if>
  </xsl:template>
  <!--
Entry point for theme types
-->
  <xsl:template name="filterThemeTypes" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootThemeTypes" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterThemeTypes']"/>
    <xsl:variable name="themeTypes" select="$rootThemeTypes/param[@name='theme']/@value"/>
    <xsl:if test="string-length($themeTypes) > 0">
      <ogc:Or>
        <xsl:call-template name="tokenize">
          <xsl:with-param name="sentence" select="$themeTypes"/>
          <xsl:with-param name="templateName" select="'filterThemeType'"/>
          <xsl:with-param name="delimeter" select="'|'"/>
        </xsl:call-template>
      </ogc:Or>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: keyword Filter templates
 -->
  <!-- *******************************************************************************************************************************************************
Template  filterKeywordLikeAnytext
Prints the text to be 
@param word  Word to be searched for
 ************************************************************************************************************************************************************* -->
  <xsl:template name="filterKeywordLikeAnytext" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:param name="word"/>
    <xsl:param name="wildcard"/>
    <xsl:if test="string-length(normalize-space($word)) > 0">
      <ogc:PropertyIsLike>
        <xsl:attribute name="wildCard"><xsl:value-of select="$searchTextWildCardCharacter"/></xsl:attribute>
        <xsl:attribute name="escape"><xsl:value-of select="$searchTextEscapeCharacter"/></xsl:attribute>
        <xsl:attribute name="singleChar"><xsl:value-of select="$searchTextSingleCharacter"/></xsl:attribute>
        <ogc:PropertyName>AnyText</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$wildcard"/>
          <xsl:value-of select="normalize-space($word)"/>
          <xsl:value-of select="$wildcard"/>
        </ogc:Literal>
      </ogc:PropertyIsLike>
    </xsl:if>
  </xsl:template>
  <!-- *******************************************************************************************************************************************************
Template  filterKeyword
@param word  Word to be searched for
 ************************************************************************************************************************************************************* -->
  <xsl:template name="filterKeyword" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootFilterKeyword" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterKeyword']"/>
    <xsl:variable name="keyword" select="normalize-space($rootFilterKeyword/param[@name='SearchText']/@value)"/>
    <xsl:variable name="keywordOperation" select="normalize-space($rootFilterKeyword/param[@name='SearchTextOption']/@value)"/>
    <xsl:choose>
      <xsl:when test="not(contains($keyword, ' ')) or translate($keywordOperation, 'exact', 'EXACT') = 'EXACT'">
        <xsl:call-template name="filterKeywordLikeAnytext">
          <xsl:with-param name="word" select="$keyword"/>
          <!-- xsl:with-param name="wildcard" select="$searchTextWildCardCharacter" -->
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="translate($keywordOperation, 'any', 'ANY') = 'ANY'">
        <ogc:Or>
          <xsl:call-template name="tokenize">
            <xsl:with-param name="sentence" select="$keyword"/>
            <xsl:with-param name="templateName" select="'filterKeywordLikeAnytext'"/>
            <!-- ><xsl:with-param name="info" select="$searchTextWildCardCharacter"/> -->
          </xsl:call-template>
        </ogc:Or>
      </xsl:when>
      <xsl:when test="translate($keywordOperation, 'all', 'ALL') = 'ALL'">
        <ogc:And>
          <xsl:call-template name="tokenize">
            <xsl:with-param name="sentence" select="$keyword"/>
            <xsl:with-param name="templateName" select="'filterKeywordLikeAnytext'"/>
          </xsl:call-template>
        </ogc:And>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <!-- envelope search -->
  <!-- ##########################################################################################################################
Filter: Spatial Filter templates
 -->
  <!-- ***********************************************************************************************************************************************************************************
Template filterSpatial
Outputs the within or interesects of the bounding box
@gptSpatialValues root of spatial nodes
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterSpatial" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="gptSpatialValues" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterSpatial']"/>
    <xsl:if test="$gptSpatialValues/param[@name='selectedBoundOption']/@value = 'useGeogExtent'">
      <ogc:BBOX>
        <xsl:call-template name="filterSpatialBBox">
          <xsl:with-param name="gptSpatialValues" select="$gptSpatialValues"/>
        </xsl:call-template>
      </ogc:BBOX>
    </xsl:if>
    <xsl:if test="$gptSpatialValues/param[@name='selectedBoundOption']/@value = 'dataWithinExtent'">
      <ogc:Within>
        <xsl:call-template name="filterSpatialBBox">
          <xsl:with-param name="gptSpatialValues" select="$gptSpatialValues"/>
        </xsl:call-template>
      </ogc:Within>
    </xsl:if>
  </xsl:template>
  <!-- ***********************************************************************************************************************************************************************************
Template filterSpatialBBox 
Outputs the bounding box
@gptSpatialValues root of spatial nodes
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterSpatialBBox" xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
    <xsl:param name="gptSpatialValues"/>
    <ogc:PropertyName>Geometry</ogc:PropertyName>
    <gml:Box>
      <xsl:attribute name="srsName"><xsl:value-of select="$gmlBoxSrsName"/></xsl:attribute>
      <!-- <gml:coordinates>-180,-90,-100,90</gml:coordinates> -->
      <!--  TODO Test &  get values from xpath -->
      <gml:coordinates>
        <xsl:value-of select="$gptSpatialValues/param[@name='minX']/@value"/>,<xsl:value-of select="$gptSpatialValues/param[@name='minY']/@value"/>,<xsl:value-of select="$gptSpatialValues/param[@name='maxX']/@value"/>,<xsl:value-of select="$gptSpatialValues/param[@name='maxY']/@value"/>
      </gml:coordinates>
    </gml:Box>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: Temporal Filter templates
 -->
  <!-- ***********************************************************************************************************************************************************************************
Template filterTemporal
Outputs CSW time parameters
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterTemporal" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="rootTemporal" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterTemporal']"/>
    <xsl:variable name="modifiedFrom" select="normalize-space($rootTemporal/param[@name='modifiedDateFrom']/@value)"/>
    <xsl:variable name="modifiedTo" select="normalize-space($rootTemporal/param[@name='modifiedDateTo']/@value)"/>
    <xsl:variable name="temporalOption" select="normalize-space($rootTemporal/param[@name='selectedModifiedTime']/@value)"/>
    <xsl:if test="string-length($modifiedFrom) > 0">
      <ogc:PropertyIsGreaterThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$modifiedFrom"/>
        </ogc:Literal>
      </ogc:PropertyIsGreaterThanOrEqualTo>
    </xsl:if>
    <xsl:if test="string-length($modifiedTo) > 0">
      <ogc:PropertyIsLessThanOrEqualTo>
        <ogc:PropertyName>Modified</ogc:PropertyName>
        <ogc:Literal>
          <xsl:value-of select="$modifiedTo"/>
        </ogc:Literal>
      </ogc:PropertyIsLessThanOrEqualTo>
    </xsl:if>
  </xsl:template>
  <!-- ##########################################################################################################################
Filter: Sort Filter templates
 -->
  <!-- ***********************************************************************************************************************************************************************************
Template filterTemporal
Outputs CSW sorting parameters
************************************************************************************************************************************************************************************** -->
  <xsl:template name="filterSort" xmlns:ogc="http://www.opengis.net/ogc">
    <xsl:variable name="root" select="//filter[@class='com.esri.gpt.catalog.search.SearchFilterSort']"/>
    <xsl:variable name="sortValue" select="normalize-space($root/param[@name='selectedSort']/@value)"/>
    <xsl:if test="string-length($sortValue) > 0">
      <xsl:if test="$sortValue != 'relevance'">
        <ogc:SortBy>
          <ogc:SortProperty>
            <ogc:PropertyName>
              <xsl:choose>
                <xsl:when test="$sortValue = 'areaAscending' or $sortValue = 'areaDescending' ">
                  <xsl:text>envelope</xsl:text>
                </xsl:when>
                <xsl:when test="$sortValue = 'dateAscending' or $sortValue = 'dateDescending' ">
                  <xsl:text>Modified</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$sortValue"/>
                </xsl:otherwise>
              </xsl:choose>
            </ogc:PropertyName>
            <xsl:choose>
              <xsl:when test="$sortValue = 'areaAscending' or $sortValue = 'dateAscending'">
                <ogc:SortOrder>ASC</ogc:SortOrder>
              </xsl:when>
              <xsl:when test="$sortValue = 'areaDescending' or $sortValue = 'dateDescending'">
                <ogc:SortOrder>DESC</ogc:SortOrder>
              </xsl:when>
            </xsl:choose>
          </ogc:SortProperty>
        </ogc:SortBy>
      </xsl:if>
    </xsl:if>
  </xsl:template>
  <xsl:attribute-set name="GetRecordsAttributes">
    <xsl:attribute name="version">2.0.2</xsl:attribute>
    <xsl:attribute name="service">CSW</xsl:attribute>
    <xsl:attribute name="resultType">
      <xsl:choose>
        <xsl:when test="translate($searchQueryDoHitsOnly,'TRUE', 'true')  = 'true' or $searchQueryDoHitsOnly = '1'">HITS</xsl:when>
        <xsl:otherwise>RESULTS</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:attribute name="startPosition"><xsl:value-of select="/GetRecords/StartPosition"/></xsl:attribute>
    <xsl:attribute name="maxRecords"><xsl:value-of select="/GetRecords/MaxRecords"/></xsl:attribute>
  </xsl:attribute-set>
</xsl:stylesheet>

