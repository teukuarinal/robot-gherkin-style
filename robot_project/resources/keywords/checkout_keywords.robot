*** Settings ***
Library    SeleniumLibrary
Variables  ../../resources/variables/data.py

*** Keywords ***
User Add Items To Cart By Name
    [Arguments]    @{product_names}
    FOR    ${product_name}    IN    @{product_names}
        Click Button    xpath=//div[@data-test="inventory-item-name"][contains(text(), '${product_name}')]/ancestor::div[@data-test="inventory-item"]//button[contains(@class, 'btn_inventory')]
    END

User Open Shopping Cart
    Click Element    xpath=//a[@class='shopping_cart_link']

Verify Products In Cart
    [Arguments]    @{product_names}
    FOR    ${product_name}    IN    @{product_names}
        Element Should Contain    css=[data-test="cart-list"]    ${product_name}
    END

User Proceed To Checkout
    Click Button    id=checkout

User Fill Checkout Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    id=first-name    ${first_name}
    Input Text    id=last-name     ${last_name}
    Input Text    id=postal-code   ${postal_code}
    Click Button  id=continue

User Confirm Order
    Click Button  id=finish

Verify Checkout Success
    Page Should Contain Element    xpath=//h2[contains(text(), 'Thank you for your order!')]

User Logout
    Click Button     id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link    timeout=5s
    Mouse Over       id=logout_sidebar_link
    Click Element    id=logout_sidebar_link
