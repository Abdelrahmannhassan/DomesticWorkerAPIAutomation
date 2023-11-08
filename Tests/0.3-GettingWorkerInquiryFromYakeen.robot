*** Settings ***
Documentation    Create application suite is designed for test and verify that application created successfully with its application reference
Resource    ../Resources/Objects/API_Preferences.robot
Resource    ../Resources/Keyword/Keywords-GetSponsorInfo.robot
Resource    ../Resources/Keyword/Common.robot
Resource    ../Resources/Keyword/Keywords_GettingWorkersInquiryFromYakeet.robot

*** Variables ***
${URI}     /Applications
${identityNumber}     1061246813
${dateOfBirthMonth}     11
${dateOfBirthYear}     1409
${policyEffectiveDate}    30-08-2023
${isGrantTameeni}      True



*** Test Cases ***


Test Case 126407 API-DW-GetWrokerInfo reqeust from yakeet - check the respone when send request using valid [WorkerIdentity number&Application Reference]

   Create application to get worker info from Yakeen
   Create API session
   ${resp}   get request and check response       ${sessionName}     ${URI}/${ApplicationRef}/Workers/inquiry/2545247088     201
   set test variable   ${actualResult}
   Verify API Response with valid Worker identity number and Application reference     ${actualResult}


Test Case 126408 API-DW-GetWorkerInfo-check response when send request using invalid [Worker Identity number] and valid [application reference]

   Create application to get worker info from Yakeen
   Create API session
   ${resp}   get request and check response       ${sessionName}     ${URI}/${ApplicationRef}/Workers/inquiry/2545247081     400
   set test variable   ${actualResult}
   Verify API Response with invalid worker identity number and valid application reference   ${actualResult}


Test Case 126409 API-DW-GetWorkerInfo-check response when send request using valid [Worker Identity number] and invalid [application reference]

   Create application to get worker info from Yakeen
   Create API session
   ${resp}   get request and check response       ${sessionName}     ${URI}/579b2e99-7077-4aef-8861-6d03d3c586a/Workers/inquiry/2545247088     404
   set test variable   ${actualResult}
   Verify API Response with valid worker identity number and invalid application reference  ${actualResult}

