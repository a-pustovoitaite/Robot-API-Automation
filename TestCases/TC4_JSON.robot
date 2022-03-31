*** Settings ***
Documentation  This is JSON example
Library  JSONLibrary
Library  os
Library  Collections
Library  RequestsLibrary


*** Variables ***
${base_url}     http://api.open-notify.org/astros.json


*** Test Cases ***
Testcase1
    create session  mysession   ${base_url}
    ${response}=  GET On Session   mysession   ${base_url}

    ${json_response}=   Set Variable   ${response.json()}
    @{name}=  get value from json  ${json_response}    $.people[0].name
    ${name_from_list}=  Get From List    ${name}    0
    Should Be Equal  ${name_from_list}   Zhai Zhigang


