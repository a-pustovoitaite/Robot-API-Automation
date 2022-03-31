*** Settings ***
Documentation   jjjj
Library     Collections
Library     RequestsLibrary
Library     SeleniumLibrary



*** Variables ***
${Base_url}  https://reqres.in


*** Test Cases ***
Get Weather Info
    Create Session   mysession   ${Base_url}
    ${response}=  GET On Session   mysession    /api/users
    #log to console  ${response.status_code}
    #log to console  ${response.content}
    #log to console  ${response.headers}

    #validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200
    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}        "email":"janet.weaver@reqres.in"
    ${contentTypeValue}=    Get From Dictionary     ${response.headers}     Content-Type
    ${contentTypeValue_string}=  Convert To String    ${contentTypeValue}
    Log    ${contentTypeValue_string}
    Should Be Equal    ${contentTypeValue_string}    application/json; charset=utf-8
    