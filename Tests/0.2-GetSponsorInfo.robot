*** Settings ***
Documentation    Create application suite is designed for test and verify that application created successfully with its application reference
Resource    ../Resources/Objects/API_Preferences.robot
Resource    ../Resources/Keyword/Keywords-GetSponsorInfo.robot
Resource    ../Resources/Keyword/Common.robot
*** Variables ***
${URI}     /Applications
${identityNumber}     1061246813
${dateOfBirthMonth}     11
${dateOfBirthYear}     1409
${policyEffectiveDate}    30-08-2023
${isGrantTameeni}      True



*** Test Cases ***

Test Case - check response when send get sponsor info request using correct application reference

   Create application-Saudi keyword
   Create API session
   ${resp}   get request and check response       ${sessionName}     ${URI}/${ApplicationRef}/Sponsors     200
   set test variable   ${actualResult}
   Verify API Response with valid data-for saudi   ${actualResult}


Test Case - check response when send get sponsor info request using wrong application reference

   Create application-Saudi keyword
   Create API session
   ${resp}   get request and check response       ${sessionName}     ${URI}/9f23dfd2-d1c0-4183-85ae-53421791c69/Sponsors     404
   set test variable   ${actualResult}
   Verify API Response with invalid data    ${actualResult}

