*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Variables  ../variables/data.py

*** Keywords ***
Prepare API Request
    Create Session    reqres    ${BASE_URL_REQRES}

Send GET Request to Retrieve User Details
    ${response}=    GET On Session    reqres    /users/2
    Set Test Variable    ${GET_RESPONSE}    ${response}

Verify GET Response Status
    Should Be Equal As Numbers    ${GET_RESPONSE.status_code}    200

Verify GET Response Schema
    ${schema}=    Load JSON From File    robot_project/resources/schemas/get_user.json
    Validate Json By Schema    ${GET_RESPONSE.json()}    ${schema}
