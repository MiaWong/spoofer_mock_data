<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xalan="http://xml.apache.org/xalan" 
xmlns:rcfs="http://xml.amadeus.com/RCFSRQ_05_2_1A"   xmlns:awsse="http://xml.amadeus.com/2010/06/Session_v3" 
  xmlns:soapenv = "http://schemas.xmlsoap.org/soap/envelope/" exclude-result-prefixes="xalan" version="1.0">
  <xsl:template name="Car_RateInformationFromCarSegment_Dynamic">
        <xsl:param name = "currencyCodePOSU_para"/>
                <xsl:variable name = "sessionID">
                    <xsl:value-of select = "/soapenv:Envelope/soapenv:Header/awsse:Session/awsse:SessionId"/>
                </xsl:variable>
                <xsl:variable name = "SIPP">
                    <xsl:value-of select = "substring($sessionID,7,4)"/>
                </xsl:variable>
                <xsl:variable name = "roundTripBoolean">
                    <xsl:value-of select = "substring($sessionID,1,1)"/>
                </xsl:variable>

	<Car_RateInformationFromCarSegmentReply xmlns="http://xml.amadeus.com/RCFSRR_05_2_1A">
			<rateDetails>
				<companyIdentification>
					<travelSector>CAR</travelSector>
					<companyCode><xsl:value-of select = "substring($sessionID,5,2)"/></companyCode>
					<companyName>ALAMO</companyName>
					<accessLevel>CP</accessLevel>
				</companyIdentification>
				<sourceLevel>
					<selectionDetails>
						<option>P4</option>
					</selectionDetails>
				</sourceLevel>
				<mktText>
					<freeTextDetails>
						<textSubjectQualifier>3</textSubjectQualifier>
						<informationType>MK</informationType>
						<companyId>1A</companyId>
						<language>EN</language>
						<encoding>2</encoding>
					</freeTextDetails>
					<freeText>    CF. CONDITIONS CARTES DE RETRAIT</freeText>
				</mktText>
				<rateDetail>
					<tariffInfo>
						<amount>64.08</amount>
						<currency><xsl:value-of select = "$currencyCodePOSU_para"/></currency>
						<ratePlanIndicator>DY</ratePlanIndicator>
						<amountType>RP</amountType>
					</tariffInfo>
					<chargeDetails>
						<type>034</type>
						<amount>1000</amount>
					</chargeDetails>
					<chargeDetails>
						<type>032</type>
						<amount>0.5</amount>
					</chargeDetails>
					<chargeDetails>
						<type>008</type>
						<amount>64.08</amount>
					</chargeDetails>
					<chargeDetails>
						<type>80</type>
						<amount>250</amount>
					</chargeDetails>
					<chargeDetails>
						<type>009</type>
						<amount>64.08</amount>
					</chargeDetails>
					<chargeDetails>
						<type>82</type>
						<amount>250</amount>
					</chargeDetails>
					<chargeDetails>
						<type>045</type>
						<amount>0.00</amount>
						<comment>TAX-TAX</comment>
					</chargeDetails>
					<chargeDetails>
						<type>108</type>
						<amount>0.00</amount>
						<comment>SCG - GENERAL SURCHARGE</comment>
					</chargeDetails>
					<chargeDetails>
						<type>108</type>
						<amount>0.00</amount>
						<comment>SCG - GENERAL SURCHARGE</comment>
					</chargeDetails>
					<chargeDetails>
						<type>108</type>
						<amount>32.69</amount>
						<comment>SCG - GENERAL SURCHARGE</comment>
					</chargeDetails>
					<chargeDetails>
						<type>108</type>
						<amount>2.51</amount>
						<comment>SCG - GENERAL SURCHARGE</comment>
					</chargeDetails>
				</rateDetail>
				<rateDetail>
					<tariffInfo>
						<amount><xsl:value-of select = "document('.\uAPI\CarPrices.xml')/CarPrice/Car[@RoundTripBoolean=$roundTripBoolean and @SIPP=$SIPP and @PackageBoolean='0']/@BaseRate"/></amount>
						<currency><xsl:value-of select = "$currencyCodePOSU_para"/></currency>
						<amountType>RB</amountType>
					</tariffInfo>
					<chargeDetails>
						<type>NBD</type>
						<amount>4</amount>
					</chargeDetails>
				</rateDetail>
				<rateDetail>
					<tariffInfo>
						<amount><xsl:value-of select = "document('.\uAPI\CarPrices.xml')/CarPrice/Car[@RoundTripBoolean=$roundTripBoolean and @SIPP=$SIPP and @PackageBoolean='0']/@TotalRate"/></amount>
						<currency><xsl:value-of select = "$currencyCodePOSU_para"/></currency>
						<amountType>904</amountType>
					</tariffInfo>
				</rateDetail>
				<dummy></dummy>
				<remarks>
					<freeTextDetails>
						<textSubjectQualifier>3</textSubjectQualifier>
						<informationType>SI</informationType>
						<companyId>1A</companyId>
						<source>S</source>
						<encoding>2</encoding>
					</freeTextDetails>
					<freeText>BASE RATE INCLUDES SURCHARGES</freeText>
					<freeText>BASE RATE INCLUDES TAXES</freeText>
					<freeText>PRICE INCLUDES TAX SURCHARGE INSURANCE. 0.00 EUR</freeText>
					<freeText>COLLISION DAMAGE WAIVER ALREADY INCLUDED.</freeText>
					<freeText>RETOUR AUTORISE SUR CERTAINES AGENCES UNIQUEMENT</freeText>
					<freeText>UN MINIMUM DE 4 JOURS DE LOCATION SERA FACTURE</freeText>
					<freeText>BASE RATE INCLUDES SURCHARGES</freeText>
					<freeText>BASE RATE INCLUDES TAXES</freeText>
					<freeText>PRICE INCLUDES TAX SURCHARGE INSURANCE. 0.00 EUR</freeText>
					<freeText>COLLISION DAMAGE WAIVER ALREADY INCLUDED.</freeText>
					<freeText>RETOUR AUTORISE SUR CERTAINES AGENCES UNIQUEMENT</freeText>
					<freeText>UN MINIMUM DE 4 JOURS DE LOCATION SERA FACTURE</freeText>
				</remarks>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>108</type>
							<amount>0.00</amount>
							<description>IBR</description>
							<periodType>001</periodType>
							<currency>EUR</currency>
							<comment>SCG - GENERAL SURCHARGE</comment>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
					<additionalInfo>
						<freeTextDetails>
							<textSubjectQualifier>3</textSubjectQualifier>
							<informationType>SI</informationType>
							<companyId>1A</companyId>
							<source>S</source>
							<encoding>2</encoding>
						</freeTextDetails>
						<freeText>COLLISION DAMAGE WAIVER</freeText>
					</additionalInfo>
				</taxCovSurchargeGroup>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>108</type>
							<amount>0.00</amount>
							<description>IBR</description>
							<periodType>001</periodType>
							<currency>EUR</currency>
							<comment>SCG - GENERAL SURCHARGE</comment>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
					<additionalInfo>
						<freeTextDetails>
							<textSubjectQualifier>3</textSubjectQualifier>
							<informationType>SI</informationType>
							<companyId>1A</companyId>
							<source>S</source>
							<encoding>2</encoding>
						</freeTextDetails>
						<freeText>THEFT PROTECTION</freeText>
					</additionalInfo>
				</taxCovSurchargeGroup>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>108</type>
							<amount>32.69</amount>
							<description>IBR</description>
							<periodType>001</periodType>
							<currency>EUR</currency>
							<comment>SCG - GENERAL SURCHARGE</comment>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
					<additionalInfo>
						<freeTextDetails>
							<textSubjectQualifier>3</textSubjectQualifier>
							<informationType>SI</informationType>
							<companyId>1A</companyId>
							<source>S</source>
							<encoding>2</encoding>
						</freeTextDetails>
						<freeText>PREMIUM LOC FEE 32.69 EURO/RNTL</freeText>
					</additionalInfo>
				</taxCovSurchargeGroup>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>108</type>
							<amount>2.51</amount>
							<description>IBR</description>
							<periodType>001</periodType>
							<currency>EUR</currency>
							<comment>SCG - GENERAL SURCHARGE</comment>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
					<additionalInfo>
						<freeTextDetails>
							<textSubjectQualifier>3</textSubjectQualifier>
							<informationType>SI</informationType>
							<companyId>1A</companyId>
							<source>S</source>
							<encoding>2</encoding>
						</freeTextDetails>
						<freeText>VEHICLE LICENSE FEE 2.51 EURO/DAY</freeText>
					</additionalInfo>
				</taxCovSurchargeGroup>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>COV</type>
							<amount>18.00</amount>
							<description>OPT</description>
							<periodType>001</periodType>
							<currency>EUR</currency>
							<comment>CDW - COLLISION DAMAGE WAIVER</comment>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
				</taxCovSurchargeGroup>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>COV</type>
							<amount>17.00</amount>
							<description>OPT</description>
							<periodType>001</periodType>
							<currency>EUR</currency>
							<comment>COV - EP</comment>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
				</taxCovSurchargeGroup>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>COV</type>
							<amount>12.50</amount>
							<description>OPT</description>
							<periodType>001</periodType>
							<currency>EUR</currency>
							<comment>COV - EXS</comment>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
				</taxCovSurchargeGroup>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>COV</type>
							<amount>18.06</amount>
							<description>OPT</description>
							<periodType>001</periodType>
							<currency>EUR</currency>
							<comment>COV - S/DW1</comment>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
				</taxCovSurchargeGroup>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>045</type>
							<amount>20.00</amount>
							<description>IBR</description>
							<periodType>012</periodType>
							<currency>EUR</currency>
							<comment>TAX-TAX</comment>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
					<additionalInfo>
						<freeTextDetails>
							<textSubjectQualifier>3</textSubjectQualifier>
							<informationType>SI</informationType>
							<companyId>1A</companyId>
							<source>S</source>
							<encoding>2</encoding>
						</freeTextDetails>
						<freeText>VALUE ADDED TAX</freeText>
					</additionalInfo>
				</taxCovSurchargeGroup>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>013</type>
							<description>OPT</description>
							<comment>CSI - CHILD SEAT FOR INFANT</comment>
						</chargeDetails>
						<chargeDetails>
							<type>013</type>
							<amount>30.00</amount>
							<periodType>004</periodType>
							<currency>EUR</currency>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
				</taxCovSurchargeGroup>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>013</type>
							<description>OPT</description>
							<comment>CST - CHILD SEAT FOR TODDLER</comment>
						</chargeDetails>
						<chargeDetails>
							<type>013</type>
							<amount>15.00</amount>
							<periodType>004</periodType>
							<currency>EUR</currency>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
				</taxCovSurchargeGroup>
				<taxCovSurchargeGroup>
					<taxSurchargeCoverageInfo>
						<tariffInfo>
							<currency>EUR</currency>
						</tariffInfo>
						<chargeDetails>
							<type>013</type>
							<description>OPT</description>
							<comment>NAV - NAVIGATION SYSTEM</comment>
						</chargeDetails>
						<chargeDetails>
							<type>013</type>
							<amount>40.00</amount>
							<periodType>004</periodType>
							<currency>EUR</currency>
						</chargeDetails>
					</taxSurchargeCoverageInfo>
				</taxCovSurchargeGroup>
				<vehicleInfoGroup>
					<vehicleDetails>
						<vehicleCharacteristic>
							<vehicleTypeOwner>ACR</vehicleTypeOwner>
							<vehicleRentalPrefType><xsl:value-of select = "substring($sessionID,7,4)"/></vehicleRentalPrefType>
						</vehicleCharacteristic>
						<freeTextDetails>
							<textSubjectQualifier>3</textSubjectQualifier>
							<informationType>SI</informationType>
							<companyId>1A</companyId>
							<encoding>1</encoding>
						</freeTextDetails>
						<carModel>TOYOTA AVENSIS BREAK OR SIMILA</carModel>
					</vehicleDetails>
				</vehicleInfoGroup>
				<otherRulesGroup>
					<otherRules>
						<ruleDetails>
							<type>OWI</type>
							<qualifier>009</qualifier>
						</ruleDetails>
					</otherRules>
				</otherRulesGroup>
				<otherRulesGroup>
					<otherRules>
						<ruleDetails>
							<type>GUA</type>
							<quantity>149</quantity>
						</ruleDetails>
						<ruleText>
							<textType>GUA</textType>
							<freeText>RATE GUARANTEED 149 DAYS FROM BOOKING</freeText>
						</ruleText>
					</otherRules>
					<dateTimeInfo>
						<businessSemantic>BED</businessSemantic>
						<beginDateTime>
							<year>2016</year>
							<month>11</month>
							<day>10</day>
						</beginDateTime>
						<endDateTime>
							<year>2017</year>
							<month>4</month>
							<day>8</day>
						</endDateTime>
					</dateTimeInfo>
				</otherRulesGroup>
				<pickupDropoffLocation>
					<locationCode>
						<locationType>176</locationType>
						<locationDescription>
							<code>CPY</code>
							<name>CDGT73*</name>
						</locationDescription>
					</locationCode>
					<address>
						<addressDetails>
							<format>5</format>
							<line1>ROISSY APT BP 332 CEDEX CDG SERVICED BY ENTERPRISE RENT A CAR</line1>
						</addressDetails>
						<city>ROISSY</city>
						<zipCode>95716</zipCode>
						<countryCode>FR</countryCode>
						<regionDetails>
							<code>J</code>
						</regionDetails>
					</address>
					<openingHours>
						<businessSemantic>OCH</businessSemantic>
						<beginDateTime>
							<hour>06</hour>
							<minutes>00</minutes>
						</beginDateTime>
						<endDateTime>
							<hour>23</hour>
							<minutes>59</minutes>
						</endDateTime>
					</openingHours>
					<phone>
						<phoneOrEmailType>FAX</phoneOrEmailType>
						<telephoneNumber>
							<telephoneNumber>33 0148621204</telephoneNumber>
						</telephoneNumber>
					</phone>
					<phone>
						<phoneOrEmailType>PHO</phoneOrEmailType>
						<telephoneNumber>
							<telephoneNumber>33 0148626581</telephoneNumber>
						</telephoneNumber>
					</phone>
				</pickupDropoffLocation>
				<pickupDropoffLocation>
					<locationCode>
						<locationType>DOL</locationType>
						<locationDescription>
							<code>CPY</code>
							<name>CDGT73*</name>
						</locationDescription>
					</locationCode>
					<address>
						<addressDetails>
							<format>5</format>
							<line1>ROISSY APT BP 332 CEDEX CDG SERVICED BY ENTERPRISE RENT A CAR</line1>
						</addressDetails>
						<city>ROISSY</city>
						<zipCode>95716</zipCode>
						<countryCode>FR</countryCode>
					</address>
					<phone>
						<phoneOrEmailType>FAX</phoneOrEmailType>
						<telephoneNumber>
							<telephoneNumber>33 0148621204</telephoneNumber>
						</telephoneNumber>
					</phone>
					<phone>
						<phoneOrEmailType>PHO</phoneOrEmailType>
						<telephoneNumber>
							<telephoneNumber>33 0148626581</telephoneNumber>
						</telephoneNumber>
					</phone>
				</pickupDropoffLocation>
				<rateCodeGroup>
					<rateCode>
						<fareCategories>
							<fareType>AY4FR</fareType>
						</fareCategories>
					</rateCode>
					<additionalInfo>
						<freeTextDetails>
							<textSubjectQualifier>3</textSubjectQualifier>
							<informationType>SI</informationType>
							<companyId>1A</companyId>
							<source>S</source>
							<encoding>2</encoding>
						</freeTextDetails>
						<freeText>DOM 4 DAY INCLUSIVE</freeText>
					</additionalInfo>
				</rateCodeGroup>
			</rateDetails>
		</Car_RateInformationFromCarSegmentReply>
</xsl:template>
</xsl:stylesheet>
