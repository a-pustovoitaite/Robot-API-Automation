*** Settings ***
Documentation   smth
Library  Collections
Library     RequestsLibrary


*** Variables ***
${Base_url}  https://www.barkyn.com/checkout/login


*** Test Cases ***
Put customer registration
    Create Session   mysession  ${Base_url}
    ${body}=    Create Dictionary   useremail=barkyn@gmail.com   password=123456
    ${header}=  Create Dictionary   Connection=keep-alive
    ${response}=  Post On Session    mysession   ${Base_url}  data=${body}    headers=${header}
    log to console  ${response.status_code}
    log to console  ${response.content}
#validation
    ${res_body}=    Convert To String   ${response.content}
    Should Contain    ${res_body}    com o sabor