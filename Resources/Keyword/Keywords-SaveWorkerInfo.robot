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

Verify API Response with valid data-for saudi to save worker info
    [Documentation]    veriy actual results when send valid data
    [Arguments]           ${actualResult}
    Should not be Equal As Strings    ${actualResult}    ""


Verify API Response when send Post request with invalid data
    [Documentation]    veriy actual results when send valid data
    [Arguments]           ${actualResult}
     should be equal as strings        ${actualResult['errorCode']}   ValidationErrorCode


Verify API Response when send Post request with fullArabicName is empty
         [Documentation]    veriy actual results when send invalid data
         [Arguments]           ${actualResult}
         should be equal as strings        ${actualResult['errorCode']}   ValidationErrorCode
         should be equal as strings      ${actualResult['errors']}     ['The FullArabicName field is required.', 'Please enter the domestic worker Arabic name consisting of 150 characters Maximum']



Verify API Response when send Post request with fullEnglishName is empty
         [Documentation]    veriy actual results when send invalid data
         [Arguments]           ${actualResult}
         should be equal as strings        ${actualResult['errorCode']}   ValidationErrorCode
         should be equal as strings      ${actualResult['errors']}     ['The FullEnglishName field is required.', 'Please enter the domestic worker English name consisting of 150 characters Maximum']


Verify API Response when send Post request with Is insurance class is empty
         [Documentation]    veriy actual results when send invalid data
         [Arguments]           ${actualResult}
         should be equal as strings        ${actualResult['errorCode']}   ValidationErrorCode
         should be equal as strings      ${actualResult['errors']}     ['InsuranceClass field is requried']

Verify API Response when send Post request with Is IsMarried is empty
         [Documentation]    veriy actual results when send invalid data
         [Arguments]           ${actualResult}
         should be equal as strings        ${actualResult['errorCode']}   ValidationErrorCode
         should be equal as strings      ${actualResult['errors']}     ['IsMarried field is requried']

 Verify API Response when send post request with Answer for Question code is empty
         [Documentation]    veriy actual results when send invalid data
         [Arguments]           ${actualResult}
         should be equal as strings        ${actualResult['errorCode']}   ValidationErrorCode
         should be equal as strings      ${actualResult['errors']}     ['Weight should be between 40 kg and 500 kg', 'The Answer field is required.', 'Answer Should Have Value For QuestionCode ']
