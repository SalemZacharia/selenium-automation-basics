*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://the-internet.herokuapp.com/login

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    chrome    arguments=--headless,--no-sandbox,--disable-dev-shm-usage,--window-size=1920,1080

Enter Username
    [Arguments]    ${username}
    Input Text    id=username    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Submit Login
    Click Button    css=button[type='submit']

Verify Login Success
    Wait Until Page Contains    secure area    timeout=10s

Verify Login Error
    Wait Until Page Contains    Your password is invalid!    timeout=10s
