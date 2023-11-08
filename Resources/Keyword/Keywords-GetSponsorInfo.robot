*** Settings ***
Library     RequestsLibrary
Library     BuiltIn
Library     Collections
Library     String
Library    JSONLibrary
Library          DateTime
Resource    ../Database/Assertions.robot
Library
*** Variables ***




*** Keywords ***

Verify API Response with valid data-for saudi
    [Documentation]    veriy actual results when send valid data
    [Arguments]           ${actualResult}
   # Should not be Equal As Strings   ${actualResult['nationality']}    None
    Should not Be Equal As Strings    ${actualResult['fullEnglishName']}    None
    Should not Be Equal As Strings    ${actualResult['fullArabicName']}    None
    Should not Be Equal As Strings    ${actualResult['policyEffectiveDate']}    None
    Should not Be Equal As Strings    ${actualResult['dateOfBirthH']}    None
    Should Be Equal As Strings        ${actualResult['dateOfBirthG']}    None

#    should be equal as strings      ${actualResult['errors']}     ['The input entered aren’t matching with the data at the National Information Center, kindly check the input and try again']

Verify API Response with invalid data
    [Documentation]    veriy actual results when send invalid data
    [Arguments]           ${actualResult}
    Should be Equal As Strings    ${actualResult['errorCode']}    DOMApp001
