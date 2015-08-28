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
	  
            <ogc:Or>
			<!--Ocean Biogeographic Information System (OBIS) USA Dataset Collection -->
			 <ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>fd25633d-4cf2-499b-ab4b-73be048ddcc9</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- NOAA National Benthic Infaunal Database (NBID) -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>4c58bf94-848f-4ba8-9bbc-17c7546ea836</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- U.S. Pacific West Coast Internet Map Server -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>2ee78410-643a-43e2-9770-369d0a8629c2</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- California 2010 Lidar Coverage, USACE National Coastal Mapping Program -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>80951992-3868-45aa-9d1d-b1fea0e1b890</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- California 2010 Lidar Coverage, USACE National Coastal Mapping Program -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>80951992-3868-45aa-9d1d-b1fea0e1b890</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- boccaccio-larvae-distribution-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>6f1e3345-4385-4751-bb06-e9d0ee03bf82</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- northern-anchovy-larvae-distribution-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>a51dfbbd-eaf9-49fb-9608-687504603d04</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- pacific-sardine-larvae-distribution-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>0546521e-f13d-4f62-9b1d-42f65845fc8e</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- brown-pelican-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>d0494e02-cea3-4ee6-8d87-0d297e947132</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- ashy-storm-petrel-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>b4220286-5d45-4822-a504-9591ea6c2380</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- brandts-cormorant-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>446745e1-1944-4baa-9075-0b2d57bc3365</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- cossins-auklet-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>1b341514-4427-4888-91be-f8c0301d50a8</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- double-crested-cormorant-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>916e39a5-277d-42b4-9370-c5843dea75d5</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- pelagic-cormorant-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>25a162b8-49aa-4428-97db-1e74a8aa9146</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- pigeon-guillemot-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>2778465d-d59d-4efb-8f82-925fcfd1ed2c</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- xantuss-murrelet-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>e17e6083-276c-4189-a7ae-c50f4fb5683c</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- data-integration-birds-mammals-fish-and-invertebrates -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>4dce62ee-8d6d-483b-adb3-e4ea87d0f617</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- composite-fish-diversity-off-southern-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>436f30d5-dcf2-4a3b-936f-d3bdebcd209e</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- fish-diversity-in-central-and-southern-california-using-fish-catch-and-effort-data-from-the-rec -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>892bd1f1-d26f-4a2c-b132-1e9e445a913c</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- fish-and-invertebrate-data-integration -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>2e7cbf7b-52c6-4bd2-b9c2-f9a8d76a129f</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- marine-bird-and-mammal-data-integration -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>494df2d6-b87f-407c-8143-83e7f17991b9</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- fish-assemblages-in-central-and-southern-california-using-fish-catch-and-effort-data-from-the-r -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>ebc9e13e-9c10-440d-af2e-f4e604b2d686</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- blue whale at sea density -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>971be32d-a6b7-4de8-9ab1-d938f49bae33</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- pacific-white-sided-dolphin-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>50829ee6-de07-4797-85ad-2523ca2b6445</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- dalls-porpoise-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>798177d1-06a0-4a7b-8733-4511daf03c56</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- northern-right-whale-dolphin-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>b4aeec0f-db52-4af7-82dd-c7d9dba98ef4</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- humpback-whale-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>06965992-a751-40fd-a59f-180b43fe30d9</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- gray-whale-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>e0b6f630-6518-4313-ace1-0aeb707aab48</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- minke-whale-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>8d732052-5c47-4252-8037-e11b55247154</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- fin-whale-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>c4ce2239-632f-4a4f-b4f0-04a6626f7ab9</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- killer-whale-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>7232531d-764d-47fa-9f54-2c0093802954</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- bottlenose-dolphin-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>9394497e-5a47-454f-b096-3afecb9e368e</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- common-dolphin-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>2ae35ad7-c7a0-47a1-bcf7-44609d2db11d</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- harbor-porpoise-at-sea-density-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>a3659543-4898-4720-ab9c-9f4b0153282b</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- fish-diversity-in-southern-california-using-trawl-data-from-the-national-marine-fisheries-servi -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>7e91f5f6-e661-4043-8bbb-7c3d4b6de2a4</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- fish-assemblages-in-southern-california-using-trawl-data-from-the-national-marine-fisheries-ser -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>eff927e1-462f-46d2-bebf-7a881084afa4</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- fish-diversity-in-southern-california-using-scuba-surveys-in-kelp-forests -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>38828cac-bd92-4cab-b389-af62e5f845d0</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- fish-assemblages-in-southern-california-kelp-forests -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>61d2ab58-7ec6-4ea3-b3c7-3652aedb77b6</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- marine-invertebrate-assemblages-in-southern-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>3e4a6132-089d-4576-ad66-baf2033cf8b2</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- nearshore-marine-fish-diversity-in-southern-california-using-trawl-information-from-the-souther -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>71b694ab-d5a5-448f-aa95-101647b048b2</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- five-minute-grid-of-marine-bird-biomass-density-off-central-california-oceanic-season-1980-200 -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>c8b5d4fa-d643-44ef-9977-19e50c60d524</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- digital-data-set-describing-surficial-geology-in-the-conterminous-us -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>414db26a-3599-40d0-994d-e69c77c7b3b5</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- pac-ext-extracted-seabed-data-for-the-continental-margin-of-the-u-s-pacific-coast-california-o -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>7f5ea848-a193-4092-a310-da5f2a721679</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- 1994-average-monthly-sea-surface-temperature-for-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>38dfdbdf-f09e-4ae3-b961-57885bdcf119</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- 1993-average-monthly-sea-surface-temperature-for-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>d33f85a5-b76e-4bed-9852-58ba6cfcc782</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- 1995-average-monthly-sea-surface-temperature-for-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>c844852f-4750-46f9-92ea-c221e276917a</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- 1996-average-monthly-sea-surface-temperature-for-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>1b79f17b-14ee-4a86-bcdd-ba9954453e2f</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- seagrass-distribution-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>b81478a4-97aa-4202-b2d5-3c059d47b824</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- tidestations-pacific-northwest-water-level-stations-and-tidal-datum-distributions -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>4fdfc8cf-7efc-4eca-b607-1eb4aec527cd</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- 2003-average-monthly-sea-surface-temperature-for-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>19a9c4ee-1479-4e89-9a00-6509767df83e</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- coastal-zone-management-act-boundary-for-the-united-states-and-us-territories-as-of-decemb-2013 -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>62dfdf35-d358-4ea5-9f4e-b7faacdddfac</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- benthic-substrate-type-off-california -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>b9270bb1-2107-4ce2-a7f5-4ce64e38f300</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- environmental-sensitivity-index-esi-data-viewer-and-rest-services-for-atlases -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>a7ff83b0-0a5d-4c8a-b7b6-a6012a5d9f75</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- environmental-sensitivity-index-esi-threatened-and-endangered-species-rest-services -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>9bfeaba1-7912-4671-b682-a5cc0edf5b3d</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- pacific-coastal-vulnerability-to-sea-level-rise-u-s-pacific-coast -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>18b0a706-2c22-43cb-807c-085ed1e3074f</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- noaa-digital-coast-sea-level-rise-and-coastal-flooding-impacts-viewer -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>6dcc2e06-ecc2-4cad-9d0c-26c3042138b1</ogc:Literal>
			</ogc:PropertyIsEqualTo>
			<!-- national-fish-habitat-partnership-data-systemb47da -->
			<ogc:PropertyIsEqualTo>
			 	<ogc:PropertyName>dc:identifier</ogc:PropertyName>
				<ogc:Literal>f2df3178-7949-43bf-a1ee-2f4974b80df3</ogc:Literal>
			</ogc:PropertyIsEqualTo>
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
