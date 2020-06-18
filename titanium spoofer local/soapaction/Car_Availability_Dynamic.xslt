<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" xmlns:xalan = "http://xml.apache.org/xalan"
 xmlns:rcar = "http://xml.amadeus.com/RCARRQ_14_3_1A" exclude-result-prefixes = "xalan"
 xmlns:asm = "urn:expedia:amdsessionmanager:datacontract:v1_0_0" 
 xmlns:soapenv = "http://schemas.xmlsoap.org/soap/envelope/" version = "1.0">
    <xsl:template name = "Car_Availability_Dynamic">
        <xsl:param name = "currencyCodePOSU_para"/>
        <xsl:param name = "countryCode_para"/>
        <xsl:param name = "rateType_para"/>
        <Car_AvailabilityReply xmlns = "http://xml.amadeus.com/RCARRR_14_3_1A">
            <availabilityDetails>
                <computeMarkups>
                    <actionRequestCode>N</actionRequestCode>
                </computeMarkups>
                <rateClass>
                    <criteriaSetType>COR</criteriaSetType>
                </rateClass>
                <!--ininal global paramter before loop-->
                <xsl:variable name = "currencyCodePOS_para">
                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:rateinfo/rcar:tariffInfo/rcar:currency"/>
                </xsl:variable>
                <xsl:variable name = "pickuplocation_para">
                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffInfo[1]/rcar:iataAirportLocations/rcar:locationDescription/rcar:name"/>
                </xsl:variable>
                <xsl:variable name = "dropofflocation_para">
                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffInfo[2]/rcar:iataAirportLocations/rcar:locationDescription/rcar:name"/>
                </xsl:variable>
                <!--loop the vendor company -->   
                <xsl:for-each select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions">
                    <xsl:choose>
                        <!--onairport  -->
                        <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                            <!--on airport  round-->
                            <xsl:choose>
                                <xsl:when test = "count(/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffInfo)!=2">
                                    <xsl:call-template name = "COMPANYLOCATION_Template">
                                        <xsl:with-param name = "CompanyCode_para">
                                            <xsl:value-of select = "rcar:companyDetails/rcar:companyCode"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "countryCode_para">
                                            <xsl:value-of select = "$countryCode_para"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "pickuplocation_para">
                                            <xsl:value-of select = "$pickuplocation_para"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "dropofflocation_para">
                                            <xsl:value-of select = "$pickuplocation_para"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:when>
                                <!--on airport  oneway-->
                                <xsl:otherwise>
                                    <xsl:call-template name = "COMPANYLOCATION_Template">
                                        <xsl:with-param name = "CompanyCode_para">
                                            <xsl:value-of select = "rcar:companyDetails/rcar:companyCode"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "countryCode_para">
                                            <xsl:value-of select = "$countryCode_para"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "pickuplocation_para">
                                            <xsl:value-of select = "$pickuplocation_para"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "dropofflocation_para">
                                            <xsl:value-of select = "$dropofflocation_para"/>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <!--off airport -->
                        <xsl:otherwise>
                            <xsl:variable name = "CompanyCode_para">
                                <xsl:value-of select = "rcar:companyDetails/rcar:companyCode"/>
                            </xsl:variable>
                            <xsl:for-each select = "rcar:pickupDropoffInfos">
                                <!--off  round -->
                                <xsl:variable name = "pickuplocation_off_para">
                                    <xsl:value-of select = "rcar:pickupDropoffLocations[1]/rcar:locationDescription/rcar:name"/>
                                </xsl:variable>
                                <xsl:variable name = "dropofflocation_off_para">
                                    <xsl:value-of select = "rcar:pickupDropoffLocations[2]/rcar:locationDescription/rcar:name"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <!--dropofflocation_off_para is null for round -->
                                    <xsl:when test = "dropofflocation_off_para=''">
                                        <!--company on pick up-->
                                        <xsl:call-template name = "COMPANYLOCATION_Template">
                                            <xsl:with-param name = "CompanyCode_para">
                                                <xsl:value-of select = "$CompanyCode_para"/>
                                            </xsl:with-param>
                                            <xsl:with-param name = "countryCode_para">
                                                <xsl:value-of select = "$countryCode_para"/>
                                            </xsl:with-param>
                                            <xsl:with-param name = "pickuplocation_para">
                                                <xsl:value-of select = "$pickuplocation_off_para"/>
                                            </xsl:with-param>
                                            <xsl:with-param name = "dropofflocation_para">
                                                <xsl:value-of select = "$pickuplocation_off_para"/>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <!--round -->
                                        <xsl:if test = "substring($pickuplocation_off_para,1,3) = substring($dropofflocation_off_para,1,3)">
                                            <!--company on pick up-->
                                            <xsl:call-template name = "COMPANYLOCATION_Template">
                                                <xsl:with-param name = "CompanyCode_para">
                                                    <xsl:value-of select = "$CompanyCode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "countryCode_para">
                                                    <xsl:value-of select = "$countryCode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "pickuplocation_para">
                                                    <xsl:value-of select = "$pickuplocation_off_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "dropofflocation_para">
                                                    <xsl:value-of select = "$pickuplocation_off_para"/>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                            <!--company on drop off -->
                                            <xsl:call-template name = "COMPANYLOCATION_Template">
                                                <xsl:with-param name = "CompanyCode_para">
                                                    <xsl:value-of select = "$CompanyCode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "countryCode_para">
                                                    <xsl:value-of select = "$countryCode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "pickuplocation_para">
                                                    <xsl:value-of select = "$dropofflocation_off_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "dropofflocation_para">
                                                    <xsl:value-of select = "$dropofflocation_off_para"/>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <!--one way -->
                                        <!--off  oneway -->
                                        <xsl:if test = "substring($pickuplocation_off_para,1,3) != substring($dropofflocation_off_para,1,3)">
                                            <xsl:call-template name = "COMPANYLOCATION_Template">
                                                <xsl:with-param name = "CompanyCode_para">
                                                    <xsl:value-of select = "$CompanyCode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "countryCode_para">
                                                    <xsl:value-of select = "$countryCode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "pickuplocation_para">
                                                    <xsl:value-of select = "$pickuplocation_off_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "dropofflocation_para">
                                                    <xsl:value-of select = "$dropofflocation_off_para"/>
                                                </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <!--loop the vendor to match rates -->
                <xsl:for-each select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions">
                    <xsl:choose>
                        <!--onairport  -->
                        <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
					<xsl:param name = "RoundTripBoolean">
            			<xsl:choose>
                			<xsl:when test = "count(/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffInfo)!=2">1</xsl:when>
                			<xsl:otherwise>0</xsl:otherwise>
            			</xsl:choose>
        			</xsl:param>
                                    <xsl:call-template name = "RATE_Template">
                                        <xsl:with-param name = "rateType_para">
                                            <xsl:value-of select = "$rateType_para"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "CompanyCode_para">
                                            <xsl:value-of select = "rcar:companyDetails/rcar:companyCode"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "currencyCodePOS_para">
                                            <xsl:value-of select = "$currencyCodePOS_para"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "currencyCodePOSU_para">
                                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "cdcode_para">
                                            <xsl:value-of select = "rcar:loyaltyNumbersList/rcar:discountNumbers/rcar:customerReferenceInfo/rcar:referenceNumber"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "pickuplocation_para">
                                            <xsl:value-of select = "$pickuplocation_para"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "dropofflocation_para">
                                            <xsl:value-of select = "$pickuplocation_para"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "RoundtripBoolean_para"> 
                                            <xsl:value-of select = "$RoundTripBoolean"/>
                                        </xsl:with-param>
                                    </xsl:call-template> 
                        </xsl:when>
                        <!--off airport -->
                        <xsl:otherwise>
                            <xsl:variable name = "CompanyCode_para">
                                <xsl:value-of select = "rcar:companyDetails/rcar:companyCode"/>
                            </xsl:variable>
                            <xsl:variable name = "cdcode_para">
                                <xsl:value-of select = "rcar:loyaltyNumbersList/rcar:discountNumbers/rcar:customerReferenceInfo/rcar:referenceNumber"/>
                            </xsl:variable>
                            <xsl:for-each select = "rcar:pickupDropoffInfos">
                                <!--off  round -->
                                <xsl:variable name = "pickuplocation_off_para">
                                    <xsl:value-of select = "rcar:pickupDropoffLocations[1]/rcar:locationDescription/rcar:name"/>
                                </xsl:variable>
                                <xsl:variable name = "dropofflocation_off_para">
                                    <xsl:value-of select = "rcar:pickupDropoffLocations[2]/rcar:locationDescription/rcar:name"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <!--dropofflocation_off_para is null for round -->
                                    <xsl:when test = "$dropofflocation_off_para=''">
                                        <!--pick -pick -->
                                        <xsl:call-template name = "RATE_Template">
                                            <xsl:with-param name = "CompanyCode_para">
                                                <xsl:value-of select = "$CompanyCode_para"/>
                                            </xsl:with-param>
                                            <xsl:with-param name = "rateType_para">
                                                <xsl:value-of select = "$rateType_para"/>
                                            </xsl:with-param>
                                            <xsl:with-param name = "cdcode_para">
                                                <xsl:value-of select = "$cdcode_para"/>
                                            </xsl:with-param>
                                            <xsl:with-param name = "currencyCodePOS_para">
                                                <xsl:value-of select = "$currencyCodePOS_para"/>
                                            </xsl:with-param>
                                            <xsl:with-param name = "currencyCodePOSU_para">
                                                <xsl:value-of select = "$currencyCodePOSU_para"/>
                                            </xsl:with-param>
                                            <xsl:with-param name = "pickuplocation_para">
                                                <xsl:value-of select = "$pickuplocation_off_para"/>
                                            </xsl:with-param>
                                            <xsl:with-param name = "dropofflocation_para">
                                                <xsl:value-of select = "$pickuplocation_off_para"/>
                                            </xsl:with-param>
                                            <xsl:with-param name = "RoundtripBoolean_para">
                                                <xsl:value-of select = "'1'"/>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <!--round -->
                                        <xsl:if test = "substring($pickuplocation_off_para,1,3) = substring($dropofflocation_off_para,1,3)">
                                            <!--pick -pick -->
                                            <xsl:call-template name = "RATE_Template">
                                                <xsl:with-param name = "CompanyCode_para">
                                                    <xsl:value-of select = "$CompanyCode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "rateType_para">
                                                    <xsl:value-of select = "$rateType_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "cdcode_para">
                                                    <xsl:value-of select = "$cdcode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "currencyCodePOS_para">
                                                    <xsl:value-of select = "$currencyCodePOS_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "currencyCodePOSU_para">
                                                    <xsl:value-of select = "$currencyCodePOSU_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "pickuplocation_para">
                                                    <xsl:value-of select = "$pickuplocation_off_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "dropofflocation_para">
                                                    <xsl:value-of select = "$pickuplocation_off_para"/>
                                                </xsl:with-param>
                                            <xsl:with-param name = "RoundtripBoolean_para">
                                                <xsl:value-of select = "'0'"/>
                                            </xsl:with-param>
                                            </xsl:call-template>
                                            <!--drop -drop -->
                                            <xsl:call-template name = "RATE_Template">
                                                <xsl:with-param name = "CompanyCode_para">
                                                    <xsl:value-of select = "$CompanyCode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "rateType_para">
                                                    <xsl:value-of select = "$rateType_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "cdcode_para">
                                                    <xsl:value-of select = "$cdcode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "currencyCodePOS_para">
                                                    <xsl:value-of select = "$currencyCodePOS_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "currencyCodePOSU_para">
                                                    <xsl:value-of select = "$currencyCodePOSU_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "pickuplocation_para">
                                                    <xsl:value-of select = "$dropofflocation_off_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "dropofflocation_para">
                                                    <xsl:value-of select = "$dropofflocation_off_para"/>
                                                </xsl:with-param>
                                           <xsl:with-param name = "RoundtripBoolean_para">
                                                <xsl:value-of select = "'0'"/>
                                            </xsl:with-param>
                                            </xsl:call-template>
                                            <!--pick -drop -->
                                            <xsl:call-template name = "RATE_Template">
                                                <xsl:with-param name = "CompanyCode_para">
                                                    <xsl:value-of select = "$CompanyCode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "rateType_para">
                                                    <xsl:value-of select = "$rateType_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "cdcode_para">
                                                    <xsl:value-of select = "$cdcode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "currencyCodePOS_para">
                                                    <xsl:value-of select = "$currencyCodePOS_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "currencyCodePOSU_para">
                                                    <xsl:value-of select = "$currencyCodePOSU_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "pickuplocation_para">
                                                    <xsl:value-of select = "$pickuplocation_off_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "dropofflocation_para">
                                                    <xsl:value-of select = "$dropofflocation_off_para"/>
                                                </xsl:with-param>
                                           <xsl:with-param name = "RoundtripBoolean_para">
                                                <xsl:value-of select = "'0'"/>
                                            </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <!--one way -->
                                        <!--off  oneway -->
                                        <xsl:if test = "substring($pickuplocation_off_para,1,3) != substring($dropofflocation_off_para,1,3)">
                                            <xsl:call-template name = "RATE_Template">
                                                <xsl:with-param name = "CompanyCode_para">
                                                    <xsl:value-of select = "$CompanyCode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "rateType_para">
                                                    <xsl:value-of select = "$rateType_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "cdcode_para">
                                                    <xsl:value-of select = "$cdcode_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "currencyCodePOS_para">
                                                    <xsl:value-of select = "$currencyCodePOS_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "currencyCodePOSU_para">
                                                    <xsl:value-of select = "$currencyCodePOSU_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "pickuplocation_para">
                                                    <xsl:value-of select = "$pickuplocation_off_para"/>
                                                </xsl:with-param>
                                                <xsl:with-param name = "dropofflocation_para">
                                                    <xsl:value-of select = "$dropofflocation_off_para"/>
                                                </xsl:with-param>
                                           <xsl:with-param name = "RoundtripBoolean_para">
                                                <xsl:value-of select = "'0'"/>
                                            </xsl:with-param>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </availabilityDetails>
        </Car_AvailabilityReply>
    </xsl:template>
    <xsl:template name = "COMPANYLOCATION_Template">
        <xsl:param name = "CompanyCode_para"/>
        <xsl:param name = "pickuplocation_para"/>
        <xsl:param name = "dropofflocation_para"/>
        <xsl:param name = "countryCode_para"/>
        <companyLocationInfo>
            <carCompanyData>
                <travelSector>CAR</travelSector>
                <companyCode>
                    <xsl:value-of select = "$CompanyCode_para"/>
                </companyCode>
                <companyName>
                    <xsl:value-of select = "$CompanyCode_para"/>
                </companyName>
                <accessLevel>CP</accessLevel>
            </carCompanyData>
            <!--rentalLocation 1 -->
            <xsl:call-template name = "LOCATION_Template">
                <xsl:with-param name = "pickuplocation_para">
                    <xsl:value-of select = "$pickuplocation_para"/>
                </xsl:with-param>
                <xsl:with-param name = "countryCode_para">
                    <xsl:value-of select = "$countryCode_para"/>
                </xsl:with-param>
            </xsl:call-template>
            <!--rentalLocation 2  for oneway -->
            <xsl:if test = "$pickuplocation_para != $dropofflocation_para">
                <xsl:call-template name = "LOCATION_Template">
                    <xsl:with-param name = "pickuplocation_para">
                        <xsl:value-of select = "$dropofflocation_para"/>
                    </xsl:with-param>
                    <xsl:with-param name = "countryCode_para">
                        <xsl:value-of select = "$countryCode_para"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:if>
        </companyLocationInfo>
    </xsl:template>
    <xsl:template name = "LOCATION_Template">
        <xsl:param name = "pickuplocation_para"/>
        <xsl:param name = "countryCode_para"/>
        <rentalLocation>
            <address>
                <addressDetails>
                    <format>2</format>
                    <line1>SERVICED BY Spoofer AIRPORT</line1>
                </addressDetails>
                <city>
                    <xsl:value-of select = "$countryCode_para"/>
                </city>
                <countryCode>
                    <xsl:value-of select = "$countryCode_para"/>
                </countryCode>
                <locationDetails>
                    <code>1A</code>
                    <!--name like SEAT01 -->
                    <name>
                        <xsl:choose>
                            <xsl:when test = "string-length($pickuplocation_para)=3">
                                <xsl:value-of select = "concat($pickuplocation_para,'T01')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select = "$pickuplocation_para"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </name>
                </locationDetails>
            </address>
            <!--on airport -->
            <xsl:if test = "string-length($pickuplocation_para)=3">
                <airportTerminalInfo>
                    <!--name like SEA -->
                    <airportCode>
                        <xsl:choose>
                            <xsl:when test = "string-length($pickuplocation_para)=3">
                                <xsl:value-of select = "$pickuplocation_para"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select = "substring($pickuplocation_para,1,3)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </airportCode>
                    <terminalInformation>
                        <name>ALL</name>
                    </terminalInformation>
                </airportTerminalInfo>
            </xsl:if>
            <xsl:if test = "substring($pickuplocation_para,3,1)='T'">
                <airportTerminalInfo>
                    <airportCode>
                        <xsl:value-of select = "substring($pickuplocation_para,1,3)"/>
                    </airportCode>
                </airportTerminalInfo>
            </xsl:if>
            <rateMarketingInfo>
                <freeTextQualification>
                    <textSubjectQualifier>3</textSubjectQualifier>
                    <informationType>MK</informationType>
                    <companyId>1A</companyId>
                    <language>EN</language>
                </freeTextQualification>
                <freeText>HASSLE-FREE RENTALS WORLDWIDE FROM ALAMO</freeText>
            </rateMarketingInfo>
            <xsl:if test = "substring($pickuplocation_para,3,1)='T'">
                <shuttleInfo>
                    <attributeFunction>SHU</attributeFunction>
                    <attributeDetails>
                        <attributeType>NON</attributeType>
                    </attributeDetails>
                </shuttleInfo>
            </xsl:if>
            <!--C -->
            <xsl:if test = "substring($pickuplocation_para,3,1)='C'">
                <locDelColOhr>
                    <accessTypeInfo>
                        <companyAccessIndicator>CAT</companyAccessIndicator>
                    </accessTypeInfo>
                    <otherSelectionDetails>
                        <option>COL</option>
                    </otherSelectionDetails>
                    <otherSelectionDetails>
                        <option>DEL</option>
                    </otherSelectionDetails>
                    <otherSelectionDetails>
                        <option>OHR</option>
                    </otherSelectionDetails>
                </locDelColOhr>
            </xsl:if>
            <locationGeocodeInfo>
                <position>
                    <encoding>POR</encoding>
                    <porPosition>
                        <porLongitude>721500</porLongitude>
                        <porLatitude>4366528</porLatitude>
                    </porPosition>
                </position>
                <distance>
                    <measurementQualifier>DST</measurementQualifier>
                    <measurementDetails>
                        <significance>FLY</significance>
                    </measurementDetails>
                    <valueRange>
                        <measureUnitQualifier>1</measureUnitQualifier>
                        <measurementValue>0</measurementValue>
                    </valueRange>
                </distance>
                <porBusinessID>
                    <porCategoryCode>
                        <categoryCodeInfo>
                            <categoryCode>CAR</categoryCode>
                        </categoryCodeInfo>
                    </porCategoryCode>
                    <porForeignKey>
                        <referenceDetails>
                            <value>20839</value>
                        </referenceDetails>
                    </porForeignKey>
                </porBusinessID>
                <porAccuracy>
                    <statusCode>100</statusCode>
                </porAccuracy>
            </locationGeocodeInfo>
            <openingHours>
                <businessSemantic>L</businessSemantic>
                <timeMode>L</timeMode>
                <beginDateTime>
                    <hour>6</hour>
                    <minutes>0</minutes>
                </beginDateTime>
                <endDateTime>
                    <hour>23</hour>
                    <minutes>45</minutes>
                </endDateTime>
                <frequency>
                    <qualifier>DOW</qualifier>
                    <value>1</value>
                </frequency>
            </openingHours>
            <openingHours>
                <businessSemantic>L</businessSemantic>
                <timeMode>L</timeMode>
                <beginDateTime>
                    <hour>6</hour>
                    <minutes>0</minutes>
                </beginDateTime>
                <endDateTime>
                    <hour>23</hour>
                    <minutes>45</minutes>
                </endDateTime>
                <frequency>
                    <qualifier>DOW</qualifier>
                    <value>2</value>
                </frequency>
            </openingHours>
            <openingHours>
                <businessSemantic>L</businessSemantic>
                <timeMode>L</timeMode>
                <beginDateTime>
                    <hour>6</hour>
                    <minutes>0</minutes>
                </beginDateTime>
                <endDateTime>
                    <hour>23</hour>
                    <minutes>45</minutes>
                </endDateTime>
                <frequency>
                    <qualifier>DOW</qualifier>
                    <value>3</value>
                </frequency>
            </openingHours>
            <openingHours>
                <businessSemantic>L</businessSemantic>
                <timeMode>L</timeMode>
                <beginDateTime>
                    <hour>6</hour>
                    <minutes>0</minutes>
                </beginDateTime>
                <endDateTime>
                    <hour>23</hour>
                    <minutes>45</minutes>
                </endDateTime>
                <frequency>
                    <qualifier>DOW</qualifier>
                    <value>4</value>
                </frequency>
            </openingHours>
            <openingHours>
                <businessSemantic>L</businessSemantic>
                <timeMode>L</timeMode>
                <beginDateTime>
                    <hour>6</hour>
                    <minutes>0</minutes>
                </beginDateTime>
                <endDateTime>
                    <hour>23</hour>
                    <minutes>45</minutes>
                </endDateTime>
                <frequency>
                    <qualifier>DOW</qualifier>
                    <value>5</value>
                </frequency>
            </openingHours>
            <openingHours>
                <businessSemantic>PDA</businessSemantic>
                <timeMode>L</timeMode>
                <beginDateTime>
                    <hour>6</hour>
                    <minutes>30</minutes>
                </beginDateTime>
                <endDateTime>
                    <hour>23</hour>
                    <minutes>45</minutes>
                </endDateTime>
                <frequency>
                    <qualifier>DOW</qualifier>
                    <value>6</value>
                </frequency>
            </openingHours>
            <openingHours>
                <businessSemantic>L</businessSemantic>
                <timeMode>L</timeMode>
                <beginDateTime>
                    <hour>6</hour>
                    <minutes>0</minutes>
                </beginDateTime>
                <endDateTime>
                    <hour>23</hour>
                    <minutes>45</minutes>
                </endDateTime>
                <frequency>
                    <qualifier>DOW</qualifier>
                    <value>7</value>
                </frequency>
            </openingHours>
        </rentalLocation>
    </xsl:template>
    
    <xsl:template name = "RATE_Template">
        <xsl:param name = "pickuplocation_para"/>
        <xsl:param name = "dropofflocation_para"/>
        <xsl:param name = "currencyCodePOS_para"/>
        <xsl:param name = "currencyCodePOSU_para"/>
        <!--currency convert  <xsl:param name = "rateConvertedQualifier_para"/>-->
        <!--dairly,weekly,.. -->
        <xsl:param name = "rateType_para"/>
        <!--vendor -  CD mapping -->
        <xsl:param name = "cdcode_para"/>
        <xsl:param name = "CompanyCode_para"/>
        <xsl:param name = "RoundtripBoolean_para"/>
        <xsl:for-each select = "document('.\uAPI\CarPrices.xml')/CarPrice/Car[@RoundTripBoolean=$RoundtripBoolean_para and @PackageBoolean='0']">
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>   					
                    <vehicleRentalPrefType><xsl:value-of select = "@SIPP"/></vehicleRentalPrefType>
                </vehicleCharacteristic>
                <carModel>FIAT PANDA 1.3</carModel>
            </vehicleTypeInfo>
            <carCompanyData>
                <travelSector>CAR</travelSector>
                <companyCode>
                    <xsl:value-of select = "$CompanyCode_para"/>
                </companyCode>
                <companyName>
                    <xsl:value-of select = "$CompanyCode_para"/>
                </companyName>
                <accessLevel>CP</accessLevel>
            </carCompanyData>
            <pickupDropoffLocations>
                <locationType>PUP</locationType>
                <locationDescription>
                    <code>1A</code>
                    <name>
                        <xsl:choose>
                            <xsl:when test = "string-length($pickuplocation_para)=3">
                                <xsl:value-of select = "concat($pickuplocation_para,'T01')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select = "$pickuplocation_para"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </name>
                </locationDescription>
            </pickupDropoffLocations>
            <pickupDropoffLocations>
                <locationType>DOL</locationType>
                <locationDescription>
                    <code>1A</code>
                    <name>
                        <xsl:choose>
                            <xsl:when test = "string-length($dropofflocation_para)=3">
                                <xsl:value-of select = "concat($dropofflocation_para,'T01')"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select = "$dropofflocation_para"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </name>
                </locationDescription>
            </pickupDropoffLocations>
            <pickupDropoffTime>
                <beginDateTime>
                    <year>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year"/>
                        </xsl:if>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year"/>
                        </xsl:if>
                    </year>
                    <month>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month"/>
                        </xsl:if>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month"/>
                        </xsl:if>
                    </month>
                    <day>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day"/>
                        </xsl:if>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day"/>
                        </xsl:if>
                    </day>
                    <hour>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour"/>
                        </xsl:if>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour"/>
                        </xsl:if>
                    </hour>
                    <minutes>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes"/>
                        </xsl:if>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes"/>
                        </xsl:if>
                    </minutes>
                </beginDateTime>
                <endDateTime>
                    <year>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year"/>
                        </xsl:if>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year"/>
                        </xsl:if>
                    </year>
                    <month>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month"/>
                        </xsl:if>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month"/>
                        </xsl:if>
                    </month>
                    <day>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day"/>
                        </xsl:if>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day"/>
                        </xsl:if>
                    </day>
                    <hour>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour"/>
                        </xsl:if>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour"/>
                        </xsl:if>
                    </hour>
                    <minutes>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes"/>
                        </xsl:if>
                        <xsl:if test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes"/>
                        </xsl:if>
                    </minutes>
                </endDateTime>
            </pickupDropoffTime>
            <validityPeriod>
                <quantityDetails>
                    <qualifier>DLD</qualifier>
                    <value>5</value>
                    <unit>MIN</unit>
                </quantityDetails>
            </validityPeriod>
            <rateIdentifier>
                <referenceDetails>
                    <value>QS38UGPBI9A35VILOOYR</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=ECMR&amp;item=0&amp;stamp=VEHICLE_0_0_1409127381376&amp;file=7.JPEG</identifier>
                        <type>AO</type>
                    </address>
                </imageURL>
                <pictureSize>
                    <option>
                        <code>7</code>
                    </option>
                </pictureSize>
                <vehicleInformation>
                    <vehicleCharacteristic>
                        <vehicleTypeOwner>ACR</vehicleTypeOwner>
                        <vehicleRentalPrefType><xsl:value-of select = "@SIPP"/></vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>4</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>FIAT PANDA 1.3</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>3</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=ECMR&amp;item=0&amp;stamp=VEHICLE_0_0_1409127381376&amp;file=4.JPEG</identifier>
                        <type>AO</type>
                    </address>
                </imageURL>
                <pictureSize>
                    <option>
                        <code>4</code>
                    </option>
                </pictureSize>
                <vehicleInformation>
                    <vehicleCharacteristic>
                        <vehicleTypeOwner>ACR</vehicleTypeOwner>
                        <vehicleRentalPrefType><xsl:value-of select = "@SIPP"/></vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>4</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>FIAT PANDA 1.3</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>3</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <loyaltyNumbersList>
                <discountNumbers>
                    <xsl:if test = "$cdcode_para ">
                        <customerReferenceInfo>
                            <referenceQualifier>CD</referenceQualifier>
                            <referenceNumber>
                                <xsl:value-of select = "$cdcode_para"/>
                            </referenceNumber>
                        </customerReferenceInfo>
                    </xsl:if>
                    <customerReferenceInfo>
                        <referenceQualifier>RC</referenceQualifier>
                        <referenceNumber>LOPU</referenceNumber>
                    </customerReferenceInfo>
                </discountNumbers>
            </loyaltyNumbersList>
            <rateDetailsInfo>
                <tariffInfo>
                    <rateIdentifier>1412090923</rateIdentifier>
                    <rateAmount>
						<xsl:choose>
							<xsl:when test = "$currencyCodePOSU_para != $currencyCodePOS_para">  <xsl:value-of select = "'137.13'"/>  </xsl:when>
							<xsl:otherwise> <xsl:value-of select = "@BaseRate"/> </xsl:otherwise>
						</xsl:choose>
					 </rateAmount>
                    <rateCurrency>
                        <xsl:value-of select = "$currencyCodePOS_para"/>
                    </rateCurrency>
                    <rateType>
                        <xsl:value-of select = "$rateType_para"/>
                    </rateType>
                    <rateAmountQualifier>901</rateAmountQualifier>
                    <xsl:if test = "$currencyCodePOSU_para != $currencyCodePOS_para">
                        <rateConvertedQualifier>4</rateConvertedQualifier>
                    </xsl:if>
                </tariffInfo>
                <tariffInfo>
                    <rateAmount>
						<xsl:choose>
							<xsl:when test = "$currencyCodePOSU_para != $currencyCodePOS_para">  <xsl:value-of select = "'386.13'"/>  </xsl:when>
							<xsl:otherwise> <xsl:value-of select = "@TotalRate"/> </xsl:otherwise>
						</xsl:choose>
					 </rateAmount>
                    <rateCurrency>
                        <xsl:value-of select = "$currencyCodePOS_para"/>
                    </rateCurrency>
                    <rateType>906</rateType>
                    <rateAmountQualifier>901</rateAmountQualifier>
                    <xsl:if test = "$currencyCodePOSU_para != $currencyCodePOS_para">
                        <rateConvertedQualifier>4</rateConvertedQualifier>
                    </xsl:if>
                </tariffInfo>
                <xsl:if test = "$currencyCodePOSU_para != $currencyCodePOS_para">
                    <tariffInfo>
                        <rateAmount><xsl:value-of select = "@BaseRate"/></rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount> <xsl:value-of select = "@TotalRate"/> </rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>906</rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                </xsl:if>
                <extraRateTypeInfo>
                    <rateCategory>024</rateCategory>
                </extraRateTypeInfo>
                <associatedCharges>
                    <chargeType>2</chargeType>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>9</chargeType>
                    <amountQualifier>UNL</amountQualifier>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>SCG</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>SCG</chargeCode>
                    <freeText>GENERAL SURCHARGE</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>SCG</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>RFT</chargeCode>
                    <freeText>REGISTRATION FEE/ ROAD TAX</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>CDW</chargeCode>
                    <freeText>COLLISION DAMAGE WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>TPW</chargeCode>
                    <freeText>THEFT PROTECTION WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>TAX</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>TAX</chargeCode>
                    <freeText>TAX</freeText>
                </associatedCharges>
            </rateDetailsInfo>
            <rateStatus>
                <statusCode>RAV</statusCode>
            </rateStatus>
            <ruleInfo>
                <ruleDetails>
                    <type>920</type>
                </ruleDetails>
                <ruleDetails>
                    <type>922</type>
                </ruleDetails>
            </ruleInfo>
            <rateMarketingInfo>
                <freeTextQualification>
                    <textSubjectQualifier>3</textSubjectQualifier>
                    <informationType>RC</informationType>
                    <companyId>1A</companyId>
                    <language>EN</language>
                </freeTextQualification>
                <freeText>LOCAL PUBLIC RATE</freeText>
            </rateMarketingInfo>
        </rates>
</xsl:for-each>
      
    </xsl:template>
</xsl:stylesheet>
