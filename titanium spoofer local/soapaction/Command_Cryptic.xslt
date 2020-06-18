<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xalan="http://xml.apache.org/xalan" xmlns:hsfr="http://xml.amadeus.com/HSFREQ_06_2_1A" exclude-result-prefixes="xalan" version="1.0">
  <xsl:template name="Command_Cryptic_Default">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
    ***  HERTZ  ***
    SECURITY FILE NOT FOUND</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Successed">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
OK E-VOUCHER</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_FRA_Standalone_RoundTrip_OffAirport_NCLLocation_BillingCodeWithLoyaltyNumber_TUID_319087">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/    ***  HERTZ  ***    SECURITY FILE NOT FOUND</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_FRA_Standalone_OneWay_OffAirport_NCELYS_BillingCode_TUID_283425">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/**** EUROPCAR ****
NO AUTHORITY TO ISSUE VOUCHERS</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_FRA_Standalone_RoundTrip_OnAirport_CDG_BillingCodeWithEDIData_TUID_283422">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/OK E-VOUCHER</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_FRA_Standalone_OneWay_OnAirport_BillingCodeWithCDCode_TUID_308094">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/    ***  HERTZ  ***    SECURITY FILE NOT FOUND</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_SCS_Off_Oneway_InvalidBillingNumber_LEHC02_TFS_287905_InvalidBillingNumber_TUID_287905">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
**** EUROPCAR ****

NO AUTHORITY TO ISSUE VOUCHERS</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_281432">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/**AVIS**WE ARE PRESENTLY UNABLE TO AUTHORIZE YOUR REQUEST.PLEASE CONTACT YOUR AVIS HELP DESK FOR ASSISTANCE.THANK YOU.</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCode_ZI_871131370003_281430">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/OK E-VOUCHER</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_RateOnRequest_281439">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/OK E-VOUCHER</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZE_871131370003_281428">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/NO CONFIRMATION NUMBER FOUND</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZE871131370003_MultiCD_40-704005_40-676186_281435">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/NO CONFIRMATION NUMBER FOUND</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_GBR_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_281436">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/OK E-VOUCHER</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_EVoucher_DeliveryAndCollection_PlaceID_ASCS_on_oneway_Egencia_FRA_208994">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/OK E-VOUCHER</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_ITA_Standalone_OneWay_OffAirport_BillingCode_ZI_871131370003_TUID_267110">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
**AVIS**
WE ARE PRESENTLY UNABLE TO AUTHORIZE YOUR REQUEST.
PLEASE CONTACT YOUR AVIS HELP DESK FOR ASSISTANCE.
THANK YOU.</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_BillingCode_ZI871131370003_SpecialEquip_CBS_208945">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
OK E-VOUCHER</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataCDCode_TUID_319085">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
**** EUROPCAR ****

NO AUTHORITY TO ISSUE VOUCHERS</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataSpecialEquip_TUID_319086">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
OK E-VOUCHER</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OffAirport_BillingCodeEDIDataLoyaltyCode_TUID_319087">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
    ***  HERTZ  ***
    SECURITY FILE NOT FOUND</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Egencia_CarBSOMS_HomeAddress_Hertz_FR_oneway_GuaranteeEnable_ON_443508">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
    ***  HERTZ  ***
    SECURITY FILE NOT FOUND</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Egencia_CarBSOMS_PlaceID_Hertz_FR_Round_GuaranteeEnable_ON_443521">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
    ***  HERTZ  ***
    SECURITY FILE NOT FOUND</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_HomeDelCol_BillingCodeEDIDataHomeDelCol_TUID_319094">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
**** EUROPCAR ****

INVALID LENGTH - /BN</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_PlaceIDDelCol_BillingCodeEDIDataPlaceIDDelCol_TUID_319095">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
OK E-VOUCHER</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_FRA_Standalone_OneWay_OffAirport_InvalidBilingCode_TUID_321848">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
    ***  HERTZ  ***
    ACCOUNT NUMBER - BN FIELD NOT RECOGNIZED</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
  <xsl:template name="Command_Cryptic_Amadeus_FRA_Standalone_RoundTrip_OnAirport_InvalidBilingCode_TUID_321847">
    <Command_CrypticReply xmlns="http://xml.amadeus.com/HSFRES_06_2_1A">
      <longTextString>
        <textStringDetails>/
NO CONFIRMATION NUMBER FOUND</textStringDetails>
      </longTextString>
    </Command_CrypticReply>
  </xsl:template>
</xsl:stylesheet>