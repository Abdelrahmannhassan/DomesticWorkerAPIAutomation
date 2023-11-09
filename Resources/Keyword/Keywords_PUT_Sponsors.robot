*** Settings ***
Library     RequestsLibrary
Library     BuiltIn
Library     Collections
Library     String
Library    JSONLibrary
Library          DateTime
Resource    ../Database/Assertions.robot
Resource    ../Keyword/Common.robot
Resource    ../Objects/API_Preferences.robot
*** Variables ***




*** Keywords ***
Verify API Response with when send PUT Request for sponsor with invalid Identity number
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  DOM001
    should be equal as strings        ${actualResult['errors']}  ['Sponsor ID and Date of Birth are wrong or not related please enter correct Data']


Verify API Response with when send PUT Request for sponsor with invalid application reference
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  DOMApp001
    should be equal as strings        ${actualResult['errors']}  ['Application not found']

Verify API Response with when send PUT Request for sponsor with invalid data
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  ValidationErrorCode

 Verify API Response with when send PUT Request for sponsor with identity number with special characters
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  ValidationErrorCode
    should be equal as strings        ${actualResult['errors']}  ['Identity Number Must Be Number']


 verify API Response when send PUT Request for sponsor with DateOfBirthMonths invalid
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  DOM001
    should be equal as strings        ${actualResult['errors']}  ['Sponsor ID and Date of Birth are wrong or not related please enter correct Data']


 verify API Response when send PUT Request for sponsor with DateOfBirthYear invalid
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  ValidationErrorCode
    should be equal as strings        ${actualResult['errors']}  ['Date  Of Birth Year  Must be in  Range 18 to 99']


 verify API Response when send PUT Request for sponsor with policy effective date invalid
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  ValidationErrorCode
    should be equal as strings        ${actualResult['errors']}  ['Policy Effective Date must Start From Tomorrow']

 verify API Response when send PUT Request for sponsor with policy effective date with special character
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  ValidationErrorCode
    should be equal as strings        ${actualResult['errors']}  ['Invalid Policy Effective Date Format', 'Policy Effective Date must Start From Tomorrow']

 verify API Response when send PUT Request for sponsor with policy effective date is empty
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  ValidationErrorCode
    should be equal as strings        ${actualResult['errors']}  ['The PolicyEffectiveDate field is required.','Invalid Policy Effective Date Format', 'Policy Effective Date must Start From Tomorrow']

 verify API Response when send PUT Request for sponsor with mobile number more than 10 digits
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  ValidationErrorCode
    should be equal as strings        ${actualResult['errors']}  ['Maximum Length Mobile Number is 10 Number']


 verify API Response when send PUT Request for sponsor with mobile number with special character
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  ValidationErrorCode
    should be equal as strings        ${actualResult['errors']}  ['Mobile Number Must Be Number']


 verify API Response when send PUT Request for sponsor with mobile number is empty
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}  ValidationErrorCode
    should be equal as strings        ${actualResult['errors']}  ['Mobile Number field is mandatory']