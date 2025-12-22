*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://the-internet.herokuapp.com/login
${BROWSER}  chrome

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    ...    options=add_argument(--headless)
    ...    options=add_argument(--no-sandbox)
    ...    options=add_argument(--disable-dev-shm-usage)
    ...    options=add_argument(--window-size=1920,1080)
    Maximize Browser Window

Enter Username
    [Arguments]    ${username}
    Input Text    id=username    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Submit Login
    Click Button    css=button[type='submit']

Verify Login Success
    Wait Until Page Contains    Secure Area    timeout=10s

Verify Login Error
    Wait Until Page Contains    Your password is invalid!    timeout=10s
