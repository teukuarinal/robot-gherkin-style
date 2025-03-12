*** Settings ***
Resource    ../../resources/keywords/api_get_keywords.robot
Resource    ../../resources/keywords/api_post_keywords.robot
Test Tags   api

*** Test Cases ***
Get User
    [Tags]    get_user
    Given Prepare GET Request         https://reqres.in/api
    And Set Headers For GET           headers=Content-Type=application/json
    When Send GET Request             /users/2
    Then Verify GET Response Status   200
    And Verify GET Response Schema    get_user.json

Create User
    [Tags]    create_user
    Given Prepare POST Request        https://reqres.in/api
    And Set Headers For POST          headers=Content-Type=application/json
    And Set Request Body
    ...    name=arinal
    ...    job=leader
    When Send POST Request    /users
    Then Verify POST Response Status   201
    And Verify POST Response Schema    create_user.json
    And Verify POST Response Content
    ...    name=arinal
    ...    job=leader