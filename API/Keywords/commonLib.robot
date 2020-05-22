*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource   ../Keywords/commonLib.robot

*** Variables ***
${base_URL}       http://dummy.restapiexample.com/
&{user_agent}    User-Agent=Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36

*** Keywords ***
Get request on dummy api
    &{headers}=        Create Dictionary        @{user_agent}  xxx
    create session     rest_api_get_request     ${base_url}    headers=${headers}    debug=1
    ${response}=       Get Request              rest_api_get_request    /api/v1/employees
    log to console     ${response.status_code}
    ${actual_Status_code}=   convert to string   ${response.status_code}
    should be equal    200   ${actual_Status_code}
    Set Test Variable  ${response}

Validate response Status
    ${Json_responce}=  to json       ${response.content}
    @{status_list}=    get value from json      ${Json_responce}        $.status
    ${status}=         get from list  ${status_list}  0
    should be equal    success   ${status}
    log to console     ${status}