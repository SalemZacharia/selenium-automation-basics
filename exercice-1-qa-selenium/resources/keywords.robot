*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}      https://the-internet.herokuapp.com/login
${BROWSER}  chrome

*** Keywords ***
Open Browser To Login Page
    ${options}=    Create Dictionary
    ...    args=--headless,--no-sandbox,--disable-dev-shm-usage

    Open Browser    ${URL}    ${BROWSER}    options=${options}

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
