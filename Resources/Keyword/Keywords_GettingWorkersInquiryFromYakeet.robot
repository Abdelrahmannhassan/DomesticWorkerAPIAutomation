*** Settings ***
Library     RequestsLibrary
Library     BuiltIn
Library     Collections
Library     String
Library    JSONLibrary
Library     DateTime
Resource    ../Database/Assertions.robot

*** Variables ***




*** Keywords ***
Verify API Response with valid Worker identity number and Application reference

    [Documentation]    veriy actual results when send Worker identity number and Application reference
    [Arguments]           ${actualResult}
    Should not be Equal As Strings   ${actualResult['fullEnglishName']}    None
    Should not Be Equal As Strings    ${actualResult['fullArabicName']}    None
    Should not Be Equal As Strings    ${actualResult['nationalityCode']}    None
    Should not Be Equal As Strings    ${actualResult['gender']}    None
    Should not Be Equal As Strings    ${actualResult['personInquiryReference']}    None

Verify API Response with invalid worker identity number and valid application reference
    [Documentation]    veriy actual results when send invalid invalid worker identity number and valid application reference
    [Arguments]           ${actualResult}
    Should be Equal As Strings    ${actualResult['errorCode']}    DOM002
    should be equal as strings    ${actualResult['errors']}    ['Sponsor ID and Member are not related please make sure to enter the correct member ID']



Verify API Response with valid worker identity number and invalid application reference
    [Documentation]    veriy actual results when send invalid valid worker identity number and invalid application reference
    [Arguments]           ${actualResult}
    Should be Equal As Strings    ${actualResult['errorCode']}    DOMApp001
    should be equal as strings    ${actualResult['errors']}    ['Application not found']