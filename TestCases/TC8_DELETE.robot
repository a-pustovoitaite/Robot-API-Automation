*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url}=  http://www.thetestingworldapi.com/
*** Test Cases ***
TC_08 DELETE API
    Create Session    my_session    ${base_url}
    ${response}=  DELETE On Session  my_session    api/studentsDetails/1118125

    Log   ${response.content}
    ${json_response}=  Set Variable   ${response.json()}
    Log  ${json_response}
    @{status_list}=  Get Value From Json    ${json_response}    status
    Log   @{status_list}
    ${status}=  Get From List    ${status_list}    0
    Should Be Equal    ${status}   true



