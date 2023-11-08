*** Settings ***
Documentation    Create application suite is designed for test and verify that application created successfully with its application reference
Resource    ../Resources/Objects/API_Preferences.robot
Resource    ../Resources/Keyword/Keywords-GetSponsorInfo.robot
Resource    ../Resources/Keyword/Common.robot
Resource    ../Resources/Keyword/Keywords_PUT_Sponsors.robot

*** Variables ***
${URI}     /Applications
${identityNumber}     1061246813
${dateOfBirthMonth}    11
${dateOfBirthYear}      1409
${policyEffectiveDate}      30-11-2023
${mobileNumber}     0552141235

*** Test Cases ***

Test case - verify when send a PUT request for sponsors with valid data
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}","dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response no body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       204

Test case - verify when send a PUT request for sponsors with invalid Identity Number
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"1061246818","dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       400
   set test variable     ${actualResult}
   Verify API Response with when send PUT Request for sponsor with invalid Identity number    ${actualResult}


Test case - verify that when send a PUT request for sponsors with invalid reference number
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}","dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/1b329b7f-2b91-4ab8-9ffb-e3cc356402c/Sponsors    ${Payload}       404
   set test variable     ${actualResult}
   Verify API Response with when send PUT Request for sponsor with invalid application reference     ${actualResult}


Test case - verify that when send a PUT request for sponsors with identity number not mach the minimum lengh
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"106124681","dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
   Verify API Response with when send PUT Request for sponsor with invalid data    ${actualResult}

Test case - verify that when send a PUT request for sponsors with identity number with special characters
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"106124681@","dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
    Verify API Response with when send PUT Request for sponsor with identity number with special characters     ${actualResult}

Test case - verify that when send a PUT request for sponsors with identity number with identity number empty
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":None ,"dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
     verify API Response when send PUT Request for sponsor with DateOfBirthMonths invalid     ${actualResult}

Test case - verify that when send a PUT request for sponsors with DateOfBirthMonths invalid
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}" ,"dateOfBirthMonth": 1,"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       400
   set test variable     ${actualResult}
   verify API Response when send PUT Request for sponsor with DateOfBirthMonths invalid     ${actualResult}

Test case - verify that when send a PUT request for sponsors with DateOfBirthMonths is empty
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}" ,"dateOfBirthMonth": None,"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
    Verify API Response with when send PUT Request for sponsor with invalid data      ${actualResult}


Test case - verify that when send a PUT request for sponsors with DateOfBirthMonths with special characters
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}" ,"dateOfBirthMonth": "1@" ,"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
   Verify API Response with when send PUT Request for sponsor with invalid data     ${actualResult}


Test case - verify that when send a PUT request for sponsors with DateOfBirthYear invalid
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}" ,"dateOfBirthMonth": ${dateOfBirthMonth} ,"dateOfBirthYear":140,"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
   Verify API Response with when send PUT Request for sponsor with invalid data     ${actualResult}


Test case - verify that when send a PUT request for sponsors with DateOfBirthYear with special characters
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}" ,"dateOfBirthMonth": ${dateOfBirthMonth} ,"dateOfBirthYear": "140@" ,"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
   Verify API Response with when send PUT Request for sponsor with invalid data     ${actualResult}


Test case - verify that when send a PUT request for sponsors with DateOfBirthYear is empty
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}" ,"dateOfBirthMonth": ${dateOfBirthMonth} ,"dateOfBirthYear": None ,"policyEffectiveDate":"${TodayDate+2}","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
   Verify API Response with when send PUT Request for sponsor with invalid data     ${actualResult}


Test case - verify that when send a PUT request for sponsors with policy effective date invalid
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}" ,"dateOfBirthMonth": ${dateOfBirthMonth} ,"dateOfBirthYear": ${dateOfBirthYear} ,"policyEffectiveDate":"30-10-2023","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
   verify API Response when send PUT Request for sponsor with policy effective date invalid     ${actualResult}


Test case - verify that when send a PUT request for sponsors with policy effective date with special character
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}" ,"dateOfBirthMonth": ${dateOfBirthMonth} ,"dateOfBirthYear": ${dateOfBirthYear} ,"policyEffectiveDate":"30-10-2023@","mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
   verify API Response when send PUT Request for sponsor with policy effective date with special character     ${actualResult}


Test case - verify that when send a PUT request for sponsors with policy effective date is empty
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}" ,"dateOfBirthMonth": ${dateOfBirthMonth} ,"dateOfBirthYear": ${dateOfBirthYear} ,"policyEffectiveDate": None,"mobileNumber":"${mobileNumber}"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
   verify API Response when send PUT Request for sponsor with policy effective date is empty     ${actualResult}


Test case - verify that when send a PUT request for sponsors with mobile number more than 10 digits
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}" ,"dateOfBirthMonth": ${dateOfBirthMonth} ,"dateOfBirthYear": ${dateOfBirthYear} ,"policyEffectiveDate": "${TodayDate+2}","mobileNumber":"05563632152"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
   verify API Response when send PUT Request for sponsor with mobile number more than 10 digits     ${actualResult}


Test case - verify that when send a PUT request for sponsors with mobile number with special character
   Create application to make PUT request for Sponsors
   Create API session
   ${Payload}  evaluate    json.dumps({"IdentityNumber":"${identityNumber}" ,"dateOfBirthMonth": ${dateOfBirthMonth} ,"dateOfBirthYear": ${dateOfBirthYear} ,"policyEffectiveDate": "${TodayDate+2}","mobileNumber":"055212363@"})
   Put request and check response with body appears     ${sessionName}   ${URI}/${ApplicationRef}/Sponsors    ${Payload}       422
   set test variable     ${actualResult}
   verify API Response when send PUT Request for sponsor with mobile number with special character     ${actualResult}