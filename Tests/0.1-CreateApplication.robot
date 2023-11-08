*** Settings ***
Documentation    Create application suite is designed for test and verify that application created successfully with its application reference
Resource    ../Resources/Objects/API_Preferences.robot
Resource    ../Resources/Keyword/Keywords_CreateApplication.robot

*** Variables ***
${URI}     /Applications
${identityNumber}     1061246813
${dateOfBirthMonth}     11
${dateOfBirthYear}     1409
${policyEffectiveDate}    30-10-2023
${isGrantTameeni}      True
${recaptchaToken}      True




*** Test Cases ***
Test Case 119677 API-DW-Create application-check response when send valid create application request for saudi

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber":"${identityNumber}","dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","isGrantTameeni":True ,"recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      201

#    Verify API Response when send valid data - Create application- visitor    ${actualResult}      ${borderNumber}     ${sponserNumber}


Test case 120571 API-DW-Create application-check response when send create application request with Identity number with Special characters

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber":"@061246813","dateOfBirthMonth":${dateOfBirthMonth},"dateOfBirthYear":${dateOfBirthYear},"policyEffectiveDate":"${TodayDate+2}","isGrantTameeni":True,"recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}



Test Case 120433 API-DW-Create application-check response when send create application request with Identity number = null

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber": None, "dateOfBirthMonth":${dateOfBirthMonth}, "dateOfBirthYear":${dateOfBirthYear}, "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni":True,"recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send Identity number = null    ${actualResult}



Test Case 124455 API-DW-Create application-check response when send create application request with wrong/ not exsit Identity number

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber":"3061246813", "dateOfBirthMonth":${dateOfBirthMonth}, "dateOfBirthYear":${dateOfBirthYear}, "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni":True,"recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}



Test Case 124993 API-DW-Create application-check response when send create application request with Policy Effective date start from today's date

    [Tags]    regression   smoke
    Create API session
    Invalid_today's_date
    ${Payload}  evaluate    json.dumps({"identityNumber":"1061246813", "dateOfBirthMonth":${dateOfBirthMonth}, "dateOfBirthYear":${dateOfBirthYear}, "policyEffectiveDate": "${TodayDate}", "isGrantTameeni":True,"recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send invalid Policy Effective date     ${actualResult}


Test Case 125125 API-DW-Create application-check response when send create application request with sponsor ID not related to the DOB

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber":"1061246813", "dateOfBirthMonth": 12, "dateOfBirthYear":${dateOfBirthYear}, "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni":True,"recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send Sponsor ID not related to DOB     ${actualResult}


Test Case 125130 API-DW-Create application-check response when send create application request with Date of birth in months empty

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber":"1061246813", "dateOfBirthMonth": " ", "dateOfBirthYear":${dateOfBirthYear}, "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni":True,"recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}



Test Case 125131 API-DW-Create application-check response when send create application request with Date of birth in years empty

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber":"1061246813", "dateOfBirthMonth": ${dateOfBirthMonth} , "dateOfBirthYear": " ", "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni":True, "recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}


Test Case 125138 API-DW-Create application-check response when send create application request with isGrantTameeni is empty

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber":"1061246813", "dateOfBirthMonth": ${dateOfBirthMonth} , "dateOfBirthYear": ${dateOfBirthYear}, "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni": " ", "recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}


Test Case 126103 API-DW-Create application-check response when send create application request with DOB years contains special characters/String

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber}, "dateOfBirthMonth": ${dateOfBirthMonth} , "dateOfBirthYear": "140@" , "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni": True, "recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}



Test Case 126104 API-DW-Create application-check response when send create application request with DOB years < configured length

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber}, "dateOfBirthMonth": ${dateOfBirthMonth} , "dateOfBirthYear": 123, "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni": True, "recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}


Test Case 126105 API-DW-Create application-check response when send create application request with DOB years > configured length

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber}, "dateOfBirthMonth": ${dateOfBirthMonth} , "dateOfBirthYear": 15000, "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni": True, "recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}



