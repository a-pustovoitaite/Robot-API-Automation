*** Settings ***
Library  JSONLibrary
Library  os
Library  Collections


*** Test Cases ***
Testcase1
    ${json_obj}=  Load JSON From File  C:/Users/a-pustovoitaite/robot-scripts/API/TestCases/jsondata.json
    ${name_value}=  Get Value From Json  ${json_obj}  $.firstName
    Log To Console    ${name_value[0]}
    Should Be Equal    ${name_value[0]}    John