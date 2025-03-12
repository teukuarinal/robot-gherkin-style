*** Settings ***
Resource      ../../resources/keywords/checkout_keywords.robot
Resource      ../../resources/keywords/login_keywords.robot
Variables     ../../resources/variables/data.py
Test Tags     web    checkout

*** Test Cases ***
User Checkout Product
    [Tags]    checkout
    Given User open SauceDemo
    When User login with username ${USERNAME} and password ${PASSWORD}
    And User Add Items To Cart By Name    Test.allTheThings() T-Shirt (Red)    Sauce Labs Backpack
    And User Open Shopping Cart
    And Verify Products In Cart           Test.allTheThings() T-Shirt (Red)    Sauce Labs Backpack
    And User Proceed To Checkout
    And User Fill Checkout Information    Teuku    Arinal    12345
    And User Confirm Order
    Then Verify Checkout Success
    And User Logout
    And Close Browser Session
