*** Settings ***
Library     Collections
Library     String
Library     JSONLibrary
Library     RequestsLibrary


*** Variables ***
${Base_url}  https://reqres.in
${Page_path}    $.per_page


*** Test Cases ***
Test API
    Create Session    my_session    ${Base_url}
    ${response}=    GET On Session  my_session      url=/api/users?page=2
    Log   ${response.headers}
    Log   ${response.status_code}
    Log   ${response.content}
    Log   ${response.content}

    #VALIDATIONS
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200

    ${json_response}=   Convert String to JSON    ${response.content}
    Log    ${json_response}
    ${contents}=    Get Value From Json    ${json_response}    ${Page_path}
    ${contents}=    Convert To String    ${contents}
    ${contents}=   Remove String Using Regexp     ${contents}  ['\\[\\],]
    Should Be Equal    ${contents}   6


*** Keywords ***