Test Case 126107 API-DW-Create application-check response when send create application request with DOB months contains special characters/String

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber}, "dateOfBirthMonth": "1@1" , "dateOfBirthYear": ${dateOfBirthYear} , "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni": True, "recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}


Test Case 126108 API-DW-Create application-check response when send create application request with DOB months< configured length

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber}, "dateOfBirthMonth": -1, "dateOfBirthYear": ${dateOfBirthYear}, "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni": True, "recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}


Test Case 126109 API-DW-Create application-check response when send create application request with DOB months > configured length

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber}, "dateOfBirthMonth": 111 , "dateOfBirthYear": ${dateOfBirthYear}, "policyEffectiveDate": "${TodayDate+2}", "isGrantTameeni": True, "recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}


Test Case 126169 API-DW-Create application-check response when send create application request with policy effective date contain special characters

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber}, "dateOfBirthMonth": ${dateOfBirthMonth} , "dateOfBirthYear": ${dateOfBirthYear} , "policyEffectiveDate": "2@7-09-2023", "isGrantTameeni": True, "recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}


Test Case 126170 API-DW-Create application-check response when send create application request with policy effective date with 0 values in day and month fields

    [Tags]    regression   smoke
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber}, "dateOfBirthMonth": ${dateOfBirthMonth} , "dateOfBirthYear": ${dateOfBirthYear} , "policyEffectiveDate": "0-0-2023", "isGrantTameeni": True, "recaptchaToken":"True"})
    Post Request and check response      ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}











































#Testcase 7117- API service - Create Application - Check response when send post request with "sponsorNumber" contains special characters for visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": "700283#633","dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2    ${actualResult}

#Testcase 8367- API service - Create Application - Check response when send create application request with identityNumber not equal 1 ,2 or 3 for logged in visitor
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 4095603656,"sponsorNumber": "${sponserNumber}","dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values3    ${actualResult}

#Testcase 7274- API service - Create Application - Check response when send post request with "identityNumber" contains letters for visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": "309560L656","sponsorNumber": ${sponserNumber},"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2     ${actualResult}


