<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xalan="http://xml.apache.org/xalan" xmlns:tdbi="http://xml.amadeus.com/TDBIUQ_11_1_1A" exclude-result-prefixes="xalan" version="1.0">
  <xsl:template name="PAY_ManageDBIData_Default">
    <!--
		<PAY_ManageDBIDataReply xmlns="http://xml.amadeus.com/TDBIUR_11_1_1A">
			<errorGroup>
				<errorOrWarningCodeDetails>
					<errorDetails>
						<errorCode>3907</errorCode>
						<errorCategory>EC</errorCategory>
						<errorCodeOwner>ZZZ</errorCodeOwner>
					</errorDetails>
				</errorOrWarningCodeDetails>
				<errorWarningDescription>
					<freeTextDetails>
						<textSubjectQualifier>CAN</textSubjectQualifier>
						<source>M</source>
						<encoding>1</encoding>
					</freeTextDetails>
					<freeText>DESCRIPTIVE BILLING NOT REQUIRED</freeText>
				</errorWarningDescription>
			</errorGroup>
			<formOfPayment>
				<formOfPayment>
					<type>CC</type>
					<vendorCode>TP</vendorCode>
					<creditCardNumber>XXXXXXXXXXXX8235</creditCardNumber>
				</formOfPayment>
			</formOfPayment>
		</PAY_ManageDBIDataReply>
		-->
    <PAY_ManageDBIDataReply xmlns="http://xml.amadeus.com/TDBIUR_11_1_1A">
      <returnCode>
        <responseType>A</responseType>
        <statusCode>P</statusCode>
      </returnCode>
      <formOfPayment>
        <formOfPayment>
          <type>CC</type>
          <vendorCode>TP</vendorCode>
          <creditCardNumber>122001010828235</creditCardNumber>
          <approvalCode>APS3</approvalCode>
        </formOfPayment>
      </formOfPayment>
      <attributeData>
        <statusDetails>
          <indicator>PR</indicator>
          <description>PROJECT NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>N/A</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>PK</indicator>
          <description>PERSONAL ID/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>Y</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AU</indicator>
          <description>ORDER NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>N/A</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AK</indicator>
          <description>ACTION CODE/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>TESTCC2</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AE</indicator>
          <description>ACCOUNTING UNIT/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>110793391</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>CNU</indicator>
          <description>Vendor Booking Confirmation Number</description>
        </statusDetails>
        <otherStatusDetails>
          <description>110793391</description>
        </otherStatusDetails>
      </attributeData>
    </PAY_ManageDBIDataReply>
  </xsl:template>
  <!-- Start Monica's Part -->
  <xsl:template name="PAY_ManageDBIData_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929">
    <PAY_ManageDBIDataReply xmlns="http://xml.amadeus.com/TDBIUR_11_1_1A">
      <returnCode>
        <responseType>A</responseType>
        <statusCode>P</statusCode>
      </returnCode>
      <formOfPayment>
        <formOfPayment>
          <type>CC</type>
          <vendorCode>TP</vendorCode>
          <creditCardNumber>122001010828235</creditCardNumber>
          <approvalCode>APS3</approvalCode>
        </formOfPayment>
      </formOfPayment>
      <attributeData>
        <statusDetails>
          <indicator>PR</indicator>
          <description>PROJECT NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>N/A</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>PK</indicator>
          <description>PERSONAL ID/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>Y</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AU</indicator>
          <description>ORDER NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>N/A</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AK</indicator>
          <description>ACTION CODE/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>TESTCC2</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AE</indicator>
          <description>ACCOUNTING UNIT/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>110793391</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>CNU</indicator>
          <description>Vendor Booking Confirmation Number</description>
        </statusDetails>
        <otherStatusDetails>
          <description>110793391</description>
        </otherStatusDetails>
      </attributeData>
    </PAY_ManageDBIDataReply>
  </xsl:template>
  <xsl:template name="PAY_ManageDBIData_FRSite_Standalone_RoundTrip_OnAirport_withAirPlus_537929_withWarning">
    <PAY_ManageDBIDataReply xmlns="http://xml.amadeus.com/TDBIUR_11_1_1A">
      <errorGroup>
        <errorOrWarningCodeDetails>
          <errorDetails>
            <errorCode>9999</errorCode>
            <errorCategory>WEC</errorCategory>
            <errorCodeOwner>ZZZ</errorCodeOwner>
          </errorDetails>
        </errorOrWarningCodeDetails>
        <errorWarningDescription>
          <freeTextDetails>
            <textSubjectQualifier>CAN</textSubjectQualifier>
            <source>M</source>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>DESCRIPTIVE BILLING NOT REQUIRED</freeText>
        </errorWarningDescription>
      </errorGroup>
      <formOfPayment>
        <formOfPayment>
          <type>CC</type>
          <vendorCode>TP</vendorCode>
          <creditCardNumber>XXXXXXXXXXXX8235</creditCardNumber>
        </formOfPayment>
      </formOfPayment>
    </PAY_ManageDBIDataReply>
  </xsl:template>
  <!-- End Monica's Part -->
  <xsl:template name="PAY_ManageDBIData_PNRDBIDataAndOthers_Airplus_TUID_518660">
    <PAY_ManageDBIDataReply xmlns="http://xml.amadeus.com/TDBIUR_11_1_1A">
      <errorGroup>
        <errorOrWarningCodeDetails>
          <errorDetails>
            <errorCode>3907</errorCode>
            <errorCategory>EC</errorCategory>
            <errorCodeOwner>ZZZ</errorCodeOwner>
          </errorDetails>
        </errorOrWarningCodeDetails>
        <errorWarningDescription>
          <freeTextDetails>
            <textSubjectQualifier>CAN</textSubjectQualifier>
            <source>M</source>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>INVALID REQUEST</freeText>
        </errorWarningDescription>
      </errorGroup>
      <formOfPayment>
        <formOfPayment>
          <type>CC</type>
          <vendorCode>TP</vendorCode>
          <creditCardNumber>XXXXXXXXXXXX8235</creditCardNumber>
        </formOfPayment>
      </formOfPayment>
    </PAY_ManageDBIDataReply>
  </xsl:template>
  <xsl:template name="PAY_ManageDBIData_PNRDBIDataOnly_Airplus_TUID_518661">
    <PAY_ManageDBIDataReply xmlns="http://xml.amadeus.com/TDBIUR_11_1_1A">
      <errorGroup>
        <errorOrWarningCodeDetails>
          <errorDetails>
            <errorCode>3907</errorCode>
            <errorCategory>EC</errorCategory>
            <errorCodeOwner>ZZZ</errorCodeOwner>
          </errorDetails>
        </errorOrWarningCodeDetails>
        <errorWarningDescription>
          <freeTextDetails>
            <textSubjectQualifier>CAN</textSubjectQualifier>
            <source>M</source>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>INVALID REQUEST</freeText>
        </errorWarningDescription>
      </errorGroup>
      <formOfPayment>
        <formOfPayment>
          <type>CC</type>
          <vendorCode>TP</vendorCode>
          <creditCardNumber>XXXXXXXXXXXX8235</creditCardNumber>
        </formOfPayment>
      </formOfPayment>
    </PAY_ManageDBIDataReply>
  </xsl:template>
  <xsl:template name="PAY_ManageDBIData_NoPNRInDBIData_Airplus_TUID_518663">
    <PAY_ManageDBIDataReply xmlns="http://xml.amadeus.com/TDBIUR_11_1_1A">
      <errorGroup>
        <errorOrWarningCodeDetails>
          <errorDetails>
            <errorCode>3907</errorCode>
            <errorCategory>EC</errorCategory>
            <errorCodeOwner>ZZZ</errorCodeOwner>
          </errorDetails>
        </errorOrWarningCodeDetails>
        <errorWarningDescription>
          <freeTextDetails>
            <textSubjectQualifier>CAN</textSubjectQualifier>
            <source>M</source>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>INVALID REQUEST</freeText>
        </errorWarningDescription>
      </errorGroup>
      <formOfPayment>
        <formOfPayment>
          <type>CC</type>
          <vendorCode>TP</vendorCode>
          <creditCardNumber>XXXXXXXXXXXX8235</creditCardNumber>
        </formOfPayment>
      </formOfPayment>
    </PAY_ManageDBIDataReply>
  </xsl:template>
  <xsl:template name="PAY_ManageDBIData_InvalidPNRInDBIData_Airplus_TUID_519841">
    <PAY_ManageDBIDataReply xmlns="http://xml.amadeus.com/TDBIUR_11_1_1A">
      <errorGroup>
        <errorOrWarningCodeDetails>
          <errorDetails>
            <errorCode>3907</errorCode>
            <errorCategory>EC</errorCategory>
            <errorCodeOwner>ZZZ</errorCodeOwner>
          </errorDetails>
        </errorOrWarningCodeDetails>
        <errorWarningDescription>
          <freeTextDetails>
            <textSubjectQualifier>CAN</textSubjectQualifier>
            <source>M</source>
            <encoding>1</encoding>
          </freeTextDetails>
          <freeText>INVALID REQUEST</freeText>
        </errorWarningDescription>
      </errorGroup>
      <formOfPayment>
        <formOfPayment>
          <type>CC</type>
          <vendorCode>TP</vendorCode>
          <creditCardNumber>XXXXXXXXXXXX8235</creditCardNumber>
        </formOfPayment>
      </formOfPayment>
    </PAY_ManageDBIDataReply>
  </xsl:template>
  <xsl:template name="PAY_ManageDBIData_Amadeus_FRA_Standalone_OneWay_OnAirport_AccredetiveAndAirplusWithKeyValue_TUID_746065">
    <PAY_ManageDBIDataReply xmlns="http://xml.amadeus.com/TDBIUR_11_1_1A">
      <returnCode>
        <responseType>U</responseType>
        <statusCode>P</statusCode>
      </returnCode>
      <formOfPayment>
        <formOfPayment>
          <type>CC</type>
          <vendorCode>TP</vendorCode>
          <creditCardNumber>XXXXXXXXXXXX8235</creditCardNumber>
        </formOfPayment>
      </formOfPayment>
      <attributeData>
        <statusDetails>
          <indicator>DBI</indicator>
          <description>3153</description>
        </statusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AE</indicator>
          <description>ACCOUNTING UNIT/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL4</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AK</indicator>
          <description>ACTION CODE/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL9</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AU</indicator>
          <description>ORDER NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL8</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>BD</indicator>
          <description>FILE DATE/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL6</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>DS</indicator>
          <description>DEPARTMENT CODE/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL2</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>IK</indicator>
          <description>ACCOUNT NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL5</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>KS</indicator>
          <description>COST ACCOUNT NBR/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL3</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>PK</indicator>
          <description>PERSONAL ID/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL1</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>PR</indicator>
          <description>PROJECT NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL7</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>RZ</indicator>
          <description>DESTINATION/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL10</description>
        </otherStatusDetails>
      </attributeData>
    </PAY_ManageDBIDataReply>
  </xsl:template>
  <xsl:template name="PAY_ManageDBIData_Amadeus_GBR_Standalone_RoundTrip_OnAirport_VendorLoyaltyNumberAndAirplusWithKeyValue_TUID_746070">
    <PAY_ManageDBIDataReply xmlns="http://xml.amadeus.com/TDBIUR_11_1_1A">
      <returnCode>
        <responseType>U</responseType>
        <statusCode>P</statusCode>
      </returnCode>
      <formOfPayment>
        <formOfPayment>
          <type>CC</type>
          <vendorCode>TP</vendorCode>
          <creditCardNumber>XXXXXXXXXXXX8235</creditCardNumber>
        </formOfPayment>
      </formOfPayment>
      <attributeData>
        <statusDetails>
          <indicator>DBI</indicator>
          <description>3154</description>
        </statusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AE</indicator>
          <description>ACCOUNTING UNIT/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL4</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AK</indicator>
          <description>ACTION CODE/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL9</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AU</indicator>
          <description>ORDER NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL8</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>BD</indicator>
          <description>FILE DATE/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL6</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>DS</indicator>
          <description>DEPARTMENT CODE/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL2</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>IK</indicator>
          <description>ACCOUNT NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL5</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>KS</indicator>
          <description>COST ACCOUNT NBR/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL3</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>PK</indicator>
          <description>PERSONAL ID/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL1</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>PR</indicator>
          <description>PROJECT NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL7</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>RZ</indicator>
          <description>DESTINATION/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>VAL10</description>
        </otherStatusDetails>
      </attributeData>
    </PAY_ManageDBIDataReply>
  </xsl:template>
  <xsl:template name="PAY_ManageDBIData_Amadeus_UK_Agency_Standalone_FRLocation_onAiport_roundTrip_AirplusWithEDIdata_TUID_456139">
    <PAY_ManageDBIDataReply xmlns="http://xml.amadeus.com/TDBIUR_11_1_1A">
      <returnCode>
        <responseType>U</responseType>
        <statusCode>P</statusCode>
      </returnCode>
      <formOfPayment>
        <formOfPayment>
          <type>CC</type>
          <vendorCode>TP</vendorCode>
          <creditCardNumber>XXXXXXXXXXXX8235</creditCardNumber>
        </formOfPayment>
      </formOfPayment>
      <attributeData>
        <statusDetails>
          <indicator>DBI</indicator>
          <description>3157</description>
        </statusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AE</indicator>
          <description>ACCOUNTING UNIT/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>val4</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AK</indicator>
          <description>ACTION CODE/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>val9</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>AU</indicator>
          <description>ORDER NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>val8</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>BD</indicator>
          <description>FILE DATE/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>val6</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>DS</indicator>
          <description>DEPARTMENT CODE/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>val2</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>IK</indicator>
          <description>ACCOUNT NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>val5</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>KS</indicator>
          <description>COST ACCOUNT NBR/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>val3</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>PK</indicator>
          <description>PERSONAL ID/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>val1</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>PR</indicator>
          <description>PROJECT NUMBER/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>val7</description>
        </otherStatusDetails>
      </attributeData>
      <attributeData>
        <statusDetails>
          <indicator>RZ</indicator>
          <description>DESTINATION/01/09/AN</description>
        </statusDetails>
        <otherStatusDetails>
          <description>val10</description>
        </otherStatusDetails>
      </attributeData>
    </PAY_ManageDBIDataReply>
  </xsl:template>
</xsl:stylesheet>