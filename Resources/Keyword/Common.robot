*** Settings ***
Library     RequestsLibrary
Library     BuiltIn
Library     Collections
Library     String
Library     JSONLibrary
Library      DateTime
Resource    ../Resources/Objects/API_Preferences.robot
Resource    ../Resources/Keyword/Keywords_CreateApplication.robot
Resource    ../Resources/Keyword/Keywords_GettingWorkersInquiryFromYakeet.robot

*** Variables ***



${URI}     /Applications
${identityNumber}     1061246813
${dateOfBirthMonth}     11
${dateOfBirthYear}     1409
${policyEffectiveDate}    30-08-2023
${isGrantTameeni}      True

*** Keywords ***


Create application-Saudi keyword

     Create API session
     Create_Date_Today+2
     ${Payload}  evaluate    json.dumps({"identityNumber":"${identityNumber}","dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","isGrantTameeni":True, "recaptchaToken":"True"})
     Post Request and check response   ${sessionName}    ${URI}      ${Payload}      201
     Set Test Variable    ${ApplicationRef}      ${actualResult['applicationReference']}


Create application to get worker info from Yakeen

     Create API session
     Create_Date_Today+2
     ${Payload}  evaluate    json.dumps({"identityNumber":"${identityNumber}","dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","isGrantTameeni":True, "recaptchaToken":"True"})
     Post Request and check response   ${sessionName}    ${URI}      ${Payload}      201
     Set Test Variable    ${ApplicationRef}      ${actualResult['applicationReference']}


Create application to save worker info

     Create API session
     Create_Date_Today+2
     ${Payload}  evaluate    json.dumps({"identityNumber":"${identityNumber}","dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","isGrantTameeni":True, "recaptchaToken":"True"})
     Post Request and check response   ${sessionName}    ${URI}      ${Payload}      201
     Set Test Variable    ${ApplicationRef}      ${actualResult['applicationReference']}

get Personal Inquiry Reference
   Create application to get worker info from Yakeen
   Create API session
   ${resp}   get request and check response       ${sessionName}     ${URI}/${ApplicationRef}/Workers/inquiry/2545247088     201
   Set Test Variable    ${personInquiryReference}      ${actualResult['personInquiryReference']}
   Set Test Variable    ${fullEnglishName}      ${actualResult['fullEnglishName']}
   Set Test Variable    ${fullArabicName}      ${actualResult['fullArabicName']}
   log  ${fullArabicName}


Create application to make PUT request for Sponsors

     Create API session
     Create_Date_Today+2
     ${Payload}  evaluate    json.dumps({"identityNumber":"${identityNumber}","dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","isGrantTameeni":True, "recaptchaToken":"True"})
     Post Request and check response   ${sessionName}    ${URI}      ${Payload}      201
     Set Test Variable    ${ApplicationRef}      ${actualResult['applicationReference']}