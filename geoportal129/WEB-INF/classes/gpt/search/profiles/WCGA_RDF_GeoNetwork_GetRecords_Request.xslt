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
                       <!-- <xsl:if test="normalize-space($keyword)!='' or normalize-space($minX) != ''" > -->
                        <ogc:And>
                            <!-- Key Word search -->
                            <!-- <xsl:apply-templates select="/GetRecords/KeyWord"/> -->

                            <!-- WCODP Selective Harvest Section -->
                            <ogc:Or>
                              <!-- Oregon Coastal Atlas -->
                              <!-- http://www.coastalatlas.net/geonetwork/srv/en/csw?request=GetCapabilities&service=CSW&version=2.0.2  -->
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
                            <!-- /Oregon Coastal Atlas -->
                            
                            <!-- Straits of Georgia Data Catalog, BC -->
                            <!-- http://soggy.zoology.ubc.ca:8080/geonetwork/srv/eng/csw?request=GetCapabilities&service=CSW&version=2.0.2 -->
                                <ogc:PropertyIsEqualTo>
                                    <!--Sportfishing Activity Locations, BC -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>CD67FCA4-5485-4C29-B799-FC86618BB5F4</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Marinas and Coastal Facility Locations, BC -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>DEF90A6E-B3A0-4DE3-AC16-93CDC1F019FE</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Rugosity of BC coast -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>CC47F1F9-44E0-4641-A71E-09F67AB9E9BA</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--California Sea Lion Haulout Locations - polygons -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>72B4337E-85F3-4A65-98CD-04D26DCBF244</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Coastal Campsites and Kayak Use Sites -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>74A5936A-5C61-4427-9B74-FF667866FCC0</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Sportfishing activities for anadromous fish along the coast of British Columbia, 1993-2009 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>DD35422D-16C0-448F-B6E6-A6024A10047A</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Ocean Energy Feature Count -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>4CB23F57-5733-4F25-83C1-651C9BC140BB</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Physical Feature Count -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>DFA27AC0-A422-484F-93CF-B78DF1C1C0A2</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--BCMCA Marine Mammal Feature Counts -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>22A7B897-7023-41C7-B0F5-FD0B1C4090A4</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Tanker Exclusion Zone -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>CBE93775-8084-4C7F-87F5-687CD2A3AFC1</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Coastal Ferry Routes -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>8AE6A7A1-83EF-4851-861B-C53A84E625A2</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Spatial Extents of Seamounts, BC -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>025E382B-80E2-4D66-8101-0F44F90EF324</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Steller Sea Lion Rookery Locations -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>02096391-1AB5-49BC-981A-7DFEC96F8914</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Federally Issued Offshore Oil and Gas Tenures-BC Coast Locations -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>80231826-EAF8-4124-A9F9-A614D47B163A</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Ocean Energy - Exploratory Wells Locations -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>0E5E3519-EAFC-45F0-B044-FCD7C7BDDF67</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Locations of High Chlorophyll Concentration on the BC Coast -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>F8CD2019-E1DF-452F-A88A-9CAB98765B8A</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                 <ogc:PropertyIsEqualTo>
                                    <!--Herring Spawn Data -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>60E0BB6F-3911-4579-8305-2E16B47DA805</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Steller Sea Lion Haulout Locations -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>033A6B4C-C91D-446E-940E-ABE092FCA9DA</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Harbour Seal Haulout Locations -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>722CE916-9563-4153-845C-5BFA24D44D97</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--BCMCA_ECO_FeatureCount, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>0D42F341-167E-43BE-B4EB-E38700AB1910</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Sportfishing Feature Count -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>A7E63F90-76FF-44AA-9B7E-80B403F6C033</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Recreation Boating Routes, BC -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>FA28DC31-7BFA-4C7D-98A0-E47D62B20BE9</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--BCMCA Bird Feature Count, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>80D366B4-5339-4868-A452-FA660EA5B53E</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Oil and Gas Prospectivity-BC Coast -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>84FBE709-EB9B-47E7-A16E-23D6A62B193D</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Areal extents of Semi-Palmated Plover Nests - point data, 2009 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>9842E331-4744-4C6B-AD63-371C07E1953E</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Groundfish sportfishing locations along the coast of British Columbia -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>CDE7CD9C-3315-4545-BB65-BB9BC4D9D566</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Basking Shark Recent Captures and Sightings,1990-2008 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>06D4395E-A6CE-4C94-8DF4-996FDEDFDE90</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Tourism and Recreation Feature Count -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>8DE7B33F-D0F8-4E63-A55B-FBF8AD65016B</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Basking Shark Historical Abundance, 1948-1950 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>C95B932F-5E84-4E26-BFD8-B81C356315F6</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--BCMCA Marine Plant Feature Count -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>8C594C6B-64C2-4C9C-A28B-54C72B72C599</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Benthic Habitat Representation -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>E745E38A-24C7-44DB-AC63-BB30FE5331CD</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Groundfish sportfishing locations along the coast of British Columbia, 1993-2009 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>86AC6BCA-8D39-47C4-9CBE-623CAD5E23AE</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--BCMCA Invertebrate Fishery Feature Counts, 2010 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>E74A508A-74D8-47ED-874F-80740F351520</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--BCMCA Giant Kelp (Macrocystis integrifolia) presence -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>75F3E0C5-0CDB-44C3-966D-7CE79334D08F</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Anchorage and Safe Boat Haven Locations, BC -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>BAA322D0-8241-485A-A614-D6BB616E7EEF</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--bcmca Commercial Fishing Feature Count -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>FAC68384-6D06-426D-A456-6C637E352F56</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Crab Sportfishing Activity Locations, BC -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>11A961AD-E7EF-4B38-8A0C-037A8DD2C4DD</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Marine Bird Survey Effort, 2009 -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>F59FE1AE-5589-4AEF-863C-BB7B5A568503</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--SCUBA dive sites, BC -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>6A787FFF-E95E-47A4-BB30-8F269FAF9291</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                                <ogc:PropertyIsEqualTo>
                                    <!--Sea Kayaking Routes, BC Coast -->
                                    <ogc:PropertyName>dc:identifier</ogc:PropertyName>
                                    <ogc:Literal>E26C3321-6428-4E32-8CFC-2B9EA724CAD8</ogc:Literal>
                                </ogc:PropertyIsEqualTo>
                            <!-- /Straits of Georgia Data Catalog, BC -->
                            
                           </ogc:Or>

                            <!-- LiveDataOrMaps search -->
<!--
                            <xsl:apply-templates select="/GetRecords/LiveDataMap"/>
-->
                            <!-- Envelope search, e.g. ogc:BBOX -->
                            <!--  <xsl:apply-templates select="/GetRecords/Envelope"/> -->
                        </ogc:And>
                       <!-- </xsl:if>  -->
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
