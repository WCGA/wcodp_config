<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no"/>
	<xsl:template match="/">
		<xsl:element name="csw:GetRecords" use-attribute-sets="GetRecordsAttributes" xmlns:csw="http://www.opengis.net/cat/csw/2.0.2" xmlns:ogc="http://www.opengis.net/ogc" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:gml="http://www.opengis.net/gml" xmlns:gmd="http://www.isotc211.org/2005/gmd">
			<csw:Query typeNames="gmd:MD_Metadata">
				<csw:ElementSetName>full</csw:ElementSetName>
				<csw:Constraint version="1.1.0">
					<ogc:Filter xmlns="http://www.opengis.net/ogc">
            <xsl:choose>
              <xsl:when test="count(/GetRecords/Envelope) + count(/GetRecords/KeyWord) &gt; 1">
                <ogc:And>
                  <!-- Key Word search -->
                  <xsl:apply-templates select="/GetRecords/KeyWord"/>
                  
                  <!-- Spatial search -->
                  <xsl:apply-templates select="/GetRecords/Envelope"/>

                  <!-- Date Range Search -->
                  <xsl:call-template name="tmpltDate"/>
                </ogc:And>
              </xsl:when>
              <xsl:otherwise>
                  <!-- Key Word search -->
                  <xsl:apply-templates select="/GetRecords/KeyWord"/>
                  
                  <!-- Spatial search -->
                  <xsl:apply-templates select="/GetRecords/Envelope"/>

                  <!-- Date Range Search -->
                  <xsl:call-template name="tmpltDate"/>
              </xsl:otherwise>
            </xsl:choose>
					</ogc:Filter>
				</csw:Constraint>
			</csw:Query>
		</xsl:element>
	</xsl:template>
	
	
	<!-- key word search -->
	<xsl:template match="/GetRecords/KeyWord" xmlns:ogc="http://www.opengis.net/ogc">

	<!-- WCODP Selective Harvest Section -->
        <ogc:Or>

 			<!--DATA.gov records -->
 			<!--https://catalog.data.gov/csw-all?request=GetCapabilities&service=CSW&version=2.0.2 -->
 			<!--https://catalog.data.gov/dataset -->
           	
			<!--Ocean Biogeographic Information System (OBIS) USA Dataset Collection -->
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>5eb81bab-3f04-418d-a03a-d5cc88922ff2</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- NOAA National Benthic Infaunal Database (NBID) -->
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>4c58bf94-848f-4ba8-9bbc-17c7546ea836</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- U.S. PACIFIC - Coastal Vulnerability to Sea-Level Rise: U.S. Pacific Coast -->
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>18b0a706-2c22-43cb-807c-085ed1e3074f</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- California 2010 Lidar Coverage, USACE National Coastal Mapping Program -->
			<ogc:PropertyIsEqualTo>
				<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>80951992-3868-45aa-9d1d-b1fea0e1b890</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- California 2009 Lidar Coverage, USACE National Coastal Mapping Program -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>eec69941-8f2f-49b3-abd4-db6dacd6f585</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- boccaccio-larvae-distribution-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>3b5b6138-bd72-426e-9b42-2804b65167dd</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- northern-anchovy-larvae-distribution-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>709447db-3d41-4828-bd36-3150ad60f7f7</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Pacific sardine larvae distribution off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>b3d736fe-183e-4c98-968d-6ef0f8f9fa29</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Brown pelican at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>35404b50-612b-4706-9bcb-769e412d10fa</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Ashy storm-petrel at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>a0dad7a8-395f-4993-b071-efacdf8447b8</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Brandt's cormorant at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>1f863101-2860-4468-8b07-2273bb2a4eff</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Cassins auklet at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>0b074382-6905-433a-98bf-a1e5ea4112b9</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Double-crested cormorant at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>55c55bbf-97c4-4b9e-a2ed-fdb45fd6d620</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Pelagic cormorant at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>41aae6b6-dde7-4fa0-bd3d-b92b44ff5e69</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Pigeon guillemot at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>473e7a4f-263b-47ca-b2b1-169aabc51e72</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Xantus's murrelet at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>a9e76a62-5f18-4406-a1f3-6cedf45a4fac</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Data ingegration - birds, mammals, fish, and invertebrates -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>efe6b62b-cae8-458a-85f0-545763fe7dd4</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Composite fish diversity off southern California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>868143cc-69c2-4d56-9c46-94efff80f59e</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Fish diversity in central and southern California using fish catch and effort data from the Recreational Fisheries Information Network -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>5dff7ae2-f1bc-4471-8b81-1bcd23cf035e</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Fish and invertebrate data integration -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>df865df9-9c10-49d3-8c7d-e962e1068ddd</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Marine bird and mammal data integration -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>25df26a3-eb72-42c4-ac99-b1c268f645ea</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Fish assemblages in central and southern California using fish catch and effort data from the Recreational Fisheries Information Network -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>4219c2fd-c5c2-408c-a1f7-e0010b7ffcb1</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- blue whale at sea density -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>baf5037c-dcf0-4bea-856e-7a4193308296</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Pacific white-sided dolphin at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>b3a1c533-9330-4f09-b4db-0a88778f526a</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Dall's porpoise at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>852b4a24-bd9a-4345-9748-b1f8aa6475e3</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Northern right-whale dolphin at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>ddaaf65b-ca13-4d55-b841-c9759280f13d</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Humpback whale at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>788b3284-1fc4-4b38-8e0b-f3ac21b052ba</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Gray whale at-sea density off California-->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>5e1e8b56-f70c-473d-a9d5-31ef196704d9</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Minke whale at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>39165d1b-670f-4c43-ad0f-63f6ea5c87f9</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Fin whale at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>d2de773a-cc99-4abd-9b19-c25e84deba23</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Killer whale at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>d6611966-7807-47d9-b9e4-c146a163e5d2</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Bottlenose dolphin at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>1af3357c-568a-4610-9e31-a882f8b1d1d8</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Common dolphin at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>c6a5e07f-441c-4b60-a02a-60ded90aa43f</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Harbor porpoise at-sea density off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>c00bd8b6-a0c2-42d7-89a6-b3f3d825ecc0</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Fish diversity in southern California using trawl data from the National Marine Fisheries Service -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>1d92569f-82d2-42a4-9b55-4ac5ec610f70</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Fish assemblages in southern California using trawl data from the National Marine Fisheries Service -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>79bfaa96-dbe8-4b7f-8713-26664de7abff</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Fish diversity in southern California using scuba surveys in kelp forests -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>b379d43d-5be0-4b46-bc58-a7ed1b681155</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Fish assemblages in southern California kelp forests. -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>0a404c52-b0c1-41d8-86e2-0a32c3033ca5</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Marine Invertebrate assemblages in southern California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>8754e099-58a7-4241-92a6-17a4598436b4</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Nearshore marine fish diversity in southern California using trawl information from the Southern California Coastal Water Research Project.-->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>b052a7e2-0db2-46bc-8db5-e48b577eaae0</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Five-minute grid of marine bird biomass density off central California - Oceanic season, 1980-2001 -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>c8b5d4fa-d643-44ef-9977-19e50c60d524</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Digital data set describing surficial geology in the conterminous US -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>414db26a-3599-40d0-994d-e69c77c7b3b5</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- PAC_EXT - Extracted seabed data for the continental margin of the U.S. Pacific Coast (California, Oregon, Washington) from usSEABED (pac_ext.txt) -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>7f5ea848-a193-4092-a310-da5f2a721679</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- 1994 Average Monthly Sea Surface Temperature for California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>c44bd158-83e0-470c-9331-82b8f93f6ed7</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- 1993 Average Monthly Sea Surface Temperature for California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>e8b8e5fb-1e1f-4ded-a67a-28713f908771</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- 1995 Average Monthly Sea Surface Temperature for California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>1e135f5c-14f4-4075-846b-c1755b4897a9</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- 1996 Average Monthly Sea Surface Temperature for California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>e1502ac5-fc55-49bf-9f10-acc07d9847d6</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Seagrass distribution off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>e064700a-4ef2-4907-a907-24ac66f03c06</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- TIDESTATIONS - Pacific Northwest Water-Level Stations and Tidal Datum Distributions -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>4fdfc8cf-7efc-4eca-b607-1eb4aec527cd</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- 2003 Average Monthly Sea Surface Temperature for California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>308a9f1a-7286-4838-9e06-24938bc616ca</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Coastal Zone Management Act Boundary for the United States and US Territories as of December 2013 -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>60d6becd-7341-4882-8c03-56ade95ec53e</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Benthic substrate type off California -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>b7825770-8ce2-45cb-b8d2-154e3f1e4704</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Environmental Sensitivity Index (ESI) Data Viewer and REST Services for Atlases -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>28568202-f290-46a5-b2dc-5bdbf5f2c471</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Environmental Sensitivity Index (ESI) Threatened and Endangered Species REST Services -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>e2d63ea9-4407-4259-aa05-dc296db4f262</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- PACIFIC - Coastal Vulnerability to Sea-Level Rise: U.S. Pacific Coast -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>18b0a706-2c22-43cb-807c-085ed1e3074f</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- NOAA Digital Coast Sea Level Rise and Coastal Flooding Impacts Viewer -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>4a90f006-f108-4780-be33-1b9af0324d0e</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!--National Fish Habitat Partnership Data System-->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>f2df3178-7949-43bf-a1ee-2f4974b80df3</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- NOAA Coastal Mapping Shoreline Products -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>ca723f87-6cd8-4909-97ac-ea84dc9b71be</ogc:Literal>
			</ogc:PropertyIsEqualTo>

			<!-- FRAM records in Data.gov -->
			<!-- Habitat Use Database - Groundfish Essential Fish Habitat (EFH) Habitat Use Database (HUD) -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>gov.noaa.nmfs.inport:18425</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Acoustic data - Integrated acoustic and trawl survey of Pacific hake off the Pacific Coast -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>gov.noaa.nmfs.inport:18469</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Biological data - Integrated acoustic and trawl survey of Pacific hake off the Pacific Coast -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>gov.noaa.nmfs.inport:18470</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Oceanographic data - Integrated acoustic and trawl survey of Pacific hake off the Pacific Coast -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>gov.noaa.nmfs.inport:18471</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Southern California Hook and Line Survey - Annual So. CA Bight hook and line data collection/survey -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>gov.noaa.nmfs.inport:18433</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- West Coast Groundfish Bottom Trawl Survey Data - Annual West Coast time series groundfish trawl data collection survey -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>gov.noaa.nmfs.inport:18418</ogc:Literal>
			</ogc:PropertyIsEqualTo>

 			<!--End DATA.gov records -->

 			<!-- NWFSC FRAM Data Warehouse records -->
 			<!-- https://www.nwfsc.noaa.gov/data/api/v1/csw?service=CSW&version=2.0.2&request=GetCapabilities -->
 			<!-- https://www.nwfsc.noaa.gov/data/map -->

			<!-- Actual Station Design Dim -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>4c843b78-1e5d-4a6c-a234-196671774d11</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Station Design Dim -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>493c6c90-3dd7-416a-912b-b4ed65910073</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- Target Station Design Dim -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>0b5e537e-b235-4bdf-9395-cc1b01195dbf</ogc:Literal>
			</ogc:PropertyIsEqualTo>

 			<!--END NWFSC FRAM Data Warehouse records -->

		</ogc:Or>
	</xsl:template>
	
	
	<!-- envelope search -->
	<xsl:template match="/GetRecords/Envelope" xmlns:ogc="http://www.opengis.net/ogc">
	<!-- generate BBOX query if minx, miny, maxx, maxy are provided -->
	<xsl:if test="./MinX and ./MinY and ./MaxX and ./MaxY">
		<xsl:choose>
			<xsl:when test="/GetRecords/RecordsFullyWithinEnvelope/text() = 'true'">
				<ogc:Within xmlns:gml="http://www.opengis.net/gml">
					<ogc:PropertyName>apiso:BoundingBox</ogc:PropertyName>
					<gml:Envelope>
						<gml:lowerCorner>
							<xsl:value-of select="MinX" />
							<xsl:text> </xsl:text>
							<xsl:value-of select="MinY" />
						</gml:lowerCorner>
						<gml:upperCorner>
							<xsl:value-of select="MaxX" />
							<xsl:text> </xsl:text>
							<xsl:value-of select="MaxY" />
						</gml:upperCorner>
					</gml:Envelope>
				</ogc:Within>
			</xsl:when>
			<xsl:otherwise>
			  <ogc:Intersects xmlns:gml="http://www.opengis.net/gml">
                    <ogc:PropertyName>apiso:BoundingBox</ogc:PropertyName>
                    <gml:Envelope>
                        <gml:lowerCorner>
                            <xsl:value-of select="MinX" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="MinY" />
                        </gml:lowerCorner>
                        <gml:upperCorner>
                            <xsl:value-of select="MaxX" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="MaxY" />
                        </gml:upperCorner>
                    </gml:Envelope>
                </ogc:Intersects>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:if>
