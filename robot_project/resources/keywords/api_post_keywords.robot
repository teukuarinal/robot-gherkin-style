*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${SESSION}    req_session

*** Keywords ***
Prepare POST Request
    [Arguments]    ${base_url}
    Create Session    ${SESSION}    ${base_url}

Set Headers For POST
    [Arguments]    &{headers}
    ${final_headers}=    Create Dictionary    &{headers}
    Set Suite Variable    ${HEADERS}    &{final_headers}

Set Request Body
    [Arguments]    &{body}
    ${final_body}=    Create Dictionary    &{body}
    Set Test Variable    ${REQUEST_BODY}    ${final_body}

Send POST Request
    [Arguments]    ${endpoint}
    ${response}=    POST On Session    ${SESSION}    ${endpoint}    json=${REQUEST_BODY}    headers=${HEADERS}
    Set Test Variable    ${RESPONSE}    ${response}

Verify POST Response Status
    [Arguments]    ${expected_status}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    ${expected_status}

Verify POST Response Schema
    [Arguments]    ${schema_file}
    ${schema}=    Load JSON From File    ${EXECDIR}/robot_project/resources/schemas/${schema_file}
    Validate JSON By Schema    ${RESPONSE.json()}    ${schema}

Verify POST Response Content
    [Arguments]    &{expected_values}
    ${response_json}=    Set Variable    ${RESPONSE.json()}
    FOR    ${key}    ${value}    IN    &{expected_values}
        Should Be Equal    ${response_json}[${key}]    ${value}
    END
