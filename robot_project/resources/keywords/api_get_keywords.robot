*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${SESSION}    req_session

*** Keywords ***
Prepare GET Request
    [Arguments]    ${base_url}
    Create Session    ${SESSION}    ${base_url}

Set Headers For GET
    [Arguments]    &{headers}
    ${final_headers}=    Create Dictionary    &{headers}
    Set Suite Variable   ${HEADERS}  &{final_headers}

Send GET Request
    [Arguments]    ${endpoint}
    ${response}=    GET On Session    ${SESSION}    ${endpoint}    headers=${HEADERS}
    Set Test Variable    ${RESPONSE}    ${response}

Verify GET Response Status
    [Arguments]    ${expected_status}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    ${expected_status}

Verify GET Response Schema
    [Arguments]    ${schema_file}
    ${schema}=    Load JSON From File    ${EXECDIR}/robot_project/resources/schemas/${schema_file}
    Validate JSON By Schema    ${RESPONSE.json()}    ${schema}

Verify GET Response Content
    [Arguments]    ${expected_values}
    ${response_json}=    Set Variable    ${RESPONSE.json()}
    FOR    ${key}    ${value}    IN    &{expected_values}
        Should Be Equal    ${response_json}[${key}]    ${value}
    END
