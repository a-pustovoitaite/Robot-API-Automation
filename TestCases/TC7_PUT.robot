*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections

*** Variables ***
${base_url}=  http://www.thetestingworldapi.com/
*** Test Cases ***
TC_07
    Create Session    my_session    ${base_url}
    ${body}=    Create Dictionary   id=1118125  first_name=Someone  middle_name=Middle  last_name=Last  date_of_birth=05/06/1990
    #${header}=  Create Dictionary   Content-Type=application/json
    ${response}=  PUT On Session  my_session    api/studentsDetails/1118125    data=${body}    #headers=${header}
    Log    ${response.status_code}
    Log to console  ${response.content}
    ${get_response}=  GET On Session  my_session  api/studentsDetails
    Log To Console    ${get_response.content}