</xsl:template>


  <!-- date search -->
	<xsl:template name="tmpltDate" xmlns:ogc="http://www.opengis.net/ogc">
		<!-- xsl:if test="string-length(normalize-space(/GetRecords/FromDate/text())) &gt; 0" -->
		<xsl:if test="contains(/GetRecords/KeyWord, 'from:') &gt; 0">
			<ogc:PropertyIsGreaterThanOrEqualTo>
				<ogc:PropertyName>apiso:TempExtent_begin</ogc:PropertyName>
				<ogc:Literal>
					<xsl:choose>
						<xsl:when test="contains(substring-after(/GetRecords/KeyWord, 'from:'),' ')">
							<xsl:value-of select="substring-before(substring-after(/GetRecords/KeyWord, 'from:'),' ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring-after(/GetRecords/KeyWord, 'from:')"/>
						</xsl:otherwise>
					</xsl:choose>
				</ogc:Literal>
			</ogc:PropertyIsGreaterThanOrEqualTo>
		</xsl:if>
		<xsl:if test="contains(/GetRecords/KeyWord, 'to:') &gt; 0">
			<ogc:PropertyIsLessThanOrEqualTo>
				<ogc:PropertyName>apiso:TempExtent_end</ogc:PropertyName>
				<ogc:Literal>
					<xsl:choose>
						<xsl:when test="contains(substring-after(/GetRecords/KeyWord, 'to:'),' ')">
							<xsl:value-of select="substring-before(substring-after(/GetRecords/KeyWord, 'to:'),' ')"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring-after(/GetRecords/KeyWord, 'to:')"/>
						</xsl:otherwise>
					</xsl:choose>
				</ogc:Literal>
			</ogc:PropertyIsLessThanOrEqualTo>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:template name="string-replace-all">
		<xsl:param name="text"/>
		<xsl:param name="replace"/>
		<xsl:param name="by"/>
		<xsl:choose>
			<xsl:when test="contains($text, $replace)">
				<xsl:value-of select="substring-before($text,$replace)"/>
				<xsl:value-of select="$by"/>
				<xsl:call-template name="string-replace-all">
					<xsl:with-param name="text" select="substring-after($text,$replace)"/>
					<xsl:with-param name="replace" select="$replace"/>
					<xsl:with-param name="by" select="$by"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$text"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	<xsl:template name="output-keywords">
		<xsl:param name="list" />
		<xsl:variable name="newlist" select="concat(normalize-space($list), ' ')" />
		<xsl:variable name="first" select="substring-before($newlist, ' ')" />
		<xsl:variable name="remaining" select="substring-after($newlist, ' ')" />
		<xsl:if test="not(contains($first,'from:') or contains($first,'to:'))">
          <xsl:value-of select="$first" />
          <xsl:text>+</xsl:text>
        </xsl:if>		
        <xsl:if test="$remaining">
			<xsl:call-template name="output-keywords">
				<xsl:with-param name="list" select="$remaining" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	
	<xsl:attribute-set name="GetRecordsAttributes">
		<xsl:attribute name="version">2.0.2</xsl:attribute>
		<xsl:attribute name="service">CSW</xsl:attribute>
		<xsl:attribute name="outputSchema">http://www.isotc211.org/2005/gmd</xsl:attribute>
		<xsl:attribute name="resultType">results</xsl:attribute>
		<xsl:attribute name="startPosition"><xsl:value-of select="/GetRecords/StartPosition"/></xsl:attribute>
		<xsl:attribute name="maxRecords"><xsl:value-of select="/GetRecords/MaxRecords"/></xsl:attribute>
	</xsl:attribute-set>
</xsl:stylesheet>
