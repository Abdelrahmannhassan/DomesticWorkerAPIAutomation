*** Settings ***
Documentation    Create application suite is designed for test and verify that application created successfully with its application reference
Resource    ../Resources/Objects/API_Preferences.robot
Resource    ../Resources/Keyword/Keywords-GetSponsorInfo.robot
Resource    ../Resources/Keyword/Common.robot
Resource    ../Resources/Keyword/Keywords_GettingWorkersInquiryFromYakeet.robot
Resource    ../Resources/Keyword/Keywords-SaveWorkerInfo.robot

*** Variables ***
${URI}     /Applications
${gender}     2
${nationalityCode}    315
${isMarried}      True
${hasHealthDeclaration}      True
${questionCode1}     1
${answerweight}       80
${questionCode2}     2
${answerhigh}     180
${insuranceclass}       1

*** Test Cases ***

Test Case 132831 API - DW - Save worker info - Check when send post request with valid data

   Create application to save worker info
   Get Personal Inquiry Reference
   Create API session
   ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender":${gender},"nationalityCode":${nationalityCode},"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration":${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer":"${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference":"${personInquiryReference}"})
   Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        201
   set test variable   ${actualResult}
   Verify API Response with valid data-for saudi to save worker info    ${actualResult}


Test Case 132832 API - DW - Save worker info - Check when send post request with Gender value empty in the body
     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": None,"nationalityCode":${nationalityCode},"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration":${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer":"${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference":"${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}

Test Case 132833 API - DW - Save worker info - Check when send post request with FullArabicName is empty in the body
     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName": None ,"gender": ${gender},"nationalityCode":${nationalityCode},"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration":${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer":"${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference":"${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with fullArabicName is empty   ${actualResult}

Test Case 132834 API - DW - Save worker info - Check when send post request with FullEnglishName is empty in the body
     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName": None ,"fullArabicName": "${fullArabicName}" ,"gender": ${gender},"nationalityCode":${nationalityCode},"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration":${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer":"${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference":"${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with fullEnglishName is empty  ${actualResult}

Test Case 132856 API-DW-Save worker info - Check when send post request with nationality code is empty
     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName": "${fullEnglishName}" ,"fullArabicName": "${fullArabicName}" ,"gender": ${gender},"nationalityCode": None,"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration":${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer":"${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference":"${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data  ${actualResult}

Test Case 132857 API-DW-Save worker info - Check when send post request with insuranceClass is empty
     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName": "${fullEnglishName}" ,"fullArabicName": "${fullArabicName}" ,"gender": ${gender},"nationalityCode": ${nationalityCode},"insuranceClass": None,"isMarried":${isMarried},"hasHealthDeclaration":${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer":"${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference":"${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with Is insurance class is empty  ${actualResult}

Test Case 132858 API-DW-Save worker info - Check when send post request with isMarried field is empty
     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName": "${fullEnglishName}" ,"fullArabicName": "${fullArabicName}" ,"gender": ${gender},"nationalityCode": ${nationalityCode},"insuranceClass": ${insuranceclass},"isMarried": None,"hasHealthDeclaration":${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer":"${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference":"${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with Is IsMarried is empty  ${actualResult}

Test Case 132859 API-DW-Save worker info - Check when send post request with hasHealthDeclaration field is empty

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender},"nationalityCode":${nationalityCode},"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration": None,"declarationAnswers":[{"questionCode":${questionCode1},"answer":"${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference":"${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}

Test Case 132860 API-DW-Save worker info - Check when send post request with questionCode field is empty

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender},"nationalityCode":${nationalityCode},"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration},"declarationAnswers":[{"questionCode":None,"answer":"${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference":"${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}

Test Case 132861 API-DW-Save worker info - Check when send post request with Answer for question code field is empty
     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender},"nationalityCode":${nationalityCode},"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer": None},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference":"${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
      Verify API Response when send post request with Answer for Question code is empty    ${actualResult}

Test Case 132862 API-DW-Save worker info - Check when send post request with personal inquire reference is empty
     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender},"nationalityCode":${nationalityCode},"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer": "${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference": None})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}

