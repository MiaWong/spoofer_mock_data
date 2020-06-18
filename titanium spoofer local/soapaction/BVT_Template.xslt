<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xalan="http://xml.apache.org/xalan" 
xmlns:rcss="http://xml.amadeus.com/RCSSCQ_10_1_1A" xmlns:rcar="http://xml.amadeus.com/RCARRQ_14_3_1A" 
exclude-result-prefixes="xalan" xmlns:asm="urn:expedia:amdsessionmanager:datacontract:v1_0_0" 
xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" version="1.0">
  <xsl:template name="ACAQ_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip">
    <Car_AvailabilityReply xmlns="http://xml.amadeus.com/RCARRR_14_3_1A">
      <availabilityDetails>
        <computeMarkups>
          <actionRequestCode>N</actionRequestCode>
        </computeMarkups>
        <rateClass>
          <criteriaSetType>COR</criteriaSetType>
        </rateClass>
        <companyLocationInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>ET</companyCode>
            <companyName>ENTERPRISE</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <rentalLocation>
            <address>
              <addressDetails>
                <format>2</format>
                <line1>AEROPORT ST EXUPERY BP 131</line1>
              </addressDetails>
              <city>SATOLAS</city>
              <countryCode>FR</countryCode>
              <regionDetails>
                <stateCode>V</stateCode>
              </regionDetails>
              <locationDetails>
                <code>1A</code>
                <name>LYST61</name>
              </locationDetails>
            </address>
            <rateMarketingInfo>
              <freeTextQualification>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>MK</informationType>
                <companyId>1A</companyId>
                <language>EN</language>
              </freeTextQualification>
              <freeText>TO CONTACT ENTERPRISE CALL 1-800-RENT-A-CAR</freeText>
            </rateMarketingInfo>
            <locationGeocodeInfo>
              <position>
                <encoding>POR</encoding>
                <porPosition>
                  <porLongitude>508111</porLongitude>
                  <porLatitude>4572555</porLatitude>
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
                    <value>188582</value>
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
                <hour>7</hour>
                <minutes>0</minutes>
              </beginDateTime>
              <endDateTime>
                <hour>23</hour>
                <minutes>30</minutes>
              </endDateTime>
            </openingHours>
          </rentalLocation>
        </companyLocationInfo>
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
            <companyCode>ET</companyCode>
            <companyName>ENTERPRISE</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>LYST61</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>LYST61</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>45LVY6DJB070IXH1CBR3</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=ET&amp;cnt=FR&amp;vehcat=EB&amp;item=0&amp;stamp=VEHICLE_0_0_1277114406825&amp;file=7.JPEG</identifier>
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
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=ET&amp;cnt=FR&amp;vehcat=EB&amp;item=0&amp;stamp=VEHICLE_0_0_1277114406825&amp;file=4.JPEG</identifier>
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
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>M1038</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>NNDXS</rateIdentifier>
              <rateAmount>51.67</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>155.01</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>002</rateCategory>
              <processIndicator>EXA</processIndicator>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>2</chargeType>
            </associatedCharges>
            <associatedCharges>
              <chargeType>9</chargeType>
              <quantity>1500</quantity>
            </associatedCharges>
            <associatedCharges>
              <chargeType>7</chargeType>
              <amount>0.30</amount>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>FR MINI PACK15 3 DAYS</freeText>
          </rateMarketingInfo>
        </rates>
      </availabilityDetails>
    </Car_AvailabilityReply>
  </xsl:template>
  <xsl:template name="ARIA_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip">
    <Car_RateInformationFromAvailabilityReply xmlns="http://xml.amadeus.com/RCFARR_10_1_1A">
      <rateDetails>
        <companyIdentification>
          <travelSector>CAR</travelSector>
          <companyCode>ET</companyCode>
          <companyName>ENTERPRISE</companyName>
          <accessLevel>CP</accessLevel>
        </companyIdentification>
        <sourceLevel>
          <selectionDetails>
            <option>P6</option>
          </selectionDetails>
        </sourceLevel>
        <mktText>
          <freeTextDetails>
            <textSubjectQualifier>3</textSubjectQualifier>
            <informationType>MK</informationType>
            <companyId>1A</companyId>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>AUTORISE ABANDON AUTORISE DANS AGENCES SPECIFIQUES</freeText>
          <freeText>UN MINIMUM DE 3 JOURS DE LOCATION SERA FACTURE</freeText>
        </mktText>
        <rateDetail>
          <tariffInfo>
            <amount>51.67</amount>
            <currency>EUR</currency>
            <ratePlanIndicator>DY</ratePlanIndicator>
            <amountType>RP</amountType>
            <rateChangeIndicator>GUA</rateChangeIndicator>
          </tariffInfo>
          <rateInformation>
            <category>2</category>
          </rateInformation>
          <chargeDetails>
            <type>032</type>
            <amount>0.30</amount>
          </chargeDetails>
          <chargeDetails>
            <type>034</type>
            <numberInParty>1500</numberInParty>
          </chargeDetails>
          <chargeDetails>
            <type>008</type>
            <amount>51.67</amount>
          </chargeDetails>
          <chargeDetails>
            <type>80</type>
            <numberInParty>500</numberInParty>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>COLLISION DAMAGE WAIVER</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>PERSONAL ACCIDENT INSURANCE 1</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>THEFT PROTECTION</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>PREMIUM LOCATION FEE 32.69EURO/RNTL</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>VEHICLE LICENSE FEE 2.51 EURO/DAY</comment>
          </chargeDetails>
          <chargeDetails>
            <type>COV</type>
            <comment>PAI - PERSONAL ACCIDENT INSURANCE</comment>
          </chargeDetails>
          <chargeDetails>
            <type>COV</type>
            <comment>TP - THEFT PROTECTION</comment>
          </chargeDetails>
          <chargeDetails>
            <type>045</type>
            <comment>VALUE ADDED TAX</comment>
          </chargeDetails>
        </rateDetail>
        <rateDetail>
          <tariffInfo>
            <amount>155.01</amount>
            <currency>EUR</currency>
            <amountType>RB</amountType>
          </tariffInfo>
          <chargeDetails>
            <type>NBD</type>
            <amount>3</amount>
          </chargeDetails>
        </rateDetail>
        <rateDetail>
          <tariffInfo>
            <amount>155.01</amount>
            <currency>EUR</currency>
            <amountType>904</amountType>
          </tariffInfo>
        </rateDetail>
        <dummy>
        </dummy>
        <remarks>
          <freeTextDetails>
            <textSubjectQualifier>3</textSubjectQualifier>
            <informationType>SI</informationType>
            <companyId>1A</companyId>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>BASE RATE INCLUDES SURCHARGES</freeText>
          <freeText>BASE RATE INCLUDES TAXES</freeText>
          <freeText>PRICE INCLUDES TAX SURCHARGE INSURANCE. 0.00 EUR</freeText>
          <freeText>COLLISION DAMAGE WAIVER ALREADY INCLUDED.</freeText>
          <freeText>AUTORISE ABANDON AUTORISE DANS AGENCES SPECIFIQUES</freeText>
          <freeText>UN MINIMUM DE 3 JOURS DE LOCATION SERA FACTURE</freeText>
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
              <comment>COLLISION DAMAGE WAIVER</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
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
              <comment>PERSONAL ACCIDENT INSURANCE 1</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
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
              <comment>THEFT PROTECTION</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
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
              <comment>PREMIUM LOCATION FEE 32.69EURO/RNTL</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
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
              <comment>VEHICLE LICENSE FEE 2.51 EURO/DAY</comment>
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
              <amount>6.02</amount>
              <description>IBR</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>PAI - PERSONAL ACCIDENT INSURANCE</comment>
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
              <amount>4.93</amount>
              <description>IBR</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>TP - THEFT PROTECTION</comment>
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
              <amount>15.00</amount>
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
              <amount>30.00</amount>
              <description>OPT</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>COV - PW1</comment>
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
              <amount>10.03</amount>
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
              <comment>VALUE ADDED TAX</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <vehicleInfoGroup>
          <vehicleDetails>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <freeTextDetails>
              <textSubjectQualifier>3</textSubjectQualifier>
              <informationType>SI</informationType>
              <companyId>1A</companyId>
              <encoding>1</encoding>
            </freeTextDetails>
            <carModel>PEUGEOT 206 OR SIMILAR</carModel>
          </vehicleDetails>
        </vehicleInfoGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>01</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>02</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>03</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>04</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>05</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>06</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>07</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
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
              <quantity>179</quantity>
              <quantityUnit>3</quantityUnit>
            </ruleDetails>
            <ruleText>
              <textType>GUA</textType>
              <freeText>RATE GUARANTEED 179 DAYS FROM BOOKING</freeText>
            </ruleText>
          </otherRules>
          <dateTimeInfo>
            <businessSemantic>BED</businessSemantic>
            <beginDateTime>
              <year>2014</year>
              <month>4</month>
              <day>11</day>
            </beginDateTime>
            <endDateTime>
              <year>2014</year>
              <month>10</month>
              <day>8</day>
            </endDateTime>
          </dateTimeInfo>
        </otherRulesGroup>
        <pickupDropoffLocation>
          <locationCode>
            <locationType>176</locationType>
            <locationDescription>
              <code>1A</code>
              <name>LYST61</name>
            </locationDescription>
          </locationCode>
          <address>
            <addressDetails>
              <format>5</format>
              <line1>AEROPORT ST EXUPERY BP 131</line1>
            </addressDetails>
            <city>SATOLAS 69125</city>
            <countryCode>FR</countryCode>
            <regionDetails>
              <code>V</code>
            </regionDetails>
          </address>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
            <beginDateTime>
              <hour>7</hour>
              <minutes>0</minutes>
            </beginDateTime>
            <endDateTime>
              <hour>23</hour>
              <minutes>30</minutes>
            </endDateTime>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <phone>
            <phoneOrEmailType>PHO</phoneOrEmailType>
            <telephoneNumber>
              <telephoneNumber>33 0472227487</telephoneNumber>
            </telephoneNumber>
          </phone>
        </pickupDropoffLocation>
        <pickupDropoffLocation>
          <locationCode>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>LYST61</name>
            </locationDescription>
          </locationCode>
          <address>
            <addressDetails>
              <format>5</format>
              <line1>AEROPORT ST EXUPERY BP 131</line1>
            </addressDetails>
            <city>SATOLAS 69125</city>
            <countryCode>FR</countryCode>
            <regionDetails>
              <code>V</code>
            </regionDetails>
          </address>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
        </pickupDropoffLocation>
        <rateCodeGroup>
          <rateCode>
            <fareCategories>
              <fareType>M1038</fareType>
            </fareCategories>
          </rateCode>
          <additionalInfo>
            <freeTextDetails>
              <textSubjectQualifier>3</textSubjectQualifier>
              <informationType>SI</informationType>
              <companyId>1A</companyId>
              <encoding>1</encoding>
            </freeTextDetails>
            <freeText>FR MINI PACK15 3 DAYS</freeText>
          </additionalInfo>
        </rateCodeGroup>
      </rateDetails>
    </Car_RateInformationFromAvailabilityReply>
  </xsl:template>
  <xsl:template name="CarSell_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip">
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
          <freeText>CF. CONDITIONS CARTES DE RETRAIT</freeText>
        </marketingInfo>
        <marketingInfo>
          <freeTextQualification>
            <textSubjectQualifier>3</textSubjectQualifier>
            <informationType>OS</informationType>
            <companyId>1A</companyId>
            <language>EN</language>
          </freeTextQualification>
          <freeText>UN MINIMUM DE 3 JOURS DE LOCATION SERA FACTURE</freeText>
        </marketingInfo>
        <paxName>
          <travellerDetails>
            <firstName>STTWO CARS</firstName>
          </travellerDetails>
        </paxName>
        <typicalCarData>
          <companyIdentification>
            <travelSector>CAR</travelSector>
            <companyCode>ET</companyCode>
          </companyIdentification>
          <locationInfo>
            <locationType>176</locationType>
            <locationDescription>
              <code>1A</code>
              <name>LYST61</name>
            </locationDescription>
            <firstLocationDetails>
              <code>LYS</code>
              <qualifier>145</qualifier>
              <agency>IA</agency>
            </firstLocationDetails>
          </locationInfo>
          <locationInfo>
            <locationType>176</locationType>
            <locationDescription>
              <code>CPY</code>
              <name>LYST61*AEROPORT ST EXUPERYBP 131 SATOLAS</name>
            </locationDescription>
          </locationInfo>
          <locationInfo>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>LYST61</name>
            </locationDescription>
            <firstLocationDetails>
              <code>LYS</code>
              <qualifier>145</qualifier>
              <agency>IA</agency>
            </firstLocationDetails>
          </locationInfo>
          <locationInfo>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>CPY</code>
              <name>LYST61*AEROPORT ST EXUPERYBP 131 SATOLAS</name>
            </locationDescription>
          </locationInfo>
          <pickupDropoffTimes>
            <beginDateTime>
              <year>2014</year>
              <month>10</month>
              <day>8</day>
              <hour>10</hour>
              <minutes>52</minutes>
            </beginDateTime>
            <endDateTime>
              <year>2014</year>
              <month>10</month>
              <day>11</day>
              <hour>10</hour>
              <minutes>52</minutes>
            </endDateTime>
          </pickupDropoffTimes>
          <vehicleInformation>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
          </vehicleInformation>
          <confirmationNbr>
            <reservation>
              <companyId>1A</companyId>
              <controlNumber>144575992COUNT</controlNumber>
              <controlType>2</controlType>
            </reservation>
          </confirmationNbr>
          <rateCodeInfo>
            <fareCategories>
              <fareType>M1038</fareType>
            </fareCategories>
          </rateCodeInfo>
          <rateInfo>
            <tariffInfo>
              <rateType>NNDXS</rateType>
              <ratePlanIndicator>DY</ratePlanIndicator>
              <amountType>GNL</amountType>
            </tariffInfo>
            <rateInformation>
              <category>24</category>
            </rateInformation>
            <chargeDetails>
              <type>RG</type>
              <comment>*ET*EUR51.67DY-0.30 KM 500FK</comment>
            </chargeDetails>
          </rateInfo>
          <rateInfo>
            <tariffInfo>
              <amount>155.01</amount>
              <currency>EUR</currency>
              <amountType>RB</amountType>
            </tariffInfo>
            <chargeDetails>
              <type>RBP</type>
              <numberInParty>3</numberInParty>
            </chargeDetails>
          </rateInfo>
          <rateInfo>
            <tariffInfo>
              <amount>155.01</amount>
              <currency>EUR</currency>
              <amountType>904</amountType>
            </tariffInfo>
            <chargeDetails>
              <type>90D</type>
              <numberInParty>3</numberInParty>
            </chargeDetails>
          </rateInfo>
          <payment>
            <formOfPayment>
              <type>CC</type>
              <vendorCode>CA</vendorCode>
              <creditCardNumber>XXXXXXXXXXXXXXXXXXXXXXXX5390</creditCardNumber>
              <expiryDate>1215</expiryDate>
              <extendedPayment>GUA</extendedPayment>
            </formOfPayment>
          </payment>
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
  <xsl:template name="PNR0_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip">
    <PNR_Reply xmlns="http://xml.amadeus.com/PNRACC_11_1_1A">
      <pnrHeader>
        <reservationInfo>
          <reservation>
            <companyId>1A</companyId>
          </reservation>
        </reservationInfo>
      </pnrHeader>
      <securityInformation>
        <responsibilityInformation>
          <typeOfPnrElement>RP</typeOfPnrElement>
          <officeId>PAREC38EE</officeId>
          <iataCode>20263051</iataCode>
        </responsibilityInformation>
        <queueingInformation>
          <queueingOfficeId>PAREC38EE</queueingOfficeId>
        </queueingInformation>
      </securityInformation>
      <sbrPOSDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <inHouseIdentification1>
            </inHouseIdentification1>
          </originIdentification>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>
            </companyId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>
            </codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrPOSDetails>
      <sbrCreationPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <inHouseIdentification1>
            </inHouseIdentification1>
          </originIdentification>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>
            </companyId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>
            </codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrCreationPosDetails>
      <sbrUpdatorPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrUpdatorPosDetails>
      <travellerInfo>
        <elementManagementPassenger>
          <reference>
            <qualifier>PT</qualifier>
            <number>2</number>
          </reference>
          <segmentName>NM</segmentName>
          <lineNumber>1</lineNumber>
        </elementManagementPassenger>
        <passengerData>
          <travellerInformation>
            <traveller>
              <surname>STTWO</surname>
              <quantity>1</quantity>
            </traveller>
            <passenger>
              <firstName>CARS</firstName>
            </passenger>
          </travellerInformation>
        </passengerData>
      </travellerInfo>
      <dataElementsMaster>
        <marker2>
        </marker2>
        <dataElementsIndiv>
          <elementManagementData>
            <segmentName>RF</segmentName>
          </elementManagementData>
          <otherDataFreetext>
            <freetextDetail>
              <subjectQualifier>3</subjectQualifier>
              <type>P22</type>
            </freetextDetail>
            <longFreetext>PAREC38EE-MCG-EXPEDI/WSECTEEU</longFreetext>
          </otherDataFreetext>
        </dataElementsIndiv>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>2</number>
            </reference>
            <segmentName>AP</segmentName>
            <lineNumber>2</lineNumber>
          </elementManagementData>
          <otherDataFreetext>
            <freetextDetail>
              <subjectQualifier>3</subjectQualifier>
              <type>3</type>
            </freetextDetail>
            <longFreetext>1425555-5555</longFreetext>
          </otherDataFreetext>
        </dataElementsIndiv>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>5</number>
            </reference>
            <segmentName>TK</segmentName>
            <lineNumber>3</lineNumber>
          </elementManagementData>
          <ticketElement>
            <passengerType>PAX</passengerType>
            <ticket>
              <indicator>OK</indicator>
              <date>110414</date>
              <officeId>PAREC38EE</officeId>
            </ticket>
          </ticketElement>
        </dataElementsIndiv>
      </dataElementsMaster>
    </PNR_Reply>
  </xsl:template>
  <xsl:template name="PNR10_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip">
    <PNR_Reply xmlns="http://xml.amadeus.com/PNRACC_11_1_1A">
      <pnrHeader>
        <reservationInfo>
          <reservation>
            <companyId>1A</companyId>
            <controlNumber>39TUJS</controlNumber>
          </reservation>
        </reservationInfo>
      </pnrHeader>
      <securityInformation>
        <responsibilityInformation>
          <typeOfPnrElement>RP</typeOfPnrElement>
        </responsibilityInformation>
      </securityInformation>
      <sbrPOSDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <inHouseIdentification1>
            </inHouseIdentification1>
          </originIdentification>
        </sbrUserIdentificationOwn>
      </sbrPOSDetails>
      <sbrCreationPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <inHouseIdentification1>
            </inHouseIdentification1>
          </originIdentification>
        </sbrUserIdentificationOwn>
      </sbrCreationPosDetails>
      <sbrUpdatorPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <inHouseIdentification1>
            </inHouseIdentification1>
          </originIdentification>
        </sbrUserIdentificationOwn>
      </sbrUpdatorPosDetails>
      <originDestinationDetails>
        <originDestination>
        </originDestination>
      </originDestinationDetails>
      <dataElementsMaster>
        <marker2>
        </marker2>
      </dataElementsMaster>
    </PNR_Reply>
  </xsl:template>
  <xsl:template name="PNR20_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip">
    <PNR_Reply xmlns="http://xml.amadeus.com/PNRACC_11_1_1A">
      <pnrHeader>
        <reservationInfo>
          <reservation>
            <companyId>1A</companyId>
          </reservation>
        </reservationInfo>
      </pnrHeader>
      <securityInformation>
        <responsibilityInformation>
          <typeOfPnrElement>RP</typeOfPnrElement>
          <officeId>PAREC38EE</officeId>
          <iataCode>20263051</iataCode>
        </responsibilityInformation>
        <queueingInformation>
          <queueingOfficeId>PAREC38EE</queueingOfficeId>
        </queueingInformation>
      </securityInformation>
      <sbrPOSDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <inHouseIdentification1>
            </inHouseIdentification1>
          </originIdentification>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>
            </companyId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>
            </codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrPOSDetails>
      <sbrCreationPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <inHouseIdentification1>
            </inHouseIdentification1>
          </originIdentification>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>
            </companyId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>
            </codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrCreationPosDetails>
      <sbrUpdatorPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrUpdatorPosDetails>
    </PNR_Reply>
  </xsl:template>
  <xsl:template name="ARIS_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip">
    <Car_RateInformationFromCarSegmentReply xmlns="http://xml.amadeus.com/RCFSRR_05_2_1A">
      <rateDetails>
        <companyIdentification>
          <travelSector>CAR</travelSector>
          <companyCode>ET</companyCode>
          <companyName>ENTERPRISE</companyName>
          <accessLevel>CP</accessLevel>
        </companyIdentification>
        <sourceLevel>
          <selectionDetails>
            <option>P6</option>
          </selectionDetails>
        </sourceLevel>
        <mktText>
          <freeTextDetails>
            <textSubjectQualifier>3</textSubjectQualifier>
            <informationType>MK</informationType>
            <companyId>1A</companyId>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>CF. CONDITIONS CARTES DE RETRAIT</freeText>
        </mktText>
        <mktText>
          <freeTextDetails>
            <textSubjectQualifier>3</textSubjectQualifier>
            <informationType>OS</informationType>
            <companyId>1A</companyId>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>UN MINIMUM DE 3 JOURS DE LOCATION SERA FACTURE</freeText>
        </mktText>
        <rateDetail>
          <tariffInfo>
            <amount>51.67</amount>
            <currency>EUR</currency>
            <ratePlanIndicator>DY</ratePlanIndicator>
            <amountType>RP</amountType>
            <rateChangeIndicator>GUA</rateChangeIndicator>
          </tariffInfo>
          <rateInformation>
            <category>002</category>
          </rateInformation>
          <chargeDetails>
            <type>032</type>
            <amount>.30</amount>
          </chargeDetails>
          <chargeDetails>
            <type>034</type>
            <numberInParty>1500</numberInParty>
          </chargeDetails>
          <chargeDetails>
            <type>008</type>
            <amount>51.67</amount>
          </chargeDetails>
          <chargeDetails>
            <type>80</type>
            <numberInParty>500</numberInParty>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>COLLISION DAMAGE WAIVER</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>PERSONAL ACCIDENT INSURANCE 1</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>THEFT PROTECTION</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>PREMIUM LOCATION FEE 32.69EURO/RNTL</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>VEHICLE LICENSE FEE 2.51 EURO/DAY</comment>
          </chargeDetails>
          <chargeDetails>
            <type>COV</type>
            <comment>PAI - PERSONAL ACCIDENT INSURANCE</comment>
          </chargeDetails>
          <chargeDetails>
            <type>COV</type>
            <comment>TP - THEFT PROTECTION</comment>
          </chargeDetails>
          <chargeDetails>
            <type>045</type>
            <comment>VALUE ADDED TAX</comment>
          </chargeDetails>
        </rateDetail>
        <rateDetail>
          <tariffInfo>
            <amount>155.01</amount>
            <currency>EUR</currency>
            <amountType>RB</amountType>
          </tariffInfo>
          <chargeDetails>
            <type>NBD</type>
            <amount>3</amount>
          </chargeDetails>
          <chargeDetails>
            <type>NBH</type>
            <amount>0</amount>
          </chargeDetails>
        </rateDetail>
        <rateDetail>
          <tariffInfo>
            <amount>155.01</amount>
            <currency>EUR</currency>
            <amountType>904</amountType>
          </tariffInfo>
        </rateDetail>
        <dummy>
        </dummy>
        <remarks>
          <freeTextDetails>
            <textSubjectQualifier>3</textSubjectQualifier>
            <informationType>SI</informationType>
            <companyId>1A</companyId>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>BASE RATE INCLUDES SURCHARGES</freeText>
          <freeText>BASE RATE INCLUDES TAXES</freeText>
          <freeText>PRICE INCLUDES TAX SURCHARGE INSURANCE. 0.00 EUR</freeText>
          <freeText>COLLISION DAMAGE WAIVER ALREADY INCLUDED.</freeText>
          <freeText>AUTORISE ABANDON AUTORISE DANS AGENCES SPECIFIQUES</freeText>
          <freeText>UN MINIMUM DE 3 JOURS DE LOCATION SERA FACTURE</freeText>
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
              <comment>COLLISION DAMAGE WAIVER</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
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
              <comment>PERSONAL ACCIDENT INSURANCE 1</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
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
              <comment>THEFT PROTECTION</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
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
              <comment>PREMIUM LOCATION FEE 32.69EURO/RNTL</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
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
              <comment>VEHICLE LICENSE FEE 2.51 EURO/DAY</comment>
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
              <amount>6.02</amount>
              <description>IBR</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>PAI - PERSONAL ACCIDENT INSURANCE</comment>
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
              <amount>4.93</amount>
              <description>IBR</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>TP - THEFT PROTECTION</comment>
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
              <amount>15.00</amount>
              <description>OPT</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>EP</comment>
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
              <amount>30.00</amount>
              <description>OPT</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>PW1</comment>
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
              <amount>10.03</amount>
              <description>OPT</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>S/DW1</comment>
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
              <comment>VALUE ADDED TAX</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <vehicleInfoGroup>
          <vehicleDetails>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <freeTextDetails>
              <textSubjectQualifier>3</textSubjectQualifier>
              <informationType>SI</informationType>
              <companyId>1A</companyId>
              <encoding>1</encoding>
            </freeTextDetails>
            <carModel>PEUGEOT 206 OR SIMILAR</carModel>
          </vehicleDetails>
        </vehicleInfoGroup>
        <pickupDropoffLocation>
          <locationCode>
            <locationType>176</locationType>
            <locationDescription>
              <code>CPY</code>
              <name>LYST61*</name>
            </locationDescription>
          </locationCode>
          <address>
            <addressDetails>
              <format>5</format>
              <line1>AEROPORT ST EXUPERY BP 131</line1>
            </addressDetails>
            <city>SATOLAS 69125</city>
            <countryCode>FR</countryCode>
          </address>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
            <beginDateTime>
              <hour>7</hour>
              <minutes>0</minutes>
            </beginDateTime>
            <endDateTime>
              <hour>23</hour>
              <minutes>30</minutes>
            </endDateTime>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <phone>
            <phoneOrEmailType>PHO</phoneOrEmailType>
            <telephoneNumber>
              <telephoneNumber>33 0472227487</telephoneNumber>
            </telephoneNumber>
          </phone>
        </pickupDropoffLocation>
        <rateCodeGroup>
          <rateCode>
            <fareCategories>
              <fareType>M1038</fareType>
            </fareCategories>
          </rateCode>
          <additionalInfo>
            <freeTextDetails>
              <textSubjectQualifier>3</textSubjectQualifier>
              <informationType>SI</informationType>
              <companyId>1A</companyId>
              <encoding>1</encoding>
            </freeTextDetails>
            <freeText>FR MINI PACK15 3 DAYS</freeText>
          </additionalInfo>
        </rateCodeGroup>
      </rateDetails>
    </Car_RateInformationFromCarSegmentReply>
  </xsl:template>
  <xsl:template name="Retireve_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip">
    <PNR_Reply xmlns="http://xml.amadeus.com/PNRACC_11_1_1A">
      <pnrHeader>
        <reservationInfo>
          <reservation>
            <companyId>1A</companyId>
            <controlNumber>39TUJS</controlNumber>
            <date>110414</date>
            <time>1053</time>
          </reservation>
        </reservationInfo>
      </pnrHeader>
      <securityInformation>
        <responsibilityInformation>
          <typeOfPnrElement>RP</typeOfPnrElement>
          <agentId>WSSU</agentId>
          <officeId>PAREC38EE</officeId>
          <iataCode>20263051</iataCode>
        </responsibilityInformation>
        <queueingInformation>
          <queueingOfficeId>PAREC38EE</queueingOfficeId>
        </queueingInformation>
        <cityCode>PAR</cityCode>
        <secondRpInformation>
          <creationOfficeId>PAREC38EE</creationOfficeId>
          <agentSignature>9996WS</agentSignature>
          <creationDate>110414</creationDate>
          <creatorIataCode>20263051</creatorIataCode>
          <creationTime>1053</creationTime>
        </secondRpInformation>
      </securityInformation>
      <sbrPOSDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrPOSDetails>
      <sbrCreationPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrCreationPosDetails>
      <sbrUpdatorPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrUpdatorPosDetails>
      <technicalData>
        <enveloppeNumberData>
          <sequenceDetails>
            <number>1</number>
          </sequenceDetails>
        </enveloppeNumberData>
        <lastTransmittedEnvelopeNumber>
          <currentRecord>0</currentRecord>
        </lastTransmittedEnvelopeNumber>
        <purgeDateData>
          <dateTime>
            <year>2014</year>
            <month>10</month>
            <day>8</day>
          </dateTime>
        </purgeDateData>
      </technicalData>
      <travellerInfo>
        <elementManagementPassenger>
          <reference>
            <qualifier>PT</qualifier>
            <number>2</number>
          </reference>
          <segmentName>NM</segmentName>
          <lineNumber>1</lineNumber>
        </elementManagementPassenger>
        <passengerData>
          <travellerInformation>
            <traveller>
              <surname>STTWO</surname>
              <quantity>1</quantity>
            </traveller>
            <passenger>
              <firstName>CARS</firstName>
            </passenger>
          </travellerInformation>
        </passengerData>
      </travellerInfo>
      <originDestinationDetails>
        <originDestination>
        </originDestination>
        <itineraryInfo>
          <elementManagementItinerary>
            <reference>
              <qualifier>ST</qualifier>
              <number>1</number>
            </reference>
            <segmentName>CCR</segmentName>
            <lineNumber>2</lineNumber>
          </elementManagementItinerary>
          <travelProduct>
            <product>
              <depDate>081014</depDate>
              <arrDate>111014</arrDate>
            </product>
            <boardpointDetail>
              <cityCode>LYS</cityCode>
            </boardpointDetail>
            <companyDetail>
              <identification>ET</identification>
            </companyDetail>
            <productDetails>
              <identification>EBMR</identification>
            </productDetails>
          </travelProduct>
          <itineraryMessageAction>
            <business>
              <function>2</function>
            </business>
          </itineraryMessageAction>
          <relatedProduct>
            <quantity>1</quantity>
            <status>HK</status>
          </relatedProduct>
          <selectionDetails>
            <selection>
              <option>P4</option>
            </selection>
          </selectionDetails>
          <typicalCarData>
            <vehicleInformation>
              <vehicleCharacteristic>
                <vehicleTypeOwner>ACR</vehicleTypeOwner>
                <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>SI</informationType>
                <companyId>1A</companyId>
                <language>EN</language>
                <source>S</source>
                <encoding>2</encoding>
              </freeTextDetails>
              <carModel>PEUGEOT 206 OR SIMILAR</carModel>
            </vehicleInformation>
            <companyIdentification>
              <travelSector>CAR</travelSector>
              <companyCodeContext>1A</companyCodeContext>
              <companyCode>ET</companyCode>
              <companyName>ENTERPRISE</companyName>
              <accessLevel>CP</accessLevel>
            </companyIdentification>
            <locationInfo>
              <locationType>176</locationType>
              <locationDescription>
                <code>1A</code>
                <name>LYST61</name>
              </locationDescription>
              <firstLocationDetails>
                <code>LYS</code>
                <qualifier>145</qualifier>
                <agency>IA</agency>
              </firstLocationDetails>
            </locationInfo>
            <locationInfo>
              <locationType>176</locationType>
              <locationDescription>
                <code>CPY</code>
                <name>LYST61*AEROPORT ST EXUPERY BP 131</name>
              </locationDescription>
            </locationInfo>
            <locationInfo>
              <locationType>DOL</locationType>
              <locationDescription>
                <code>1A</code>
                <name>LYST61</name>
              </locationDescription>
              <firstLocationDetails>
                <code>LYS</code>
                <qualifier>145</qualifier>
                <agency>IA</agency>
              </firstLocationDetails>
            </locationInfo>
            <locationInfo>
              <locationType>DOL</locationType>
              <locationDescription>
                <code>CPY</code>
                <name>LYST61*AEROPORT ST EXUPERYBP 131 SATOLAS</name>
              </locationDescription>
            </locationInfo>
            <pickupDropoffTimes>
              <beginDateTime>
                <year>2014</year>
                <month>10</month>
                <day>8</day>
                <hour>10</hour>
                <minutes>52</minutes>
              </beginDateTime>
              <endDateTime>
                <year>2014</year>
                <month>10</month>
                <day>11</day>
                <hour>10</hour>
                <minutes>52</minutes>
              </endDateTime>
            </pickupDropoffTimes>
            <cancelOrConfirmNbr>
              <reservation>
                <companyId>1A</companyId>
                <controlNumber>144575992COUNT</controlNumber>
                <controlType>2</controlType>
              </reservation>
            </cancelOrConfirmNbr>
            <rateCodeGroup>
              <rateCodeInfo>
                <fareCategories>
                  <fareType>M1038</fareType>
                </fareCategories>
              </rateCodeInfo>
              <additionalInfo>
                <freeTextDetails>
                  <textSubjectQualifier>3</textSubjectQualifier>
                  <informationType>SI</informationType>
                  <companyId>1A</companyId>
                  <language>EN</language>
                  <source>S</source>
                  <encoding>2</encoding>
                </freeTextDetails>
                <freeText>FR MINI PACK15 3 DAYS</freeText>
              </additionalInfo>
            </rateCodeGroup>
            <rateInfo>
              <tariffInfo>
                <rateType>NNDXS</rateType>
                <currency>EUR</currency>
                <ratePlanIndicator>DY</ratePlanIndicator>
                <amountType>GNL</amountType>
              </tariffInfo>
              <rateInformation>
                <category>2</category>
              </rateInformation>
              <chargeDetails>
                <type>RG</type>
                <comment>*ET*EUR51.67DY-0.30 KM 500FK</comment>
              </chargeDetails>
              <chargeDetails>
                <type>RB</type>
                <comment>*ET*EUR155.01 BR-3DY</comment>
              </chargeDetails>
            </rateInfo>
            <rateInfo>
              <tariffInfo>
                <amount>155.01</amount>
                <currency>EUR</currency>
                <amountType>RB</amountType>
              </tariffInfo>
              <chargeDetails>
                <type>RBP</type>
                <numberInParty>3</numberInParty>
              </chargeDetails>
            </rateInfo>
            <rateInfo>
              <tariffInfo>
                <amount>155.01</amount>
                <currency>EUR</currency>
                <amountType>904</amountType>
              </tariffInfo>
              <chargeDetails>
                <type>90D</type>
                <numberInParty>3</numberInParty>
              </chargeDetails>
            </rateInfo>
            <rulesPoliciesGroup>
              <dummy1>
              </dummy1>
              <pickupDropoffLocation>
                <locationInfo>
                  <locationType>176</locationType>
                </locationInfo>
                <phone>
                  <phoneOrEmailType>PHO</phoneOrEmailType>
                  <emailAddress>33 0472227487</emailAddress>
                </phone>
              </pickupDropoffLocation>
            </rulesPoliciesGroup>
            <payment>
              <formOfPayment>
                <type>CC</type>
                <extendedPayment>GUA</extendedPayment>
                <fopFreeText>CCCAXXXXXXXXXXXX5390EXP1215</fopFreeText>
              </formOfPayment>
            </payment>
            <bookingSource>
              <originatorDetails>
                <originatorId>20263051</originatorId>
              </originatorDetails>
            </bookingSource>
            <marketingInfo>
              <freetextDetail>
                <subjectQualifier>3</subjectQualifier>
                <type>MK</type>
                <companyId>1A</companyId>
                <language>EN</language>
              </freetextDetail>
              <text>CF. CONDITIONS CARTES DE RETRAIT</text>
            </marketingInfo>
            <marketingInfo>
              <freetextDetail>
                <subjectQualifier>3</subjectQualifier>
                <type>OS</type>
                <companyId>1A</companyId>
                <language>EN</language>
              </freetextDetail>
              <text>UN MINIMUM DE 3 JOURS DE LOCATION SERA FACTURE</text>
            </marketingInfo>
            <supleInfo>
              <remarkDetails>
                <type>ARR</type>
                <freetext>1052</freetext>
                <language>EN</language>
                <encoding>2</encoding>
              </remarkDetails>
            </supleInfo>
            <supleInfo>
              <remarkDetails>
                <type>CNM</type>
                <freetext>STTWO CARS</freetext>
                <language>EN</language>
                <encoding>2</encoding>
              </remarkDetails>
            </supleInfo>
            <attribute>
              <criteriaSetType>BAT</criteriaSetType>
              <criteriaDetails>
                <attributeType>COR</attributeType>
              </criteriaDetails>
            </attribute>
          </typicalCarData>
          <markerRailTour>
          </markerRailTour>
          <referenceForSegment>
            <reference>
              <qualifier>PT</qualifier>
              <number>2</number>
            </reference>
          </referenceForSegment>
        </itineraryInfo>
      </originDestinationDetails>
      <dataElementsMaster>
        <marker2>
        </marker2>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>2</number>
            </reference>
            <segmentName>AP</segmentName>
            <lineNumber>3</lineNumber>
          </elementManagementData>
          <otherDataFreetext>
            <freetextDetail>
              <subjectQualifier>3</subjectQualifier>
              <type>3</type>
            </freetextDetail>
            <longFreetext>1425555-5555</longFreetext>
          </otherDataFreetext>
        </dataElementsIndiv>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>5</number>
            </reference>
            <segmentName>TK</segmentName>
            <lineNumber>4</lineNumber>
          </elementManagementData>
          <ticketElement>
            <passengerType>PAX</passengerType>
            <ticket>
              <indicator>OK</indicator>
              <date>110414</date>
              <officeId>PAREC38EE</officeId>
            </ticket>
          </ticketElement>
        </dataElementsIndiv>
      </dataElementsMaster>
    </PNR_Reply>
  </xsl:template>
  <xsl:template name="Cancel_Amadeus_FR_Agency_Standalone_FRLocation_onAirport_roundTrip">
    <PNR_Reply xmlns="http://xml.amadeus.com/PNRACC_11_1_1A">
      <pnrHeader>
        <reservationInfo>
          <reservation>
            <companyId>1A</companyId>
            <controlNumber>39TUJS</controlNumber>
            <date>110414</date>
            <time>1053</time>
          </reservation>
        </reservationInfo>
      </pnrHeader>
      <securityInformation>
        <responsibilityInformation>
          <typeOfPnrElement>RP</typeOfPnrElement>
          <agentId>WSSU</agentId>
          <officeId>PAREC38EE</officeId>
          <iataCode>20263051</iataCode>
        </responsibilityInformation>
        <queueingInformation>
          <queueingOfficeId>PAREC38EE</queueingOfficeId>
        </queueingInformation>
        <cityCode>PAR</cityCode>
        <secondRpInformation>
          <creationOfficeId>PAREC38EE</creationOfficeId>
          <agentSignature>9996WS</agentSignature>
          <creationDate>110414</creationDate>
          <creatorIataCode>20263051</creatorIataCode>
          <creationTime>1053</creationTime>
        </secondRpInformation>
      </securityInformation>
      <sbrPOSDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrPOSDetails>
      <sbrCreationPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrCreationPosDetails>
      <sbrUpdatorPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrUpdatorPosDetails>
      <technicalData>
        <enveloppeNumberData>
          <sequenceDetails>
            <number>2</number>
          </sequenceDetails>
        </enveloppeNumberData>
        <lastTransmittedEnvelopeNumber>
          <currentRecord>1</currentRecord>
        </lastTransmittedEnvelopeNumber>
        <purgeDateData>
          <dateTime>
            <year>2014</year>
            <month>10</month>
            <day>8</day>
          </dateTime>
        </purgeDateData>
      </technicalData>
      <travellerInfo>
        <elementManagementPassenger>
          <reference>
            <qualifier>PT</qualifier>
            <number>2</number>
          </reference>
          <segmentName>NM</segmentName>
          <lineNumber>1</lineNumber>
        </elementManagementPassenger>
        <passengerData>
          <travellerInformation>
            <traveller>
              <surname>STTWO</surname>
              <quantity>1</quantity>
            </traveller>
            <passenger>
              <firstName>CARS</firstName>
            </passenger>
          </travellerInformation>
        </passengerData>
      </travellerInfo>
      <dataElementsMaster>
        <marker2>
        </marker2>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>2</number>
            </reference>
            <segmentName>AP</segmentName>
            <lineNumber>2</lineNumber>
          </elementManagementData>
          <otherDataFreetext>
            <freetextDetail>
              <subjectQualifier>3</subjectQualifier>
              <type>3</type>
            </freetextDetail>
            <longFreetext>1425555-5555</longFreetext>
          </otherDataFreetext>
        </dataElementsIndiv>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>5</number>
            </reference>
            <segmentName>TK</segmentName>
            <lineNumber>3</lineNumber>
          </elementManagementData>
          <ticketElement>
            <passengerType>PAX</passengerType>
            <ticket>
              <indicator>OK</indicator>
              <date>110414</date>
              <officeId>PAREC38EE</officeId>
            </ticket>
          </ticketElement>
        </dataElementsIndiv>
      </dataElementsMaster>
    </PNR_Reply>
  </xsl:template>
  <xsl:template name="ACAQ_Amadeus_UK_MultipleCDCode_onAirport_roundTrip">
    <Car_AvailabilityReply xmlns="http://xml.amadeus.com/RCARRR_14_3_1A">
      <availabilityDetails>
        <computeMarkups>
          <actionRequestCode>N</actionRequestCode>
        </computeMarkups>
        <errorWarning>
          <errorOrWarningCodeDetails>
            <errorDetails>
              <errorCode>418</errorCode>
              <errorCategory>WEC</errorCategory>
              <errorCodeOwner>1A</errorCodeOwner>
            </errorDetails>
          </errorOrWarningCodeDetails>
          <errorWarningDescription>
            <freeTextDetails>
              <textSubjectQualifier>3</textSubjectQualifier>
              <language>EN</language>
              <source>A</source>
              <encoding>1</encoding>
            </freeTextDetails>
            <freeText>CAR COMPANY NOT AT LOCATION</freeText>
          </errorWarningDescription>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
          </carCompanyData>
        </errorWarning>
        <rateClass>
          <criteriaSetType>COR</criteriaSetType>
        </rateClass>
        <companyLocationInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <rentalLocation>
            <address>
              <addressDetails>
                <format>2</format>
                <line1>CARRER MAESTRAT ESQUINA CARRER</line1>
              </addressDetails>
              <city>VALENCIA 46940</city>
              <countryCode>ES</countryCode>
              <locationDetails>
                <code>1A</code>
                <name>VLCS02</name>
              </locationDetails>
            </address>
            <rateMarketingInfo>
              <freeTextQualification>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>MK</informationType>
                <companyId>1A</companyId>
                <language>EN</language>
              </freeTextQualification>
              <freeText>EUROPCAR: GET GOOD DEALS AND GO FOR GREEN!</freeText>
            </rateMarketingInfo>
            <locationGeocodeInfo>
              <position>
                <encoding>POR</encoding>
                <porPosition>
                  <porLongitude>-48982</porLongitude>
                  <porLatitude>3949585</porLatitude>
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
                    <value>158618</value>
                  </referenceDetails>
                </porForeignKey>
              </porBusinessID>
              <porAccuracy>
                <statusCode>1</statusCode>
              </porAccuracy>
            </locationGeocodeInfo>
            <openingHours>
              <businessSemantic>L</businessSemantic>
              <timeMode>L</timeMode>
              <beginDateTime>
                <hour>9</hour>
                <minutes>0</minutes>
              </beginDateTime>
              <endDateTime>
                <hour>13</hour>
                <minutes>30</minutes>
              </endDateTime>
            </openingHours>
            <openingHours>
              <businessSemantic>L</businessSemantic>
              <timeMode>L</timeMode>
              <beginDateTime>
                <hour>15</hour>
                <minutes>30</minutes>
              </beginDateTime>
              <endDateTime>
                <hour>18</hour>
                <minutes>30</minutes>
              </endDateTime>
            </openingHours>
          </rentalLocation>
        </companyLocationInfo>
        <companyLocationInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <rentalLocation>
            <address>
              <addressDetails>
                <format>2</format>
                <line1>MANISES AEROPUERTO</line1>
              </addressDetails>
              <city>VALENCIA 46940</city>
              <countryCode>ES</countryCode>
              <locationDetails>
                <code>1A</code>
                <name>VLCT01</name>
              </locationDetails>
            </address>
            <rateMarketingInfo>
              <freeTextQualification>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>MK</informationType>
                <companyId>1A</companyId>
                <language>EN</language>
              </freeTextQualification>
              <freeText>EUROPCAR: GET GOOD DEALS AND GO FOR GREEN!</freeText>
            </rateMarketingInfo>
            <locationGeocodeInfo>
              <position>
                <encoding>POR</encoding>
                <porPosition>
                  <porLongitude>-46667</porLongitude>
                  <porLatitude>3948332</porLatitude>
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
                    <value>2607</value>
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
                <hour>7</hour>
                <minutes>0</minutes>
              </beginDateTime>
              <endDateTime>
                <hour>23</hour>
                <minutes>59</minutes>
              </endDateTime>
            </openingHours>
          </rentalLocation>
        </companyLocationInfo>
        <companyLocationInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <rentalLocation>
            <address>
              <addressDetails>
                <format>2</format>
                <line1>ESTACION VALENCIA AVE</line1>
              </addressDetails>
              <city>VALENCIA 46007</city>
              <countryCode>ES</countryCode>
              <locationDetails>
                <code>1A</code>
                <name>VLCX01</name>
              </locationDetails>
            </address>
            <rateMarketingInfo>
              <freeTextQualification>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>MK</informationType>
                <companyId>1A</companyId>
                <language>EN</language>
              </freeTextQualification>
              <freeText>EUROPCAR: GET GOOD DEALS AND GO FOR GREEN!</freeText>
            </rateMarketingInfo>
            <locationGeocodeInfo>
              <position>
                <encoding>POR</encoding>
                <porPosition>
                  <porLongitude>-37625</porLongitude>
                  <porLatitude>3946763</porLatitude>
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
                    <value>2605</value>
                  </referenceDetails>
                </porForeignKey>
              </porBusinessID>
              <porAccuracy>
                <statusCode>110</statusCode>
              </porAccuracy>
            </locationGeocodeInfo>
            <openingHours>
              <businessSemantic>L</businessSemantic>
              <timeMode>L</timeMode>
              <beginDateTime>
                <hour>8</hour>
                <minutes>0</minutes>
              </beginDateTime>
              <endDateTime>
                <hour>23</hour>
                <minutes>30</minutes>
              </endDateTime>
            </openingHours>
          </rentalLocation>
        </companyLocationInfo>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>MCMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>FI 500 12 LOUNGE</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>J1AE557NFYIL14AO6MPB</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=MCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <value>0</value>
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
              <carModel>FI 500 12 LOUNGE</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=MCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <value>0</value>
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
              <carModel>FI 500 12 LOUNGE</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>44.30</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>53.61</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>53.61</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>64.87</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>NISSAN MICRA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
<pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>D75BJCH435AN7L2DQA17</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EBMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
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
              <carModel>NISSAN MICRA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EBMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
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
              <carModel>NISSAN MICRA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>45.21</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>54.70</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>54.71</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>66.20</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>MCMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>FI 500 12 LOUNGE</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
      <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>9JSBO41VRR75YDGJQYNT</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=MCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <value>0</value>
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
              <carModel>FI 500 12 LOUNGE</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=MCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <value>0</value>
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
              <carModel>FI 500 12 LOUNGE</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>46.19</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>55.89</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>55.89</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>67.63</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>NISSAN MICRA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>5YHCKKPBURJ5CCG1HHW9</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EBMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
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
              <carModel>NISSAN MICRA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EBMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
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
              <carModel>NISSAN MICRA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>47.14</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>57.04</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>57.05</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>69.03</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>EDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VOLKSWAGEN POLO</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>A5EAIVT9VH41HLD264E2</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
              <carModel>VOLKSWAGEN POLO</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
              <carModel>VOLKSWAGEN POLO</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>47.47</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>57.44</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>57.45</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>69.51</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>EDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VOLKSWAGEN POLO</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>VX79BOAS783HEIRXEL8B</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
              <carModel>VOLKSWAGEN POLO</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
              <carModel>VOLKSWAGEN POLO</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>49.50</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>59.89</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>59.90</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>72.48</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>MCMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>FI 500 12 LOUNGE</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>4CCLYQO5V38S2G2E6D7D</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=MCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <value>0</value>
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
              <carModel>FI 500 12 LOUNGE</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=MCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <value>0</value>
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
              <carModel>FI 500 12 LOUNGE</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>46.19</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>62.89</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>55.89</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>76.10</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>NISSAN MICRA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>LBV1TOY9B7KFJX2IPQOL</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EBMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
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
              <carModel>NISSAN MICRA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EBMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>EBMR</vehicleRentalPrefType>
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
              <carModel>NISSAN MICRA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>47.14</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>64.04</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>57.05</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>77.50</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>EDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VOLKSWAGEN POLO</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>UXEWFHBLUJ0HUVIPLHYW</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
              <carModel>VOLKSWAGEN POLO</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=EDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
              <carModel>VOLKSWAGEN POLO</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>49.50</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>66.89</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>59.90</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>80.95</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CCMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>FIAT LINEA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>PKC9IFS86IU1GAYVRBIM</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>CCMR</vehicleRentalPrefType>
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
              <carModel>FIAT LINEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>CCMR</vehicleRentalPrefType>
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
              <carModel>FIAT LINEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>61.53</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>74.45</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>74.46</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>90.10</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>SEAT LEON</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>VI4RFNH15HXU2B5LQYTX</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
              <carModel>SEAT LEON</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
              <carModel>SEAT LEON</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>64.10</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>77.56</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>77.57</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>93.86</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CCMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>FIAT LINEA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>IPYY0YVRBFF7XKYE8HFE</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>CCMR</vehicleRentalPrefType>
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
              <carModel>FIAT LINEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>CCMR</vehicleRentalPrefType>
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
              <carModel>FIAT LINEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>64.15</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>77.62</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>77.63</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>93.93</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>SEAT LEON</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>YEA1QGMIGHGY8GY8FV1Q</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
              <carModel>SEAT LEON</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
              <carModel>SEAT LEON</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>66.82</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>80.85</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>80.86</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>97.84</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CCMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>FIAT LINEA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>BGYA2XOBF5PFJ1HBI4TY</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>CCMR</vehicleRentalPrefType>
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
              <carModel>FIAT LINEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CCMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>CCMR</vehicleRentalPrefType>
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
              <carModel>FIAT LINEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>64.15</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>84.62</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>77.63</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>102.40</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>IDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VOLKSWAGEN GOLF</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>MAXVQW47T5Y5MXFOW50D</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>IDMR</vehicleRentalPrefType>
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
              <carModel>VOLKSWAGEN GOLF</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>IDMR</vehicleRentalPrefType>
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
              <carModel>VOLKSWAGEN GOLF</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>70.50</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>85.31</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>85.32</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>103.24</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>SEAT LEON</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>AQSUSA6BF0A3B9Y274A1</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
              <carModel>SEAT LEON</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
              <carModel>SEAT LEON</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>66.82</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>87.85</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>80.86</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>106.31</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>IDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VOLKSWAGEN GOLF</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
       <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>AA6X8MM6RNK2FEW8P4K6</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>IDMR</vehicleRentalPrefType>
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
              <carModel>VOLKSWAGEN GOLF</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>IDMR</vehicleRentalPrefType>
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
              <carModel>VOLKSWAGEN GOLF</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>73.50</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>88.94</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>88.95</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>107.63</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CWMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>PEUGEOT 308 SW</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>4V9F59ICETDO4KMD7AK0</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CWMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>CWMR</vehicleRentalPrefType>
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
              <carModel>PEUGEOT 308 SW</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CWMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>CWMR</vehicleRentalPrefType>
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
              <carModel>PEUGEOT 308 SW</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>73.50</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>88.94</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>88.95</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>107.63</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>IMMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>SEAT ALTEA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
       <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>Y52FJ0N949F95POA08NE</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IMMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>IMMR</vehicleRentalPrefType>
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
              <carModel>SEAT ALTEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IMMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>IMMR</vehicleRentalPrefType>
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
              <carModel>SEAT ALTEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>77.55</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>93.84</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>93.85</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>113.56</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>IDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VOLKSWAGEN GOLF</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>2147MRKT25T2BWHUX653</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>IDMR</vehicleRentalPrefType>
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
              <carModel>VOLKSWAGEN GOLF</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>IDMR</vehicleRentalPrefType>
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
              <carModel>VOLKSWAGEN GOLF</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>73.50</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>95.94</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>88.95</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>116.10</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CWMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>PEUGEOT 308 SW</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
       <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>FKCKB2VBBJQELVL8N73Q</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CWMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>CWMR</vehicleRentalPrefType>
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
              <carModel>PEUGEOT 308 SW</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=CWMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>CWMR</vehicleRentalPrefType>
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
              <carModel>PEUGEOT 308 SW</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>73.50</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>95.94</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>88.95</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>116.10</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>IMMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>SEAT ALTEA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>DXSOVAJUHPXWBBIMEFYP</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IMMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>IMMR</vehicleRentalPrefType>
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
              <carModel>SEAT ALTEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IMMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>IMMR</vehicleRentalPrefType>
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
              <carModel>SEAT ALTEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>80.86</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>97.84</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>97.85</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>118.40</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>ISMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>AUDI A3 5 DOORS</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>0Q5LMQUAXX1CWU1S6LNN</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=ISMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>ISMR</vehicleRentalPrefType>
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
              <carModel>AUDI A3 5 DOORS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=ISMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>ISMR</vehicleRentalPrefType>
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
              <carModel>AUDI A3 5 DOORS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>81.09</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>98.12</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>98.13</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>118.74</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>IVMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VW TOURAN 5 PLAZAS + 2 ABATIBLES</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>BMLMX5ADKA4L298O030Y</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>IVMR</vehicleRentalPrefType>
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
              <carModel>VW TOURAN 5 PLAZAS + 2 ABATIBLES</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>IVMR</vehicleRentalPrefType>
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
              <carModel>VW TOURAN 5 PLAZAS + 2 ABATIBLES</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>84.35</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>102.05</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>102.07</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>123.50</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>IVMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VW TOURAN 5 PLAZAS + 2 ABATIBLES</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>22BYXDS4YHRB4DY3J9H5</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>IVMR</vehicleRentalPrefType>
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
              <carModel>VW TOURAN 5 PLAZAS + 2 ABATIBLES</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>IVMR</vehicleRentalPrefType>
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
              <carModel>VW TOURAN 5 PLAZAS + 2 ABATIBLES</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>84.35</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>102.05</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>102.07</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>123.50</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>IDAR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>AUDI A3 AUTO</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>KLQMUYCV2CV5F84DLXHL</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IDAR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>IDAR</vehicleRentalPrefType>
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
              <carModel>AUDI A3 AUTO</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IDAR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>IDAR</vehicleRentalPrefType>
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
              <carModel>AUDI A3 AUTO</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>84.54</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>102.29</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>102.30</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>123.78</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>IMMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>SEAT ALTEA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>FAWKOVO866DQR4EN4QK6</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IMMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>IMMR</vehicleRentalPrefType>
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
              <carModel>SEAT ALTEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IMMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>IMMR</vehicleRentalPrefType>
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
              <carModel>SEAT ALTEA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>80.86</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>104.84</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>97.85</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>126.87</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>SDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>OPEL INSIGNIA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>3HBJPGWCFFXVPVGES5MY</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>SDMR</vehicleRentalPrefType>
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
              <carModel>OPEL INSIGNIA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>SDMR</vehicleRentalPrefType>
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
              <carModel>OPEL INSIGNIA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>88.13</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>106.64</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>106.65</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>129.05</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>IVMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VW TOURAN 5 PLAZAS + 2 ABATIBLES</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
       <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>C0Q455S9VDG0USJLAHXP</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>IVMR</vehicleRentalPrefType>
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
              <carModel>VW TOURAN 5 PLAZAS + 2 ABATIBLES</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=IVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>IVMR</vehicleRentalPrefType>
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
              <carModel>VW TOURAN 5 PLAZAS + 2 ABATIBLES</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>84.35</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>109.05</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>102.07</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>131.97</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>SDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>OPEL INSIGNIA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>WWMMT31M9OMLPDQUJJ5G</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>SDMR</vehicleRentalPrefType>
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
              <carModel>OPEL INSIGNIA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>SDMR</vehicleRentalPrefType>
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
              <carModel>OPEL INSIGNIA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>91.88</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>111.18</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>111.19</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>134.54</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>SDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>OPEL INSIGNIA</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>XMGSF1FQIEGGB43675SG</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>SDMR</vehicleRentalPrefType>
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
              <carModel>OPEL INSIGNIA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>SDMR</vehicleRentalPrefType>
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
              <carModel>OPEL INSIGNIA</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>91.88</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>118.18</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>111.19</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>143.01</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>ITMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VW GOLF CABRIO</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>TG3JUTFEEKVC7D6NELEX</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=ITMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>ITMR</vehicleRentalPrefType>
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
              <carModel>VW GOLF CABRIO</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=ITMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>ITMR</vehicleRentalPrefType>
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
              <carModel>VW GOLF CABRIO</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>97.32</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>124.76</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>117.77</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>150.97</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>FVMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VW SHARAN 7 SEATS</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>0VEC0II7NCOHSS1OMG41</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=FVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>FVMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>0</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>PAX</qualifier>
                <value>7</value>
              </vehicleInfo>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>CMK</informationType>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <carModel>VW SHARAN 7 SEATS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=FVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>FVMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>0</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>PAX</qualifier>
                <value>7</value>
              </vehicleInfo>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>CMK</informationType>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <carModel>VW SHARAN 7 SEATS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>109.65</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>132.67</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>132.69</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>160.55</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>FVMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>VW SHARAN 7 SEATS</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
       <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>20E9DKXS6CQ686I9O2GC</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=FVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>FVMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>0</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>PAX</qualifier>
                <value>7</value>
              </vehicleInfo>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>CMK</informationType>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <carModel>VW SHARAN 7 SEATS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=FVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>FVMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>0</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>PAX</qualifier>
                <value>7</value>
              </vehicleInfo>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>CMK</informationType>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <carModel>VW SHARAN 7 SEATS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>109.65</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>139.67</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>132.69</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>169.02</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>SVMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>MERCEDES VITO 9 SEATS</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCT01</name>
            </locationDescription>
          </pickupDropoffLocations>
       <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>E6T80VWNC1PE24OFOM8V</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>SVMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>0</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>PAX</qualifier>
                <value>9</value>
              </vehicleInfo>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>CMK</informationType>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <carModel>MERCEDES VITO 9 SEATS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>SVMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>0</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>PAX</qualifier>
                <value>9</value>
              </vehicleInfo>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>CMK</informationType>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <carModel>MERCEDES VITO 9 SEATS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>118.09</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>142.89</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>142.91</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>172.92</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>SVMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>MERCEDES VITO 9 SEATS</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>Y0287LHVOY9364C609TC</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>SVMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>0</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>PAX</qualifier>
                <value>9</value>
              </vehicleInfo>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>CMK</informationType>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <carModel>MERCEDES VITO 9 SEATS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>SVMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>0</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>PAX</qualifier>
                <value>9</value>
              </vehicleInfo>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>CMK</informationType>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <carModel>MERCEDES VITO 9 SEATS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>118.09</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>142.89</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>142.91</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>172.92</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>SVMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>MERCEDES VITO 9 SEATS</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>BKRDOGTE43A43DCBYU7O</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>SVMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>0</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>PAX</qualifier>
                <value>9</value>
              </vehicleInfo>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>CMK</informationType>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <carModel>MERCEDES VITO 9 SEATS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=SVMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>SVMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>0</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>PAX</qualifier>
                <value>9</value>
              </vehicleInfo>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>CMK</informationType>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <carModel>MERCEDES VITO 9 SEATS</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>118.09</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>149.89</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>142.91</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>181.39</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>FDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>AUDI A4</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCS02</name>
            </locationDescription>
          </pickupDropoffLocations>
        <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>THR1L47LE2YPMQ4C8XQC</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=FDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>FDMR</vehicleRentalPrefType>
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
              <carModel>AUDI A4</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=FDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>FDMR</vehicleRentalPrefType>
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
              <carModel>AUDI A4</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>132.19</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>159.95</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>159.97</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>193.56</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>FDMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>AUDI A4</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>EP</companyCode>
            <companyName>EUROPCAR</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>VLCX01</name>
            </locationDescription>
          </pickupDropoffLocations>
         <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>11G5ESGEOO3I6VJR1RDF</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=FDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>FDMR</vehicleRentalPrefType>
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
              <carModel>AUDI A4</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=EP&amp;cnt=ES&amp;vehcat=FDMR&amp;item=0&amp;stamp=VEHICLE_0_0_1390226443683&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>FDMR</vehicleRentalPrefType>
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
              <carModel>AUDI A4</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>0</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>51354174</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>SPDR</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateIdentifier>1404111206</rateIdentifier>
              <rateAmount>137.82</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>173.76</rateAmount>
              <rateCurrency>GBP</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
              <rateConvertedQualifier>4</rateConvertedQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>166.78</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>210.27</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>901</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>024</rateCategory>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>SUPER DRIVE</freeText>
          </rateMarketingInfo>
        </rates>
      </availabilityDetails>
    </Car_AvailabilityReply>
  </xsl:template>
  <xsl:template name="ACAQ_EVoucher_Amadeus_FR_Agency_oneWay">
    <Car_AvailabilityReply xmlns="http://xml.amadeus.com/RCARRR_14_3_1A">
      <availabilityDetails>
        <computeMarkups>
          <actionRequestCode>N</actionRequestCode>
        </computeMarkups>
        <rateClass>
          <criteriaSetType>COR</criteriaSetType>
        </rateClass>
        <companyLocationInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>ZI</companyCode>
            <companyName>AVIS</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <rentalLocation>
            <address>
              <addressDetails>
                <format>2</format>
                <line1>LYON ST EXUPERY AEROPORT</line1>
              </addressDetails>
              <city>COLOMBIER SAUGNIEU</city>
              <countryCode>FR</countryCode>
              <locationDetails>
                <code>1A</code>
                <name>LYST01</name>
              </locationDetails>
            </address>
            <rateMarketingInfo>
              <freeTextQualification>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>MK</informationType>
                <companyId>1A</companyId>
                <language>EN</language>
              </freeTextQualification>
              <freeText>AVIS THANKS YOU FOR YOUR BUSINESS</freeText>
              <freeText>AND FOR USING AMADEUS COMPLETE ACCESS PLUS</freeText>
            </rateMarketingInfo>
            <locationGeocodeInfo>
              <position>
                <encoding>POR</encoding>
                <porPosition>
                  <porLongitude>508111</porLongitude>
                  <porLatitude>4572555</porLatitude>
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
                    <value>129906</value>
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
                <hour>7</hour>
                <minutes>0</minutes>
              </beginDateTime>
              <endDateTime>
                <hour>0</hour>
                <minutes>0</minutes>
              </endDateTime>
            </openingHours>
          </rentalLocation>
          <rentalLocation>
            <address>
              <addressDetails>
                <format>2</format>
                <line1>NICE AEROPORT 06</line1>
              </addressDetails>
              <city>NICE CEDEX 3</city>
              <countryCode>FR</countryCode>
              <locationDetails>
                <code>1A</code>
                <name>NCET01</name>
              </locationDetails>
            </address>
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
                    <value>129726</value>
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
                <minutes>30</minutes>
              </beginDateTime>
              <endDateTime>
                <hour>0</hour>
                <minutes>0</minutes>
              </endDateTime>
            </openingHours>
          </rentalLocation>
        </companyLocationInfo>
        <rates>
          <vehicleTypeInfo>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CXMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <carModel>Renault Megane</carModel>
          </vehicleTypeInfo>
          <carCompanyData>
            <travelSector>CAR</travelSector>
            <companyCode>ZI</companyCode>
            <companyName>AVIS</companyName>
            <accessLevel>CP</accessLevel>
          </carCompanyData>
          <pickupDropoffLocations>
            <locationType>PUP</locationType>
            <locationDescription>
              <code>1A</code>
              <name>LYST01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffLocations>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>NCET01</name>
            </locationDescription>
          </pickupDropoffLocations>
          <pickupDropoffTime>
            <beginDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:beginDateTime/rcar:minutes" />
                </xsl:if>
              </minutes>
            </beginDateTime>
            <endDateTime>
              <year>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:year" />
                </xsl:if>
              </year>
              <month>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:month" />
                </xsl:if>
              </month>
              <day>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:day" />
                </xsl:if>
              </day>
              <hour>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:hour" />
                </xsl:if>
              </hour>
              <minutes>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:pickupDropoffInfo/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
                </xsl:if>
                <xsl:if test="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos">
                  <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcar:Car_Availability/rcar:providerSpecificOptions/rcar:pickupDropoffInfos/rcar:pickupDropoffTimes/rcar:endDateTime/rcar:minutes" />
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
              <value>VNT76N7WMDJPW7RXN3LQ</value>
            </referenceDetails>
          </rateIdentifier>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=ZI&amp;cnt=FR&amp;vehcat=CXMR&amp;item=0&amp;stamp=VEHICLE_0__0__1396286213553&amp;file=7.JPEG</identifier>
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
                <vehicleRentalPrefType>CXMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>5</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>FPX</qualifier>
                <value>2</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>RPX</qualifier>
                <value>3</value>
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
              <carModel>Renault Megane</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>2</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
            <pictureCaption>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>PCP</informationType>
                <language>EN</language>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <freeText>Air Con   Radio/Cassette  Air Bag</freeText>
            </pictureCaption>
          </sizedPictures>
          <sizedPictures>
            <imageURL>
              <address>
                <identifier>http://multimedia.amadeus.com/mdc/retrieveCarItem?ctg=VEHICLE&amp;prov=ZI&amp;cnt=FR&amp;vehcat=CXMR&amp;item=0&amp;stamp=VEHICLE_0__0__1396286213553&amp;file=4.JPEG</identifier>
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
                <vehicleRentalPrefType>CXMR</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <vehicleInfo>
                <qualifier>NOD</qualifier>
                <value>5</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>FPX</qualifier>
                <value>2</value>
              </vehicleInfo>
              <vehicleInfo>
                <qualifier>RPX</qualifier>
                <value>3</value>
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
              <carModel>Renault Megane</carModel>
              <nonNumericalAttributes>
                <attributeType>BS</attributeType>
                <attributeDescription>2</attributeDescription>
              </nonNumericalAttributes>
            </vehicleInformation>
            <pictureCaption>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>PCP</informationType>
                <language>EN</language>
                <source>M</source>
                <encoding>7</encoding>
              </freeTextDetails>
              <freeText>Air Con   Radio/Cassette  Air Bag</freeText>
            </pictureCaption>
          </sizedPictures>
          <loyaltyNumbersList>
            <discountNumbers>
              <customerReferenceInfo>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>N865556</referenceNumber>
              </customerReferenceInfo>
              <customerReferenceInfo>
                <referenceQualifier>RC</referenceQualifier>
                <referenceNumber>S1I</referenceNumber>
              </customerReferenceInfo>
            </discountNumbers>
          </loyaltyNumbersList>
          <rateDetailsInfo>
            <tariffInfo>
              <rateAmount>158.45</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>3</rateType>
            </tariffInfo>
            <tariffInfo>
              <rateAmount>282.45</rateAmount>
              <rateCurrency>EUR</rateCurrency>
              <rateType>906</rateType>
              <rateAmountQualifier>902</rateAmountQualifier>
            </tariffInfo>
            <extraRateTypeInfo>
              <rateCategory>007</rateCategory>
              <processIndicator>EXA</processIndicator>
            </extraRateTypeInfo>
            <associatedCharges>
              <chargeType>2</chargeType>
            </associatedCharges>
            <associatedCharges>
              <chargeType>9</chargeType>
              <amountQualifier>UNL</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>108</chargeType>
              <amountQualifier>4</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>45</chargeType>
              <amountQualifier>3</amountQualifier>
            </associatedCharges>
            <associatedCharges>
              <chargeType>COV</chargeType>
              <amountQualifier>3</amountQualifier>
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
            <freeText>STD ILL KM 1-6D</freeText>
          </rateMarketingInfo>
        </rates>
      </availabilityDetails>
    </Car_AvailabilityReply>
  </xsl:template>
  <xsl:template name="ARIA_EVoucher_Amadeus_FR_Agency_oneWay">
    <Car_RateInformationFromAvailabilityReply xmlns="http://xml.amadeus.com/RCFARR_10_1_1A">
      <rateDetails>
        <companyIdentification>
          <travelSector>CAR</travelSector>
          <companyCode>ZI</companyCode>
          <companyName>AVIS</companyName>
          <accessLevel>CP</accessLevel>
        </companyIdentification>
        <sourceLevel>
          <selectionDetails>
            <option>P6</option>
          </selectionDetails>
        </sourceLevel>
        <mktText>
          <freeTextDetails>
            <textSubjectQualifier>3</textSubjectQualifier>
            <informationType>MK</informationType>
            <companyId>1A</companyId>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>AVIS THANKS YOU FOR YOUR BUSINESS</freeText>
          <freeText>AND FOR USING AMADEUS RATE FEATURES</freeText>
        </mktText>
        <rateDetail>
          <tariffInfo>
            <amount>158.45</amount>
            <currency>EUR</currency>
            <ratePlanIndicator>DY</ratePlanIndicator>
            <amountType>RP</amountType>
            <rateChangeIndicator>GUA</rateChangeIndicator>
          </tariffInfo>
          <rateInformation>
            <category>7</category>
          </rateInformation>
          <chargeDetails>
            <type>034</type>
            <description>UNL</description>
          </chargeDetails>
          <chargeDetails>
            <type>008</type>
            <amount>158.45</amount>
          </chargeDetails>
          <chargeDetails>
            <type>009</type>
            <amount>158.45</amount>
          </chargeDetails>
          <chargeDetails>
            <type>80</type>
            <description>UNL</description>
          </chargeDetails>
          <chargeDetails>
            <type>82</type>
            <description>UNL</description>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <amount>34.58</amount>
            <comment>LOCATION SURCHARGE</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <amount>2.92</amount>
            <comment>REGISTRATION FEE/ ROAD TAX</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>SALES TAX</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <amount>65.83</amount>
            <comment>ONE WAY CHARGE</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <amount>20.67</amount>
            <comment>TAX ON MANDATORY ITEMS</comment>
          </chargeDetails>
          <chargeDetails>
            <type>COV</type>
            <comment>CDW - COLLISION DAMAGE WAIVER</comment>
          </chargeDetails>
          <chargeDetails>
            <type>COV</type>
            <comment>PAI - PERSONAL ACCIDENT INSURANCE</comment>
          </chargeDetails>
          <chargeDetails>
            <type>COV</type>
            <comment>TP - THEFT PROTECTION</comment>
          </chargeDetails>
        </rateDetail>
        <rateDetail>
          <tariffInfo>
            <amount>158.45</amount>
            <currency>EUR</currency>
            <amountType>RB</amountType>
          </tariffInfo>
          <chargeDetails>
            <type>NBD</type>
            <amount>1</amount>
          </chargeDetails>
        </rateDetail>
        <rateDetail>
          <tariffInfo>
            <amount>282.45</amount>
            <currency>EUR</currency>
            <amountType>904</amountType>
          </tariffInfo>
        </rateDetail>
        <dummy>
        </dummy>
        <remarks>
          <freeTextDetails>
            <textSubjectQualifier>3</textSubjectQualifier>
            <informationType>SI</informationType>
            <companyId>1A</companyId>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>MUST RETURN TO REQUESTED CITY</freeText>
          <freeText>THE MINIMUM RENTAL PERIOD IS 001 DAYS</freeText>
          <freeText>33.33     DAMAGE ADMIN FEE MAY APPLY</freeText>
        </remarks>
        <taxCovSurchargeGroup>
          <taxSurchargeCoverageInfo>
            <tariffInfo>
              <currency>EUR</currency>
            </tariffInfo>
            <chargeDetails>
              <type>108</type>
              <amount>34.58</amount>
              <description>IES</description>
              <periodType>004</periodType>
              <currency>EUR</currency>
              <comment>LOCATION SURCHARGE</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <taxCovSurchargeGroup>
          <taxSurchargeCoverageInfo>
            <tariffInfo>
              <currency>EUR</currency>
            </tariffInfo>
            <chargeDetails>
              <type>108</type>
              <amount>2.92</amount>
              <description>IES</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>REGISTRATION FEE/ ROAD TAX</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <taxCovSurchargeGroup>
          <taxSurchargeCoverageInfo>
            <tariffInfo>
              <currency>EUR</currency>
            </tariffInfo>
            <chargeDetails>
              <type>108</type>
              <amount>20.00</amount>
              <description>IBR</description>
              <periodType>012</periodType>
              <comment>SALES TAX</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <taxCovSurchargeGroup>
          <taxSurchargeCoverageInfo>
            <tariffInfo>
              <currency>EUR</currency>
            </tariffInfo>
            <chargeDetails>
              <type>108</type>
              <amount>65.83</amount>
              <description>IES</description>
              <periodType>004</periodType>
              <currency>EUR</currency>
              <comment>ONE WAY CHARGE</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <taxCovSurchargeGroup>
          <taxSurchargeCoverageInfo>
            <tariffInfo>
              <currency>EUR</currency>
            </tariffInfo>
            <chargeDetails>
              <type>108</type>
              <amount>20.00</amount>
              <description>IES</description>
              <periodType>012</periodType>
              <comment>TAX ON MANDATORY ITEMS</comment>
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
              <amount>0.00</amount>
              <description>IBR</description>
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
              <amount>0.00</amount>
              <description>IBR</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>PAI - PERSONAL ACCIDENT INSURANCE</comment>
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
              <amount>0.00</amount>
              <description>IBR</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>TP - THEFT PROTECTION</comment>
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
              <amount>0.84</amount>
              <description>OPT</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>SLI - SUPPLEMENTARY LIABILITY INSURANCE</comment>
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
              <comment>CSB - CHILD SEAT FOR BABY</comment>
            </chargeDetails>
            <chargeDetails>
              <type>013</type>
              <amount>10.00</amount>
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
              <comment>CBS - CHILD BOOSTER SEAT</comment>
            </chargeDetails>
            <chargeDetails>
              <type>013</type>
              <amount>4.99</amount>
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
              <amount>13.99</amount>
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
              <comment>STR - WINTER TYRES</comment>
            </chargeDetails>
            <chargeDetails>
              <type>013</type>
              <amount>24.00</amount>
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
              <comment>SKR - SKI RACK</comment>
            </chargeDetails>
            <chargeDetails>
              <type>013</type>
              <amount>30.00</amount>
              <periodType>004</periodType>
              <currency>EUR</currency>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <vehicleInfoGroup>
          <vehicleDetails>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CXMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <freeTextDetails>
              <textSubjectQualifier>3</textSubjectQualifier>
              <informationType>SI</informationType>
              <companyId>1A</companyId>
              <encoding>1</encoding>
            </freeTextDetails>
            <carModel>REFER TO POLICY PAGE CPOZIXXX/VEH</carModel>
          </vehicleDetails>
        </vehicleInfoGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>01</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>02</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>03</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>04</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>05</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>06</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MIN</qualifier>
              <daysOfOperation>07</daysOfOperation>
            </ruleDetails>
            <ruleDetails>
              <type>PCK</type>
              <quantityUnit>3</quantityUnit>
              <qualifier>MAX</qualifier>
            </ruleDetails>
          </otherRules>
        </otherRulesGroup>
        <otherRulesGroup>
          <otherRules>
            <ruleDetails>
              <type>GUA</type>
              <quantity>365</quantity>
              <quantityUnit>3</quantityUnit>
            </ruleDetails>
            <ruleText>
              <textType>GUA</textType>
              <freeText>GUARANTEED FOR 365 DAYS</freeText>
            </ruleText>
          </otherRules>
          <dateTimeInfo>
            <businessSemantic>BED</businessSemantic>
            <beginDateTime>
              <year>2014</year>
              <month>4</month>
              <day>14</day>
            </beginDateTime>
            <endDateTime>
              <year>2015</year>
              <month>4</month>
              <day>14</day>
            </endDateTime>
          </dateTimeInfo>
        </otherRulesGroup>
        <pickupDropoffLocation>
          <locationCode>
            <locationType>176</locationType>
            <locationDescription>
              <code>1A</code>
              <name>LYST01</name>
            </locationDescription>
          </locationCode>
          <address>
            <addressDetails>
              <format>5</format>
              <line1>LYON ST EXUPERY AEROPORT</line1>
            </addressDetails>
            <city>COLOMBIER SAUGNIEU69125</city>
            <countryCode>FR</countryCode>
          </address>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
            <beginDateTime>
              <hour>7</hour>
              <minutes>0</minutes>
            </beginDateTime>
            <endDateTime>
              <hour>24</hour>
              <minutes>0</minutes>
            </endDateTime>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <phone>
            <phoneOrEmailType>PHO</phoneOrEmailType>
            <telephoneNumber>
              <telephoneNumber>0820 61 16 60</telephoneNumber>
            </telephoneNumber>
          </phone>
          <phone>
            <phoneOrEmailType>FAX</phoneOrEmailType>
            <telephoneNumber>
              <telephoneNumber>04 72 22 71 82</telephoneNumber>
            </telephoneNumber>
          </phone>
        </pickupDropoffLocation>
        <pickupDropoffLocation>
          <locationCode>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>NCET01</name>
            </locationDescription>
          </locationCode>
          <address>
            <addressDetails>
              <format>5</format>
              <line1>NICE AEROPORT 06</line1>
            </addressDetails>
            <city>NICE CEDEX 306281</city>
            <countryCode>FR</countryCode>
          </address>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
            <beginDateTime>
              <hour>6</hour>
              <minutes>30</minutes>
            </beginDateTime>
            <endDateTime>
              <hour>24</hour>
              <minutes>0</minutes>
            </endDateTime>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <phone>
            <phoneOrEmailType>PHO</phoneOrEmailType>
            <telephoneNumber>
              <telephoneNumber>0820 61 16 32</telephoneNumber>
            </telephoneNumber>
          </phone>
          <phone>
            <phoneOrEmailType>FAX</phoneOrEmailType>
            <telephoneNumber>
              <telephoneNumber>04 93 21 49 58</telephoneNumber>
            </telephoneNumber>
          </phone>
        </pickupDropoffLocation>
        <rateCodeGroup>
          <rateCode>
            <fareCategories>
              <fareType>S1I</fareType>
            </fareCategories>
          </rateCode>
          <additionalInfo>
            <freeTextDetails>
              <textSubjectQualifier>3</textSubjectQualifier>
              <informationType>SI</informationType>
              <companyId>1A</companyId>
              <encoding>1</encoding>
            </freeTextDetails>
            <freeText>STD ILL KM 1-6D</freeText>
          </additionalInfo>
        </rateCodeGroup>
      </rateDetails>
    </Car_RateInformationFromAvailabilityReply>
  </xsl:template>
  <xsl:template name="PNR0_EVoucher_Amadeus_FR_Agency_oneWay">
    <PNR_Reply xmlns="http://xml.amadeus.com/PNRACC_11_1_1A">
      <pnrHeader>
        <reservationInfo>
          <reservation>
            <companyId>1A</companyId>
          </reservation>
        </reservationInfo>
      </pnrHeader>
      <securityInformation>
        <responsibilityInformation>
          <typeOfPnrElement>RP</typeOfPnrElement>
          <officeId>PAREC38EE</officeId>
          <iataCode>20263051</iataCode>
        </responsibilityInformation>
        <queueingInformation>
          <queueingOfficeId>PAREC38EE</queueingOfficeId>
        </queueingInformation>
      </securityInformation>
      <sbrPOSDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <inHouseIdentification1>
            </inHouseIdentification1>
          </originIdentification>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>
            </companyId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>
            </codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrPOSDetails>
      <sbrCreationPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <inHouseIdentification1>
            </inHouseIdentification1>
          </originIdentification>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>
            </companyId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>
            </codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrCreationPosDetails>
      <sbrUpdatorPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrUpdatorPosDetails>
      <travellerInfo>
        <elementManagementPassenger>
          <reference>
            <qualifier>PT</qualifier>
            <number>2</number>
          </reference>
          <segmentName>NM</segmentName>
          <lineNumber>1</lineNumber>
        </elementManagementPassenger>
        <passengerData>
          <travellerInformation>
            <traveller>
              <surname>STTWO</surname>
              <quantity>1</quantity>
            </traveller>
            <passenger>
              <firstName>CARBSRESERVE</firstName>
            </passenger>
          </travellerInformation>
        </passengerData>
      </travellerInfo>
      <dataElementsMaster>
        <marker2>
        </marker2>
        <dataElementsIndiv>
          <elementManagementData>
            <segmentName>RF</segmentName>
          </elementManagementData>
          <otherDataFreetext>
            <freetextDetail>
              <subjectQualifier>3</subjectQualifier>
              <type>P22</type>
            </freetextDetail>
            <longFreetext>PAREC38EE-MCG-EXPEDI/WSECTEEU</longFreetext>
          </otherDataFreetext>
        </dataElementsIndiv>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>2</number>
            </reference>
            <segmentName>AP</segmentName>
            <lineNumber>2</lineNumber>
          </elementManagementData>
          <otherDataFreetext>
            <freetextDetail>
              <subjectQualifier>3</subjectQualifier>
              <type>3</type>
            </freetextDetail>
            <longFreetext>12542555505555</longFreetext>
          </otherDataFreetext>
        </dataElementsIndiv>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>5</number>
            </reference>
            <segmentName>TK</segmentName>
            <lineNumber>3</lineNumber>
          </elementManagementData>
          <ticketElement>
            <passengerType>PAX</passengerType>
            <ticket>
              <indicator>OK</indicator>
              <date>140414</date>
              <officeId>PAREC38EE</officeId>
            </ticket>
          </ticketElement>
        </dataElementsIndiv>
      </dataElementsMaster>
    </PNR_Reply>
  </xsl:template>
  <xsl:template name="PNR11_EVoucher_Amadeus_FR_Agency_oneWay">
    <PNR_Reply xmlns="http://xml.amadeus.com/PNRACC_11_1_1A">
      <pnrHeader>
        <reservationInfo>
          <reservation>
            <companyId>1A</companyId>
            <controlNumber>4C4ZU3</controlNumber>
            <date>140414</date>
            <time>0747</time>
          </reservation>
        </reservationInfo>
      </pnrHeader>
      <securityInformation>
        <responsibilityInformation>
          <typeOfPnrElement>RP</typeOfPnrElement>
          <agentId>WSSU</agentId>
          <officeId>PAREC38EE</officeId>
          <iataCode>20263051</iataCode>
        </responsibilityInformation>
        <queueingInformation>
          <queueingOfficeId>PAREC38EE</queueingOfficeId>
        </queueingInformation>
        <cityCode>PAR</cityCode>
        <secondRpInformation>
          <creationOfficeId>PAREC38EE</creationOfficeId>
          <agentSignature>9996WS</agentSignature>
          <creationDate>140414</creationDate>
          <creatorIataCode>20263051</creatorIataCode>
          <creationTime>0747</creationTime>
        </secondRpInformation>
      </securityInformation>
      <sbrPOSDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrPOSDetails>
      <sbrCreationPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrCreationPosDetails>
      <sbrUpdatorPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrUpdatorPosDetails>
      <technicalData>
        <enveloppeNumberData>
          <sequenceDetails>
            <number>1</number>
          </sequenceDetails>
        </enveloppeNumberData>
        <lastTransmittedEnvelopeNumber>
          <currentRecord>0</currentRecord>
        </lastTransmittedEnvelopeNumber>
        <purgeDateData>
          <dateTime>
            <year>2014</year>
            <month>10</month>
            <day>1</day>
          </dateTime>
        </purgeDateData>
      </technicalData>
      <travellerInfo>
        <elementManagementPassenger>
          <reference>
            <qualifier>PT</qualifier>
            <number>2</number>
          </reference>
          <segmentName>NM</segmentName>
          <lineNumber>1</lineNumber>
        </elementManagementPassenger>
        <passengerData>
          <travellerInformation>
            <traveller>
              <surname>STTWO</surname>
              <quantity>1</quantity>
            </traveller>
            <passenger>
              <firstName>CARBSRESERVE</firstName>
            </passenger>
          </travellerInformation>
        </passengerData>
      </travellerInfo>
      <originDestinationDetails>
        <originDestination>
        </originDestination>
        <itineraryInfo>
          <elementManagementItinerary>
            <reference>
              <qualifier>ST</qualifier>
              <number>1</number>
            </reference>
            <segmentName>CCR</segmentName>
            <lineNumber>2</lineNumber>
          </elementManagementItinerary>
          <travelProduct>
            <product>
              <depDate>011014</depDate>
              <arrDate>021014</arrDate>
            </product>
            <boardpointDetail>
              <cityCode>LYS</cityCode>
            </boardpointDetail>
            <companyDetail>
              <identification>ZI</identification>
            </companyDetail>
            <productDetails>
              <identification>CXMR</identification>
            </productDetails>
          </travelProduct>
          <itineraryMessageAction>
            <business>
              <function>2</function>
            </business>
          </itineraryMessageAction>
          <relatedProduct>
            <quantity>1</quantity>
            <status>HK</status>
          </relatedProduct>
          <selectionDetails>
            <selection>
              <option>P4</option>
            </selection>
          </selectionDetails>
          <typicalCarData>
            <vehicleInformation>
              <vehicleCharacteristic>
                <vehicleTypeOwner>ACR</vehicleTypeOwner>
                <vehicleRentalPrefType>CXMR</vehicleRentalPrefType>
                <vehicleRentalPrefType>J</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>SI</informationType>
                <companyId>1A</companyId>
                <language>EN</language>
                <source>S</source>
                <encoding>2</encoding>
              </freeTextDetails>
              <carModel>REFER TO POLICY PAGE CPOZIXXX/VEH</carModel>
            </vehicleInformation>
            <companyIdentification>
              <travelSector>CAR</travelSector>
              <companyCodeContext>1A</companyCodeContext>
              <companyCode>ZI</companyCode>
              <companyName>AVIS</companyName>
              <accessLevel>CP</accessLevel>
            </companyIdentification>
            <locationInfo>
              <locationType>176</locationType>
              <locationDescription>
                <code>1A</code>
                <name>LYST01</name>
              </locationDescription>
              <firstLocationDetails>
                <code>LYS</code>
                <qualifier>145</qualifier>
                <agency>IA</agency>
              </firstLocationDetails>
            </locationInfo>
            <locationInfo>
              <locationType>176</locationType>
              <locationDescription>
                <code>CPY</code>
                <name>LYS*LYON ST EXUPERY AEROPORT</name>
              </locationDescription>
            </locationInfo>
            <locationInfo>
              <locationType>DOL</locationType>
              <locationDescription>
                <code>1A</code>
                <name>NCET01</name>
              </locationDescription>
              <firstLocationDetails>
                <code>NCE</code>
                <qualifier>145</qualifier>
                <agency>IA</agency>
              </firstLocationDetails>
            </locationInfo>
            <locationInfo>
              <locationType>DOL</locationType>
              <locationDescription>
                <code>CPY</code>
                <name>NCE*NICE AEROPORT 06</name>
              </locationDescription>
            </locationInfo>
            <pickupDropoffTimes>
              <beginDateTime>
                <year>2014</year>
                <month>10</month>
                <day>1</day>
                <hour>12</hour>
                <minutes>47</minutes>
              </beginDateTime>
              <endDateTime>
                <year>2014</year>
                <month>10</month>
                <day>2</day>
                <hour>12</hour>
                <minutes>47</minutes>
              </endDateTime>
            </pickupDropoffTimes>
            <cancelOrConfirmNbr>
              <reservation>
                <companyId>1A</companyId>
                <controlNumber>16287706FR1</controlNumber>
                <controlType>2</controlType>
              </reservation>
            </cancelOrConfirmNbr>
            <rateCodeGroup>
              <rateCodeInfo>
                <fareCategories>
                  <fareType>S1I</fareType>
                </fareCategories>
              </rateCodeInfo>
              <additionalInfo>
                <freeTextDetails>
                  <textSubjectQualifier>3</textSubjectQualifier>
                  <informationType>SI</informationType>
                  <companyId>1A</companyId>
                  <language>EN</language>
                  <source>S</source>
                  <encoding>2</encoding>
                </freeTextDetails>
                <freeText>STD ILL KM 1-6D</freeText>
              </additionalInfo>
            </rateCodeGroup>
            <customerInfo>
              <customerReferences>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>N865556</referenceNumber>
              </customerReferences>
            </customerInfo>
            <rateInfo>
              <tariffInfo>
                <currency>EUR</currency>
                <ratePlanIndicator>DY</ratePlanIndicator>
                <amountType>GNL</amountType>
              </tariffInfo>
              <rateInformation>
                <category>7</category>
              </rateInformation>
              <chargeDetails>
                <type>RG</type>
                <comment>*ZI*EUR158.45DY-UNL FM XH 226.89 UNL FM</comment>
              </chargeDetails>
            </rateInfo>
            <rateInfo>
              <tariffInfo>
                <amount>158.45</amount>
                <currency>EUR</currency>
                <ratePlanIndicator>DY</ratePlanIndicator>
                <amountType>RG</amountType>
              </tariffInfo>
              <rateInformation>
                <category>7</category>
              </rateInformation>
              <chargeDetails>
                <type>34</type>
                <description>UNL</description>
              </chargeDetails>
              <chargeDetails>
                <type>9</type>
                <amount>226.89</amount>
              </chargeDetails>
            </rateInfo>
            <rateInfo>
              <tariffInfo>
                <amount>158.45</amount>
                <currency>EUR</currency>
                <amountType>RB</amountType>
              </tariffInfo>
              <chargeDetails>
                <type>RBP</type>
                <numberInParty>1</numberInParty>
              </chargeDetails>
            </rateInfo>
            <rateInfo>
              <tariffInfo>
                <amount>282.45</amount>
                <currency>EUR</currency>
                <amountType>904</amountType>
              </tariffInfo>
              <chargeDetails>
                <type>90D</type>
                <numberInParty>1</numberInParty>
              </chargeDetails>
            </rateInfo>
            <rateInfo>
              <tariffInfo>
                <amount>65.83</amount>
                <amountType>DC</amountType>
              </tariffInfo>
            </rateInfo>
            <rulesPoliciesGroup>
              <dummy1>
              </dummy1>
              <pickupDropoffLocation>
                <locationInfo>
                  <locationType>176</locationType>
                </locationInfo>
                <phone>
                  <phoneOrEmailType>PHO</phoneOrEmailType>
                  <emailAddress>0820 61 16 60</emailAddress>
                </phone>
                <phone>
                  <phoneOrEmailType>FAX</phoneOrEmailType>
                  <emailAddress>04 72 22 71 82</emailAddress>
                </phone>
              </pickupDropoffLocation>
              <pickupDropoffLocation>
                <locationInfo>
                  <locationType>DOL</locationType>
                </locationInfo>
                <phone>
                  <phoneOrEmailType>PHO</phoneOrEmailType>
                  <emailAddress>0820 61 16 32</emailAddress>
                </phone>
                <phone>
                  <phoneOrEmailType>FAX</phoneOrEmailType>
                  <emailAddress>04 93 21 49 58</emailAddress>
                </phone>
              </pickupDropoffLocation>
            </rulesPoliciesGroup>
            <payment>
              <formOfPayment>
                <type>CC</type>
                <extendedPayment>GUA</extendedPayment>
                <fopFreeText>CCCAXXXXXXXXXXXX5390EXP1214</fopFreeText>
              </formOfPayment>
            </payment>
            <billingData>
              <billingInfo>
                <billingDetails>871131370003</billingDetails>
                <billingQualifier>901</billingQualifier>
              </billingInfo>
            </billingData>
            <bookingSource>
              <originatorDetails>
                <originatorId>20263051</originatorId>
              </originatorDetails>
            </bookingSource>
            <marketingInfo>
              <freetextDetail>
                <subjectQualifier>3</subjectQualifier>
                <type>MK</type>
                <companyId>1A</companyId>
                <language>EN</language>
              </freetextDetail>
              <text>000-120  KMS , A  10.00 REFUELING SERVICE CHARGE WILL APPLY</text>
              <text>$33.33DAMAGE ADMIN FEE MAY APPLY</text>
              <text>STD ILL KM 1-6D RATE INCLUDES CDW,PAI,TP,TAX</text>
              <text>EXTRA CHARGES MAY APPLY</text>
            </marketingInfo>
            <supleInfo>
              <remarkDetails>
                <type>ARR</type>
                <freetext>1247</freetext>
                <language>EN</language>
                <encoding>2</encoding>
              </remarkDetails>
            </supleInfo>
            <supleInfo>
              <remarkDetails>
                <type>CNM</type>
                <freetext>STTWO CARBSRESERVE</freetext>
                <language>EN</language>
                <encoding>2</encoding>
              </remarkDetails>
            </supleInfo>
            <attribute>
              <criteriaSetType>BAT</criteriaSetType>
              <criteriaDetails>
                <attributeType>COR</attributeType>
              </criteriaDetails>
            </attribute>
          </typicalCarData>
          <markerRailTour>
          </markerRailTour>
          <referenceForSegment>
            <reference>
              <qualifier>PT</qualifier>
              <number>2</number>
            </reference>
          </referenceForSegment>
        </itineraryInfo>
      </originDestinationDetails>
      <dataElementsMaster>
        <marker2>
        </marker2>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>2</number>
            </reference>
            <segmentName>AP</segmentName>
            <lineNumber>3</lineNumber>
          </elementManagementData>
          <otherDataFreetext>
            <freetextDetail>
              <subjectQualifier>3</subjectQualifier>
              <type>3</type>
            </freetextDetail>
            <longFreetext>12542555505555</longFreetext>
          </otherDataFreetext>
        </dataElementsIndiv>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>5</number>
            </reference>
            <segmentName>TK</segmentName>
            <lineNumber>4</lineNumber>
          </elementManagementData>
          <ticketElement>
            <passengerType>PAX</passengerType>
            <ticket>
              <indicator>OK</indicator>
              <date>140414</date>
              <officeId>PAREC38EE</officeId>
            </ticket>
          </ticketElement>
        </dataElementsIndiv>
      </dataElementsMaster>
    </PNR_Reply>
  </xsl:template>
  <xsl:template name="PNR20_EVoucher_Amadeus_FR_Agency_oneWay">
    <PNR_Reply xmlns="http://xml.amadeus.com/PNRACC_11_1_1A">
      <pnrHeader>
        <reservationInfo>
          <reservation>
            <companyId>1A</companyId>
          </reservation>
        </reservationInfo>
      </pnrHeader>
      <securityInformation>
        <responsibilityInformation>
          <typeOfPnrElement>RP</typeOfPnrElement>
          <officeId>PAREC38EE</officeId>
          <iataCode>20263051</iataCode>
        </responsibilityInformation>
        <queueingInformation>
          <queueingOfficeId>PAREC38EE</queueingOfficeId>
        </queueingInformation>
      </securityInformation>
      <sbrPOSDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <inHouseIdentification1>
            </inHouseIdentification1>
          </originIdentification>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>
            </companyId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>
            </codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrPOSDetails>
      <sbrCreationPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <inHouseIdentification1>
            </inHouseIdentification1>
          </originIdentification>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>
            </companyId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>
            </codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrCreationPosDetails>
      <sbrUpdatorPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrUpdatorPosDetails>
    </PNR_Reply>
  </xsl:template>
  <xsl:template name="CarSell_EVoucher_Amadeus_FR_Agency_oneWay">
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
          <freeText>000-120  KMS , A  10.00 REFUELING SERVICE CHARGE WILL APPLY</freeText>
          <freeText>$33.33DAMAGE ADMIN FEE MAY APPLY</freeText>
          <freeText>STD ILL KM 1-6D RATE INCLUDES CDW,PAI,TP,TAX</freeText>
          <freeText>EXTRA CHARGES MAY APPLY</freeText>
        </marketingInfo>
        <paxName>
          <travellerDetails>
            <firstName>STTWO CARBSRESERVE</firstName>
          </travellerDetails>
        </paxName>
        <typicalCarData>
          <companyIdentification>
            <travelSector>CAR</travelSector>
            <companyCode>ZI</companyCode>
          </companyIdentification>
          <locationInfo>
            <locationType>176</locationType>
            <locationDescription>
              <code>1A</code>
              <name>LYST01</name>
            </locationDescription>
            <firstLocationDetails>
              <code>LYS</code>
              <qualifier>145</qualifier>
              <agency>IA</agency>
            </firstLocationDetails>
          </locationInfo>
          <locationInfo>
            <locationType>176</locationType>
            <locationDescription>
              <code>CPY</code>
              <name>LYS*AEROPORT DE LYON SAINT EXUP COLOMBIER</name>
            </locationDescription>
          </locationInfo>
          <locationInfo>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>1A</code>
              <name>NCET01</name>
            </locationDescription>
            <firstLocationDetails>
              <code>NCE</code>
              <qualifier>145</qualifier>
              <agency>IA</agency>
            </firstLocationDetails>
          </locationInfo>
          <locationInfo>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>CPY</code>
              <name>NCE*AEROPORT NICE COTE D'AZUR NICE CEDEX 3</name>
            </locationDescription>
          </locationInfo>
          <pickupDropoffTimes>
            <beginDateTime>
              <year>
                <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:pickupDropoffTimes/rcss:beginDateTime/rcss:year" />
              </year>
              <month>
                <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:pickupDropoffTimes/rcss:beginDateTime/rcss:month" />
              </month>
              <day>
                <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:pickupDropoffTimes/rcss:beginDateTime/rcss:day" />
              </day>
              <hour>
                <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:pickupDropoffTimes/rcss:beginDateTime/rcss:hour" />
              </hour>
              <minutes>
                <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:pickupDropoffTimes/rcss:beginDateTime/rcss:minutes" />
              </minutes>
                            y
                        </beginDateTime>
            <endDateTime>
              <year>
                <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:pickupDropoffTimes/rcss:endDateTime/rcss:year" />
              </year>
              <month>
                <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:pickupDropoffTimes/rcss:endDateTime/rcss:month" />
              </month>
              <day>
                <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:pickupDropoffTimes/rcss:endDateTime/rcss:day" />
              </day>
              <hour>
                <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:pickupDropoffTimes/rcss:endDateTime/rcss:hour" />
              </hour>
              <minutes>
                <xsl:value-of select="/soapenv:Envelope/soapenv:Body/rcss:Car_Sell/rcss:sellData/rcss:pickupDropoffTimes/rcss:endDateTime/rcss:minutes" />
              </minutes>
            </endDateTime>
          </pickupDropoffTimes>
          <vehicleInformation>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CXMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
          </vehicleInformation>
          <confirmationNbr>
            <reservation>
              <companyId>1A</companyId>
              <controlNumber>16287706FR1</controlNumber>
              <controlType>2</controlType>
            </reservation>
          </confirmationNbr>
          <rateCodeInfo>
            <fareCategories>
              <fareType>S1I</fareType>
            </fareCategories>
          </rateCodeInfo>
          <customerInfo>
            <customerReferences>
              <referenceQualifier>CD</referenceQualifier>
              <referenceNumber>N865556</referenceNumber>
            </customerReferences>
          </customerInfo>
          <rateInfo>
            <tariffInfo>
              <ratePlanIndicator>DY</ratePlanIndicator>
              <amountType>GNL</amountType>
            </tariffInfo>
            <rateInformation>
              <category>24</category>
            </rateInformation>
          </rateInfo>
          <rateInfo>
            <tariffInfo>
              <amount>158.45</amount>
              <currency>EUR</currency>
              <ratePlanIndicator>DY</ratePlanIndicator>
              <amountType>RG</amountType>
            </tariffInfo>
            <chargeDetails>
            </chargeDetails>
            <chargeDetails>
            </chargeDetails>
            <chargeDetails>
            </chargeDetails>
            <chargeDetails>
              <description>UNL</description>
            </chargeDetails>
            <chargeDetails>
            </chargeDetails>
            <chargeDetails>
            </chargeDetails>
            <chargeDetails>
            </chargeDetails>
            <chargeDetails>
            </chargeDetails>
            <chargeDetails>
            </chargeDetails>
            <chargeDetails>
              <type>9</type>
              <amount>226.89</amount>
            </chargeDetails>
            <chargeDetails>
            </chargeDetails>
            <chargeDetails>
              <description>UNL</description>
            </chargeDetails>
          </rateInfo>
          <rateInfo>
            <tariffInfo>
              <amount>282.45</amount>
              <currency>EUR</currency>
              <amountType>904</amountType>
            </tariffInfo>
            <chargeDetails>
              <type>90D</type>
              <numberInParty>1</numberInParty>
            </chargeDetails>
          </rateInfo>
          <rateInfo>
            <tariffInfo>
              <amount>65.83</amount>
              <amountType>DRO</amountType>
            </tariffInfo>
          </rateInfo>
          <payment>
            <formOfPayment>
              <type>CC</type>
              <vendorCode>CA</vendorCode>
              <creditCardNumber>XXXXXXXXXXXXXXXXXXXXXXXX5390</creditCardNumber>
              <expiryDate>1214</expiryDate>
              <extendedPayment>GUA</extendedPayment>
            </formOfPayment>
          </payment>
          <billingData>
            <billingInfo>
              <billingDetails>C871131370003</billingDetails>
              <billingQualifier>901</billingQualifier>
            </billingInfo>
          </billingData>
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
  <xsl:template name="ARIS_EVoucher_Amadeus_FR_Agency_oneWay">
    <Car_RateInformationFromCarSegmentReply xmlns="http://xml.amadeus.com/RCFSRR_05_2_1A">
      <rateDetails>
        <companyIdentification>
          <travelSector>CAR</travelSector>
          <companyCode>ZI</companyCode>
          <companyName>AVIS</companyName>
          <accessLevel>CP</accessLevel>
        </companyIdentification>
        <sourceLevel>
          <selectionDetails>
            <option>P6</option>
          </selectionDetails>
        </sourceLevel>
        <mktText>
          <freeTextDetails>
            <textSubjectQualifier>3</textSubjectQualifier>
            <informationType>MK</informationType>
            <companyId>1A</companyId>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>000-120  KMS , A  10.00 REFUELING SERVICE CHARGE WILL APPLY</freeText>
          <freeText>$33.33DAMAGE ADMIN FEE MAY APPLY</freeText>
          <freeText>STD ILL KM 1-6D RATE INCLUDES CDW,PAI,TP,TAX</freeText>
          <freeText>EXTRA CHARGES MAY APPLY</freeText>
        </mktText>
        <rateDetail>
          <tariffInfo>
            <amount>158.45</amount>
            <currency>EUR</currency>
            <ratePlanIndicator>DY</ratePlanIndicator>
            <amountType>RP</amountType>
            <rateChangeIndicator>GUA</rateChangeIndicator>
          </tariffInfo>
          <rateInformation>
            <category>007</category>
          </rateInformation>
          <chargeDetails>
            <type>034</type>
            <description>UNL</description>
          </chargeDetails>
          <chargeDetails>
            <type>008</type>
            <amount>158.45</amount>
          </chargeDetails>
          <chargeDetails>
            <type>009</type>
            <amount>158.45</amount>
          </chargeDetails>
          <chargeDetails>
            <type>80</type>
            <description>UNL</description>
          </chargeDetails>
          <chargeDetails>
            <type>82</type>
            <description>UNL</description>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <amount>34.58</amount>
            <comment>LOCATION SURCHARGE</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <amount>2.92</amount>
            <comment>REGISTRATION FEE / ROAD TAX</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <comment>SALES TAX</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <amount>65.83</amount>
            <comment>ONE WAY CHARGE</comment>
          </chargeDetails>
          <chargeDetails>
            <type>108</type>
            <amount>20.67</amount>
            <comment>TAX ON MANDATORY ITEMS</comment>
          </chargeDetails>
          <chargeDetails>
            <type>COV</type>
            <comment>CDW - COLLISION DAMAGE WAIVER</comment>
          </chargeDetails>
          <chargeDetails>
            <type>COV</type>
            <comment>PAI - PERSONAL ACCIDENT INSURANCE</comment>
          </chargeDetails>
          <chargeDetails>
            <type>COV</type>
            <comment>TP - THEFT PROTECTION</comment>
          </chargeDetails>
        </rateDetail>
        <rateDetail>
          <tariffInfo>
            <amount>158.45</amount>
            <currency>EUR</currency>
            <amountType>RB</amountType>
          </tariffInfo>
          <chargeDetails>
            <type>NBD</type>
            <amount>1</amount>
          </chargeDetails>
          <chargeDetails>
            <type>NBH</type>
            <amount>0</amount>
          </chargeDetails>
        </rateDetail>
        <rateDetail>
          <tariffInfo>
            <amount>282.45</amount>
            <currency>EUR</currency>
            <amountType>904</amountType>
          </tariffInfo>
        </rateDetail>
        <dummy>
        </dummy>
        <remarks>
          <freeTextDetails>
            <textSubjectQualifier>3</textSubjectQualifier>
            <informationType>SI</informationType>
            <companyId>1A</companyId>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>MUST RETURN TO REQUESTED CITY</freeText>
          <freeText>THE MINIMUM RENTAL PERIOD IS 001 DAYS</freeText>
          <freeText>33.33     DAMAGE ADMIN FEE MAY APPLY</freeText>
        </remarks>
        <taxCovSurchargeGroup>
          <taxSurchargeCoverageInfo>
            <tariffInfo>
              <currency>EUR</currency>
            </tariffInfo>
            <chargeDetails>
              <type>108</type>
              <amount>34.58</amount>
              <description>IES</description>
              <periodType>004</periodType>
              <currency>EUR</currency>
              <comment>LOCATION SURCHARGE</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <taxCovSurchargeGroup>
          <taxSurchargeCoverageInfo>
            <tariffInfo>
              <currency>EUR</currency>
            </tariffInfo>
            <chargeDetails>
              <type>108</type>
              <amount>2.92</amount>
              <description>IES</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>REGISTRATION FEE / ROAD TAX</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <taxCovSurchargeGroup>
          <taxSurchargeCoverageInfo>
            <tariffInfo>
              <currency>EUR</currency>
            </tariffInfo>
            <chargeDetails>
              <type>108</type>
              <amount>20.000</amount>
              <description>IBR</description>
              <periodType>012</periodType>
              <comment>SALES TAX</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <taxCovSurchargeGroup>
          <taxSurchargeCoverageInfo>
            <tariffInfo>
              <currency>EUR</currency>
            </tariffInfo>
            <chargeDetails>
              <type>108</type>
              <amount>65.83</amount>
              <description>IES</description>
              <periodType>004</periodType>
              <currency>EUR</currency>
              <comment>ONE WAY CHARGE</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <taxCovSurchargeGroup>
          <taxSurchargeCoverageInfo>
            <tariffInfo>
              <currency>EUR</currency>
            </tariffInfo>
            <chargeDetails>
              <type>108</type>
              <amount>20.000</amount>
              <description>IES</description>
              <periodType>012</periodType>
              <comment>TAX ON MANDATORY ITEMS</comment>
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
              <amount>.00</amount>
              <description>IBR</description>
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
              <amount>.00</amount>
              <description>IBR</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>PAI - PERSONAL ACCIDENT INSURANCE</comment>
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
              <amount>.00</amount>
              <description>IBR</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>TP - THEFT PROTECTION</comment>
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
              <amount>.84</amount>
              <description>OPT</description>
              <periodType>001</periodType>
              <currency>EUR</currency>
              <comment>SLI - SUPPLEMENTARY LIABILITY INSURANCE</comment>
            </chargeDetails>
          </taxSurchargeCoverageInfo>
        </taxCovSurchargeGroup>
        <vehicleInfoGroup>
          <vehicleDetails>
            <vehicleCharacteristic>
              <vehicleTypeOwner>ACR</vehicleTypeOwner>
              <vehicleRentalPrefType>CXMR</vehicleRentalPrefType>
            </vehicleCharacteristic>
            <freeTextDetails>
              <textSubjectQualifier>3</textSubjectQualifier>
              <informationType>SI</informationType>
              <companyId>1A</companyId>
              <encoding>1</encoding>
            </freeTextDetails>
            <carModel>REFER TO POLICY PAGE CPOZIXXX/VEH</carModel>
          </vehicleDetails>
        </vehicleInfoGroup>
        <pickupDropoffLocation>
          <locationCode>
            <locationType>176</locationType>
            <locationDescription>
              <code>CPY</code>
              <name>LYST01*</name>
            </locationDescription>
          </locationCode>
          <address>
            <addressDetails>
              <format>5</format>
              <line1>LYON ST EXUPERY AEROPORT</line1>
            </addressDetails>
            <city>COLOMBIER SAUGNIEU69125</city>
            <countryCode>FR</countryCode>
          </address>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
            <beginDateTime>
              <hour>7</hour>
              <minutes>0</minutes>
            </beginDateTime>
            <endDateTime>
              <hour>24</hour>
              <minutes>0</minutes>
            </endDateTime>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <phone>
            <phoneOrEmailType>PHO</phoneOrEmailType>
            <telephoneNumber>
              <telephoneNumber>0820 61 16 60</telephoneNumber>
            </telephoneNumber>
          </phone>
          <phone>
            <phoneOrEmailType>FAX</phoneOrEmailType>
            <telephoneNumber>
              <telephoneNumber>04 72 22 71 82</telephoneNumber>
            </telephoneNumber>
          </phone>
        </pickupDropoffLocation>
        <pickupDropoffLocation>
          <locationCode>
            <locationType>DOL</locationType>
            <locationDescription>
              <code>CPY</code>
              <name>NCET01*</name>
            </locationDescription>
          </locationCode>
          <address>
            <addressDetails>
              <format>5</format>
              <line1>NICE AEROPORT 06</line1>
            </addressDetails>
            <city>NICE CEDEX 306281</city>
            <countryCode>FR</countryCode>
          </address>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
            <beginDateTime>
              <hour>6</hour>
              <minutes>30</minutes>
            </beginDateTime>
            <endDateTime>
              <hour>24</hour>
              <minutes>0</minutes>
            </endDateTime>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <openingHours>
            <businessSemantic>OCH</businessSemantic>
          </openingHours>
          <phone>
            <phoneOrEmailType>PHO</phoneOrEmailType>
            <telephoneNumber>
              <telephoneNumber>0820 61 16 32</telephoneNumber>
            </telephoneNumber>
          </phone>
          <phone>
            <phoneOrEmailType>FAX</phoneOrEmailType>
            <telephoneNumber>
              <telephoneNumber>04 93 21 49 58</telephoneNumber>
            </telephoneNumber>
          </phone>
        </pickupDropoffLocation>
        <rateCodeGroup>
          <rateCode>
            <fareCategories>
              <fareType>S1I</fareType>
            </fareCategories>
          </rateCode>
          <additionalInfo>
            <freeTextDetails>
              <textSubjectQualifier>3</textSubjectQualifier>
              <informationType>SI</informationType>
              <companyId>1A</companyId>
              <encoding>1</encoding>
            </freeTextDetails>
            <freeText>STD ILL KM 1-6D</freeText>
          </additionalInfo>
        </rateCodeGroup>
      </rateDetails>
    </Car_RateInformationFromCarSegmentReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_EVoucher_Amadeus_FR_Agency_oneWay">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>
                /
                OK E-VOUCHER
            </textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Retrieve_EVoucher_Amadeus_FR_Agency_oneWay">
    <PNR_Reply xmlns="http://xml.amadeus.com/PNRACC_11_1_1A">
      <pnrHeader>
        <reservationInfo>
          <reservation>
            <companyId>1A</companyId>
            <controlNumber>4C4ZU3</controlNumber>
            <date>140414</date>
            <time>0748</time>
          </reservation>
        </reservationInfo>
      </pnrHeader>
      <securityInformation>
        <responsibilityInformation>
          <typeOfPnrElement>RP</typeOfPnrElement>
          <agentId>WSSU</agentId>
          <officeId>PAREC38EE</officeId>
          <iataCode>20263051</iataCode>
        </responsibilityInformation>
        <queueingInformation>
          <queueingOfficeId>PAREC38EE</queueingOfficeId>
        </queueingInformation>
        <cityCode>PAR</cityCode>
        <secondRpInformation>
          <creationOfficeId>PAREC38EE</creationOfficeId>
          <agentSignature>9996WS</agentSignature>
          <creationDate>140414</creationDate>
          <creatorIataCode>20263051</creatorIataCode>
          <creationTime>0747</creationTime>
        </secondRpInformation>
      </securityInformation>
      <sbrPOSDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrPOSDetails>
      <sbrCreationPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrCreationPosDetails>
      <sbrUpdatorPosDetails>
        <sbrUserIdentificationOwn>
          <originIdentification>
            <originatorId>20263051</originatorId>
            <inHouseIdentification1>PAREC38EE</inHouseIdentification1>
          </originIdentification>
          <originatorTypeCode>T</originatorTypeCode>
        </sbrUserIdentificationOwn>
        <sbrSystemDetails>
          <deliveringSystem>
            <companyId>1A</companyId>
            <locationId>PAR</locationId>
          </deliveringSystem>
        </sbrSystemDetails>
        <sbrPreferences>
          <userPreferences>
            <codedCountry>FR</codedCountry>
          </userPreferences>
        </sbrPreferences>
      </sbrUpdatorPosDetails>
      <technicalData>
        <enveloppeNumberData>
          <sequenceDetails>
            <number>2</number>
          </sequenceDetails>
        </enveloppeNumberData>
        <lastTransmittedEnvelopeNumber>
          <currentRecord>1</currentRecord>
        </lastTransmittedEnvelopeNumber>
        <purgeDateData>
          <dateTime>
            <year>2014</year>
            <month>10</month>
            <day>1</day>
          </dateTime>
        </purgeDateData>
      </technicalData>
      <travellerInfo>
        <elementManagementPassenger>
          <reference>
            <qualifier>PT</qualifier>
            <number>2</number>
          </reference>
          <segmentName>NM</segmentName>
          <lineNumber>1</lineNumber>
        </elementManagementPassenger>
        <passengerData>
          <travellerInformation>
            <traveller>
              <surname>STTWO</surname>
              <quantity>1</quantity>
            </traveller>
            <passenger>
              <firstName>CARBSRESERVE</firstName>
            </passenger>
          </travellerInformation>
        </passengerData>
      </travellerInfo>
      <originDestinationDetails>
        <originDestination>
        </originDestination>
        <itineraryInfo>
          <elementManagementItinerary>
            <reference>
              <qualifier>ST</qualifier>
              <number>1</number>
            </reference>
            <segmentName>CCR</segmentName>
            <lineNumber>2</lineNumber>
          </elementManagementItinerary>
          <travelProduct>
            <product>
              <depDate>011014</depDate>
              <arrDate>021014</arrDate>
            </product>
            <boardpointDetail>
              <cityCode>LYS</cityCode>
            </boardpointDetail>
            <companyDetail>
              <identification>ZI</identification>
            </companyDetail>
            <productDetails>
              <identification>CXMR</identification>
            </productDetails>
          </travelProduct>
          <itineraryMessageAction>
            <business>
              <function>2</function>
            </business>
          </itineraryMessageAction>
          <relatedProduct>
            <quantity>1</quantity>
            <status>HK</status>
          </relatedProduct>
          <selectionDetails>
            <selection>
              <option>P4</option>
            </selection>
          </selectionDetails>
          <typicalCarData>
            <vehicleInformation>
              <vehicleCharacteristic>
                <vehicleTypeOwner>ACR</vehicleTypeOwner>
                <vehicleRentalPrefType>CXMR</vehicleRentalPrefType>
                <vehicleRentalPrefType>J</vehicleRentalPrefType>
              </vehicleCharacteristic>
              <freeTextDetails>
                <textSubjectQualifier>3</textSubjectQualifier>
                <informationType>SI</informationType>
                <companyId>1A</companyId>
                <language>EN</language>
                <source>S</source>
                <encoding>2</encoding>
              </freeTextDetails>
              <carModel>REFER TO POLICY PAGE CPOZIXXX/VEH</carModel>
            </vehicleInformation>
            <voucherPrintAck>
              <referenceDetails>
                <type>CK</type>
                <value>40538451</value>
              </referenceDetails>
            </voucherPrintAck>
            <companyIdentification>
              <travelSector>CAR</travelSector>
              <companyCodeContext>1A</companyCodeContext>
              <companyCode>ZI</companyCode>
              <companyName>AVIS</companyName>
              <accessLevel>CP</accessLevel>
            </companyIdentification>
            <locationInfo>
              <locationType>176</locationType>
              <locationDescription>
                <code>1A</code>
                <name>LYST01</name>
              </locationDescription>
              <firstLocationDetails>
                <code>LYS</code>
                <qualifier>145</qualifier>
                <agency>IA</agency>
              </firstLocationDetails>
            </locationInfo>
            <locationInfo>
              <locationType>176</locationType>
              <locationDescription>
                <code>CPY</code>
                <name>LYS*LYON ST EXUPERY AEROPORT</name>
              </locationDescription>
            </locationInfo>
            <locationInfo>
              <locationType>DOL</locationType>
              <locationDescription>
                <code>1A</code>
                <name>NCET01</name>
              </locationDescription>
              <firstLocationDetails>
                <code>NCE</code>
                <qualifier>145</qualifier>
                <agency>IA</agency>
              </firstLocationDetails>
            </locationInfo>
            <locationInfo>
              <locationType>DOL</locationType>
              <locationDescription>
                <code>CPY</code>
                <name>NCE*NICE AEROPORT 06</name>
              </locationDescription>
            </locationInfo>
            <pickupDropoffTimes>
              <beginDateTime>
                <year>2014</year>
                <month>10</month>
                <day>1</day>
                <hour>12</hour>
                <minutes>47</minutes>
              </beginDateTime>
              <endDateTime>
                <year>2014</year>
                <month>10</month>
                <day>2</day>
                <hour>12</hour>
                <minutes>47</minutes>
              </endDateTime>
            </pickupDropoffTimes>
            <cancelOrConfirmNbr>
              <reservation>
                <companyId>1A</companyId>
                <controlNumber>16287706FR1</controlNumber>
                <controlType>2</controlType>
              </reservation>
            </cancelOrConfirmNbr>
            <rateCodeGroup>
              <rateCodeInfo>
                <fareCategories>
                  <fareType>S1I</fareType>
                </fareCategories>
              </rateCodeInfo>
              <additionalInfo>
                <freeTextDetails>
                  <textSubjectQualifier>3</textSubjectQualifier>
                  <informationType>SI</informationType>
                  <companyId>1A</companyId>
                  <language>EN</language>
                  <source>S</source>
                  <encoding>2</encoding>
                </freeTextDetails>
                <freeText>STD ILL KM 1-6D</freeText>
              </additionalInfo>
            </rateCodeGroup>
            <customerInfo>
              <customerReferences>
                <referenceQualifier>CD</referenceQualifier>
                <referenceNumber>N865556</referenceNumber>
              </customerReferences>
            </customerInfo>
            <rateInfo>
              <tariffInfo>
                <currency>EUR</currency>
                <ratePlanIndicator>DY</ratePlanIndicator>
                <amountType>GNL</amountType>
              </tariffInfo>
              <rateInformation>
                <category>7</category>
              </rateInformation>
              <chargeDetails>
                <type>VV</type>
                <comment>FULL CREDIT</comment>
              </chargeDetails>
            </rateInfo>
            <rateInfo>
              <tariffInfo>
                <amount>158.45</amount>
                <currency>EUR</currency>
                <amountType>RB</amountType>
              </tariffInfo>
              <chargeDetails>
                <type>RBP</type>
                <numberInParty>1</numberInParty>
              </chargeDetails>
            </rateInfo>
            <rateInfo>
              <tariffInfo>
                <amount>282.45</amount>
                <currency>EUR</currency>
                <amountType>904</amountType>
              </tariffInfo>
              <chargeDetails>
                <type>90D</type>
                <numberInParty>1</numberInParty>
              </chargeDetails>
            </rateInfo>
            <rateInfo>
              <tariffInfo>
                <amount>65.83</amount>
                <amountType>DC</amountType>
              </tariffInfo>
            </rateInfo>
            <rulesPoliciesGroup>
              <dummy1>
              </dummy1>
              <pickupDropoffLocation>
                <locationInfo>
                  <locationType>176</locationType>
                </locationInfo>
                <phone>
                  <phoneOrEmailType>PHO</phoneOrEmailType>
                  <emailAddress>0820 61 16 60</emailAddress>
                </phone>
                <phone>
                  <phoneOrEmailType>FAX</phoneOrEmailType>
                  <emailAddress>04 72 22 71 82</emailAddress>
                </phone>
              </pickupDropoffLocation>
              <pickupDropoffLocation>
                <locationInfo>
                  <locationType>DOL</locationType>
                </locationInfo>
                <phone>
                  <phoneOrEmailType>PHO</phoneOrEmailType>
                  <emailAddress>0820 61 16 32</emailAddress>
                </phone>
                <phone>
                  <phoneOrEmailType>FAX</phoneOrEmailType>
                  <emailAddress>04 93 21 49 58</emailAddress>
                </phone>
              </pickupDropoffLocation>
            </rulesPoliciesGroup>
            <payment>
              <formOfPayment>
                <type>CC</type>
                <extendedPayment>GUA</extendedPayment>
                <fopFreeText>CCCAXXXXXXXXXXXX5390EXP1214</fopFreeText>
              </formOfPayment>
            </payment>
            <billingData>
              <billingInfo>
                <billingDetails>871131370003</billingDetails>
                <billingQualifier>901</billingQualifier>
              </billingInfo>
            </billingData>
            <bookingSource>
              <originatorDetails>
                <originatorId>20263051</originatorId>
              </originatorDetails>
            </bookingSource>
            <marketingInfo>
              <freetextDetail>
                <subjectQualifier>3</subjectQualifier>
                <type>MK</type>
                <companyId>1A</companyId>
                <language>EN</language>
              </freetextDetail>
              <text>000-120  KMS , A  10.00 REFUELING SERVICE CHARGE WILL APPLY</text>
              <text>$33.33DAMAGE ADMIN FEE MAY APPLY</text>
              <text>STD ILL KM 1-6D RATE INCLUDES CDW,PAI,TP,TAX</text>
              <text>EXTRA CHARGES MAY APPLY</text>
            </marketingInfo>
            <supleInfo>
              <remarkDetails>
                <type>ARR</type>
                <freetext>1247</freetext>
                <language>EN</language>
                <encoding>2</encoding>
              </remarkDetails>
            </supleInfo>
            <supleInfo>
              <remarkDetails>
                <type>CNM</type>
                <freetext>STTWO CARBSRESERVE</freetext>
                <language>EN</language>
                <encoding>2</encoding>
              </remarkDetails>
            </supleInfo>
            <electronicVoucherNumber>
              <documentDetails>
                <number>E16287706</number>
              </documentDetails>
            </electronicVoucherNumber>
            <attribute>
              <criteriaSetType>BAT</criteriaSetType>
              <criteriaDetails>
                <attributeType>COR</attributeType>
              </criteriaDetails>
            </attribute>
          </typicalCarData>
          <markerRailTour>
          </markerRailTour>
          <referenceForSegment>
            <reference>
              <qualifier>PT</qualifier>
              <number>2</number>
            </reference>
          </referenceForSegment>
        </itineraryInfo>
      </originDestinationDetails>
      <dataElementsMaster>
        <marker2>
        </marker2>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>2</number>
            </reference>
            <segmentName>AP</segmentName>
            <lineNumber>3</lineNumber>
          </elementManagementData>
          <otherDataFreetext>
            <freetextDetail>
              <subjectQualifier>3</subjectQualifier>
              <type>3</type>
            </freetextDetail>
            <longFreetext>12542555505555</longFreetext>
          </otherDataFreetext>
        </dataElementsIndiv>
        <dataElementsIndiv>
          <elementManagementData>
            <reference>
              <qualifier>OT</qualifier>
              <number>5</number>
            </reference>
            <segmentName>TK</segmentName>
            <lineNumber>4</lineNumber>
          </elementManagementData>
          <ticketElement>
            <passengerType>PAX</passengerType>
            <ticket>
              <indicator>OK</indicator>
              <date>140414</date>
              <officeId>PAREC38EE</officeId>
            </ticket>
          </ticketElement>
        </dataElementsIndiv>
      </dataElementsMaster>
    </PNR_Reply>
  </xsl:template>
</xsl:stylesheet>