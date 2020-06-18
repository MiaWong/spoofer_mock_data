<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl = "http://www.w3.org/1999/XSL/Transform" xmlns:xalan = "http://xml.apache.org/xalan"
 xmlns:rcar = "http://xml.amadeus.com/RCARRQ_14_3_1A" exclude-result-prefixes = "xalan"
 xmlns:asm = "urn:expedia:amdsessionmanager:datacontract:v1_0_0" 
 xmlns:soapenv = "http://schemas.xmlsoap.org/soap/envelope/" version = "1.0">
    <xsl:template name = "Car_Availability_Search_Common">
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
                            <!--on airport  round-->
                            <xsl:choose>
                                <xsl:when test = "count(/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffInfo)!=2">
                                    <xsl:call-template name = "RATE_Template_Round">
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
                                    </xsl:call-template>
                                </xsl:when>
                                <!--on airport  oneway-->
                                <xsl:otherwise>
                                    <xsl:call-template name = "RATE_Template_ONEWAY">
                                        <xsl:with-param name = "CompanyCode_para">
                                            <xsl:value-of select = "rcar:companyDetails/rcar:companyCode"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "rateType_para">
                                            <xsl:value-of select = "$rateType_para"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "cdcode_para">
                                            <xsl:value-of select = "rcar:loyaltyNumbersList/rcar:discountNumbers/rcar:customerReferenceInfo/rcar:referenceNumber"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "currencyCodePOS_para">
                                            <xsl:value-of select = "$currencyCodePOS_para"/>
                                        </xsl:with-param>
                                        <xsl:with-param name = "currencyCodePOSU_para">
                                            <xsl:value-of select = "$currencyCodePOSU_para"/>
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
                                        <xsl:call-template name = "RATE_Template_Round">
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
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <!--round -->
                                        <xsl:if test = "substring($pickuplocation_off_para,1,3) = substring($dropofflocation_off_para,1,3)">
                                            <!--pick -pick -->
                                            <xsl:call-template name = "RATE_Template_Round">
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
                                            </xsl:call-template>
                                            <!--drop -drop -->
                                            <xsl:call-template name = "RATE_Template_Round">
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
                                            </xsl:call-template>
                                            <!--pick -drop -->
                                            <xsl:call-template name = "RATE_Template_Round">
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
                                            </xsl:call-template>
                                        </xsl:if>
                                        <!--one way -->
                                        <!--off  oneway -->
                                        <xsl:if test = "substring($pickuplocation_off_para,1,3) != substring($dropofflocation_off_para,1,3)">
                                            <xsl:call-template name = "RATE_Template_ONEWAY">
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
    <xsl:template name = "RATE_Template_ONEWAY">
        <xsl:param name = "pickuplocation_para"/>
        <xsl:param name = "dropofflocation_para"/>
        <xsl:param name = "currencyCodePOSU_para"/>
        <xsl:param name = "currencyCodePOS_para"/>
        <!--currency convert  <xsl:param name = "rateConvertedQualifier_para"/>-->
        <!--dairly,weekly,.. -->
        <xsl:param name = "rateType_para"/>
        <!--vendor -  CD mapping -->
        <xsl:param name = "cdcode_para"/>
        <xsl:param name = "CompanyCode_para"/>
        <!--024, 002  <xsl:param name = "rateCategory_para"/>-->
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>MCMR</vehicleRentalPrefType>
                </vehicleCharacteristic>
                <carModel>PEUGEOT 107</carModel>
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
                    <value>FBHJM3SBMPLQG6X0IMWW</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=MC&amp;item=0&amp;stamp=VEHICLE_0_0_1345797361344&amp;file=7.JPEG</identifier>
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
                        <vehicleRentalPrefType>MC</vehicleRentalPrefType>
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
                    <carModel>PEUGEOT 107</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>2</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=MC&amp;item=0&amp;stamp=VEHICLE_0_0_1345797361344&amp;file=4.JPEG</identifier>
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
                        <vehicleRentalPrefType>MC</vehicleRentalPrefType>
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
                    <carModel>PEUGEOT 107</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>2</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <!--CD code part-->
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
                    <rateIdentifier>1412100230</rateIdentifier>
                    <rateAmount>63.50</rateAmount>
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
                    <rateAmount>187.55</rateAmount>
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
                        <rateAmount>50.35</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>148.70</rateAmount>
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
                    <chargeType>8</chargeType>
                    <quantity>250</quantity>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>6</chargeType>
                    <amount>0.15</amount>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>SCG</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>OWC</chargeCode>
                    <freeText>ONE WAY CHARGE</freeText>
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
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>CDW</chargeCode>
                    <freeText>COLLISION DAMAGE WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TPW</chargeCode>
                    <freeText>THEFT PROTECTION WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>TAX</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TAX</chargeCode>
                    <freeText>TAX</freeText>
                </associatedCharges>
            </rateDetailsInfo>
            <rateStatus>
                <statusCode>RAV</statusCode>
            </rateStatus>
            <ruleInfo>
                <ruleDetails>
                    <type>901</type>
                </ruleDetails>
                <ruleDetails>
                    <type>920</type>
                </ruleDetails>
            </ruleInfo>
            <rateMarketingInfo>
                <freeTextQualification>
                    <textSubjectQualifier>3</textSubjectQualifier>
                    <informationType>RC</informationType>
                    <companyId>1A</companyId>
                    <language>EN</language>
                </freeTextQualification>
                <freeText>FR NICE PL UK POS - 6 DAY RATE</freeText>
            </rateMarketingInfo>
        </rates>
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
                </vehicleCharacteristic>
                <carModel>FIAT GRANDE PUNTO</carModel>
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
                    <value>VM8X308LL4G2FYL22FDO</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=EB&amp;item=0&amp;stamp=VEHICLE_0_0_1345797361344&amp;file=7.JPEG</identifier>
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
                        <vehicleRentalPrefType>EB</vehicleRentalPrefType>
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
                    <carModel>FIAT GRANDE PUNTO</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>2</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=EB&amp;item=0&amp;stamp=VEHICLE_0_0_1345797361344&amp;file=4.JPEG</identifier>
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
                        <vehicleRentalPrefType>EB</vehicleRentalPrefType>
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
                    <carModel>FIAT GRANDE PUNTO</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>2</attributeDescription>
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
                    <rateIdentifier>1412100230</rateIdentifier>
                    <rateAmount>47.25</rateAmount>
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
                    <rateAmount>155.05</rateAmount>
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
                        <rateAmount>37.46</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>122.93</rateAmount>
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
                    <chargeType>8</chargeType>
                    <quantity>250</quantity>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>6</chargeType>
                    <amount>0.15</amount>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>SCG</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>OWC</chargeCode>
                    <freeText>ONE WAY CHARGE</freeText>
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
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>CDW</chargeCode>
                    <freeText>COLLISION DAMAGE WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TPW</chargeCode>
                    <freeText>THEFT PROTECTION WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>TAX</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TAX</chargeCode>
                    <freeText>TAX</freeText>
                </associatedCharges>
            </rateDetailsInfo>
            <rateStatus>
                <statusCode>RAV</statusCode>
            </rateStatus>
            <ruleInfo>
                <ruleDetails>
                    <type>901</type>
                </ruleDetails>
                <ruleDetails>
                    <type>920</type>
                </ruleDetails>
            </ruleInfo>
            <rateMarketingInfo>
                <freeTextQualification>
                    <textSubjectQualifier>3</textSubjectQualifier>
                    <informationType>RC</informationType>
                    <companyId>1A</companyId>
                    <language>EN</language>
                </freeTextQualification>
                <freeText>FR NICE PL UK POS - 6 DAY RATE</freeText>
            </rateMarketingInfo>
        </rates>
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>EDMR</vehicleRentalPrefType>
                </vehicleCharacteristic>
                <carModel>FIAT GRANDE PUNTO</carModel>
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
                    <value>50FM6ENP2KMX8VWBW5XJ</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=ED&amp;item=0&amp;stamp=VEHICLE_0_0_1345797361344&amp;file=7.JPEG</identifier>
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
                        <vehicleRentalPrefType>ED</vehicleRentalPrefType>
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
                    <carModel>FIAT GRANDE PUNTO</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>2</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=ED&amp;item=0&amp;stamp=VEHICLE_0_0_1345797361344&amp;file=4.JPEG</identifier>
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
                        <vehicleRentalPrefType>ED</vehicleRentalPrefType>
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
                    <carModel>FIAT GRANDE PUNTO</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>2</attributeDescription>
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
                    <rateIdentifier>1412100230</rateIdentifier>
                    <rateAmount>55.76</rateAmount>
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
                    <rateAmount>172.06</rateAmount>
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
                        <rateAmount>44.21</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>136.42</rateAmount>
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
                    <chargeType>8</chargeType>
                    <quantity>250</quantity>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>6</chargeType>
                    <amount>0.15</amount>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>SCG</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>OWC</chargeCode>
                    <freeText>ONE WAY CHARGE</freeText>
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
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>CDW</chargeCode>
                    <freeText>COLLISION DAMAGE WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TPW</chargeCode>
                    <freeText>THEFT PROTECTION WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>TAX</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TAX</chargeCode>
                    <freeText>TAX</freeText>
                </associatedCharges>
            </rateDetailsInfo>
            <rateStatus>
                <statusCode>RAV</statusCode>
            </rateStatus>
            <ruleInfo>
                <ruleDetails>
                    <type>901</type>
                </ruleDetails>
                <ruleDetails>
                    <type>920</type>
                </ruleDetails>
            </ruleInfo>
            <rateMarketingInfo>
                <freeTextQualification>
                    <textSubjectQualifier>3</textSubjectQualifier>
                    <informationType>RC</informationType>
                    <companyId>1A</companyId>
                    <language>EN</language>
                </freeTextQualification>
                <freeText>FR NICE PL UK POS - 6 DAY RATE</freeText>
            </rateMarketingInfo>
        </rates>
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>CMMR</vehicleRentalPrefType>
                </vehicleCharacteristic>
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
                    <value>HSU2JYB9F6576GPYWDTC</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=CM&amp;item=0&amp;stamp=VEHICLE_0_0_1345794396358&amp;file=7.JPEG</identifier>
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
                        <vehicleRentalPrefType>CM</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>4</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>2</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=CM&amp;item=0&amp;stamp=VEHICLE_0_0_1345794396358&amp;file=4.JPEG</identifier>
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
                        <vehicleRentalPrefType>CM</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>4</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>2</attributeDescription>
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
                    <rateIdentifier>1412100230</rateIdentifier>
                    <rateAmount>48.03</rateAmount>
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
                    <rateAmount>156.58</rateAmount>
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
                        <rateAmount>38.08</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>124.15</rateAmount>
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
                    <chargeType>8</chargeType>
                    <quantity>250</quantity>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>6</chargeType>
                    <amount>0.15</amount>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>SCG</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>OWC</chargeCode>
                    <freeText>ONE WAY CHARGE</freeText>
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
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>CDW</chargeCode>
                    <freeText>COLLISION DAMAGE WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TPW</chargeCode>
                    <freeText>THEFT PROTECTION WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>TAX</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TAX</chargeCode>
                    <freeText>TAX</freeText>
                </associatedCharges>
            </rateDetailsInfo>
            <rateStatus>
                <statusCode>ROR</statusCode>
            </rateStatus>
            <ruleInfo>
                <ruleDetails>
                    <type>901</type>
                </ruleDetails>
                <ruleDetails>
                    <type>920</type>
                </ruleDetails>
            </ruleInfo>
            <rateMarketingInfo>
                <freeTextQualification>
                    <textSubjectQualifier>3</textSubjectQualifier>
                    <informationType>RC</informationType>
                    <companyId>1A</companyId>
                    <language>EN</language>
                </freeTextQualification>
                <freeText>FR NICE PL UK POS - 6 DAY RATE</freeText>
            </rateMarketingInfo>
        </rates>
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>CXMR</vehicleRentalPrefType>
                </vehicleCharacteristic>
                <carModel>TOYOTA PRIUS</carModel>
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
                    <value>5TMCG5PICTM3KP48PGTU</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=CX&amp;item=0&amp;stamp=VEHICLE_0_0_1345797805001&amp;file=7.JPEG</identifier>
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
                        <vehicleRentalPrefType>CX</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>4</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>TOYOTA PRIUS</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>4</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=CX&amp;item=0&amp;stamp=VEHICLE_0_0_1345797805001&amp;file=4.JPEG</identifier>
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
                        <vehicleRentalPrefType>CX</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>4</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>TOYOTA PRIUS</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>4</attributeDescription>
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
                    <rateIdentifier>1412100230</rateIdentifier>
                    <rateAmount>44.14</rateAmount>
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
                    <rateAmount>148.84</rateAmount>
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
                        <rateAmount>35.00</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>118.01</rateAmount>
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
                    <chargeType>8</chargeType>
                    <quantity>250</quantity>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>6</chargeType>
                    <amount>0.15</amount>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>SCG</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>OWC</chargeCode>
                    <freeText>ONE WAY CHARGE</freeText>
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
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>CDW</chargeCode>
                    <freeText>COLLISION DAMAGE WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TPW</chargeCode>
                    <freeText>THEFT PROTECTION WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>TAX</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TAX</chargeCode>
                    <freeText>TAX</freeText>
                </associatedCharges>
            </rateDetailsInfo>
            <rateStatus>
                <statusCode>RAV</statusCode>
            </rateStatus>
            <ruleInfo>
                <ruleDetails>
                    <type>901</type>
                </ruleDetails>
                <ruleDetails>
                    <type>920</type>
                </ruleDetails>
            </ruleInfo>
            <rateMarketingInfo>
                <freeTextQualification>
                    <textSubjectQualifier>3</textSubjectQualifier>
                    <informationType>RC</informationType>
                    <companyId>1A</companyId>
                    <language>EN</language>
                </freeTextQualification>
                <freeText>FR NICE PL UK POS - 6 DAY RATE</freeText>
            </rateMarketingInfo>
        </rates>
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>SDMR</vehicleRentalPrefType>
                </vehicleCharacteristic>
                <carModel>SAAB 9-3</carModel>
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
                    <value>QQ20N0CK5A5FPR551XMQ</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=SD&amp;item=0&amp;stamp=VEHICLE_0_0_1345797361344&amp;file=7.JPEG</identifier>
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
                        <vehicleRentalPrefType>SD</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>4</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>SAAB 9-3</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>4</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=AL&amp;cnt=FR&amp;vehcat=SD&amp;item=0&amp;stamp=VEHICLE_0_0_1345797361344&amp;file=4.JPEG</identifier>
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
                        <vehicleRentalPrefType>SD</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>4</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>SAAB 9-3</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>4</attributeDescription>
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
                    <rateIdentifier>1412100230</rateIdentifier>
                    <rateAmount>41.82</rateAmount>
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
                    <rateAmount>144.17</rateAmount>
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
                        <rateAmount>33.16</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>114.31</rateAmount>
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
                    <chargeType>8</chargeType>
                    <quantity>250</quantity>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>6</chargeType>
                    <amount>0.15</amount>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>SCG</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>OWC</chargeCode>
                    <freeText>ONE WAY CHARGE</freeText>
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
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>CDW</chargeCode>
                    <freeText>COLLISION DAMAGE WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TPW</chargeCode>
                    <freeText>THEFT PROTECTION WAIVER</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>COV</chargeType>
                    <amountQualifier>4</amountQualifier>
                    <chargeCode>COV</chargeCode>
                    <freeText>General coverage</freeText>
                </associatedCharges>
                <associatedCharges>
                    <chargeType>TAX</chargeType>
                    <amountQualifier>3</amountQualifier>
                    <chargeCode>TAX</chargeCode>
                    <freeText>TAX</freeText>
                </associatedCharges>
            </rateDetailsInfo>
            <rateStatus>
                <statusCode>RAV</statusCode>
            </rateStatus>
            <ruleInfo>
                <ruleDetails>
                    <type>901</type>
                </ruleDetails>
                <ruleDetails>
                    <type>920</type>
                </ruleDetails>
            </ruleInfo>
            <rateMarketingInfo>
                <freeTextQualification>
                    <textSubjectQualifier>3</textSubjectQualifier>
                    <informationType>RC</informationType>
                    <companyId>1A</companyId>
                    <language>EN</language>
                </freeTextQualification>
                <freeText>FR NICE PL UK POS - 6 DAY RATE</freeText>
            </rateMarketingInfo>
        </rates>
    </xsl:template>
    <xsl:template name = "RATE_Template_Round">
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
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>ECMR</vehicleRentalPrefType>
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
                        <vehicleRentalPrefType>ECMR</vehicleRentalPrefType>
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
                        <vehicleRentalPrefType>ECMR</vehicleRentalPrefType>
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
                    <rateAmount>137.13</rateAmount>
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
                    <rateAmount>386.13</rateAmount>
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
                        <rateAmount>172.95</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>487.01</rateAmount>
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
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>MCMR</vehicleRentalPrefType>
                </vehicleCharacteristic>
                <carModel>FIAT 500 1.2</carModel>
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
                    <value>JULFFR5D3MUKB61DSJTX</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=MCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1409127381376&amp;file=7.JPEG</identifier>
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
                        <vehicleRentalPrefType>MCMR</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>3</value>
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
                    <carModel>FIAT 500 1.2</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>0</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=MCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1409127381376&amp;file=4.JPEG</identifier>
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
                        <vehicleRentalPrefType>MCMR</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>3</value>
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
                    <carModel>FIAT 500 1.2</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>0</attributeDescription>
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
                    <rateAmount>137.13</rateAmount>
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
                    <rateAmount>386.13</rateAmount>
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
                        <rateAmount>172.95</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>487.01</rateAmount>
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
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>EDMR</vehicleRentalPrefType>
                </vehicleCharacteristic>
                <carModel>PEUGEOT 208 1.4</carModel>
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
                    <value>CUDN2F2UYVTQPWYKEPVX</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=EDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1409127381376&amp;file=7.JPEG</identifier>
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
                        <vehicleRentalPrefType>EDMR</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>PEUGEOT 208 1.4</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>0</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=EDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1409127381376&amp;file=4.JPEG</identifier>
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
                        <vehicleRentalPrefType>EDMR</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>PEUGEOT 208 1.4</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>0</attributeDescription>
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
                    <rateAmount>171.08</rateAmount>
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
                    <rateAmount>463.06</rateAmount>
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
                        <rateAmount>215.77</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>584.03</rateAmount>
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
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>EMMR</vehicleRentalPrefType>
                </vehicleCharacteristic>
                <carModel>FIAT PUNTO 1.2</carModel>
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
                    <value>07153KQSAQLMMYBOEEKE</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=EMMR&amp;item=0&amp;stamp=VEHICLE_0_0_1409127381376&amp;file=7.JPEG</identifier>
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
                        <vehicleRentalPrefType>EMMR</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>0</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>FIAT PUNTO 1.2</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>0</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=EMMR&amp;item=0&amp;stamp=VEHICLE_0_0_1409127381376&amp;file=4.JPEG</identifier>
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
                        <vehicleRentalPrefType>EMMR</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>0</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>FIAT PUNTO 1.2</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>0</attributeDescription>
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
                    <rateAmount>182.97</rateAmount>
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
                    <rateAmount>490.02</rateAmount>
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
                        <rateAmount>230.77</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>618.03</rateAmount>
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
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>CDMR</vehicleRentalPrefType>
                </vehicleCharacteristic>
                <carModel>VOLKSWAGEN GOLF 1.6</carModel>
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
                    <value>BE51C5MQUIOUPQ1TCSNN</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=CDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1409127381376&amp;file=7.JPEG</identifier>
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
                        <vehicleRentalPrefType>CDMR</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>VOLKSWAGEN GOLF 1.6</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>0</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=CDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1409127381376&amp;file=4.JPEG</identifier>
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
                        <vehicleRentalPrefType>CDMR</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <vehicleInfo>
                        <qualifier>PAX</qualifier>
                        <value>5</value>
                    </vehicleInfo>
                    <freeTextDetails>
                        <textSubjectQualifier>3</textSubjectQualifier>
                        <informationType>CMK</informationType>
                        <source>M</source>
                        <encoding>7</encoding>
                    </freeTextDetails>
                    <carModel>VOLKSWAGEN GOLF 1.6</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>0</attributeDescription>
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
                    <rateAmount>157.15</rateAmount>
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
                    <rateAmount>544.68</rateAmount>
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
                        <rateAmount>198.20</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>686.97</rateAmount>
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
        <rates>
            <vehicleTypeInfo>
                <vehicleCharacteristic>
                    <vehicleTypeOwner>ACR</vehicleTypeOwner>
                    <vehicleRentalPrefType>CTMR</vehicleRentalPrefType>
                </vehicleCharacteristic>
                <carModel>RENAULT MEGANE CABRIOLET</carModel>
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
                    <value>LP5CH76U1TIL4TTDHQ2J</value>
                </referenceDetails>
            </rateIdentifier>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=CTMR&amp;item=0&amp;stamp=VEHICLE_0_0_1326280536547&amp;file=7.JPEG</identifier>
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
                        <vehicleRentalPrefType>CTMR</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>4</value>
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
                    <carModel>RENAULT MEGANE CABRIOLET</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>1</attributeDescription>
                    </nonNumericalAttributes>
                </vehicleInformation>
            </sizedPictures>
            <sizedPictures>
                <imageURL>
                    <address>
                        <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=IT&amp;vehcat=CTMR&amp;item=0&amp;stamp=VEHICLE_0_0_1326280536547&amp;file=4.JPEG</identifier>
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
                        <vehicleRentalPrefType>CTMR</vehicleRentalPrefType>
                    </vehicleCharacteristic>
                    <vehicleInfo>
                        <qualifier>NOD</qualifier>
                        <value>4</value>
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
                    <carModel>RENAULT MEGANE CABRIOLET</carModel>
                    <nonNumericalAttributes>
                        <attributeType>BS</attributeType>
                        <attributeDescription>1</attributeDescription>
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
                    <rateAmount>173.25</rateAmount>
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
                    <rateAmount>581.16</rateAmount>
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
                        <rateAmount>218.51</rateAmount>
                        <rateCurrency>
                            <xsl:value-of select = "$currencyCodePOSU_para"/>
                        </rateCurrency>
                        <rateType>
                            <xsl:value-of select = "$rateType_para"/>
                        </rateType>
                        <rateAmountQualifier>901</rateAmountQualifier>
                    </tariffInfo>
                    <tariffInfo>
                        <rateAmount>732.98</rateAmount>
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
    </xsl:template>
</xsl:stylesheet>