Test Case 133309 API-DW-Saveworkerinfo - Check response when send post request and send english name in Full Arabic Name

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"Ahmed","gender": ${gender},"nationalityCode":${nationalityCode},"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer": "${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference": "${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}

Test Case 133310 API-DW-Saveworkerinfo - Check response when send post request and send Arabic name in Full English Name

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"احمد","fullArabicName":"${fullArabicName}","gender": ${gender},"nationalityCode":${nationalityCode},"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer": "${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference": "${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}

Test Case 133311 API-DW-Save wroker info - check response when enter Gender as Special character

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": "#$#@","nationalityCode":${nationalityCode},"insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer": "${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference": "${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}

Test Case 133312 API-DW-Save worker info - Check response when send nationalityCode with Special characters

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender} ,"nationalityCode": "@#$@","insuranceClass":${insuranceclass},"isMarried":${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer": "${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference": "${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}

Test Case 133313 API-DW-Save worker info - Check response when send insuranceClass with Special characters

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender} ,"nationalityCode": ${nationalityCode} ,"insuranceClass": "#$%#" ,"isMarried":${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer": "${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference": "${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}


Test Case 133314 API-DW-Save worker info - Check response when send Is Married with anything execpt True or false because it boolean

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender} ,"nationalityCode": ${nationalityCode} ,"insuranceClass": ${insuranceclass} ,"isMarried":"yes","hasHealthDeclaration": ${hasHealthDeclaration},"declarationAnswers":[{"questionCode":${questionCode1},"answer": "${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference": "${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}

Test Case 133315 API-DW-Save worker info - Check response when send hasHealthDeclaration with anything execpt True or false because it boolean

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender} ,"nationalityCode": ${nationalityCode} ,"insuranceClass": ${insuranceclass} ,"isMarried": ${isMarried},"hasHealthDeclaration": "yes" ,"declarationAnswers":[{"questionCode":${questionCode1},"answer": "${answerweight}"},{"questionCode":${questionCode2},"answer":"${answerhigh}"}],"personInquiryReference": "${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}


Test Case 133316 API-DW-Save worker info - Check response when send questionCode with Special characters

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender} ,"nationalityCode": ${nationalityCode} ,"insuranceClass": ${insuranceclass} ,"isMarried": ${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration} ,"declarationAnswers":[{"questionCode":"@#$","answer": "${answerweight}"}],"personInquiryReference": "${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}


Test Case 133317 API-DW-Save worker info - Check response when send questionCode with any string

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender} ,"nationalityCode": ${nationalityCode} ,"insuranceClass": ${insuranceclass} ,"isMarried": ${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration} ,"declarationAnswers":[{"questionCode": "Ahmed", "answer": "${answerweight}"}],"personInquiryReference": "${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}

Test Case 133318 API-DW-Save worker info - Check response when send answer with any string

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender} ,"nationalityCode": ${nationalityCode} ,"insuranceClass": ${insuranceclass} ,"isMarried": ${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration} ,"declarationAnswers":[{"questionCode":${questionCode1},"answer": "#$%"}],"personInquiryReference": "${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}

Test Case 133319 API-DW-Save worker info - Check response when send answer with any integar

     Create application to save worker info
     Get Personal Inquiry Reference
     Create API session
     ${Payload}  evaluate    json.dumps({"fullEnglishName":"${fullEnglishName}","fullArabicName":"${fullArabicName}","gender": ${gender} ,"nationalityCode": ${nationalityCode} ,"insuranceClass": ${insuranceclass} ,"isMarried": ${isMarried},"hasHealthDeclaration": ${hasHealthDeclaration} ,"declarationAnswers":[{"questionCode":${questionCode1},"answer": 12345}],"personInquiryReference": "${personInquiryReference}"})
     Post Request and check response    ${sessionName}    ${URI}/${ApplicationRef}/Workers    ${Payload}        422
     set test variable   ${actualResult}
     Verify API Response when send Post request with invalid data    ${actualResult}