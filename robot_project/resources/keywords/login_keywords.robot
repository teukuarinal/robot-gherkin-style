*** Settings ***
Library    SeleniumLibrary
Library    ../../drivers/chromedriversync.py
Variables  ../../resources/variables/data.py

*** Keywords ***
User open SauceDemo
    Install Chromedriver
    Open Browser    ${BASE_URL_SAUCEDEMO}    ${BROWSER}
    Maximize Browser Window

User Login With username ${username} and password ${password}
    Input Text    id=user-name    ${username}
    Input Text    id=password     ${password}
    Click Button  id=login-button

Verify Login Success
    Page Should Contain Element    xpath=//div[@class='inventory_list']

Verify Login Failure
    Page Should Contain Element    xpath=//h3[contains(text(), 'Epic sadface')]

Close Browser Session
    Close Browser
