*** Settings ***
Resource      ../resources/keywords/login_keywords.robot
Variables     ../resources/variables/data.py
Test Tags     login

*** Test Cases ***
User login with valid credentials
    [Tags]    login_success
    Given Open SauceDemo
    When Login With username ${USERNAME} and password ${PASSWORD}
    Then Verify Login Success

User login with invalid credentials
    [Tags]    login_failed
    Given Open SauceDemo
    When Login With username ${USERNAME} and password "wrong_password"
    Then Verify Login Failure