#Testcase 7278- API service - Create Application - Check response when send post request with "identityNumber" contains spaces for visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": "3095602 656","sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2      ${actualResult}
#
#Testcase 7280- API service - Create Application - Check response when send post request with "identityNumber" contains AR numbers for visitor
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response  ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#
#Testcase 7282- API service - Create Application - Check response when send post request with "sponsorNumber" less than 10 digits for visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": 566669,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid data not matched with NIC - create application     ${actualResult}
#
#Testcase 7283- API service - Create Application - Check response when send post request with "sponsorNumber" more than 10 digits for visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": 5558484895696555,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid data not matched with NIC - create application     ${actualResult}
#
#
#
#Testcase 7275- API service - Create Application - Check response when send post request with "identityNumber" less than 10 digits for visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 309563656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#Testcase 7276- API service - Create Application - Check response when send post request with "identityNumber" more than 10 digits for visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 309560399656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response   ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#Testcase 7279- API service - Create Application - Check response when send post request with null value "identityNumber" for Visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": None,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response     ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2      ${actualResult}
#
#
#
#Testcase 7281- API service - Create Application - Check response when send post request with "sponsorNumber" contains letters for visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#Testcase 7285- API service - Create Application - Check response when send post request with "sponsorNumber" contains spaces for visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#Testcase 7286- API service - Create Application - Check response when send post request with null value "sponsorNumber" for visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#Testcase 7287- API service - Create Application - Check response when send post request with "sponsorNumber" contains AR numbers for visitor
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#
#Testcase 7127- API service - Create Application - Check response when send create application request with null Authentication token for logged in visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": ${sponserNumber},"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response when token is invalid    ${sessionName}    ${URI}      ${Payload}      401
#   Verify API Response when send invalid Authentication token    ${actualResult}
#
#
#Testcase 7116- API service - Create Application - Check response when send post request with "identityNumber" contains special characters for visitor
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 30956_0656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#
#
#Testcase 7114- API service - Create Application - Check response when send valid create application request for logged in Saudi/iqama
#
#    [Tags]    regression   smoke
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": ${dateOfBirthMonthSaudi/iqama},"dateOfBirthYear": ${dateOfBirthYearSaudi/iqama},"token": "","captchaCode": ""})
#    Post Request and check response   ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      200
#    Verify API Response when send valid data - Create application- saudi/iqama    ${actualResult}    ${identityNumber}
#
#
#Testcase 7332- API service - Create Application - Check response when send create application request with null Authentication token for logged in Saudi/iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response when token is null    ${sessionName}    ${URI}      ${Payload}      401
#    Verify API Response when send invalid Authentication token     ${actualResult}
#
#
#
#Testcase 7126- API service - Create Application - Check response when send create application request with wrong Authentication token for logged in Saudi/iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response when token is invalid    ${sessionName}    ${URI}      ${Payload}      401
#    Verify API Response when send invalid Authentication token     ${actualResult}
#
#
#Testcase 7120- API service - Create Application - Check response when send post request with wrong "dateOfBirthMonth" for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 11,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid data not matched with NIC - create application      ${actualResult}
#
#
#Testcase 7124- API service - Create Application - Check response when send post request with null values
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": None,"sponsorNumber": None,"dateOfBirthMonth": None,"dateOfBirthYear": None,"token": None,"captchaCode": None})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2       ${actualResult}
#
#Testcase 7125- API service - Create Application - Check response when send post request with empty body
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({})
#    Post Request and check response    ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#
#Testcase 7294- API service - Create Application - Check response when send post request with null value "identityNumber" for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": None,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2      ${actualResult}
#
#Testcase 7309- API service - Create Application - Check response when send post request with null value for "dateOfBirthYear" for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": None,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values      ${actualResult}
#
#
#
#Testcase 7288- API service - Create Application - Check response when send post request with "identityNumber" contains special characters for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": "112160332&","sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response     ${Valid-token}    ${sessionName}     ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2    ${actualResult}
#
#
#Testcase 7289- API service - Create Application - Check response when send post request with "identityNumber" contains letters for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": "11216l3326","sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response     ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2     ${actualResult}
#
#
#Testcase 7290- API service - Create Application - Check response when send post request with "identityNumber" less than 10 digits for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 11216032,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid data not matched with NIC - create application    ${actualResult}
#
#
#Testcase 7291- API service - Create Application - Check response when send post request with "identityNumber" more than 10 digits for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber}895,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid data not matched with NIC - create application     ${actualResult}
#
#
#
#Testcase 7293- API service - Create Application - Check response when send post request with "identityNumber" contains spaces for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": "309560 3656","sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2      ${actualResult}
#
#
#
#
#Testcase 7295- API service - Create Application - Check response when send post request with "identityNumber" contains AR numbers for Saudi/iqama
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response  ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values3     ${actualResult}
#
#
#
#Testcase 7296- API service - Create Application - Check response when send post request with "dateOfBirthMonth" with value > 12 for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 13,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid data not matched with NIC - create application     ${actualResult}
#
#
#
#Testcase 7297- API service - Create Application - Check response when send post request with "dateOfBirthMonth" with value < 1 for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": -1,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response     ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid data not matched with NIC - create application    ${actualResult}
#
#
#Testcase 7298- API service - Create Application - Check response when send post request with "dateOfBirthMonth" in letters style for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": "dec","dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response       ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2     ${actualResult}
#
#Testcase 7299- API service - Create Application - Check response when send post request with "dateOfBirthMonth" contains AR number for Saudi/iqama
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 0,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response  ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values3     ${actualResult}
#
#Testcase 7300- API service - Create Application - Check response when send post request with "dateOfBirthMonth" contains Spaces for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": "1 2","dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2      ${actualResult}
#
#Testcase 7301- API service - Create Application - Check response when send post request with null value for "dateOfBirthMonth" for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": None,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values      ${actualResult}
#
#Testcase 7302- API service - Create Application - Check response when send post request with "dateOfBirthMonth" contains special characters for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": "1@","dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2     ${actualResult}
#
#Testcase 7303- API service - Create Application - Check response when send post request with wrong "dateOfBirthYear" for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1318,"token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid data not matched with NIC - create application     ${actualResult}
#
#
#
#Testcase 7307- API service - Create Application - Check response when send post request with "dateOfBirthYear" contains AR number for Saudi/iqama
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095604656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response  ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#
#Testcase 7308- API service - Create Application - Check response when send post request with "dateOfBirthYear" contains Spaces for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": "14 18","token": "","captchaCode": ""})
#    Post Request and check response    ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2     ${actualResult}
#
#
#
#Testcase 7310- API service - Create Application - Check response when send post request with "dateOfBirthYear" contains special characters for Saudi/iqama
#    [Tags]    regression
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": "14@18","token": "","captchaCode": ""})
#    Post Request and check response     ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
#    Verify API Response when send null/invalid values2      ${actualResult}
#
#
##Testcase 7110- API service - Create Application - Check response when send valid create application request for non logged in visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": ${sponserNumber},"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": "4321"})
##    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      200
##    Verify API Response when send valid data - Create application- visitor    ${actualResult}      ${borderNumber}     ${sponserNumber}
#
##Testcase 7311- API service - Create Application - Check response when send post request with wrong "token" for non logged Saudi/iqama
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}
#
##Testcase 7312- API service - Create Application - Check response when send post request with "token" contains AR number for non logged Saudi/iqama
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}
#
##Testcase 7313- API service - Create Application - Check response when send post request with "token" contains Spaces for non logged Saudi/iqama
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}
#
##Testcase 7314- API service - Create Application - Check response when send post request with null value for "token" for non logged Saudi/iqama
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}
#
##Testcase 7315- API service - Create Application - Check response when send post request with "captchaCode" contains special characters for visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}
##
##Testcase 7316- API service - Create Application - Check response when send post request with "captchaCode" contains letters for visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}
#
##Testcase 7318- API service - Create Application - Check response when send post request with "captchaCode" contains spaces for visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}
##
##Testcase 7319- API service - Create Application - Check response when send post request with null value "captchaCode" for visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}
##
###Testcase 7320- API service - Create Application - Check response when send post request with "captchaCode" contains AR numbers for visitor
###    Create API session
###    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
###    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
###    Verify API Response when send null/invalid values     ${actualResult}
#
##Testcase 7321- API service - Create Application - Check response when send post request with wrong "token" for non logged visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}
##
##Testcase 7322- API service - Create Application - Check response when send post request with "token" contains AR number for non logged visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}
##
##Testcase 7323- API service - Create Application - Check response when send post request with "token" contains Spaces for non logged visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}
##
##Testcase 7324- API service - Create Application - Check response when send post request with null value for "token" for non logged visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send invalid identityNumber     ${actualResult}
##
##Testcase 7325- API service - Create Application - Check response when send post request with wrong "captchaCode" for non logged in Saudi/iqama
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send invalid identityNumber     ${actualResult}
#
#
##Testcase 7326- API service - Create Application - Check response when send post request with "captchaCode" contains special characters for Saudi/iqama
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send invalid identityNumber     ${actualResult}
#
##Testcase 7327- API service - Create Application - Check response when send post request with "captchaCode" contains letters for Saudi/iqama
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": 3095605656,"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send invalid identityNumber     ${actualResult}
#
#
##Testcase 7329- API service - Create Application - Check response when send post request with "captchaCode" contains spaces for Saudi/iqama
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": 3095605656,"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send invalid identityNumber     ${actualResult}
#
#
##Testcase 7330- API service - Create Application - Check response when send post request with null value "captchaCode" for Saudi/iqama
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": 3095605656,"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send invalid identityNumber     ${actualResult}
#
#
##Testcase 7331- API service - Create Application - Check response when send post request with "captchaCode" contains AR numbers for saudi or iqama
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": 3095604656,"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send invalid identityNumber     ${actualResult}
#
#
##Testcase 7110- API service - Create Application - Check response when send valid create application request for non logged in visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": 3121603326,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      200
##    Verify API Response when send null/invalid values    ${actualResult}
#
##Testcase 7123- API service - Create Application - Check response when send post request with wrong "captchaCode" for non logged in visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send invalid identityNumber     ${actualResult}
#
#




