*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url}=  http://www.thetestingworldapi.com
*** Test Cases ***
TC_06
    Create Session    my_session    ${base_url}
    ${body}=    Create Dictionary   first_name=Agne  middle_name=Vitalevna  last_name=Pustaite  date_of_birth=05/06/1990
   # ${header}=  Create Dictionary   Content-Type="application/json"
    Log    ${body}
    ${response}=  POST On Session   my_session    /api/studentsDetails   data=${body}    #headers=${header}
    Log    ${response.headers}
    Log    ${response.status_code}
    Log to console   ${response.content}
    Log  ${response.content}
    #VALIDATIONS
    ${status_code}=  Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    201