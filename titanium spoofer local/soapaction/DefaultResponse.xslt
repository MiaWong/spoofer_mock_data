<?xml version="1.0"?>
<xsl:stylesheet
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
    xmlns:xalan = "http://xml.apache.org/xalan"
    xmlns:soapenv = "http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:rcar = "http://xml.amadeus.com/RCARRQ_14_3_1A"
    xmlns:rcfa = "http://xml.amadeus.com/RCFARQ_05_2_1A"
    xmlns:pnra = "http://xml.amadeus.com/PNRADD_11_1_1A"
    xmlns:rcss = "http://xml.amadeus.com/RCSSCQ_10_1_1A"
    xmlns:rcfs = "http://xml.amadeus.com/RCFSRQ_05_2_1A"
    xmlns:pnrr = "http://xml.amadeus.com/PNRRET_11_1_1A"
    xmlns:pnrx = "http://xml.amadeus.com/PNRXCL_11_1_1A"
    xmlns:hsfr = "http://xml.amadeus.com/HSFREQ_06_2_1A"
    xmlns:tdbi = "http://xml.amadeus.com/TDBIUQ_11_1_1A"
    xmlns:asm = "urn:expedia:amdsessionmanager:datacontract:v1_0_0"
    xmlns:addressing = "http://www.w3.org/2005/08/addressing"
    xmlns:air = "urn:expedia:supply:provider:air:v1"
    xmlns:i = "http://www.w3.org/2001/XMLSchema-instance"
    xmlns:awsse = "http://xml.amadeus.com/2010/06/Session_v3"
    exclude-result-prefixes = "xalan"
    version = "1.0">
    <xsl:import href = "urn:Car_Availability.xslt"/>
    <xsl:import href = "urn:Car_RateInformationFromAvailability.xslt"/>
    <xsl:import href = "urn:Car_RateInformationFromCarSegment.xslt"/>
    <xsl:import href = "urn:Car_Sell.xslt"/>
    <xsl:import href = "urn:PNR_AddMultiElements.xslt"/>
    <xsl:import href = "urn:PNR_Retrieve.xslt"/>
    <xsl:import href = "urn:PNR_Cancel.xslt"/>
    <xsl:import href = "urn:Command_Cryptic.xslt"/>
    <xsl:import href = "urn:PAY_ManageDBIData.xslt"/>
    <xsl:import href = "urn:Car_LocationList.xslt"/>
    <xsl:import href = "urn:BVT_Template.xslt"/>
    <xsl:import href = "urn:Car_Availability_Search.xslt"/>
    <xsl:import href = "urn:Car_Availability_Dynamic.xslt"/>
    <xsl:import href = "urn:PNR_AddMultiElements_Dynamic.xslt"/>
    <xsl:import href = "urn:Car_RateInformationFromCarSegment_Dynamic.xslt"/>
    <xsl:import href = "urn:Car_Sell_Dynamic.xslt"/>
    <xsl:import href = "urn:Car_RateInformationFromAvailability_Dynamic.xslt"/>
    <xsl:param name = "orig" select = ""/>
    <xsl:template match = "/">
        <xsl:variable name = "rcssVendorCode">
            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:companyIdentification/rcss:companyCode"/>
        </xsl:variable>
        <xsl:variable name = "rcssSIPP">
            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:vehicleInformation/rcss:vehicleRentalNeedType/rcss:vehicleRentalPrefType"/>
        </xsl:variable>
        <xsl:variable name = "sessionID">
            <xsl:value-of select = "/soapenv:Envelope/soapenv:Header/awsse:Session/awsse:SessionId"/>
        </xsl:variable>
        <xsl:variable name = "pickuplocation">
            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:locationInfo[1]/rcss:locationDescription/rcss:name"/>
        </xsl:variable>
        <xsl:variable name = "dropofflocation">
            <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:locationInfo[2]/rcss:locationDescription/rcss:name"/>
        </xsl:variable>
        <xsl:variable name = "roundTripBoolean">
            <xsl:choose>
                <xsl:when test = "$pickuplocation=$dropofflocation">1</xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <soapenv:Envelope xmlns:soapenv = "http://schemas.xmlsoap.org/soap/envelope/" xmlns:awsse = "http://xml.amadeus.com/2010/06/Session_v3" xmlns:awsl = "http://wsdl.amadeus.com/2010/06/ws/Link_v1" xmlns:addressing = "http://www.w3.org/2005/08/addressing" xmlns:xsd = "http://www.w3.org/2001/XMLSchema" xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance">
            <soapenv:Header>
                <addressing:To>http://www.w3.org/2005/08/addressing/anonymous</addressing:To>
                <addressing:From>
                    <addressing:Address>
                        <xsl:value-of select = "/soapenv:Envelope/soapenv:Header/addressing:To"/>
                    </addressing:Address>
                </addressing:From>
                <addressing:Action>http://webservices.amadeus.com/ABCDEF_12_3_1A</addressing:Action>
                <addressing:MessageID>
                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Header/addressing:MessageID"/>
                </addressing:MessageID>
                <addressing:RelatesTo RelationshipType = "http://www.w3.org/2005/08/addressing/reply">ed5c950c-62dd-423e-bace-888859915fbc</addressing:RelatesTo>
                <awsse:Session TransactionStatusCode = "End">
                    <awsse:SessionId>
                        <xsl:choose>
                            <xsl:when test = "string-length($rcssVendorCode) &gt; 0 and string-length($rcssSIPP) &gt; 0">
                                <xsl:value-of select = "concat($roundTripBoolean,'01F',$rcssVendorCode,$rcssSIPP)"/>
                            </xsl:when>
                            <xsl:when test = "string-length($sessionID) &gt; 0">
                                <xsl:value-of select = "$sessionID"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select = "'001FPN8ACX'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </awsse:SessionId>
                    <awsse:SequenceNumber>1</awsse:SequenceNumber>
                    <awsse:SecurityToken>15EZ6S3LYHUI0DC656TZ2XYZH</awsse:SecurityToken>
                </awsse:Session>
            </soapenv:Header>
            <soapenv:Body>
                <xsl:variable name = "optionCode">
                    <xsl:if test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                        <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements/pnra:pnrActions/pnra:optionCode"/>
                    </xsl:if>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test = "$orig='365464d6-2857-41bb-98f9-01930abcd119'">
                        <xsl:call-template name = "AmadeusSopaFault"/>
                    </xsl:when>
                    <xsl:when test = "$orig='F72D3F90-C4A3-4975-B96A-1071A07725CD'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:call-template name = "PNR_AddElements_GetReservation_UserStory518310"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:variable name = "errorCode">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:loyaltyNumbersList/rcar:discountNumbers/rcar:customerReferenceInfo[last()]/rcar:referenceNumber"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "$errorCode='ErrorCode9005'">
                                        <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode_9005"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode25'">
                                        <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode_25"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode25664'">
                                        <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode_25664"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode10471'">
                                        <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode_10471"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode1935'">
                                        <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode_1935"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode8324'">
                                        <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode_8324"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode12384'">
                                        <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode_12384"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode23380'">
                                        <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode_23380"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode32035'">
                                        <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode_32035"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='24315'">
                                        <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode24315"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "Car_Availability_Default"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:variable name = "errorCode">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability/rcfa:customerInfo/rcfa:customerReferences/rcfa:referenceNumber"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "$errorCode='ErrorCode24315'">
                                        <xsl:call-template name = "Car_RateInformationFromAvailability_ErrorMappingUpgrade_ErrorCode_24315"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode4543'">
                                        <xsl:call-template name = "Car_RateInformationFromAvailability_ErrorMappingUpgrade_ErrorCode_4543"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode600'">
                                        <xsl:call-template name = "Car_RateInformationFromAvailability_ErrorMappingUpgrade_ErrorCode_600"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode9768'">
                                        <xsl:call-template name = "Car_RateInformationFromAvailability_ErrorMappingUpgrade_ErrorCode_9768"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode3973'">
                                        <xsl:call-template name = "Car_RateInformationFromAvailability_ErrorMappingUpgrade_ErrorCode_3973"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode216'">
                                        <xsl:call-template name = "Car_RateInformationFromAvailability_ErrorMappingUpgrade_ErrorCode_216"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode25663'">
                                        <xsl:call-template name = "Car_RateInformationFromAvailability_ErrorMappingUpgrade_ErrorCode_25663"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode17'">
                                        <xsl:call-template name = "Car_RateInformationFromAvailability_ErrorMappingUpgrade_ErrorCode_17"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode440'">
                                        <xsl:call-template name = "Car_RateInformationFromAvailability_ErrorMappingUpgrade_ErrorCode_440"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "Car_RateInformationFromAvailability_Default"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:variable name = "errorCode">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve/retrievalFacts/reservationOrProfileIdentifier/reservation/controlNumber"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "$errorCode='ErrorCode477'">
                                        <xsl:call-template name = "PNR_Retrieve_ErrorMappingUpgrade_ErrorCode_477"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "PNR_Retrieve_Default"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:variable name = "errorCode">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve/pnrr:retrievalFacts/pnrr:reservationOrProfileIdentifier/pnrr:reservation/pnrr:controlNumber"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "$errorCode='ErrorCode477'">
                                        <xsl:call-template name = "PNR_Retrieve_ErrorMappingUpgrade_ErrorCode_477"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode42'">
                                        <xsl:call-template name = "PNR_Retrieve_ErrorMappingUpgrade_ErrorCode_42"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode1929'">
                                        <xsl:call-template name = "PNR_Retrieve_ErrorMappingUpgrade_ErrorCode_1929"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode1938'">
                                        <xsl:call-template name = "PNR_Retrieve_ErrorMappingUpgrade_ErrorCode_1938"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode533'">
                                        <xsl:call-template name = "PNR_Retrieve_ErrorMappingUpgrade_ErrorCode_533"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode15'">
                                        <xsl:call-template name = "PNR_Retrieve_ErrorMappingUpgrade_ErrorCode_15"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode55'">
                                        <xsl:call-template name = "PNR_Retrieve_ErrorMappingUpgrade_ErrorCode_55"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode9678'">
                                        <xsl:call-template name = "PNR_Retrieve_ErrorMappingUpgrade_ErrorCode_9678"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode5'">
                                        <xsl:call-template name = "PNR_Retrieve_ErrorMappingUpgrade_ErrorCode_5"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "PNR_Retrieve_Default"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:variable name = "errorCode">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel/pnrx:reservationInfo/pnrx:reservation/pnrx:controlNumber"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "$errorCode='ErrorCode15'">
                                        <xsl:call-template name = "PNR_Cancel_ErrorMappingUpgrade_ErrorCode_15"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode1'">
                                        <xsl:call-template name = "PNR_Cancel_ErrorMappingUpgrade_ErrorCode_1"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode3006'">
                                        <xsl:call-template name = "PNR_Cancel_ErrorMappingUpgrade_ErrorCode_3006"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode8570'">
                                        <xsl:call-template name = "PNR_Cancel_ErrorMappingUpgrade_ErrorCode_8570"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode55'">
                                        <xsl:call-template name = "PNR_Cancel_ErrorMappingUpgrade_ErrorCode_55"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode1876'">
                                        <xsl:call-template name = "PNR_Cancel_ErrorMappingUpgrade_ErrorCode_1876"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode1929'">
                                        <xsl:call-template name = "PNR_Cancel_ErrorMappingUpgrade_ErrorCode_1929"/>
                                    </xsl:when>
                                    <xsl:when test = "$errorCode='ErrorCode562'">
                                        <xsl:call-template name = "PNR_Cancel_ErrorMappingUpgrade_ErrorCode_562"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "PNR_Cancel_Default"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='977479E0-158A-48C6-8856-7FAEE773BEA5'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:variable name = "speciaEquipPrefs">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:vehicleInformation/rcss:specialEquipPrefs"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "$speciaEquipPrefs = 'LoyaltyCardNumberErrorMapping'">
                                        <xsl:call-template name = "Car_Sell_503350_LoyaltyCardNumberErrorMapping"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--For  UserStroy375139 Insurance rate  edit  by Qiuhua-->
                    <xsl:when test = "$orig='43F55702-7A9C-44C7-B7EC-1F384DB5FCDE'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_UKsite_Standalone_OnAirport_LHRLocation_RoundTrip_ExcessAndLiability_435033"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_UKsite_Standalone_OnAirport_LHRLocation_RoundTrip_ExcessAndLiability_435033"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='367FB920-FEB1-4562-8AAC-1696A1A9884F'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OffAirport_NCLLocation_OneWay_ExcessAndLiability_435035"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRsite_Standalone_OffAirport_NCLLocation_OneWay_ExcessAndLiability_435035"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='661CA231-BF41-4DCD-ADCA-BA6486A33EBB'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OffAirport_NCLLocation_OneWay_ExcessAndLiability_435035"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRsite_Standalone_OffAirport_NCLLocation_OneWay_TariffinfoMissingForExcess_435036"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='E94CACB5-FCEA-4A9A-93B4-2FE98DC8D8CE'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LAX_1068163"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LAX_1068163"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='7A69656F-FC76-4FD0-A401-31835D504FBD'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OffAirport_NCLLocation_OneWay_ExcessAndLiability_435035"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRsite_Standalone_OffAirport_NCLLocation_OneWay_TariffinfoMissingForLiability_435037"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='0DB2AC4A-DDFC-4812-A733-B119FDE7CB8A'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OffAirport_NCLLocation_OneWay_ExcessAndLiability_435035"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRsite_Standalone_OffAirport_NCLLocation_OneWay_NoExcessAndLiability_435039"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='6900051B-8A40-4083-A4E9-54136707655E'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OffAirport_NCLLocation_OneWay_ExcessAndLiability_435035"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRsite_Standalone_OffAirport_NCLLocation_OneWay_Excess_435040"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='75E9A454-5307-4FF5-87A8-D3899DA62F60'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OffAirport_NCLLocation_RoundTrip_Liability_435041"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRsite_Standalone_OffAirport_NCLLocation_RoundTrip_Liability_435041"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--For RateCode: RateCode returned in Amadues response is different with GetCost&Avail -->
                    <xsl:when test = "$orig='6E871BF7-E7B7-44C8-8CA4-B90EE7E5ADAC'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OnAirport_RoundTrip_RateCode_TUID_421351"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--look at the actual Amadeus request that's embedded in the body and call into the correct template -->
                    <xsl:when test = "$orig='a8dda513-52a3-490a-8d04-9361148208d5'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddElements_Reserve_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddElements_Reserve_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddElements_Reserve_11"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddElements_GetReservation_Default"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_Default"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--It's for UserStory 505500: Support agencia send PNR in DBI -->
                    <xsl:when test = "$orig='02f07917-e3ff-4add-afc3-7b0c0ded7a7c'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OnAirport_RoundTrip_528561"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_OnAirport_RoundTrip_528561"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_OnAirport_RoundTrip_528561_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_OnAirport_RoundTrip_528561_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_OnAirport_RoundTrip_528561_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_OnAirport_RoundTrip_528561"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_OnAirport_RoundTrip_528561"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_OnAirport_RoundTrip_528561"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_Default"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--Start Monica's Part -->
                    <!--For User story 499064 - Amadeus SCS Properly handle warnings returned in all messages -->
                    <!--528741	Test Case	Verify Cancel successfully with error returned in SCS response when errorCategory=WEC returned in APCQ response	Monica Liu	Design	-->
                    <xsl:when test = "$orig='02f07917-e3ff-4add-afc3-7b0c0ded7a7d'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--533963	Test Case	Verify Cancel successfully with error returned in SCS response when errorCategory=WEC returned in APRQ response	Monica Liu	Design	-->
                    <!--528742	Test Case	Verify GetReservation successfully with error returned in SCS response when errorCategory=WEC returned in APRQ response	Monica Liu	Design	-->
                    <xsl:when test = "$orig='02f07917-e3ff-4add-afc3-7b0c0ded7a7e'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--528736	Test Case	Verify GetCostAndAvaill successfully with error returned in SCS response when errorCategory=WEC returned in ACAQ response	Monica Liu	Design	-->
                    <!--528734	Test Case	Verify searchl successfully with error returned in SCS response when errorCategory=WEC returned in ACAQ response	Monica Liu	Design	-->
                    <xsl:when test = "$orig='02f07917-e3ff-4add-afc3-7b0c0ded7a7f'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--528731	Test Case	Verify Getdetail successfully with error returned in SCS response when errorCategory=WEC returned in ARIA response	Monica Liu	Design	-->
                    <xsl:when test = "$orig='02f07917-e3ff-4add-afc3-7b0c0ded7a7g'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--533969	Test Case	Verify GetReservation successfully with error returned in SCS response when errorCategory=WEC returned in ARIS response	Monica Liu	Design	-->
                    <!--533978	Test Case	Verify Reserve successfully with error returned in SCS response when errorCategory=WEC returned in ARIS response	Monica Liu	Design -->
                    <xsl:when test = "$orig='02f07917-e3ff-4add-afc3-7b0c0ded7a7h'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--533979	Test Case	Verify Reserve successfully with error returned in SCS response when errorCategory=WEC returned in ADBI response	Monica Liu	Design	-->
                    <xsl:when test = "$orig='02f07917-e3ff-4add-afc3-7b0c0ded7a7i'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--533977	Test Case	Verify Reserve successfully with error returned in SCS response when errorCategory=WEC returned in APAM response	Monica Liu	Design	-->
                    <xsl:when test = "$orig='02f07917-e3ff-4add-afc3-7b0c0ded7a7j'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--533980	Test Case	Verify Reserve successfully with error returned in SCS response when errorCategory=WEC returned in APCM response	Monica Liu	Design	-->
                    <xsl:when test = "$orig='02f07917-e3ff-4add-afc3-7b0c0ded7a7k'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--Test Case	Verify Reserve successfully with error returned in SCS response when errorCategory=WEC returned in CarSEll response	Monica Liu	Design	-->
                    <xsl:when test = "$orig='02f07917-e3ff-4add-afc3-7b0c0ded7a7m'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--End User story 499064 -->
                    <!--End Monica's Part -->
                    <!--Meichun's part-->
                    <xsl:when test = "$orig='9d28e995-8ed0-462b-a06f-4b67101b95cc'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_NoPictureReturnInSearch_TUID_490678"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_NoPictureReturnInSearch_TUID_490678"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='68f3eaed-66e3-4b87-bf0e-9be6839abd8f'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ddede6b1-5df6-4deb-9bde-1b1ca5926d07'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Rountrip_Pickup_MulPhoneBlock_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Rountrip_Pickup_MulPhoneBlock_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='5f5ce86b-aec8-499c-b03d-a533e12edcd3'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Rountrip_Pickup_NoPhoneBlock_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Rountrip_Pickup_NoPhoneBlock_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='36795b63-e170-47bf-be62-e5a5d90c92d6'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Rountrip_PickupDropoff_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Rountrip_PickupDropoff_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='3f62dc29-78b6-4d2c-933b-2ab4570afb56'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Rountrip_PickupDropoff_MulPhoneNum_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Rountrip_PickupDropoff_MulPhoneNum_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='47aac49c-f81e-4c21-9292-c9a6e443601c'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Rountrip_PickupDropoff_NoPhoneNum_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Rountrip_PickupDropoff_NoPhoneNum_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Rountrip_Pickup_TUID_455527"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='cb0978f2-4482-4125-96f8-72b0a8c93a58'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='5c78e867-be91-4edd-bb39-96b684f9be7a'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Oneway_PickupDropoff_Fax_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Oneway_PickupDropoff_Fax_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--UserStory4887705_BookingNoticeError_CarSellWarning_Evoucher_successed-->
                    <xsl:when test = "$orig='1EFA153D-1782-4732-8DCA-322AB5497339'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_11"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRsite_Standalone_OffAirport_RoundTrip_NCL_eVoucher_Error_8276"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Successed"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--UserStory4887705_BookingNoticeError_CarSellWarning_Evoucher_failed-->
                    <xsl:when test = "$orig='1EFA153D-1782-4732-8DCA-322AB5497341'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_11"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRsite_Standalone_OffAirport_RoundTrip_NCL_eVoucher_Error_8276"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--UserStory4887705_BookingNoticeError_NoCarSellWarning_Evoucher_failed-->
                    <xsl:when test = "$orig='1EFA153D-1782-4732-8DCA-322AB5497342'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_11"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRsite_Standalone_OffAirport_RoundTrip_NCL_NoWarning"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='22c87337-9657-4d7c-9a54-5e0c2b86e756'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Oneway_PickupDropoff_NoPhoneNumber_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Oneway_PickupDropoff_NoPhoneNumber_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='9581c3ea-c948-4112-97ca-a1530d8dbfd5'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Oneway_PickupDropoff_NoPhoneBlock_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Oneway_PickupDropoff_NoPhoneBlock_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='f0e54271-9a46-4348-8c2a-7dc4d65fe080'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Oneway_PickupDropoff_MulPhoneBlock_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Oneway_PickupDropoff_MulPhoneBlock_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='d8073cf4-689e-4687-bd1f-5eb1d5dc07fa'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Oneway_Pickup_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Oneway_Pickup_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='12047bdc-9b5a-41fb-beb7-d81d8e6a0462'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Oneway_Dropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Oneway_Dropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='b79d685f-cb07-486c-b6c6-563cd41c6e8c'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_AgencyPhoneNumber__Oneway_Dropoff_MulPhoneNum_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_AgencyPhoneNumber__Oneway_Dropoff_MulPhoneNum_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_AgencyPhoneNumber__Oneway_PickupDropoff_TUID_455529"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--End of Meichun's part-->
                    <xsl:when test = "$orig='38EE65BB-244A-45F5-845E-8650102CCFAC'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_281432_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_281432_11"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_281432_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:variable name = "speciaEquipPrefs">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:vehicleInformation/rcss:specialEquipPrefs"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "$speciaEquipPrefs= '474814'">
                                        <xsl:call-template name = "Car_Sell_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_474814"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "Car_Sell_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_281432"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_ITAsite_Standalone_OffAirport_OneWay_VCE_TUID_281432"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='A3FC4112-C647-4EBB-AD0C-F207C6D6F7FA'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474792_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474792_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474792_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:variable name = "speciaEquipPrefs">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:vehicleInformation/rcss:specialEquipPrefs"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "$speciaEquipPrefs='474794'">
                                        <xsl:call-template name = "Car_Sell_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474794"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "Car_Sell_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474792"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474792"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--<xsl:when test="$orig='5C01FAD1-44DF-4F34-8D26-B8225E110FC7'">
                    <xsl:choose>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                    <xsl:call-template name="Car_Availability_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_0Err_TUID_207147"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                    <xsl:call-template name="Car_RateInformationFromAvailability_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_0Err_TUID_207147"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                    <xsl:if test="$optionCode='0'">
                    <xsl:call-template name="PNR_AddElements_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_0Err_TUID_207147_0"/>
                    </xsl:if>
                    <xsl:if test="$optionCode='10'">
                    <xsl:call-template name="PNR_AddElements_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_0Err_TUID_207147_10"/>
                    </xsl:if>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                    <xsl:call-template name="Car_Sell_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_0Err_TUID_207147"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                    <xsl:call-template name="Car_RateInformationFromCarSegment_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_0Err_TUID_207147"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                    <xsl:call-template name="PNR_Retrieve_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_0Err_TUID_207147"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/pnrr:PNR_Cancel">
                    <xsl:call-template name="PNR_Cancel_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_0Err_TUID_207147"/>
                    </xsl:when>
                    </xsl:choose>
                    </xsl:when>
                    
                    <xsl:when test="$orig='6D01ABD1-44DF-4F34-8D26-ABC25E110FC43'">
                    <xsl:choose>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                    <xsl:call-template name="Car_Availability_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420084"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                    <xsl:call-template name="Car_RateInformationFromAvailability_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420084"/>
                    </xsl:when>
                    </xsl:choose>
                    </xsl:when>
                    
                    <xsl:when test="$orig='7C01FAD1-FD44-4F34-8D26-CBA25E110FC7'">
                    <xsl:choose>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                    <xsl:call-template name="Car_Availability_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420086"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                    <xsl:call-template name="Car_RateInformationFromAvailability_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420086"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                    <xsl:if test="$optionCode='0'">
                    <xsl:call-template name="PNR_AddElements_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420086_0"/>
                    </xsl:if>
                    <xsl:if test="$optionCode='10'">
                    <xsl:call-template name="PNR_AddElements_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420086_10"/>
                    </xsl:if>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                    <xsl:call-template name="Car_Sell_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_4200867"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                    <xsl:call-template name="Car_RateInformationFromCarSegment_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420086"/>
                    </xsl:when>
                    </xsl:choose>
                    </xsl:when>
                    
                    <xsl:when test="$orig='8C01FAD1-44DF-4F34-8D26-ABC25E110FC5'">
                    <xsl:choose>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                    <xsl:call-template name="Car_Availability_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420087"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                    <xsl:call-template name="Car_RateInformationFromAvailability_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420087"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                    <xsl:if test="$optionCode='0'">
                    <xsl:call-template name="PNR_AddElements_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420087_0"/>
                    </xsl:if>
                    <xsl:if test="$optionCode='10'">
                    <xsl:call-template name="PNR_AddElements_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420087_10"/>
                    </xsl:if>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                    <xsl:call-template name="Car_Sell_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420087"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                    <xsl:call-template name="Car_RateInformationFromCarSegment_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420087"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                    <xsl:call-template name="PNR_Retrieve_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420087"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/pnrr:PNR_Cancel">
                    <xsl:call-template name="PNR_Cancel_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420087"/>
                    </xsl:when>
                    </xsl:choose>
                    </xsl:when>                                    
                    <xsl:when test="$orig='9C01FAD1-44DF-4F34-8D26-ABC25E110FC6'">
                    <xsl:choose>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                    <xsl:call-template name="Car_Availability_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420088"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                    <xsl:call-template name="Car_RateInformationFromAvailability_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420088"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                    <xsl:if test="$optionCode='0'">
                    <xsl:call-template name="PNR_AddElements_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420088_0"/>
                    </xsl:if>
                    <xsl:if test="$optionCode='10'">
                    <xsl:call-template name="PNR_AddElements_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420088_10"/>
                    </xsl:if>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                    <xsl:call-template name="Car_Sell_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420088"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                    <xsl:call-template name="Car_RateInformationFromCarSegment_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420088"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                    <xsl:call-template name="PNR_Retrieve_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420088"/>
                    </xsl:when>
                    <xsl:when test="/soapenv:Envelope/soapenv:Body/pnrr:PNR_Cancel">
                    <xsl:call-template name="PNR_Cancel_UKsite_Standalone_OnAirport_RoundTrip_UKLocation_Error_TUID_420088"/>
                    </xsl:when>
                    </xsl:choose>
                    </xsl:when>
                    -->
                    <xsl:when test = "$orig='491A98BD-EC25-407D-84BD-10A01ABCD006'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "ACAQ_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "ARIA_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR0_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR10_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR20_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:variable name = "speciaEquipPrefs">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:vehicleInformation/rcss:specialEquipPrefs"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "$speciaEquipPrefs = 'LoyaltyCardNumberErrorMapping'">
                                        <xsl:call-template name = "Car_Sell_503350_LoyaltyCardNumberErrorMapping"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "CarSell_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "ARIS_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "Retireve_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Cancel">
                                <xsl:call-template name = "Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='022b6f92-c179-4d0a-9605-de1cbf1dfb4e'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_ErrorMappingUpgrade_ErrorCode_15"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='491A98BD-EC25-407D-84BD-10A01ABCD112'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "ACAQ_Amadeus_UK_MultipleCDCode_onAirport_roundTrip"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='491A98BD-EC25-407D-84BD-10A01ABCD113'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "ACAQ_EVoucher_Amadeus_FR_Agency_oneWay"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "ARIA_EVoucher_Amadeus_FR_Agency_oneWay"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR0_EVoucher_Amadeus_FR_Agency_oneWay"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR11_EVoucher_Amadeus_FR_Agency_oneWay"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR20_EVoucher_Amadeus_FR_Agency_oneWay"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "CarSell_EVoucher_Amadeus_FR_Agency_oneWay"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "ARIS_EVoucher_Amadeus_FR_Agency_oneWay"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "Retrieve_EVoucher_Amadeus_FR_Agency_oneWay"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "Retrieve_EVoucher_Amadeus_FR_Agency_oneWay"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_EVoucher_Amadeus_FR_Agency_oneWay"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='9a1a4bd9-2f88-4dc0-9276-2426593bb971'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeSpecailEquipment_TUID_333616"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='e2bfd5fe-83cd-4444-8d34-cfd384440609'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_OMSReserve_TwoTraveler_DigitalFirstNameInFirstTraveler_TUID_503354"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_OMSReserve_TwoTraveler_DigitalFirstNameInFirstTraveler_TUID_503354"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_OMSReserve_TwoTraveler_DigitalFirstNameInFirstTraveler_TUID_503354_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_OMSReserve_TwoTraveler_DigitalFirstNameInFirstTraveler_TUID_503354_10"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_OMSReserve_TwoTraveler_DigitalFirstNameInFirstTraveler_TUID_503354"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_OMSReserve_TwoTraveler_DigitalFirstNameInFirstTraveler_TUID_503354"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='55712df3-7d46-459c-9431-2127ce0e786a'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_CollectionLocation_CityNameErrorMapping_TUID_514146"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ad76219c-b8ab-429a-b7e0-e098ecbead15'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST01_Crypto_Decrypted_CCGuaranteeBillingCode_TUID_333612"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Successed"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST01_Crypto_Decrypted_CCGuaranteeBillingCode_TUID_333612"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST01_Crypto_Decrypted_CCGuaranteeBillingCode_TUID_333612_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST01_Crypto_Decrypted_CCGuaranteeBillingCode_TUID_333612_11"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST01_Crypto_Decrypted_CCGuaranteeBillingCode_TUID_333612_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST01_Crypto_Decrypted_CCGuaranteeBillingCode_TUID_333612"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST01_Crypto_Decrypted_CCGuaranteeBillingCode_TUID_333612"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST01_Crypto_Decrypted_CCGuaranteeBillingCode_TUID_333612"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST01_Crypto_Decrypted_CCGuaranteeBillingCode_TUID_333612"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST01_Crypto_Decrypted_CCGuaranteeBillingCode_TUID_333612"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST01_Crypto_Decrypted_CCGuaranteeBillingCode_TUID_333612"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='31d38e57-ab4e-4202-837a-5ed11ea155a9'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SCS_Off_RoundTrip_InvalidLengthOnOption_LEHT02_TFS_198660_InvalidLengthOnOption_XXX_TUID_198660"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_Off_RoundTrip_InvalidLengthOnOption_LEHT02_TFS_198660_InvalidLengthOnOption_XXX_TUID_198660_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_Off_RoundTrip_InvalidLengthOnOption_LEHT02_TFS_198660_InvalidLengthOnOption_XXX_TUID_198660_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SCS_Off_RoundTrip_InvalidLengthOnOption_LEHT02_TFS_198660_InvalidLengthOnOption_XXX_TUID_198660"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='49b6e45b-0c73-4601-b4ce-f4d23dafbbc6'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SCS_Off_RoundTrip_InvalidPickupDate_AGPT01_TFS_198647_InvalidPickupDate_TUID_198647"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='91d87b67-75a9-4a2d-9548-f018596ac8d3'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SCS_Off_RoundTrip_InvalidDropoffDate_LEHC02_TFS_198648_InvalidDropoffDate_TUID_198648"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='8a8400a6-06d1-4ded-add1-a361f5c2922c'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SCS_Off_Oneway_InvalidLocationType_LEHC02_TFS_203299_InvalidLocationType_TUID_203299"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='9276b0f6-840f-4c1b-8661-5e29839d509c'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SCS_Off_RoundTrip_ClosedAtTimeOfDayRequest_LEHC02_TFS_198658_LocationClosedAtArriveDay_Time_TUID_198658"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_Off_RoundTrip_ClosedAtTimeOfDayRequest_LEHC02_TFS_198658_LocationClosedAtArriveDay_Time_TUID_198658_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_Off_RoundTrip_ClosedAtTimeOfDayRequest_LEHC02_TFS_198658_LocationClosedAtArriveDay_Time_TUID_198658_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SCS_Off_RoundTrip_ClosedAtTimeOfDayRequest_LEHC02_TFS_198658_LocationClosedAtArriveDay_Time_TUID_198658"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='e3b3ce80-e446-445c-82bd-c45dc032348b'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SCS_On_RoundTrip_RateCodeNotAvaliable_LEHT02_TFS_198663_RateCodeNotAvaliable_TUID_198663"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_On_RoundTrip_RateCodeNotAvaliable_LEHT02_TFS_198663_RateCodeNotAvaliable_TUID_198663_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_On_RoundTrip_RateCodeNotAvaliable_LEHT02_TFS_198663_RateCodeNotAvaliable_TUID_198663_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SCS_On_RoundTrip_RateCodeNotAvaliable_LEHT02_TFS_198663_RateCodeNotAvaliable_TUID_198663"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='21c52a26-d5e9-4db1-8e22-601ecebf18c0'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_Off_Oneway_CheckTransactionParameter_LEHC02_TFS_198664_CheckTransactionParameter_TUID_198664_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_Off_Oneway_CheckTransactionParameter_LEHC02_TFS_198664_CheckTransactionParameter_TUID_198664_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SCS_Off_Oneway_CheckTransactionParameter_LEHC02_TFS_198664_CheckTransactionParameter_TUID_198664"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SCS_Off_Oneway_CheckTransactionParameter_LEHC02_TFS_198664_CheckTransactionParameter_TUID_198664"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='8abe6abe-0da1-447c-aaa7-de4c4bf05ac0'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_ASCS_Off_RoundTrip_CarCompanyNotAtLocation_LEHC02_TFS_198646_CarCompanyNotAtLocation_TUID_90701"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_ASCS_Off_RoundTrip_CarCompanyNotAtLocation_LEHC02_TFS_198646_CarCompanyNotAtLocation_TUID_90701_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_ASCS_Off_RoundTrip_CarCompanyNotAtLocation_LEHC02_TFS_198646_CarCompanyNotAtLocation_TUID_90701_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_ASCS_Off_RoundTrip_CarCompanyNotAtLocation_LEHC02_TFS_198646_CarCompanyNotAtLocation_TUID_90701"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='204a0d10-195c-45e2-b9cb-44f2c71ae6cf'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SCS_Off_Oneway_InvalidBillingNumber_LEHC02_TFS_287905_InvalidBillingNumber_TUID_287905"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_Off_Oneway_InvalidBillingNumber_LEHC02_TFS_287905_InvalidBillingNumber_TUID_287905_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_Off_Oneway_InvalidBillingNumber_LEHC02_TFS_287905_InvalidBillingNumber_TUID_287905_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_Off_Oneway_InvalidBillingNumber_LEHC02_TFS_287905_InvalidBillingNumber_TUID_287905_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SCS_Off_Oneway_InvalidBillingNumber_LEHC02_TFS_287905_InvalidBillingNumber_TUID_287905"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_SCS_Off_Oneway_InvalidBillingNumber_LEHC02_TFS_287905_InvalidBillingNumber_TUID_287905"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_SCS_Off_Oneway_InvalidBillingNumber_LEHC02_TFS_287905_InvalidBillingNumber_TUID_287905"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='b014d33b-526c-4f1c-8ddf-13d3042e187a'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SCS_Off_Oneway_InvalidSpecialEquipmentcode_LEHC02_TFS_287918_InvalidSpecialEquipmentcode_TUID_287918"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_Off_Oneway_InvalidSpecialEquipmentcode_LEHC02_TFS_287918_InvalidSpecialEquipmentcode_TUID_287918_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SCS_Off_Oneway_InvalidSpecialEquipmentcode_LEHC02_TFS_287918_InvalidSpecialEquipmentcode_TUID_287918_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SCS_Off_Oneway_InvalidSpecialEquipmentcode_LEHC02_TFS_287918_InvalidSpecialEquipmentcode_TUID_287918"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='da3ceba5-ea00-4316-bd96-629e7ea41df4'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_ASCS_Off_RoundTrip_VehicleTypeFormatError_LEHC02_TFS_198649_CarTypeFormatError_TUID_90702"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_ASCS_Off_RoundTrip_VehicleTypeFormatError_LEHC02_TFS_198649_CarTypeFormatError_TUID_90702_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_ASCS_Off_RoundTrip_VehicleTypeFormatError_LEHC02_TFS_198649_CarTypeFormatError_TUID_90702_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_ASCS_Off_RoundTrip_VehicleTypeFormatError_LEHC02_TFS_198649_CarTypeFormatError_TUID_90702"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='3c778cd6-b899-4c1b-94ae-f64d75cb3813'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_2213_TUID_486357"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_2213_TUID_486357_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_2213_TUID_486357_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:variable name = "speciaEquipPrefs">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:vehicleInformation/rcss:specialEquipPrefs"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "substring( $speciaEquipPrefs, 1, 3 ) = 'EH_'">
                                        <xsl:variable name = "tmpErrorCode">
                                            <xsl:value-of select = "substring( $speciaEquipPrefs, 4, 5)"/>
                                        </xsl:variable>
                                        <xsl:call-template name = "Car_Sell_ErrorHandling">
                                            <xsl:with-param name = "errorCode">
                                                <xsl:value-of select = "$tmpErrorCode"/>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_2213_TUID_486357"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='4f9a8bce-0a66-45fe-a474-0e4fc29b29a4'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_PHXENTERCOST_10192_31_TUID_486356"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_PHXENTERCOST_10192_31_TUID_486356_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_PHXENTERCOST_10192_31_TUID_486356_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_PHXENTERCOST_10192_31_TUID_486356"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='426643d7-4f0a-49de-8541-ad1546684a35'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_NATIONAL_10192_32_TUID_486354"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_NATIONAL_10192_32_TUID_486354_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_NATIONAL_10192_32_TUID_486354_10"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_NATIONAL_10192_32_TUID_486354"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_NATIONAL_10192_32_TUID_486354"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='85230fec-fb71-475d-8539-53fc45841335'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_PASACCEPTEES_10192_30_TUID_486353"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_PASACCEPTEES_10192_30_TUID_486353_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_PASACCEPTEES_10192_30_TUID_486353_10"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_PASACCEPTEES_10192_30_TUID_486353"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_testCarAmaduesSCSReserve_ErrorMapping_PASACCEPTEES_10192_30_TUID_486353"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='83ad0ba5-389a-481e-abe9-f912c5c4828d'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='0e764ae9-60dd-4105-b670-fb3b87cb33f2'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='0e2bdca8-d9cf-401f-a76b-8b81a0362fd5'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='4141fcd8-e393-4dbb-a161-c8ee2969ff60'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='9a0b986b-a9a7-48f9-8533-eca4fd7127ae'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Montyly_TUID_207188"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Montyly_TUID_207188"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Montyly_TUID_207188_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Montyly_TUID_207188_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Montyly_TUID_207188_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Montyly_TUID_207188"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Montyly_TUID_207188"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Montyly_TUID_207188"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Montyly_TUID_207188"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Montyly_TUID_207188"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Montyly_TUID_207188"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='9983137a-499e-4fef-b7f6-ca82478724be'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_SpecialEquipmentFee_401732"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_SpecialEquipmentFee_401732"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_SpecialEquipmentFee_401732_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_SpecialEquipmentFee_401732_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_SpecialEquipmentFee_401732_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_SpecialEquipmentFee_401732"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_SpecialEquipmentFee_401732"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_SpecialEquipmentFee_401732"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_SpecialEquipmentFee_401732"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_SpecialEquipmentFee_401732"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_SpecialEquipmentFee_401732"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='b95d5992-6793-4c76-a9d8-291b5a7d01d0'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_Weekly_TUID_207184"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_Weekly_TUID_207184"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_Weekly_TUID_207184_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_Weekly_TUID_207184_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_Weekly_TUID_207184_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_Weekly_TUID_207184"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_Weekly_TUID_207184"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_Weekly_TUID_207184"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_Weekly_TUID_207184"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_Weekly_TUID_207184"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_Weekly_TUID_207184"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='d8b5e27f-7a6d-480d-b7db-2b9a859bee8b'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OffAirport_NCELYS_OneDay_TUID_207182"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OffAirport_NCELYS_OneDay_TUID_207182"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_NCELYS_OneDay_TUID_207182_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_NCELYS_OneDay_TUID_207182_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_NCELYS_OneDay_TUID_207182_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OffAirport_NCELYS_OneDay_TUID_207182"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OffAirport_NCELYS_OneDay_TUID_207182"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_NCELYS_OneDay_TUID_207182"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_NCELYS_OneDay_TUID_207182"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OffAirport_NCELYS_OneDay_TUID_207182"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OffAirport_NCELYS_OneDay_TUID_207182"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='881615b7-f183-4f98-b513-a79a82d35181'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_3Days_TUID_207144"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='8760c84c-118a-471e-8c64-2499c4b9824f'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_SpecialEquipment_TUID_207165"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_SpecialEquipment_TUID_207165"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_SpecialEquipment_TUID_207165_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_SpecialEquipment_TUID_207165_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_SpecialEquipment_TUID_207165_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_SpecialEquipment_TUID_207165"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_SpecialEquipment_TUID_207165"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_SpecialEquipment_TUID_207165"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_SpecialEquipment_TUID_207165"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_SpecialEquipment_TUID_207165"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_SpecialEquipment_TUID_207165"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='3420ea34-64f0-4621-bba2-1c60ff097402'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_455528"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_455528"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_455528_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_455528_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_455528_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_455528"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_455528"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_455528"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_455528"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_455528"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_455528"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='5c2e7071-72fd-45d7-a103-8a49627ec5ed'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_ASCS_Standalone_on_oneWay_UK_MultipleCDcode_VLC_EPWithCDCode_TUID_266102"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_ASCS_Standalone_on_oneWay_UK_MultipleCDcode_VLC_EPWithCDCode_TUID_266102"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_ASCS_Standalone_on_oneWay_UK_MultipleCDcode_VLC_EPWithCDCode_TUID_266102_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_ASCS_Standalone_on_oneWay_UK_MultipleCDcode_VLC_EPWithCDCode_TUID_266102_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_ASCS_Standalone_on_oneWay_UK_MultipleCDcode_VLC_EPWithCDCode_TUID_266102_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_ASCS_Standalone_on_oneWay_UK_MultipleCDcode_VLC_EPWithCDCode_TUID_266102"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_ASCS_Standalone_on_oneWay_UK_MultipleCDcode_VLC_EPWithCDCode_TUID_266102"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_ASCS_Standalone_on_oneWay_UK_MultipleCDcode_VLC_EPWithCDCode_TUID_266102"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_ASCS_Standalone_on_oneWay_UK_MultipleCDcode_VLC_EPWithCDCode_TUID_266102"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_ASCS_Standalone_on_oneWay_UK_MultipleCDcode_VLC_EPWithCDCode_TUID_266102"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_ASCS_Standalone_on_oneWay_UK_MultipleCDcode_VLC_EPWithCDCode_TUID_266102"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='8fc10758-527b-4fd6-aabe-5706a0da65c0'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_CD_14-51354174_239133"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_CD_14-51354174_239133"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_CD_14-51354174_239133_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_CD_14-51354174_239133_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_CD_14-51354174_239133_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_CD_14-51354174_239133"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_CD_14-51354174_239133"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_CD_14-51354174_239133"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_CD_14-51354174_239133"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_CD_14-51354174_239133"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_CD_14-51354174_239133"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ec829667-03e8-4593-a261-edfb55bd689c'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_239136"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_239136"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_239136_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_239136_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_239136_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_239136"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_239136"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_239136"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_239136"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_239136"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_239136"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='debcb709-8cdd-44ae-b867-922c73d0cc24'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OffAirport_PlaceIDCollecion_239134"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OffAirport_PlaceIDCollecion_239134"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_PlaceIDCollecion_239134_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_PlaceIDCollecion_239134_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_PlaceIDCollecion_239134_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OffAirport_PlaceIDCollecion_239134"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OffAirport_PlaceIDCollecion_239134"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_PlaceIDCollecion_239134"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_PlaceIDCollecion_239134"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OffAirport_PlaceIDCollecion_239134"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OffAirport_PlaceIDCollecion_239134"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='0cf25bb0-1f26-46fd-82e4-225ad6d65d2a'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_PlaceIDDelivery_239137"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_PlaceIDDelivery_239137"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_PlaceIDDelivery_239137_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_PlaceIDDelivery_239137_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_PlaceIDDelivery_239137_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_PlaceIDDelivery_239137"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_PlaceIDDelivery_239137"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_PlaceIDDelivery_239137"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_PlaceIDDelivery_239137"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_PlaceIDDelivery_239137"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_CD_41-N865556_PlaceIDDelivery_239137"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='742f1846-1de2-4313-a4af-49abfc5d687e'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='82ece231-c16c-4ffa-b7c6-9666bde973eb'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='5019999b-a2d1-46e9-9709-7c1bf7d37951'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='491f7874-9b64-4677-9f8b-3298bcf946c9'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_TUID_477362"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_TUID_477362"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_TUID_477362_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_TUID_477362_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_TUID_477362_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_TUID_477362"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_TUID_477362"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_TUID_477362"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_TUID_477362"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_TUID_477362"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_TUID_477362"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='01730284-7965-4148-90c4-053ea503d837'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_CSI_TUID_477373"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_CSI_TUID_477373"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_CSI_TUID_477373_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_CSI_TUID_477373_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_CSI_TUID_477373_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_CSI_TUID_477373"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_CSI_TUID_477373"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_CSI_TUID_477373"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_CSI_TUID_477373"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_CSI_TUID_477373"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_CSI_TUID_477373"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='525327f4-fedb-46c4-a651-6836941ba932'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SCS_Off_Oneway_InvalidSpecialEquipmentcode_LEHC02_TFS_287918_InvalidSpecialEquipmentcode_TUID_287918"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='525327f4-fedb-46c4-a651-6836941ba931'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_CDG_SpecialEquipment_HCL_CSI_TUID_477367"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='22b82032-f441-4941-a10f-21736ad0b7c1'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_NCELYS_SpecialEquipment_TUID_207164"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_NCELYS_SpecialEquipment_TUID_207164"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_NCELYS_SpecialEquipment_TUID_207164_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_NCELYS_SpecialEquipment_TUID_207164_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_NCELYS_SpecialEquipment_TUID_207164_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_NCELYS_SpecialEquipment_TUID_207164"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_NCELYS_SpecialEquipment_TUID_207164"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_NCELYS_SpecialEquipment_TUID_207164"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_NCELYS_SpecialEquipment_TUID_207164"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_NCELYS_SpecialEquipment_TUID_207164"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_NCELYS_SpecialEquipment_TUID_207164"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='4b2b81da-a5e1-4fab-9ed8-a2b7cfe7be8f'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Reserved_TUID_207189"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Reserved_TUID_207189"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Reserved_TUID_207189_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Reserved_TUID_207189_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Reserved_TUID_207189_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Reserved_TUID_207189"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Reserved_TUID_207189"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Reserved_TUID_207189"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Reserved_TUID_207189"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Reserved_TUID_207189"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Reserved_TUID_207189"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='9555fe95-2743-4040-897e-24a69d72f67a'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_EPCDCode_TUID_297633"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_EPCDCode_TUID_297633"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_EPCDCode_TUID_297633_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_EPCDCode_TUID_297633_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_EPCDCode_TUID_297633_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_EPCDCode_TUID_297633"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_EPCDCode_TUID_297633"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_EPCDCode_TUID_297633"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_EPCDCode_TUID_297633"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_EPCDCode_TUID_297633"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_EPCDCode_TUID_297633"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='bd1db1ed-ee58-4027-80e1-921ab202122d'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:variable name = "uniqueReference">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment/rcfs:bookingIdentifier/rcfs:uniqueReference"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "$uniqueReference='1'">
                                        <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628_1"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628_2"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628_1"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_TUID_276628"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='aed3834f-bf6c-4f0a-b8a5-f626cf7a3439'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='36a6ed90-ec60-4a94-8390-37dae33b3bc7'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='27431e79-46eb-4f85-9432-271b8f98b8d6'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='b4ec5e62-b5d6-4b72-b5a7-05fec8d52f79'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436_11"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_ZE_10"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='be5a1fbe-1925-474a-9e3f-c6f2cfc05ceb'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_Daily_281499"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_Daily_281499"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_Daily_281499_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_Daily_281499_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_Daily_281499_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_Daily_281499"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_Daily_281499"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_Daily_281499"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_Daily_281499"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_Daily_281499"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_Daily_281499"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='08338ecc-0988-4118-b3e7-3b83de9a23a7'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_Weekly_281502"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_Weekly_281502"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_Weekly_281502_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_Weekly_281502_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_Weekly_281502_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_Weekly_281502"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_Weekly_281502"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_Weekly_281502"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_Weekly_281502"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_Weekly_281502"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_Weekly_281502"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='c337e621-c581-40ea-a478-1ef1c033b5d7'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_WeeklyExtraDay_281503"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_WeeklyExtraDay_281503"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_WeeklyExtraDay_281503_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_WeeklyExtraDay_281503_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_WeeklyExtraDay_281503_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_WeeklyExtraDay_281503"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_WeeklyExtraDay_281503"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_WeeklyExtraDay_281503"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_WeeklyExtraDay_281503"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_WeeklyExtraDay_281503"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_WeeklyExtraDay_281503"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='72853396-e9b0-406e-ab15-5a4545beed04'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_AirFlight_281504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_AirFlight_281504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_AirFlight_281504_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_AirFlight_281504_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_AirFlight_281504_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_AirFlight_281504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_AirFlight_281504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_AirFlight_281504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_AirFlight_281504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_AirFlight_281504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_AirFlight_281504"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='fd8354c4-bd63-4bb2-a0aa-2e2d69dd0af0'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_NormalBook_TUID_267977"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_NormalBook_TUID_267977"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_NormalBook_TUID_267977_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_NormalBook_TUID_267977_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_NormalBook_TUID_267977_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_NormalBook_TUID_267977"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_NormalBook_TUID_267977"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_NormalBook_TUID_267977"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_NormalBook_TUID_267977"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_NormalBook_TUID_267977"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_NormalBook_TUID_267977"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='25f3bea6-aca4-4866-88e7-dd963bffa5c8'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_ITA_Standalone_OneWay_OffAirport_TravelerList_281505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_ITA_Standalone_OneWay_OffAirport_TravelerList_281505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_TravelerList_281505_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_TravelerList_281505_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_TravelerList_281505_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_ITA_Standalone_OneWay_OffAirport_TravelerList_281505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_ITA_Standalone_OneWay_OffAirport_TravelerList_281505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_ITA_Standalone_OneWay_OffAirport_TravelerList_281505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_ITA_Standalone_OneWay_OffAirport_TravelerList_281505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_ITA_Standalone_OneWay_OffAirport_TravelerList_281505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_ITA_Standalone_OneWay_OffAirport_TravelerList_281505"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='3593d37a-6451-4168-a604-159e6f08b7e6'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_PreferedRenterNumber_281507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_PreferedRenterNumber_281507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_PreferedRenterNumber_281507_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_PreferedRenterNumber_281507_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_PreferedRenterNumber_281507_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_PreferedRenterNumber_281507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_PreferedRenterNumber_281507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_PreferedRenterNumber_281507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_PreferedRenterNumber_281507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_PreferedRenterNumber_281507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_PreferedRenterNumber_281507"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='fba62f25-8a20-4fa0-901f-b9886218698e'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_SpecialEquip_NVS_281508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_SpecialEquip_NVS_281508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_SpecialEquip_NVS_281508_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_SpecialEquip_NVS_281508_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_SpecialEquip_NVS_281508_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_SpecialEquip_NVS_281508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_SpecialEquip_NVS_281508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_SpecialEquip_NVS_281508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_SpecialEquip_NVS_281508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_SpecialEquip_NVS_281508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_SpecialEquip_NVS_281508"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='d37d3828-9ea6-4ca8-9a21-b1050f895842'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_281058"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_281058"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_281058_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_281058_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_281058_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_281058"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_281058"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_281058"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_281058"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_281058"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_281058"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='cde94263-183d-44fc-88dd-040fbe1235ba'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL__3days_284735"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL__3days_284735"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL__3days_284735_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL__3days_284735_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL__3days_284735_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL__3days_284735"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL__3days_284735"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL__3days_284735"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL__3days_284735"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL__3days_284735"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL__3days_284735"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='85d12819-da69-464f-a392-9c9a8dc45cd6'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_TestScenarioName.Amadeus_ITA_Standalone_OneWay_OffAirport_VCE_321793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_TestScenarioName.Amadeus_ITA_Standalone_OneWay_OffAirport_VCE_321793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_TestScenarioName.Amadeus_ITA_Standalone_OneWay_OffAirport_VCE_321793_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_TestScenarioName.Amadeus_ITA_Standalone_OneWay_OffAirport_VCE_321793_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_TestScenarioName.Amadeus_ITA_Standalone_OneWay_OffAirport_VCE_321793_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_TestScenarioName.Amadeus_ITA_Standalone_OneWay_OffAirport_VCE_321793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_TestScenarioName.Amadeus_ITA_Standalone_OneWay_OffAirport_VCE_321793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_TestScenarioName.Amadeus_ITA_Standalone_OneWay_OffAirport_VCE_321793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_TestScenarioName.Amadeus_ITA_Standalone_OneWay_OffAirport_VCE_321793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_TestScenarioName.Amadeus_ITA_Standalone_OneWay_OffAirport_VCE_321793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_TestScenarioName.Amadeus_ITA_Standalone_OneWay_OffAirport_VCE_321793"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='96dfc5ee-1943-48f8-b870-401fed0b8ade'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OffAirport_NCE_LYS_3days_338486"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OffAirport_NCE_LYS_3days_338486"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_NCE_LYS_3days_338486_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_NCE_LYS_3days_338486_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_NCE_LYS_3days_338486_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OffAirport_NCE_LYS_3days_338486"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OffAirport_NCE_LYS_3days_338486"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_NCE_LYS_3days_338486"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_NCE_LYS_3days_338486"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OffAirport_NCE_LYS_3days_338486"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OffAirport_NCE_LYS_3days_338486"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='31b976b8-3ba1-4aab-bcad-da760e46e535'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_LoyaltyCardNumber_TUID_297637"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_LoyaltyCardNumber_TUID_297637"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_LoyaltyCardNumber_TUID_297637_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_LoyaltyCardNumber_TUID_297637_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_LoyaltyCardNumber_TUID_297637_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_LoyaltyCardNumber_TUID_297637"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_LoyaltyCardNumber_TUID_297637"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_LoyaltyCardNumber_TUID_297637"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_LoyaltyCardNumber_TUID_297637"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_LoyaltyCardNumber_TUID_297637"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_LoyaltyCardNumber_TUID_297637"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='0f75a5d9-b374-40a9-b7b3-4c8db9e3bc82'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_315620"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_315620"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_315620_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_315620_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_315620_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_315620"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_315620"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_315620"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_315620"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_315620"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_315620"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='8ff4c994-c894-4f8b-a4c6-984877effdc0'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_CD_EP51354174_320375"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_CD_EP51354174_320375"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_CD_EP51354174_320375_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_CD_EP51354174_320375_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_CD_EP51354174_320375_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_CD_EP51354174_320375"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_CD_EP51354174_320375"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_CD_EP51354174_320375"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_CD_EP51354174_320375"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_CD_EP51354174_320375"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_CD_EP51354174_320375"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='e40c6984-c417-46cd-bafd-11caa7eb548d'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_BillingC_EP27356081_320376"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_320376"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_BillingC_EP27356081_320376"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_BillingC_EP27356081_320376_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_BillingC_EP27356081_320376_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_BillingC_EP27356081_320376_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_BillingC_EP27356081_320376"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_BillingC_EP27356081_320376"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_BillingC_EP27356081_320376"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_BillingC_EP27356081_320376"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_BillingC_EP27356081_320376"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_Roundtrip_OnAirport_CurrencyConvert_CDG_BillingC_EP27356081_320376"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='6127eb98-9fa2-4b26-86d6-701dba920ca5'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207209"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207209"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207209_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207209_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207209_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207209"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207209"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207209"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207209"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207209"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207209"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='7ebb0ade-7f5b-4a1b-a0bc-532e4a480e32'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_TUID_207208"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_TUID_207208"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_TUID_207208_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_TUID_207208_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_TUID_207208_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_TUID_207208"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_TUID_207208"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_TUID_207208"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_TUID_207208"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_TUID_207208"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_TUID_207208"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='b2c51f7b-14f4-4be6-ae70-a37daa1e29b1'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207212"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207212"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207212_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207212_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207212_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207212"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207212"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207212"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207212"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207212"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207212"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='8a917e01-6269-4f34-a2da-47e3c4a251de'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207211"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207211"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207211_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207211_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207211_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207211"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207211"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207211"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207211"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207211"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_TUID_207211"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='0161eec5-047c-4ae3-8c13-c102a8b65bf9'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_CanceledPNR_TUID_207163"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_CanceledPNR_TUID_207163"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='e87d6470-4ad5-4650-afd8-9510567d9b6e'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_ITA_Standalone_OneWay_OffAirport_NoDetailDuringBook_338480"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_ITA_Standalone_OneWay_OffAirport_NoDetailDuringBook_338480"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_NoDetailDuringBook_338480_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_NoDetailDuringBook_338480_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OffAirport_NoDetailDuringBook_338480_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_ITA_Standalone_OneWay_OffAirport_NoDetailDuringBook_338480"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_ITA_Standalone_OneWay_OffAirport_NoDetailDuringBook_338480"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_ITA_Standalone_OneWay_OffAirport_NoDetailDuringBook_338480"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_ITA_Standalone_OneWay_OffAirport_NoDetailDuringBook_338480"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_ITA_Standalone_OneWay_OffAirport_NoDetailDuringBook_338480"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_ITA_Standalone_OneWay_OffAirport_NoDetailDuringBook_338480"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='d4dcc4f6-3007-4c0c-9a22-4eda82552de2'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OffAirport_DetailDuringBookFail_349525"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OffAirport_DetailDuringBookFail_349525"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_DetailDuringBookFail_349525_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_DetailDuringBookFail_349525_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_DetailDuringBookFail_349525_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OffAirport_DetailDuringBookFail_349525"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OffAirport_DetailDuringBookFail_349525"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_DetailDuringBookFail_349525"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_DetailDuringBookFail_349525"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OffAirport_DetailDuringBookFail_349525"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OffAirport_DetailDuringBookFail_349525"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='3719e4b2-8a02-4ca4-b3f7-d075bb471912'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_GetReservation_TwoTraveler_TUID_458460"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_GetReservation_TwoTraveler_TUID_458460"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_GetReservation_TwoTraveler_TUID_458460_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_GetReservation_TwoTraveler_TUID_458460_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_GetReservation_TwoTraveler_TUID_458460_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_GetReservation_TwoTraveler_TUID_458460"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_GetReservation_TwoTraveler_TUID_458460"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_GetReservation_TwoTraveler_TUID_458460"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_GetReservation_TwoTraveler_TUID_458460"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_GetReservation_TwoTraveler_TUID_458460"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PART01_GetReservation_TwoTraveler_TUID_458460"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='3eb6f865-2f0f-436d-8224-9dad70db77fd'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:variable name = "reference">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment/rcfs:bookingIdentifier/rcfs:uniqueReference"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "$reference='1'">
                                        <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297_2"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297_2"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InProgressBooking_TUID_207297"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='0a8b498b-b0ae-44a2-8815-105824394cab'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_AirLoyatalNumber_TUID_486292"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_AirLoyatalNumber_TUID_486292"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_AirLoyatalNumber_TUID_486292_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_AirLoyatalNumber_TUID_486292_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_AirLoyatalNumber_TUID_486292_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_AirLoyatalNumber_TUID_486292"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_AirLoyatalNumber_TUID_486292"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_AirLoyatalNumber_TUID_486292"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_AirLoyatalNumber_TUID_486292"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_AirLoyatalNumber_TUID_486292"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_AirLoyatalNumber_TUID_486292"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='2f0e4cbf-4b78-4a68-83cf-1a0500d4ad6e'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_InvalidAirLoyatalNumber_TUID_484843"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_InvalidAirLoyatalNumber_TUID_484843"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_InvalidAirLoyatalNumber_TUID_484843_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_InvalidAirLoyatalNumber_TUID_484843_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_InvalidAirLoyatalNumber_TUID_484843_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_InvalidAirLoyatalNumber_TUID_484843"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_InvalidAirLoyatalNumber_TUID_484843"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_InvalidAirLoyatalNumber_TUID_484843"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_InvalidAirLoyatalNumber_TUID_484843"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_InvalidAirLoyatalNumber_TUID_484843"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_InvalidAirLoyatalNumber_TUID_484843"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='1e3113d0-0536-4de7-81c1-c5b7c2c0f8c9'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SecondaryDriver_TwoSpecifiedTraveller_TUID_456921"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_SecondaryDriver_TwoSpecifiedTraveller_TUID_456921"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoSpecifiedTraveller_TUID_456921_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoSpecifiedTraveller_TUID_456921_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoSpecifiedTraveller_TUID_456921_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SecondaryDriver_TwoSpecifiedTraveller_TUID_456921"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_SecondaryDriver_TwoSpecifiedTraveller_TUID_456921"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_TwoSpecifiedTraveller_TUID_456921"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_TwoSpecifiedTraveller_TUID_456921"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_TwoSpecifiedTraveller_TUID_456921"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_TwoSpecifiedTraveller_TUID_456921"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='be73042f-c294-4e8b-8565-69e099be2db1'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SecondaryDriver_ThreeTraveller_TUID_455553"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_SecondaryDriver_ThreeTraveller_TUID_455553"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_ThreeTraveller_TUID_455553_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_ThreeTraveller_TUID_455553_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_ThreeTraveller_TUID_455553_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SecondaryDriver_ThreeTraveller_TUID_455553"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_SecondaryDriver_ThreeTraveller_TUID_455553"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_ThreeTraveller_TUID_455553"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_ThreeTraveller_TUID_455553"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_ThreeTraveller_TUID_455553"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_ThreeTraveller_TUID_455553"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='e16f18f2-3dc4-4f65-a9ed-83798a7373e8'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455752"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455752"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455752_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455752_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455752_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455752"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455752"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455752"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455752"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455752"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455752"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='897802ab-5940-4acf-affd-103871e4f008'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SecondaryDriver_TwoTraveller_TUID_455623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_SecondaryDriver_TwoTraveller_TUID_455623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoTraveller_TUID_455623_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoTraveller_TUID_455623_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoTraveller_TUID_455623_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SecondaryDriver_TwoTraveller_TUID_455623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_SecondaryDriver_TwoTraveller_TUID_455623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_TwoTraveller_TUID_455623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_TwoTraveller_TUID_455623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_TwoTraveller_TUID_455623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_TwoTraveller_TUID_455623"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='dcf4f4a0-8c29-4f31-8e7c-db750bf3dac5'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455557"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_SecondaryDriver_ThreeTraveller_DELAndCOL_TUID_455557"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='fa2b0c38-423f-4425-baec-77a86ea1e4b0'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SecondaryDriver_TwoTraveller_DigitalFirstNameInSecondTraveler_TUID_472069"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_SecondaryDriver_TwoTraveller_DigitalFirstNameInSecondTraveler_TUID_472069"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoTraveller_DigitalFirstNameInSecondTraveler_TUID_472069_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoTraveller_DigitalFirstNameInSecondTraveler_TUID_472069_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SecondaryDriver_TwoTraveller_DigitalFirstNameInSecondTraveler_TUID_472069"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_SecondaryDriver_TwoTraveller_DigitalFirstNameInSecondTraveler_TUID_472069"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='9666b38f-ace8-461d-ac2a-ba690571e4e9'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_SecondaryDriver_TwoTraveller_DigitalLastNameInSecondTraveler_TUID_472070"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='b772a225-c25e-48f5-8c38-2ab1550c5d83'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_PNRDBIDataAndOthers_Airplus_TUID_518660"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_PNRDBIDataAndOthers_Airplus_TUID_518660"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PNRDBIDataAndOthers_Airplus_TUID_518660_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PNRDBIDataAndOthers_Airplus_TUID_518660_10"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_PNRDBIDataAndOthers_Airplus_TUID_518660"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_PNRDBIDataAndOthers_Airplus_TUID_518660"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_PNRDBIDataAndOthers_Airplus_TUID_518660"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='7132d03d-d51d-4558-999f-335c38b286f3'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_PNRDBIDataOnly_Airplus_TUID_518661"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_PNRDBIDataOnly_Airplus_TUID_518661"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PNRDBIDataOnly_Airplus_TUID_518661_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PNRDBIDataOnly_Airplus_TUID_518661_10"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_PNRDBIDataOnly_Airplus_TUID_518661"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_PNRDBIDataOnly_Airplus_TUID_518661"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_PNRDBIDataOnly_Airplus_TUID_518661"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='8c54d688-6cb6-46b5-abfc-4aeabfeef472'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_NoPNRInDBIData_Airplus_TUID_518663"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_NoPNRInDBIData_Airplus_TUID_518663"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_NoPNRInDBIData_Airplus_TUID_518663_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_NoPNRInDBIData_Airplus_TUID_518663_10"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_NoPNRInDBIData_Airplus_TUID_518663"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_NoPNRInDBIData_Airplus_TUID_518663"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_NoPNRInDBIData_Airplus_TUID_518663"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='cf7d8922-d00d-4371-b4ed-8665228efee6'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_InvalidPNRInDBIData_Airplus_TUID_519841"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_InvalidPNRInDBIData_Airplus_TUID_519841"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_InvalidPNRInDBIData_Airplus_TUID_519841_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_InvalidPNRInDBIData_Airplus_TUID_519841_10"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_InvalidPNRInDBIData_Airplus_TUID_519841"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_InvalidPNRInDBIData_Airplus_TUID_519841"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_InvalidPNRInDBIData_Airplus_TUID_519841"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='519904b2-4125-4f26-9d45-a623f685d33a'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OffAirport_VLC_MultiEPCDCode_190976"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OffAirport_VLC_MultiEPCDCode_190976"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OffAirport_VLC_MultiEPCDCode_190976_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OffAirport_VLC_MultiEPCDCode_190976_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OffAirport_VLC_MultiEPCDCode_190976_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OffAirport_VLC_MultiEPCDCode_190976"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OffAirport_VLC_MultiEPCDCode_190976"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OffAirport_VLC_MultiEPCDCode_190976"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OffAirport_VLC_MultiEPCDCode_190976"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OffAirport_VLC_MultiEPCDCode_190976"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OffAirport_VLC_MultiEPCDCode_190976"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ca9eaf2d-2bdc-4b4c-8717-88c5aca221df'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_WithWithoutEPCDCode_190973"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_WithWithoutEPCDCode_190973"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_WithWithoutEPCDCode_190973_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_WithWithoutEPCDCode_190973_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_WithWithoutEPCDCode_190973_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_WithWithoutEPCDCode_190973"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_WithWithoutEPCDCode_190973"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_WithWithoutEPCDCode_190973"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_WithWithoutEPCDCode_190973"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_WithWithoutEPCDCode_190973"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_WithWithoutEPCDCode_190973"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='1e20b23d-d734-4b8f-812d-67d0332b0af9'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_190971"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_190971"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_190971_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_190971_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_190971_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_190971"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_190971"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_190971"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_190971"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_190971"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_OneWay_OnAirport_LHREDI_Weekly_190971"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='6ba07e0d-84ec-444e-844e-6b7f722bb5d8'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_Standalone_OneWay_OffAirport_NCEMRS_WithCDCode_Monthly_190969"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_Standalone_OneWay_OffAirport_NCEMRS_WithCDCode_Monthly_190969"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Standalone_OneWay_OffAirport_NCEMRS_WithCDCode_Monthly_190969_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Standalone_OneWay_OffAirport_NCEMRS_WithCDCode_Monthly_190969_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Standalone_OneWay_OffAirport_NCEMRS_WithCDCode_Monthly_190969_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_Standalone_OneWay_OffAirport_NCEMRS_WithCDCode_Monthly_190969"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_Standalone_OneWay_OffAirport_NCEMRS_WithCDCode_Monthly_190969"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Standalone_OneWay_OffAirport_NCEMRS_WithCDCode_Monthly_190969"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Standalone_OneWay_OffAirport_NCEMRS_WithCDCode_Monthly_190969"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Standalone_OneWay_OffAirport_NCEMRS_WithCDCode_Monthly_190969"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Standalone_OneWay_OffAirport_NCEMRS_WithCDCode_Monthly_190969"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='9ccc3f89-c0aa-4075-87ce-9e9b03056312'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_ITA_Standalone_OneWay_OnAirport_VCEBLQ_WeeklyExtradays_190966"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_ITA_Standalone_OneWay_OnAirport_VCEBLQ_WeeklyExtradays_190966"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OnAirport_VCEBLQ_WeeklyExtradays_190966_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OnAirport_VCEBLQ_WeeklyExtradays_190966_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_ITA_Standalone_OneWay_OnAirport_VCEBLQ_WeeklyExtradays_190966_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_ITA_Standalone_OneWay_OnAirport_VCEBLQ_WeeklyExtradays_190966"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_ITA_Standalone_OneWay_OnAirport_VCEBLQ_WeeklyExtradays_190966"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_ITA_Standalone_OneWay_OnAirport_VCEBLQ_WeeklyExtradays_190966"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_ITA_Standalone_OneWay_OnAirport_VCEBLQ_WeeklyExtradays_190966"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_ITA_Standalone_OneWay_OnAirport_VCEBLQ_WeeklyExtradays_190966"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_ITA_Standalone_OneWay_OnAirport_VCEBLQ_WeeklyExtradays_190966"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='b557e69a-8b98-4487-ac0e-e575a60e4bef'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_Standalone_RoundTrip_OnAirport_CDG_WithCDCode_3DaysExtraHours_190965"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_Standalone_RoundTrip_OnAirport_CDG_WithCDCode_3DaysExtraHours_190965"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Standalone_RoundTrip_OnAirport_CDG_WithCDCode_3DaysExtraHours_190965_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Standalone_RoundTrip_OnAirport_CDG_WithCDCode_3DaysExtraHours_190965_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Standalone_RoundTrip_OnAirport_CDG_WithCDCode_3DaysExtraHours_190965_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_Standalone_RoundTrip_OnAirport_CDG_WithCDCode_3DaysExtraHours_190965"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_Standalone_RoundTrip_OnAirport_CDG_WithCDCode_3DaysExtraHours_190965"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Standalone_RoundTrip_OnAirport_CDG_WithCDCode_3DaysExtraHours_190965"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Standalone_RoundTrip_OnAirport_CDG_WithCDCode_3DaysExtraHours_190965"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Standalone_RoundTrip_OnAirport_CDG_WithCDCode_3DaysExtraHours_190965"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Standalone_RoundTrip_OnAirport_CDG_WithCDCode_3DaysExtraHours_190965"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='f54ccf9c-86de-433b-83c2-6f0c01f0dba7'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_Spain_Standalone_RoundTrip_OnAirport_NCL_Weekend_190962"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_Spain_Standalone_RoundTrip_OnAirport_NCL_Weekend_190962"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_Spain_Standalone_RoundTrip_OnAirport_NCL_Weekend_190962_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_Spain_Standalone_RoundTrip_OnAirport_NCL_Weekend_190962_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_Spain_Standalone_RoundTrip_OnAirport_NCL_Weekend_190962_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_Spain_Standalone_RoundTrip_OnAirport_NCL_Weekend_190962"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_Spain_Standalone_RoundTrip_OnAirport_NCL_Weekend_190962"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_Spain_Standalone_RoundTrip_OnAirport_NCL_Weekend_190962"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_Spain_Standalone_RoundTrip_OnAirport_NCL_Weekend_190962"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_Spain_Standalone_RoundTrip_OnAirport_NCL_Weekend_190962"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_Spain_Standalone_RoundTrip_OnAirport_NCL_Weekend_190962"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='4329b847-52b0-417b-9ff4-5cad863930e6'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_DeliveryAndCollection_PlaceID_ASCS_on_RoundTrip_Egencia_GBR_191465"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_PlaceID_ASCS_on_RoundTrip_Egencia_GBR_191465_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_PlaceID_ASCS_on_RoundTrip_Egencia_GBR_191465_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_PlaceID_ASCS_on_RoundTrip_Egencia_GBR_191465_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_DeliveryAndCollection_PlaceID_ASCS_on_RoundTrip_Egencia_GBR_191465"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_DeliveryAndCollection_PlaceID_ASCS_on_RoundTrip_Egencia_GBR_191465"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_DeliveryAndCollection_PlaceID_ASCS_on_RoundTrip_Egencia_GBR_191465"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_DeliveryAndCollection_PlaceID_ASCS_on_RoundTrip_Egencia_GBR_191465"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_DeliveryAndCollection_PlaceID_ASCS_on_RoundTrip_Egencia_GBR_191465"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_DeliveryAndCollection_PlaceID_ASCS_on_RoundTrip_Egencia_GBR_191465"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='399e905c-a791-46eb-ab79-c23c3cba5580'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_DeliveryAndCollection_PlaceID_ASCS_on_OneWay_Egencia_GBR_191466"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_PlaceID_ASCS_on_OneWay_Egencia_GBR_191466_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_PlaceID_ASCS_on_OneWay_Egencia_GBR_191466_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_PlaceID_ASCS_on_OneWay_Egencia_GBR_191466_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_DeliveryAndCollection_PlaceID_ASCS_on_OneWay_Egencia_GBR_191466"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_DeliveryAndCollection_PlaceID_ASCS_on_OneWay_Egencia_GBR_191466"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_DeliveryAndCollection_PlaceID_ASCS_on_OneWay_Egencia_GBR_191466"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_DeliveryAndCollection_PlaceID_ASCS_on_OneWay_Egencia_GBR_191466"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_DeliveryAndCollection_PlaceID_ASCS_on_OneWay_Egencia_GBR_191466"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_DeliveryAndCollection_PlaceID_ASCS_on_OneWay_Egencia_GBR_191466"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='14278bde-931e-400b-9980-51b9847fa697'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability__DeliveryAndDropOffLocation_PlaceID_ASCS_on_OneWay_Egencia_FRA_191467"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements__DeliveryAndDropOffLocation_PlaceID_ASCS_on_OneWay_Egencia_FRA_191467_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements__DeliveryAndDropOffLocation_PlaceID_ASCS_on_OneWay_Egencia_FRA_191467_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements__DeliveryAndDropOffLocation_PlaceID_ASCS_on_OneWay_Egencia_FRA_191467_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell__DeliveryAndDropOffLocation_PlaceID_ASCS_on_OneWay_Egencia_FRA_191467"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment__DeliveryAndDropOffLocation_PlaceID_ASCS_on_OneWay_Egencia_FRA_191467"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve__DeliveryAndDropOffLocation_PlaceID_ASCS_on_OneWay_Egencia_FRA_191467"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve__DeliveryAndDropOffLocation_PlaceID_ASCS_on_OneWay_Egencia_FRA_191467"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel__DeliveryAndDropOffLocation_PlaceID_ASCS_on_OneWay_Egencia_FRA_191467"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel__DeliveryAndDropOffLocation_PlaceID_ASCS_on_OneWay_Egencia_FRA_191467"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='cc6d9807-9c32-4a0d-9c19-3555fc5a649c'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_PickupLocationAndCollection_PlaceID_ASCS_off_OneWay_Egencia_ESP_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PickupLocationAndCollection_PlaceID_ASCS_off_OneWay_Egencia_ESP_191469_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PickupLocationAndCollection_PlaceID_ASCS_off_OneWay_Egencia_ESP_191469_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PickupLocationAndCollection_PlaceID_ASCS_off_OneWay_Egencia_ESP_191469_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_PickupLocationAndCollection_PlaceID_ASCS_off_OneWay_Egencia_ESP_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_PickupLocationAndCollection_PlaceID_ASCS_off_OneWay_Egencia_ESP_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_PickupLocationAndCollection_PlaceID_ASCS_off_OneWay_Egencia_ESP_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_PickupLocationAndCollection_PlaceID_ASCS_off_OneWay_Egencia_ESP_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_PickupLocationAndCollection_PlaceID_ASCS_off_OneWay_Egencia_ESP_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_PickupLocationAndCollection_PlaceID_ASCS_off_OneWay_Egencia_ESP_191469"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ab182da4-f13c-403c-a11c-9a6636183b96'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_DeliveryAndCollection_HomeAddress_ASCS_on_RoundTrip_Egencia_GBR_193504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_HomeAddress_ASCS_on_RoundTrip_Egencia_GBR_193504_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_HomeAddress_ASCS_on_RoundTrip_Egencia_GBR_193504_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_HomeAddress_ASCS_on_RoundTrip_Egencia_GBR_193504_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_DeliveryAndCollection_HomeAddress_ASCS_on_RoundTrip_Egencia_GBR_193504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_DeliveryAndCollection_HomeAddress_ASCS_on_RoundTrip_Egencia_GBR_193504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_DeliveryAndCollection_HomeAddress_ASCS_on_RoundTrip_Egencia_GBR_193504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_DeliveryAndCollection_HomeAddress_ASCS_on_RoundTrip_Egencia_GBR_193504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_DeliveryAndCollection_HomeAddress_ASCS_on_RoundTrip_Egencia_GBR_193504"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_DeliveryAndCollection_HomeAddress_ASCS_on_RoundTrip_Egencia_GBR_193504"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='8e5795d1-f859-4e4c-b698-1d138ef582e1'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_DeliveryAndCollection_HomeAddress_ASCS_on_OneWay_Egencia_GBR_193505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_HomeAddress_ASCS_on_OneWay_Egencia_GBR_193505_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_HomeAddress_ASCS_on_OneWay_Egencia_GBR_193505_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndCollection_HomeAddress_ASCS_on_OneWay_Egencia_GBR_193505_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_DeliveryAndCollection_HomeAddress_ASCS_on_OneWay_Egencia_GBR_193505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_DeliveryAndCollection_HomeAddress_ASCS_on_OneWay_Egencia_GBR_193505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_DeliveryAndCollection_HomeAddress_ASCS_on_OneWay_Egencia_GBR_193505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_DeliveryAndCollection_HomeAddress_ASCS_on_OneWay_Egencia_GBR_193505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_DeliveryAndCollection_HomeAddress_ASCS_on_OneWay_Egencia_GBR_193505"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_DeliveryAndCollection_HomeAddress_ASCS_on_OneWay_Egencia_GBR_193505"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ae5e0cc4-4e74-45a3-8541-7e2e3bd9fd40'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_DeliveryAndDropOffLocation_HomeAddress_ASCS_on_OneWay_Egencia_FRA_193507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndDropOffLocation_HomeAddress_ASCS_on_OneWay_Egencia_FRA_193507_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndDropOffLocation_HomeAddress_ASCS_on_OneWay_Egencia_FRA_193507_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_DeliveryAndDropOffLocation_HomeAddress_ASCS_on_OneWay_Egencia_FRA_193507_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_DeliveryAndDropOffLocation_HomeAddress_ASCS_on_OneWay_Egencia_FRA_193507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_DeliveryAndDropOffLocation_HomeAddress_ASCS_on_OneWay_Egencia_FRA_193507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_DeliveryAndDropOffLocation_HomeAddress_ASCS_on_OneWay_Egencia_FRA_193507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_DeliveryAndDropOffLocation_HomeAddress_ASCS_on_OneWay_Egencia_FRA_193507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_DeliveryAndDropOffLocation_HomeAddress_ASCS_on_OneWay_Egencia_FRA_193507"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_DeliveryAndDropOffLocation_HomeAddress_ASCS_on_OneWay_Egencia_FRA_193507"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='8215e49b-94c5-4d2b-8e3c-87038887c52a'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_PickupLocationAndCollection_HomeAddress_ASCS_off_OneWay_Egencia_ESP_193510"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PickupLocationAndCollection_HomeAddress_ASCS_off_OneWay_Egencia_ESP_193510_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PickupLocationAndCollection_HomeAddress_ASCS_off_OneWay_Egencia_ESP_193510_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PickupLocationAndCollection_HomeAddress_ASCS_off_OneWay_Egencia_ESP_193510_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_PickupLocationAndCollection_HomeAddress_ASCS_off_OneWay_Egencia_ESP_193510"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_PickupLocationAndCollection_HomeAddress_ASCS_off_OneWay_Egencia_ESP_193510"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_PickupLocationAndCollection_HomeAddress_ASCS_off_OneWay_Egencia_ESP_193510"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_PickupLocationAndCollection_HomeAddress_ASCS_off_OneWay_Egencia_ESP_193510"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_PickupLocationAndCollection_HomeAddress_ASCS_off_OneWay_Egencia_ESP_193510"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_PickupLocationAndCollection_HomeAddress_ASCS_off_OneWay_Egencia_ESP_193510"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='d559a78e-4e03-4851-af6d-a67e493181e3'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='297127fa-1a24-485d-abcf-38ceada75194'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='982958a0-b98a-4bae-bbae-1e1466b49682'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_EVoucher_DeliveryAndDropOffLocation_PlaceID_ASCS_on_roundTrip_FRA_208952"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Successed"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndDropOffLocation_PlaceID_ASCS_on_roundTrip_FRA_208952_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndDropOffLocation_PlaceID_ASCS_on_roundTrip_FRA_208952_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndDropOffLocation_PlaceID_ASCS_on_roundTrip_FRA_208952_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_EVoucher_DeliveryAndDropOffLocation_PlaceID_ASCS_on_roundTrip_FRA_208952"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_EVoucher_DeliveryAndDropOffLocation_PlaceID_ASCS_on_roundTrip_FRA_208952"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_EVoucher_DeliveryAndDropOffLocation_PlaceID_ASCS_on_roundTrip_FRA_208952"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_EVoucher_DeliveryAndDropOffLocation_PlaceID_ASCS_on_roundTrip_FRA_208952"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_EVoucher_DeliveryAndDropOffLocation_PlaceID_ASCS_on_roundTrip_FRA_208952"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_EVoucher_DeliveryAndDropOffLocation_PlaceID_ASCS_on_roundTrip_FRA_208952"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='04479e29-e59d-4947-a7c5-8f66a719caf4'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_roundTrip_FRA_208967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_roundTrip_FRA_208967_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_roundTrip_FRA_208967_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_roundTrip_FRA_208967_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_roundTrip_FRA_208967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_roundTrip_FRA_208967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_roundTrip_FRA_208967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_roundTrip_FRA_208967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_roundTrip_FRA_208967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_roundTrip_FRA_208967"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='63705e61-01d5-42a5-be08-1c478647f932'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_oneway_FRA_208996"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_oneway_FRA_208996_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_oneway_FRA_208996_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_oneway_FRA_208996_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_oneway_FRA_208996"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_oneway_FRA_208996"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_oneway_FRA_208996"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_oneway_FRA_208996"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_oneway_FRA_208996"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_EVoucher_DeliveryAndCollection_HomeAddress_ASCS_on_oneway_FRA_208996"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='a4e35731-9748-4a50-9ed2-638c89327eb8'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_Span_Standalone_OneWay_OffAirport_ROMMIL_MonthlyExtradays_190967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_Span_Standalone_OneWay_OffAirport_ROMMIL_MonthlyExtradays_190967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_Span_Standalone_OneWay_OffAirport_ROMMIL_MonthlyExtradays_190967_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_Span_Standalone_OneWay_OffAirport_ROMMIL_MonthlyExtradays_190967_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_Span_Standalone_OneWay_OffAirport_ROMMIL_MonthlyExtradays_190967_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_Span_Standalone_OneWay_OffAirport_ROMMIL_MonthlyExtradays_190967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_Span_Standalone_OneWay_OffAirport_ROMMIL_MonthlyExtradays_190967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_Span_Standalone_OneWay_OffAirport_ROMMIL_MonthlyExtradays_190967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_Span_Standalone_OneWay_OffAirport_ROMMIL_MonthlyExtradays_190967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_Span_Standalone_OneWay_OffAirport_ROMMIL_MonthlyExtradays_190967"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_Span_Standalone_OneWay_OffAirport_ROMMIL_MonthlyExtradays_190967"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='54617c5a-4e99-4240-a373-c26986e019cb'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_PickupLocationAndCollection_PlaceID_Collection_ASCS_FR_round_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PickupLocationAndCollection_PlaceID_Collection_ASCS_FR_round_191469_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PickupLocationAndCollection_PlaceID_Collection_ASCS_FR_round_191469_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_PickupLocationAndCollection_PlaceID_Collection_ASCS_FR_round_191469_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_PickupLocationAndCollection_PlaceID_Collection_ASCS_FR_round_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_PickupLocationAndCollection_PlaceID_Collection_ASCS_FR_round_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_PickupLocationAndCollection_PlaceID_Collection_ASCS_FR_round_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_PickupLocationAndCollection_PlaceID_Collection_ASCS_FR_round_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_PickupLocationAndCollection_PlaceID_Collection_ASCS_FR_round_191469"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_PickupLocationAndCollection_PlaceID_Collection_ASCS_FR_round_191469"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='1EFA153D-1782-4732-8DCA-322AB5ECE7A4'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_11"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Successed"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_FRsite_Standalone_OffAirport_RoundTrip_NCL_TUID_474812"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='3df9718e-6bcf-4deb-89f2-603fcc29425c'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Agency_Standalone_on_roundTrip_FR_OneCDcode_EUR_52103"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Agency_Standalone_on_roundTrip_FR_OneCDcode_EUR_52103"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_on_roundTrip_FR_OneCDcode_EUR_52103_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_on_roundTrip_FR_OneCDcode_EUR_52103_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_on_roundTrip_FR_OneCDcode_EUR_52103_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Agency_Standalone_on_roundTrip_FR_OneCDcode_EUR_52103"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Agency_Standalone_on_roundTrip_FR_OneCDcode_EUR_52103"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_Standalone_on_roundTrip_FR_OneCDcode_EUR_52103"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_Standalone_on_roundTrip_FR_OneCDcode_EUR_52103"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_Standalone_on_roundTrip_FR_OneCDcode_EUR_52103"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_Standalone_on_roundTrip_FR_OneCDcode_EUR_52103"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='f85255bd-6a41-40ec-9441-bdc2a6e826c7'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Agency_Standalone_off_roundTrip_ESP_MultipleLocation_52114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Agency_Standalone_off_roundTrip_ESP_MultipleLocation_52114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_off_roundTrip_ESP_MultipleLocation_52114_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_off_roundTrip_ESP_MultipleLocation_52114_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_off_roundTrip_ESP_MultipleLocation_52114_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Agency_Standalone_off_roundTrip_ESP_MultipleLocation_52114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Agency_Standalone_off_roundTrip_ESP_MultipleLocation_52114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_Standalone_off_roundTrip_ESP_MultipleLocation_52114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_Standalone_off_roundTrip_ESP_MultipleLocation_52114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_Standalone_off_roundTrip_ESP_MultipleLocation_52114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_Standalone_off_roundTrip_ESP_MultipleLocation_52114"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='7f403458-9c62-46ad-9a2c-494074cb6ab5'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Agency_Standalone_on_roundTrip_FR_VCE_52110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Agency_Standalone_on_roundTrip_FR_VCE_52110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_on_roundTrip_FR_VCE_52110_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_on_roundTrip_FR_VCE_52110_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_on_roundTrip_FR_VCE_52110_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Agency_Standalone_on_roundTrip_FR_VCE_52110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Agency_Standalone_on_roundTrip_FR_VCE_52110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_Standalone_on_roundTrip_FR_VCE_52110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_Standalone_on_roundTrip_FR_VCE_52110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_Standalone_on_roundTrip_FR_VCE_52110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_Standalone_on_roundTrip_FR_VCE_52110"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='36c91d86-b5c6-4df4-8b2f-191003e59afa'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Agency_Standalone_off_roundTrip_FR_VCE_52907"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Agency_Standalone_off_roundTrip_FR_VCE_52907"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_off_roundTrip_FR_VCE_52907_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_off_roundTrip_FR_VCE_52907_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_Standalone_off_roundTrip_FR_VCE_52907_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Agency_Standalone_off_roundTrip_FR_VCE_52907"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Agency_Standalone_off_roundTrip_FR_VCE_52907"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_Standalone_off_roundTrip_FR_VCE_52907"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_Standalone_off_roundTrip_FR_VCE_52907"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_Standalone_off_roundTrip_FR_VCE_52907"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_Standalone_off_roundTrip_FR_VCE_52907"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='c9aa3626-565e-4a73-b375-9c94cba5d3bc'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='6f5ecec6-a7b1-4824-a27d-df8ccf3282db'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='c982617e-c905-4a33-ad81-a3e0652cb671'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='5fbcbf04-1ce5-4b87-9bce-9a77445604bc'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_MultiEDIData_TUID_442670"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_MultiEDIData_TUID_442670"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_MultiEDIData_TUID_442670_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_MultiEDIData_TUID_442670_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_MultiEDIData_TUID_442670_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_MultiEDIData_TUID_442670"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_MultiEDIData_TUID_442670"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_MultiEDIData_TUID_442670"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_MultiEDIData_TUID_442670"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_MultiEDIData_TUID_442670"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_MultiEDIData_TUID_442670"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='da299d0d-8c0d-4176-8df6-325a7637aa1b'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithNormalCreditCard_TUID_442669"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithNormalCreditCard_TUID_442669"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithNormalCreditCard_TUID_442669_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithNormalCreditCard_TUID_442669_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithNormalCreditCard_TUID_442669_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithNormalCreditCard_TUID_442669"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithNormalCreditCard_TUID_442669"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithNormalCreditCard_TUID_442669"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithNormalCreditCard_TUID_442669"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithNormalCreditCard_TUID_442669"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithNormalCreditCard_TUID_442669"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='34f32e0e-8334-409f-a5b5-de32786ac2d0'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Agency_CarBS_PlaceID_DeliveryAndCollection_RoundTrip_303788"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Agency_CarBS_PlaceID_DeliveryAndCollection_RoundTrip_303788"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_DeliveryAndCollection_RoundTrip_303788_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_DeliveryAndCollection_RoundTrip_303788_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_DeliveryAndCollection_RoundTrip_303788_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Agency_CarBS_PlaceID_DeliveryAndCollection_RoundTrip_303788"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Agency_CarBS_PlaceID_DeliveryAndCollection_RoundTrip_303788"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_CarBS_PlaceID_DeliveryAndCollection_RoundTrip_303788"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_CarBS_PlaceID_DeliveryAndCollection_RoundTrip_303788"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_CarBS_PlaceID_DeliveryAndCollection_RoundTrip_303788"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_CarBS_PlaceID_DeliveryAndCollection_RoundTrip_303788"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='860106c5-f2dd-4405-bec9-fdbebbcbd23f'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Agency_CarBS_PlaceID_DeliveryAndDropOffAtAirport_303790"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Agency_CarBS_PlaceID_DeliveryAndDropOffAtAirport_303790"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_DeliveryAndDropOffAtAirport_303790_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_DeliveryAndDropOffAtAirport_303790_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_DeliveryAndDropOffAtAirport_303790_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Agency_CarBS_PlaceID_DeliveryAndDropOffAtAirport_303790"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Agency_CarBS_PlaceID_DeliveryAndDropOffAtAirport_303790"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_CarBS_PlaceID_DeliveryAndDropOffAtAirport_303790"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_CarBS_PlaceID_DeliveryAndDropOffAtAirport_303790"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_CarBS_PlaceID_DeliveryAndDropOffAtAirport_303790"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_CarBS_PlaceID_DeliveryAndDropOffAtAirport_303790"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='57cca8e6-11cf-4a38-b54a-d535296d20ad'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Agency_CarBS_PlaceID_PickupAtAgencyAndCollection_303791"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Agency_CarBS_PlaceID_PickupAtAgencyAndCollection_303791"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_PickupAtAgencyAndCollection_303791_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_PickupAtAgencyAndCollection_303791_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_PickupAtAgencyAndCollection_303791_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Agency_CarBS_PlaceID_PickupAtAgencyAndCollection_303791"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Agency_CarBS_PlaceID_PickupAtAgencyAndCollection_303791"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_CarBS_PlaceID_PickupAtAgencyAndCollection_303791"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_CarBS_PlaceID_PickupAtAgencyAndCollection_303791"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_CarBS_PlaceID_PickupAtAgencyAndCollection_303791"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_CarBS_PlaceID_PickupAtAgencyAndCollection_303791"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='893cdfb6-6742-4b3f-9522-25e2bd942b9a'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithPlaceIDDelCol_TUID_442668"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithPlaceIDDelCol_TUID_442668"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithPlaceIDDelCol_TUID_442668_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithPlaceIDDelCol_TUID_442668_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithPlaceIDDelCol_TUID_442668_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithPlaceIDDelCol_TUID_442668"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithPlaceIDDelCol_TUID_442668"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithPlaceIDDelCol_TUID_442668"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithPlaceIDDelCol_TUID_442668"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithPlaceIDDelCol_TUID_442668"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithPlaceIDDelCol_TUID_442668"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='e953884f-723b-43a3-a55c-8f5bfc9ee145'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Agency_CarBS_PlaceID_DeliveryAndCollection_SpecialEquipment_303793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Agency_CarBS_PlaceID_DeliveryAndCollection_SpecialEquipment_303793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_DeliveryAndCollection_SpecialEquipment_303793_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_DeliveryAndCollection_SpecialEquipment_303793_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Agency_CarBS_PlaceID_DeliveryAndCollection_SpecialEquipment_303793_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Agency_CarBS_PlaceID_DeliveryAndCollection_SpecialEquipment_303793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Agency_CarBS_PlaceID_DeliveryAndCollection_SpecialEquipment_303793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_CarBS_PlaceID_DeliveryAndCollection_SpecialEquipment_303793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Agency_CarBS_PlaceID_DeliveryAndCollection_SpecialEquipment_303793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_CarBS_PlaceID_DeliveryAndCollection_SpecialEquipment_303793"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Agency_CarBS_PlaceID_DeliveryAndCollection_SpecialEquipment_303793"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='831d9c7a-d22a-4105-978a-8c0479ec9bd1'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithHomeDelCol_TUID_442667"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='345c8b3a-1ee6-413e-94d2-382ae3bbaff5'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithLoyaltyCardNumber_TUID_442666"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithLoyaltyCardNumber_TUID_442666"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithLoyaltyCardNumber_TUID_442666_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithLoyaltyCardNumber_TUID_442666_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithLoyaltyCardNumber_TUID_442666_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithLoyaltyCardNumber_TUID_442666"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithLoyaltyCardNumber_TUID_442666"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithLoyaltyCardNumber_TUID_442666"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithLoyaltyCardNumber_TUID_442666"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithLoyaltyCardNumber_TUID_442666"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithLoyaltyCardNumber_TUID_442666"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='fd4b2b67-4c84-4410-bb9f-e9ef2681b545'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithSpecialEquip_TUID_442665"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithSpecialEquip_TUID_442665"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithSpecialEquip_TUID_442665_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithSpecialEquip_TUID_442665_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithSpecialEquip_TUID_442665_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithSpecialEquip_TUID_442665"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithSpecialEquip_TUID_442665"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithSpecialEquip_TUID_442665"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithSpecialEquip_TUID_442665"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithSpecialEquip_TUID_442665"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithSpecialEquip_TUID_442665"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='81f17fd4-9753-47f3-9cb3-e1749bce8bcf'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Egencia_CarBSOMS_GetOrderProcess_PriceChangeError_370938"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ad03a6db-37c0-42bb-ab27-bf3b4c7721a6'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithCDCode_TUID_442662"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithCDCode_TUID_442662"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithCDCode_TUID_442662_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithCDCode_TUID_442662_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithCDCode_TUID_442662_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithCDCode_TUID_442662"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithCDCode_TUID_442662"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithCDCode_TUID_442662"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithCDCode_TUID_442662"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithCDCode_TUID_442662"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_EDIDataWithCDCode_TUID_442662"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='12bc7ada-15fb-4757-84d8-3fb50ca39091'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Egencia_CarBSOMS_GetOrderProcess_NoPriceChangeError_370940"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='36738283-f05d-4c53-8614-770f7f40fb55'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_OnlyEDIData_TUID_442656"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_OnlyEDIData_TUID_442656"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_OnlyEDIData_TUID_442656_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_OnlyEDIData_TUID_442656_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_OnlyEDIData_TUID_442656_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_OnlyEDIData_TUID_442656"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_OnlyEDIData_TUID_442656"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_OnlyEDIData_TUID_442656"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_OnlyEDIData_TUID_442656"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_OnlyEDIData_TUID_442656"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_OnlyEDIData_TUID_442656"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='7a634c8e-700a-4394-b433-1ec1f9cdc16b'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuarantee_TUID_333508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuarantee_TUID_333508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuarantee_TUID_333508_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuarantee_TUID_333508_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuarantee_TUID_333508_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuarantee_TUID_333508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuarantee_TUID_333508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuarantee_TUID_333508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuarantee_TUID_333508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuarantee_TUID_333508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuarantee_TUID_333508"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ba72a72d-e1fd-437a-89bb-7a0f0d907429'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_Crypto_Decrypted_CCGuarantee_TUID_333596"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_Crypto_Decrypted_CCGuarantee_TUID_333596"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_Crypto_Decrypted_CCGuarantee_TUID_333596_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_Crypto_Decrypted_CCGuarantee_TUID_333596_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_Crypto_Decrypted_CCGuarantee_TUID_333596_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_Crypto_Decrypted_CCGuarantee_TUID_333596"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_Crypto_Decrypted_CCGuarantee_TUID_333596"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_Crypto_Decrypted_CCGuarantee_TUID_333596"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_Crypto_Decrypted_CCGuarantee_TUID_333596"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_Crypto_Decrypted_CCGuarantee_TUID_333596"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_Crypto_Decrypted_CCGuarantee_TUID_333596"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='916ad622-04f6-4c73-9625-289b9f1f2e8a'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_BOD_Crypto_Decrypted_CCGuaranteePlaceIDDELCOL_TUID_333598"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_BOD_Crypto_Decrypted_CCGuaranteePlaceIDDELCOL_TUID_333598"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_BOD_Crypto_Decrypted_CCGuaranteePlaceIDDELCOL_TUID_333598_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_BOD_Crypto_Decrypted_CCGuaranteePlaceIDDELCOL_TUID_333598_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_BOD_Crypto_Decrypted_CCGuaranteePlaceIDDELCOL_TUID_333598_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_BOD_Crypto_Decrypted_CCGuaranteePlaceIDDELCOL_TUID_333598"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_BOD_Crypto_Decrypted_CCGuaranteePlaceIDDELCOL_TUID_333598"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_BOD_Crypto_Decrypted_CCGuaranteePlaceIDDELCOL_TUID_333598"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_BOD_Crypto_Decrypted_CCGuaranteePlaceIDDELCOL_TUID_333598"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_BOD_Crypto_Decrypted_CCGuaranteePlaceIDDELCOL_TUID_333598"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_BOD_Crypto_Decrypted_CCGuaranteePlaceIDDELCOL_TUID_333598"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='7767d582-7087-4029-a081-77645a3f0972'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='3eba528c-35e7-4932-a10b-d48195cef98f'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeCDCode_TUID_333609"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeCDCode_TUID_333609"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeCDCode_TUID_333609_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeCDCode_TUID_333609_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeCDCode_TUID_333609_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeCDCode_TUID_333609"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeCDCode_TUID_333609"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeCDCode_TUID_333609"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeCDCode_TUID_333609"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeCDCode_TUID_333609"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip_LYST50_Crypto_Decrypted_CCGuaranteeCDCode_TUID_333609"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='8875b643-04b0-4066-b70c-d74451471cc9'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='cdd21a16-cc38-4bb6-9467-934f57c30aaf'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ac630d0e-aa9f-49a0-bfc6-c76cb7a32435'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='fe7ae55b-ea1e-4de4-b889-d3335396b283'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='dcc5abb5-5e64-44c8-b242-75c72a24ca62'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='895e16b4-00bd-46f3-9199-46739baac61e'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_SoftErrorHandling_TUID_333632"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_SoftErrorHandling_TUID_333632"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_SoftErrorHandling_TUID_333632_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_SoftErrorHandling_TUID_333632_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_SoftErrorHandling_TUID_333632_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_SoftErrorHandling_TUID_333632"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_SoftErrorHandling_TUID_333632"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_SoftErrorHandling_TUID_333632"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_SoftErrorHandling_TUID_333632"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_SoftErrorHandling_TUID_333632"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_SoftErrorHandling_TUID_333632"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='24ad239c-fdcb-444d-a176-712813afdfb4'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_CDCode40-704005_TUID_308981"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_CDCode40-704005_TUID_308981"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_CDCode40-704005_TUID_308981_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_CDCode40-704005_TUID_308981_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_CDCode40-704005_TUID_308981_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_CDCode40-704005_TUID_308981"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_CDCode40-704005_TUID_308981"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_CDCode40-704005_TUID_308981"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_CDCode40-704005_TUID_308981"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_CDCode40-704005_TUID_308981"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_CDCode40-704005_TUID_308981"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='76075919-6508-4da3-a95a-7ce3b2abf8ad'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingNumber_TUID_308983"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingNumber_TUID_308983"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingNumber_TUID_308983_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingNumber_TUID_308983_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingNumber_TUID_308983_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingNumber_TUID_308983"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingNumber_TUID_308983"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingNumber_TUID_308983"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingNumber_TUID_308983"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingNumber_TUID_308983"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingNumber_TUID_308983"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Successed"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='36b94b5d-c77b-47e0-acf6-2dab86ded171'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_SpecialEquipment_TUID_308985"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_SpecialEquipment_TUID_308985"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_SpecialEquipment_TUID_308985_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_SpecialEquipment_TUID_308985_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_SpecialEquipment_TUID_308985_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_SpecialEquipment_TUID_308985"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_SpecialEquipment_TUID_308985"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_SpecialEquipment_TUID_308985"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_SpecialEquipment_TUID_308985"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_SpecialEquipment_TUID_308985"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_SpecialEquipment_TUID_308985"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='3fc1cf88-260a-469e-8a75-9ac69d01abc0'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingCode_CDNumber40-704005_TUID_310114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingCode_CDNumber40-704005_TUID_310114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingCode_CDNumber40-704005_TUID_310114_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingCode_CDNumber40-704005_TUID_310114_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingCode_CDNumber40-704005_TUID_310114_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingCode_CDNumber40-704005_TUID_310114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingCode_CDNumber40-704005_TUID_310114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingCode_CDNumber40-704005_TUID_310114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingCode_CDNumber40-704005_TUID_310114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingCode_CDNumber40-704005_TUID_310114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_LoyatalNumber_BillingCode_CDNumber40-704005_TUID_310114"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Successed"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='c53ccf2b-73d7-4c61-a78a-fb1f16b275d2'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_ReservationGuaranteeRequired_TUID_474848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_ReservationGuaranteeRequired_TUID_474848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_ReservationGuaranteeRequired_TUID_474848_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_ReservationGuaranteeRequired_TUID_474848_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_ReservationGuaranteeRequired_TUID_474848_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_ReservationGuaranteeRequired_TUID_474848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_ReservationGuaranteeRequired_TUID_474848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_ReservationGuaranteeRequired_TUID_474848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_ReservationGuaranteeRequired_TUID_474848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_ReservationGuaranteeRequired_TUID_474848"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_FRLocation_offAirport_roundTrip_ReservationGuaranteeRequired_TUID_474848"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='a5401479-22f5-4bcc-9412-f30ec0ea189b'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_Standalone_RoundTrip_CurrencyNotAvailableError_518061"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_Standalone_RoundTrip_CurrencyNotAvailableError_518061"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Standalone_RoundTrip_CurrencyNotAvailableError_518061_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Standalone_RoundTrip_CurrencyNotAvailableError_518061_10"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_Standalone_RoundTrip_CurrencyNotAvailableError_518061"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_Standalone_RoundTrip_CurrencyNotAvailableError_518061"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Standalone_RoundTrip_CurrencyNotAvailableError_518061"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Standalone_RoundTrip_CurrencyNotAvailableError_518061"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='a5401479-22f5-4bcc-9412-f30ec0ea7899'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_Standalone_RoundTrip_CurrencyNotAvailableError_518061"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='45e751d1-45b4-44a6-914e-398dc92d64d9'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_RoundTrip_CurrencyNotAvailableError_746006"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='3d5eeedf-ce7a-48b9-a793-1226182ad02a'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_LoyaltyCardNumberWithCreditCard_TUID_766517"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_LoyaltyCardNumberWithCreditCard_TUID_766517"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_LoyaltyCardNumberWithCreditCard_TUID_766517_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_LoyaltyCardNumberWithCreditCard_TUID_766517_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_LoyaltyCardNumberWithCreditCard_TUID_766517_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_LoyaltyCardNumberWithCreditCard_TUID_766517"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_LoyaltyCardNumberWithCreditCard_TUID_766517"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_LoyaltyCardNumberWithCreditCard_TUID_766517"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_LoyaltyCardNumberWithCreditCard_TUID_766517"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_LoyaltyCardNumberWithCreditCard_TUID_766517"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_NCL_LoyaltyCardNumberWithCreditCard_TUID_766517"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ec186678-0b4e-4062-8507-95c535643ea4'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Daily_249590"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Daily_249590"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Daily_249590_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Daily_249590_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Daily_249590_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Daily_249590"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Daily_249590"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Daily_249590"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Daily_249590"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Daily_249590"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_LHR_Daily_249590"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='10745c63-5273-4e4a-a0d5-8a3506cddd72'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='6b1742aa-ee35-4656-812a-5a8a660f280b'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveOnly_TUID_746067"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveOnly_TUID_746067"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveOnly_TUID_746067_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveOnly_TUID_746067_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveOnly_TUID_746067_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveOnly_TUID_746067"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveOnly_TUID_746067"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveOnly_TUID_746067"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveOnly_TUID_746067"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveOnly_TUID_746067"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveOnly_TUID_746067"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='262162a3-be00-4388-bcac-b2ff8654a0fc'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='20bf49d0-ca41-45fd-ae89-73f4767c391e'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_AccredetiveEDIData_TUID_766516"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_AccredetiveEDIData_TUID_766516"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_AccredetiveEDIData_TUID_766516_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_AccredetiveEDIData_TUID_766516_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OffAirport_AccredetiveEDIData_TUID_766516_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OffAirport_AccredetiveEDIData_TUID_766516"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OffAirport_AccredetiveEDIData_TUID_766516"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_AccredetiveEDIData_TUID_766516"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OffAirport_AccredetiveEDIData_TUID_766516"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_AccredetiveEDIData_TUID_766516"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OffAirport_AccredetiveEDIData_TUID_766516"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='f98e1848-3351-485a-b20b-40bf1eb1f880'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='45609b2e-faf3-469b-84aa-3c3a4a1573ea'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "E2E_Location_LYSC06_303759"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_E2E_HomeAddress_DeliveryAndCollection_OneWay_303759"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RIA_E2E_HomeAddress_DeliveryAndCollection_OneWay_303759"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DeliveryAndCollection_OneWay_303759_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_E2E_HomeAddress_DeliveryAndCollection_OneWay_303759_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_E2E_HomeAddress_DeliveryAndCollection_OneWay_303759_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_E2E_HomeAddress_DeliveryAndCollection_OneWay_303759"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_E2E_HomeAddress_DeliveryAndCollection_OneWay_303759"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_E2E_HomeAddress_DeliveryAndCollection_OneWay_303759"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_E2E_HomeAddress_DeliveryAndCollection_OneWay_303759"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_E2E_HomeAddress_DeliveryAndCollection_OneWay_303759"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_E2E_HomeAddress_DeliveryAndCollection_OneWay_303759"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='45609b2e-faf3-469b-84aa-3c3a4a1573bb'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "E2E_Location_LYST01_30375901"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='81eee441-79a7-4986-ada1-f514d0aff57d'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "E2E_Location_LYST01_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DelAndCol_RoundTrip_303761_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DelAndCol_RoundTrip_303761_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DelAndCol_RoundTrip_303761_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ba54b7ca-e471-430e-88b4-d2126fca7784'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "E2E_Location_LYSC06_303759"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_E2E_HomeAddress_DelAndCol_OffAtAgency_303762"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_E2E_HomeAddress_DelAndCol_OffAtAgency_303762"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DelAndCol_OffAtAgency_303762_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DelAndCol_OffAtAgency_303762_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DelAndCol_OffAtAgency_303762_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_E2E_HomeAddress_DelAndCol_OffAtAgency_303762"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_E2E_HomeAddress_DelAndCol_OffAtAgency_303762"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_DelAndCol_OffAtAgency_303762"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_DelAndCol_OffAtAgency_303762"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_DelAndCol_OffAtAgency_303762"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_DelAndCol_OffAtAgency_303762"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ba54b7ca-e471-430e-88b4-d2126fca7785'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "E2E_Location_BIQC02_30376201"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='f899387c-4233-428c-8d5a-8d495e4e3a68'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "E2E_Location_UROC01_303763"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_E2E_HomeAddress_AtAgency_DelAndCol_303763"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_E2E_HomeAddress_AtAgency_DelAndCol_303763"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_AtAgency_DelAndCol_303763_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_AtAgency_DelAndCol_303763_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_AtAgency_DelAndCol_303763_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_E2E_HomeAddress_AtAgency_DelAndCol_303763"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_E2E_HomeAddress_AtAgency_DelAndCol_303763"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_AtAgency_DelAndCol_303763"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_AtAgency_DelAndCol_303763"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_AtAgency_DelAndCol_303763"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_AtAgency_DelAndCol_303763"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='f899387c-4233-428c-8d5a-8d495e4e3a88'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "E2E_Location_LYST01_303761"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ae02f57c-927f-4810-a243-37ce0e05c473'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "E2E_Location_LYSX01_303764"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_E2E_HomeAddress_DELT_COLT_BillingCode_303764"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_E2E_HomeAddress_DELT_COLT_BillingCode_303764"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DELT_COLT_BillingCode_303764_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DELT_COLT_BillingCode_303764_20"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DELT_COLT_BillingCode_303764_11"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_E2E_HomeAddress_DELT_COLT_BillingCode_303764"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_E2E_HomeAddress_DELT_COLT_BillingCode_303764"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_DELT_COLT_BillingCode_303764"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_DELT_COLT_BillingCode_303764"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_DELT_COLT_BillingCode_303764"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_DELT_COLT_BillingCode_303764"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='db221618-d9c9-4a0a-93de-fb159c647832'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_870101"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_870101"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_870101_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_870101_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_870101_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_870101"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_870101"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_870101"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_870101"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_870101"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_870101"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='6033bbfc-4f25-44ba-ba84-2058578055a2'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863635"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_GBR_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863635"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863635_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863635_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_GBR_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863635_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_GBR_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863635"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_GBR_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863635"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863635"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_GBR_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863635"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863635"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_GBR_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863635"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='bc64279b-564c-48af-97ef-4925459797fc'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863621"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863621"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863621_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863621_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863621_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863621"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863621"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863621"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863621"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863621"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863621"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='bb00a2fd-6897-4e82-8b5f-e4ce2056b311'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863619"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863619"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863619_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863619_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863619_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863619"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863619"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863619"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863619"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863619"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863619"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ff9c88e3-c240-43fb-9a7c-f6815c54569b'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FR_Agency_Standalone_UKLocation_onAiport_roundTrip_ToleranceTotalPrice_TUID_886526"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FR_Agency_Standalone_UKLocation_onAiport_roundTrip_ToleranceTotalPrice_TUID_886526"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_UKLocation_onAiport_roundTrip_ToleranceTotalPrice_TUID_886526_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_UKLocation_onAiport_roundTrip_ToleranceTotalPrice_TUID_886526_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FR_Agency_Standalone_UKLocation_onAiport_roundTrip_ToleranceTotalPrice_TUID_886526_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FR_Agency_Standalone_UKLocation_onAiport_roundTrip_ToleranceTotalPrice_TUID_886526"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FR_Agency_Standalone_UKLocation_onAiport_roundTrip_ToleranceTotalPrice_TUID_886526"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_UKLocation_onAiport_roundTrip_ToleranceTotalPrice_TUID_886526"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FR_Agency_Standalone_UKLocation_onAiport_roundTrip_ToleranceTotalPrice_TUID_886526"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_UKLocation_onAiport_roundTrip_ToleranceTotalPrice_TUID_886526"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FR_Agency_Standalone_UKLocation_onAiport_roundTrip_ToleranceTotalPrice_TUID_886526"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='16d3356a-5e0c-45ed-a2bf-286f304e7398'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_ToleranceTotalPrice_TUID_863610"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_RoundTrip_OffAirport_ToleranceTotalPrice_TUID_863610"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='786e2772-b161-4d96-a294-875789e6c6aa'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_ESP_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863612"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_ESP_Standalone_RoundTrip_OnAirport_ToleranceTotalPrice_TUID_863612"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='00f9f60e-7b67-4ac3-989f-125b7d8cec8b'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_ITA_Standalone_OneWay_OffAirport_ToleranceTotalPrice_TUID_863636"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_ITA_Standalone_OneWay_OffAirport_ToleranceTotalPrice_TUID_863636"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='961ebf16-4c0d-4064-9293-4d0422ef7c78'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863623_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863623_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863623_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863623"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadeus_FRA_Standalone_OneWay_OnAirport_ToleranceTotalPrice_TUID_863623"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='088e777e-0c18-44d0-ab51-b15fbb8dfe63'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "E2E_Location_DelF_ColF_LONW60_315110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_E2E_HomeAddress_DELF_COLF_Loyalty_oneWay_315110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_E2E_HomeAddress_DELF_COLF_Loyalty_oneWay_315110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DELF_COLF_Loyalty_oneWay_315110_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DELF_COLF_Loyalty_oneWay_315110_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DELF_COLF_Loyalty_oneWay_315110_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_E2E_HomeAddress_DELF_COLF_Loyalty_oneWay_315110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_E2E_HomeAddress_DELF_COLF_Loyalty_oneWay_315110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_DELF_COLF_Loyalty_oneWay_315110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_DELF_COLF_Loyalty_oneWay_315110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_DELF_COLF_Loyalty_oneWay_315110"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_DELF_COLF_Loyalty_oneWay_315110"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='088e777e-0c18-44d0-ab51-b15fbb8dfe66'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "E2E_Location_DelF_ColF_EDIW60_31511001"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='db10094c-eb06-486f-9052-279776a8cf10'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_E2E_LONW066_round_ZE_loyalty_PlcaceID_303792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_E2E_LONW066_round_ZE_loyalty_PlcaceID_303792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadues_E2E_LONW066_round_ZE_loyalty_PlcaceID_303792_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadues_E2E_LONW066_round_ZE_loyalty_PlcaceID_303792_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadues_E2E_LONW066_round_ZE_loyalty_PlcaceID_303792_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadues_E2E_LONW066_round_ZE_loyalty_PlcaceID_303792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadues_E2E_LONW066_round_ZE_loyalty_PlcaceID_303792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadues_E2E_LONW066_round_ZE_loyalty_PlcaceID_303792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadues_E2E_LONW066_round_ZE_loyalty_PlcaceID_303792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadues_E2E_LONW066_round_ZE_loyalty_PlcaceID_303792"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadues_E2E_LONW066_round_ZE_loyalty_PlcaceID_303792"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='81eee441-79a7-4986-ada1-f514d0aff00d'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "E2E_Location_LYST01_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DelAndCol_RoundTrip_303761_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DelAndCol_RoundTrip_303761_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_E2E_HomeAddress_DelAndCol_RoundTrip_303761_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_E2E_HomeAddress_DelAndCol_RoundTrip_reservedStatus_303777"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_E2E_HomeAddress_DelAndCol_RoundTrip_303761"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='99c29879-6c0e-4976-8eef-e5b9faf08c01'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_DElAndCol_OneWay_Loyalty_Billing_ZE_LHRW60_EDIW60_443509"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_DElAndCol_OneWay_Loyalty_Billing_ZE_LHRW60_EDIW60_443509"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadues_DElAndCol_OneWay_Loyalty_Billing_ZE_LHRW60_EDIW60_443509_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadues_DElAndCol_OneWay_Loyalty_Billing_ZE_LHRW60_EDIW60_443509_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadues_DElAndCol_OneWay_Loyalty_Billing_ZE_LHRW60_EDIW60_443509_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadues_DElAndCol_OneWay_Loyalty_Billing_ZE_LHRW60_EDIW60_443509"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadues_DElAndCol_OneWay_Loyalty_Billing_ZE_LHRW60_EDIW60_443509"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadues_DElAndCol_OneWay_Loyalty_Billing_ZE_LHRW60_EDIW60_443509"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadues_DElAndCol_OneWay_Loyalty_Billing_ZE_LHRW60_EDIW60_443509"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadues_DElAndCol_OneWay_Loyalty_Billing_ZE_LHRW60_EDIW60_443509"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadues_DElAndCol_OneWay_Loyalty_Billing_ZE_LHRW60_EDIW60_443509"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ecfbd59f-8123-4a20-acfc-5a2f3631603b'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_DElAndCol_PlaceID_Loyalty_Billing_ZE_LHRW66_443524"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_DElAndCol_PlaceID_Loyalty_Billing_ZE_LHRW66_443524"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadues_DElAndCol_PlaceID_Loyalty_Billing_ZE_LHRW66_443524_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadues_DElAndCol_PlaceID_Loyalty_Billing_ZE_LHRW66_443524_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddMultiElements_Amadues_DElAndCol_PlaceID_Loyalty_Billing_ZE_LHRW66_443524_20"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Amadues_DElAndCol_PlaceID_Loyalty_Billing_ZE_LHRW66_443524"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Amadues_DElAndCol_PlaceID_Loyalty_Billing_ZE_LHRW66_443524"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadues_DElAndCol_PlaceID_Loyalty_Billing_ZE_LHRW66_443524"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Amadues_DElAndCol_PlaceID_Loyalty_Billing_ZE_LHRW66_443524"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadues_DElAndCol_PlaceID_Loyalty_Billing_ZE_LHRW66_443524"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Amadues_DElAndCol_PlaceID_Loyalty_Billing_ZE_LHRW66_443524"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ad48ab97-7a9e-4e67-acdc-3bd86c15fb70'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_FRA_Standalone_OneWay_OnAirport_BIQAndGNB_Daily_181584"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_FRA_Standalone_OneWay_OnAirport_BIQAndGNB_Daily_181584"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='ab872572-f254-4f15-b036-0453dedbce30'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_GBR_Standalone_Roundtrip_OnAirport_VLC_Weekly_181586"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_GBR_Standalone_Roundtrip_OnAirport_VLC_Weekly_181586"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='746cdc1c-754c-439c-b6b9-b1bf997cdc22'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_GBR_Standalone_Roundtrip_OnAirport_NCE_WeeklyExtraDay_181587"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_GBR_Standalone_Roundtrip_OnAirport_NCE_WeeklyExtraDay_181587"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='a574646d-91cc-4c07-8ec3-eb0fb9fcb698'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_GBR_Standalone_Roundtrip_OnAirport_LYS_Monthly_181588"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_GBR_Standalone_Roundtrip_OnAirport_LYS_Monthly_181588"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='00af73ae-3046-4817-927b-866ffbb3c25c'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_ASCS_on_roundTrip_GBR_InvalidCompany_185132"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_ASCS_on_roundTrip_GBR_InvalidCompany_185132"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='8d750cd9-ff93-4fc0-8df2-cb80fd3b687f'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_ASCS_on_roundTrip_FRA_InvalidRateCode_183170"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_ASCS_on_roundTrip_FRA_InvalidRateCode_183170"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='e2188499-215c-44e8-bbdb-f32622667261'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_ZI_SDMR_NCET01_TUID_503277"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='4a64bb84-c556-4106-8e80-f81917b7fa32'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_UK_Agency_Standalone_OnAirport_RoundTrip_BCN_WeeklyExtraDay_181527"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_UK_Agency_Standalone_OnAirport_RoundTrip_BCN_WeeklyExtraDay_181527"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='3bc7dea3-9018-47ce-8f1a-365a3f347859'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_UK_Agency_Standalone_OnAirport_RoundTrip_MAD_WeeklyExtraDayExtraHour_181530"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_UK_Agency_Standalone_OnAirport_RoundTrip_MAD_WeeklyExtraDayExtraHour_181530"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='c10af6d4-40f8-436e-83d6-3b6902ce4fa7'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_UK_Agency_Standalone_OnAirport_RoundTrip_LHR_MonthlyExtraDay_181529"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_UK_Agency_Standalone_OnAirport_RoundTrip_LHR_MonthlyExtraDay_181529"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='d96cef02-312d-48b7-bcf0-01ff1ca30f66'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_FR_Agency_Standalone_OnAirport_OneWay_LYS_BIQ_Daily_181524"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_FR_Agency_Standalone_OnAirport_OneWay_LYS_BIQ_Daily_181524"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='727D36B1-3011-433F-8FE0-7B30A4FA4D66'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_FR_Agency_Standalone_OnAirport_OneWay_LYS_BIQ_Daily_181524"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_FR_Agency_Standalone_OnAirport_OneWay_LYS_BIQ_Daily_181524"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='365464d6-2857-41bb-98f9-01930cfca0f6'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Amadues_UK_Agency_Standalone_OnAirport_RoundTrip_CDG_ExtraHour_181526"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Amadues_UK_Agency_Standalone_OnAirport_RoundTrip_CDG_ExtraHour_181526"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--Dynamic search rateType_para: 3-daily  , 6 weekly, 5 weekend, 4 Monthly, 2 trip-->
                    <xsl:when test = "$orig='365464d6-2857-41bb-98f9-01930abcd001'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Search_Common">
                                    <xsl:with-param name = "currencyCodePOSU_para">EUR</xsl:with-param>
                                    <xsl:with-param name = "countryCode_para">FR</xsl:with-param>
                                    <xsl:with-param name = "rateType_para">6</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='365464d6-2857-41bb-98f9-01930abcd004'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Search_Common">
                                    <xsl:with-param name = "currencyCodePOSU_para">EUR</xsl:with-param>
                                    <xsl:with-param name = "countryCode_para">FR</xsl:with-param>
                                    <xsl:with-param name = "rateType_para">4</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='365464d6-2857-41bb-98f9-01930abcd003'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Search_Common">
                                    <xsl:with-param name = "currencyCodePOSU_para">EUR</xsl:with-param>
                                    <xsl:with-param name = "countryCode_para">FR</xsl:with-param>
                                    <xsl:with-param name = "rateType_para">3</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='365464d6-2857-41bb-98f9-01930abcd006'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Search_Common">
                                    <xsl:with-param name = "currencyCodePOSU_para">GBP</xsl:with-param>
                                    <xsl:with-param name = "countryCode_para">GB</xsl:with-param>
                                    <xsl:with-param name = "rateType_para">6</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='365464d6-2857-41bb-98f9-01930abcd005'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Search_Common">
                                    <xsl:with-param name = "currencyCodePOSU_para">GBP</xsl:with-param>
                                    <xsl:with-param name = "countryCode_para">GB</xsl:with-param>
                                    <xsl:with-param name = "rateType_para">4</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test = "$orig='365464d6-2857-41bb-98f9-01930abcd002'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Search_Common">
                                    <xsl:with-param name = "currencyCodePOSU_para">GBP</xsl:with-param>
                                    <xsl:with-param name = "countryCode_para">GB</xsl:with-param>
                                    <xsl:with-param name = "rateType_para">3</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <!--Dynamic for Daily, GBP, same GUID as worldspan template-->
                    <xsl:when test = "$orig='7FF66C39-C47E-4613-A70E-CC99A16FC6C3'">
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:call-template name = "Car_Availability_Dynamic">
                                    <xsl:with-param name = "currencyCodePOSU_para">GBP</xsl:with-param>
                                    <xsl:with-param name = "countryCode_para">GB</xsl:with-param>
                                    <xsl:with-param name = "rateType_para">3</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Dynamic">
                                    <xsl:with-param name = "currencyCodePOSU_para">GBP</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddElements_Dynamic_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddElements_Dynamic_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddElements_Reserve_11"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddElements_GetReservation_Default"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:call-template name = "Car_Sell_Dynamic">
                                    <xsl:with-param name = "currencyCodePOSU_para">GBP</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Dynamic">
                                    <xsl:with-param name = "currencyCodePOSU_para">GBP</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrx:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:call-template name = "CarLocationSearch_Dynamic"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability">
                                <xsl:variable name = "referenceNumber">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:loyaltyNumbersList/rcar:discountNumbers/rcar:customerReferenceInfo[last()]/rcar:referenceNumber"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "substring( $referenceNumber, 1, 3 ) = 'EC_'">
                                        <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode24315">
                                            <xsl:with-param name = "errorCode">
                                                <xsl:value-of select = "substring-after($referenceNumber, 'EC_')"/>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                            <xsl:when test = "count(/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:companyDetails/rcar:companyCode)=0">
                                                <!--no vendor error-->
                                                <xsl:call-template name = "Car_Availability_ErrorMappingUpgrade_ErrorCode24315">
                                                    <xsl:with-param name = "errorCode">
                                                        <xsl:value-of select = "8307"/>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!--<xsl:call-template name = "Car_Availability_Default"/> -->
                                                <xsl:call-template name = "Car_Availability_Dynamic">
                                                    <xsl:with-param name = "currencyCodePOSU_para">GBP</xsl:with-param>
                                                    <xsl:with-param name = "countryCode_para">GB</xsl:with-param>
                                                    <xsl:with-param name = "rateType_para">3</xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfa:Car_RateInformationFromAvailability">
                                <xsl:call-template name = "Car_RateInformationFromAvailability_Dynamic">
                                    <xsl:with-param name = "currencyCodePOSU_para">GBP</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                                <xsl:if test = "$optionCode='0'">
                                    <xsl:call-template name = "PNR_AddElements_Dynamic_0"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='10'">
                                    <xsl:call-template name = "PNR_AddElements_Dynamic_10"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='11'">
                                    <xsl:call-template name = "PNR_AddElements_Reserve_11"/>
                                </xsl:if>
                                <xsl:if test = "$optionCode='20'">
                                    <xsl:call-template name = "PNR_AddElements_GetReservation_Default"/>
                                </xsl:if>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell">
                                <xsl:variable name = "speciaEquipPrefs">
                                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:vehicleInformation/rcss:specialEquipPrefs"/>
                                </xsl:variable>
                                <xsl:choose>
                                    <xsl:when test = "substring( $speciaEquipPrefs, 1, 3 ) = 'SQ_'">
                                        <xsl:choose>
                                            <xsl:when test = "substring-after($speciaEquipPrefs, 'SQ_')='10117'">
                                                <xsl:call-template name = "Car_Sell_10117"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:call-template name = "Car_Sell_InvalidSpeciaEquipment">
                                                    <xsl:with-param name = "errorCode">
                                                        <xsl:value-of select = "substring-after($speciaEquipPrefs, 'SQ_')"/>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test = "substring( $speciaEquipPrefs, 1, 3 ) = 'EH_'">
                                        <xsl:variable name = "tmpErrorCode">
                                            <xsl:value-of select = "substring( $speciaEquipPrefs, 4, 5)"/>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test = "$tmpErrorCode='10192'">
                                                <xsl:call-template name = "Car_Sell_ErrorHandling_10192">
                                                    <xsl:with-param name = "errorCode">
                                                        <xsl:value-of select = "$tmpErrorCode"/>
                                                    </xsl:with-param>
                                                    <xsl:with-param name = "sequence">
                                                        <xsl:value-of select = "substring-after($speciaEquipPrefs, 'EH_10192_')"/>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:call-template name = "Car_Sell_ErrorHandling">
                                                    <xsl:with-param name = "errorCode">
                                                        <xsl:value-of select = "substring-after($speciaEquipPrefs, 'EH_')"/>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:when test = "substring( $speciaEquipPrefs, 1, 3 ) = 'EW_'">
                                        <xsl:call-template name = "Car_Sell_ErrorHandling_Warning">
                                            <xsl:with-param name = "errorCode">
                                                <xsl:value-of select = "substring-after($speciaEquipPrefs, 'EW_')"/>
                                            </xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <!--Start: Below are for user story 437655 Sprint Error Mapping Update -->
                                    <xsl:when test = "$speciaEquipPrefs = 'ErrorMapping'">
                                        <xsl:call-template name = "Car_Sell_ErrorMapping"/>
                                    </xsl:when>
                                    <xsl:when test = "substring( $speciaEquipPrefs, 1, 3 ) = 'EM_'">
                                        <xsl:variable name = "tmpErrorCode">
                                            <xsl:value-of select = "substring( $speciaEquipPrefs, 4, 5)"/>
                                        </xsl:variable>
                                        <xsl:choose>
                                            <xsl:when test = "$tmpErrorCode='10192'">
                                                <xsl:call-template name = "Car_Sell_ErrorMapping">
                                                    <xsl:with-param name = "errorCode">
                                                        <xsl:value-of select = "$tmpErrorCode"/>
                                                    </xsl:with-param>
                                                    <xsl:with-param name = "sequence">
                                                        <xsl:value-of select = "substring-after($speciaEquipPrefs, 'EM_10192_')"/>
                                                    </xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:when>
                                        </xsl:choose>
                                    </xsl:when>
                                    <!--End for user story 437655 Sprint Error Mapping Update-->
                                    <xsl:otherwise>
                                        <xsl:call-template name = "Car_Sell_Dynamic">
                                            <xsl:with-param name = "currencyCodePOSU_para">GBP</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/rcfs:Car_RateInformationFromCarSegment">
                                <xsl:call-template name = "Car_RateInformationFromCarSegment_Dynamic">
                                    <xsl:with-param name = "currencyCodePOSU_para">GBP</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Default"/>
                            </xsl:when>
							<xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Retrieve_Default"/>                                    
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Cancel">
                                <xsl:call-template name = "PNR_Cancel_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                                <xsl:call-template name = "PNR_Cancel_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/hsfr:Command_Cryptic">
                                <xsl:call-template name = "Command_Cryptic_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/tdbi:PAY_ManageDBIData">
                                <xsl:call-template name = "PAY_ManageDBIData_Default"/>
                            </xsl:when>
                            <xsl:when test = "/soapenv:Envelope/soapenv:Body/Car_LocationList">
                                <xsl:variable name = "porLongitude" select = "/soapenv:Envelope/soapenv:Body/Car_LocationList/geoCoding/position/porPosition/porLongitude"/>
                                <xsl:variable name = "porLatitude" select = "/soapenv:Envelope/soapenv:Body/Car_LocationList/geoCoding/position/porPosition/porLatitude"/>
                                <xsl:variable name = "airportOrCityCode" select = "/soapenv:Envelope/soapenv:Body/Car_LocationList/cityAirportSelection/locationInfo/airportOrCityCode"/>
                                <xsl:variable name = "selectionOptions" select = "/soapenv:Envelope/soapenv:Body/Car_LocationList/selectionOptions"/>
                                <xsl:choose>
                                    <!--It's for LatLong LocationSearch -->
                                    <xsl:when test = "$porLongitude='-587070' and $porLatitude='5461470'">
                                        <xsl:call-template name = "CarBS_Location_LatLong_DELT_COLT_OHRT_238769"/>
                                    </xsl:when>
                                    <xsl:when test = "$porLongitude='-76091' and $porLatitude='5141405'">
                                        <xsl:call-template name = "ASCS_Location_UK_LatLong_DELT_COLT_OHRT"/>
                                    </xsl:when>
                                    <!--It's for IATA LocationSearch -->
                                    <xsl:when test = "$airportOrCityCode='LYS' and normalize-space($selectionOptions)='CAT DEL' ">
                                        <xsl:call-template name = "ASCS_Location_DELT_COLF_LYSC06"/>
                                    </xsl:when>
                                    <xsl:when test = "$airportOrCityCode='LYS' and normalize-space($selectionOptions)='CAT COL DEL' ">
                                        <xsl:call-template name = "ASCS_Location_DELT_COLT_LYST01"/>
                                    </xsl:when>
                                    <xsl:when test = "$airportOrCityCode='NCE'">
                                        <xsl:call-template name = "Car_LocationList_DELCOL_EXV_303763"/>
                                    </xsl:when>
                                    <xsl:when test = "$airportOrCityCode='EDI'">
                                        <xsl:call-template name = "ASCS_Location_UK_Airport_DELT_COLT_OHRT_ILDT"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:call-template name = "CarLocationSearch_Dynamic"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                    <!--<xsl:choose>
                    <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnra:PNR_AddMultiElements">
                    <xsl:if test = "$optionCode='0'">
                    <asm:SessionNumber>02VZOLVP2F</SessionNumber>
                    </xsl:if>
                    </xsl:when>
                    <xsl:when test = "/soapenv:Envelope/soapenv:Body/pnrr:PNR_Retrieve">
                    <asm:SessionNumber>08FXRF2JOO</SessionNumber>
                    </xsl:when>
                    <xsl:when test = "/soapenv:Envelope/soapenv:Body/PNR_Retrieve">
                    <asm:SessionNumber>07M0C3QPIP</SessionNumber>
                    </xsl:when>
                    </xsl:choose> -->
                </xsl:choose>
            </soapenv:Body>
        </soapenv:Envelope>
    </xsl:template>
</xsl:stylesheet>
