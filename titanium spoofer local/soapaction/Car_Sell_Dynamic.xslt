<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xalan="http://xml.apache.org/xalan" 
xmlns:rcss="http://xml.amadeus.com/RCSSCQ_10_1_1A" xmlns:asm="urn:expedia:amdsessionmanager:datacontract:v1_0_0" 
xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" exclude-result-prefixes="xalan" version="1.0">
  <xsl:template name="Car_Sell_Dynamic">
        <xsl:param name = "currencyCodePOSU_para"/>
                <xsl:variable name = "pickuplocation">
                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:locationInfo[1]/rcss:locationDescription/rcss:name"/>
                </xsl:variable>
                <xsl:variable name = "dropofflocation">
                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:locationInfo[2]/rcss:locationDescription/rcss:name"/>
                </xsl:variable>
                <xsl:variable name = "vendorCode">
                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:companyIdentification/rcss:companyCode"/>
                </xsl:variable>
                <xsl:variable name = "SIPP">
                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:vehicleInformation/rcss:vehicleRentalNeedType/rcss:vehicleRentalPrefType"/>
                </xsl:variable>
                <xsl:variable name = "ccNumber">
                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:payment/rcss:formOfPayment/rcss:creditCardNumber"/>
                </xsl:variable>
					<xsl:param name = "roundTripBoolean">
            			<xsl:choose>
                			<xsl:when test = "$pickuplocation=$dropofflocation">1</xsl:when>
                			<xsl:otherwise>0</xsl:otherwise>
            			</xsl:choose>
        			</xsl:param>
<Car_SellReply xmlns="http://xml.amadeus.com/RCSSCR_10_1_1A">
			<carSegment>
				<bookingIdentifier>
					<referenceType>S</referenceType>
					<uniqueReference>1</uniqueReference>
				</bookingIdentifier>
				<rateStatus>
					<statusCode>HK</statusCode>
				</rateStatus>
				<bookingType>
					<selectionDetails>
						<option>CA</option>
					</selectionDetails>
				</bookingType>
				<marketingInfo>
					<freeTextQualification>
						<textSubjectQualifier>3</textSubjectQualifier>
						<informationType>MK</informationType>
						<companyId>1A</companyId>
						<language>EN</language>
					</freeTextQualification>
					<freeText>    CF. CONDITIONS CARTES DE RETRAIT</freeText>
				</marketingInfo>
				<marketingInfo>
					<freeTextQualification>
						<textSubjectQualifier>3</textSubjectQualifier>
						<informationType>OS</informationType>
						<companyId>1A</companyId>
						<language>EN</language>
					</freeTextQualification>
					<freeText>    UN MINIMUM DE 4 JOURS DE LOCATION SERA FACTURE</freeText>
				</marketingInfo>
				<paxName>
					<travellerDetails>
						<firstName>STTWO CARBSRESERVE</firstName>
					</travellerDetails>
				</paxName>
				<typicalCarData>
					<companyIdentification>
						<travelSector>CAR</travelSector>
						<companyCode><xsl:value-of select = "$vendorCode"/></companyCode>
					</companyIdentification>
					<locationInfo>
						<locationType>176</locationType>
						<locationDescription>
							<code>1A</code>
							<name> <xsl:value-of select = "$pickuplocation"/></name>
						</locationDescription>
						<firstLocationDetails>
							<code>PAR</code>
							<qualifier>145</qualifier>
							<agency>IA</agency>
						</firstLocationDetails>
					</locationInfo>
					<locationInfo>
						<locationType>176</locationType>
						<locationDescription>
							<code>CPY</code>
							<name>CDGT73*ROISSY APT BP 332 CEDEX CDG SER ROISSY</name>
						</locationDescription>
					</locationInfo>
					<locationInfo>
						<locationType>DOL</locationType>
						<locationDescription>
							<code>1A</code>
							<name><xsl:value-of select = "$dropofflocation"/></name>
						</locationDescription>
						<firstLocationDetails>
							<code>PAR</code>
							<qualifier>145</qualifier>
							<agency>IA</agency>
						</firstLocationDetails>
					</locationInfo>
					<locationInfo>
						<locationType>DOL</locationType>
						<locationDescription>
							<code>CPY</code>
							<name>CDGT73*ROISSY APT BP 332 CEDEX CDG SER ROISSY</name>
						</locationDescription>
					</locationInfo>
					<pickupDropoffTimes>
						<beginDateTime>
							<year>2017</year>
							<month>4</month>
							<day>8</day>
							<hour>8</hour>
							<minutes>5</minutes>
						</beginDateTime>
						<endDateTime>
							<year>2017</year>
							<month>4</month>
							<day>11</day>
							<hour>11</hour>
							<minutes>5</minutes>
						</endDateTime>
					</pickupDropoffTimes>
					<vehicleInformation>
						<vehicleCharacteristic>
							<vehicleTypeOwner>ACR</vehicleTypeOwner>
							<vehicleRentalPrefType><xsl:value-of select = "$SIPP"/></vehicleRentalPrefType>
						</vehicleCharacteristic>
					</vehicleInformation>
					<confirmationNbr>
						<reservation>
							<companyId>1A</companyId>
							<controlNumber>1130043343COUNT</controlNumber>
							<controlType>2</controlType>
						</reservation>
					</confirmationNbr>
					<rateCodeInfo>
						<fareCategories>
							<fareType>AY4FR</fareType>
						</fareCategories>
					</rateCodeInfo>
					<rateInfo>
						<tariffInfo>
							<rateType>5NDXS</rateType>
							<ratePlanIndicator>DY</ratePlanIndicator>
							<amountType>GNL</amountType>
						</tariffInfo>
						<rateInformation>
							<category>24</category>
						</rateInformation>
						<chargeDetails>
							<type>RG</type>
							<comment>*AL*EUR64.08DY-0.50 KM 250FK</comment>
						</chargeDetails>
						<chargeDetails>
							<type>RB</type>
							<comment>*AL*EUR256.32 BR-4DY</comment>
						</chargeDetails>
					</rateInfo>
					<rateInfo>
						<tariffInfo>
							<amount><xsl:value-of select = "document('.\uAPI\CarPrices.xml')/CarPrice/Car[@RoundTripBoolean=$roundTripBoolean and @SIPP=$SIPP and @PackageBoolean='0']/@TotalRate"/></amount> 
							<currency><xsl:value-of select = "$currencyCodePOSU_para"/></currency>
							<amountType>904</amountType>
						</tariffInfo>
						<chargeDetails>
							<type>90D</type>
							<numberInParty>4</numberInParty>
						</chargeDetails>
					</rateInfo>
  <xsl:if test = "string-length($ccNumber) &gt; 0">
					<payment>
						<formOfPayment>
							<type>CC</type>
							<vendorCode>CA</vendorCode>
							<creditCardNumber><xsl:value-of select = "$ccNumber"/></creditCardNumber>
							<expiryDate>1217</expiryDate>
							<extendedPayment>GUA</extendedPayment>
						</formOfPayment>
					</payment>
</xsl:if>
					<bookingSource>
						<originatorDetails>
							<originatorId>20263051</originatorId>
						</originatorDetails>
					</bookingSource>
				</typicalCarData>
				<paxTattooNbr>
					<referenceDetails>
						<type>PT</type>
						<value>2</value>
					</referenceDetails>
				</paxTattooNbr>
			</carSegment>
		</Car_SellReply>
  </xsl:template>
</xsl:stylesheet>
