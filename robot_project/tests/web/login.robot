*** Settings ***
Resource      ../../resources/keywords/login_keywords.robot
Variables     ../../resources/variables/data.py
Test Tags     web    login

*** Test Cases ***
User login with valid credentials
    [Tags]    login_success
    Given User Open SauceDemo
    When User Login With username ${USERNAME} and password ${PASSWORD}
    Then Verify Login Success
    And Close Browser Session

User login with invalid credentials
    [Tags]    login_failed
    Given User Open SauceDemo
    When User Login With username ${USERNAME} and password "wrong_password"
    Then Verify Login Failure
    And Close Browser Session
