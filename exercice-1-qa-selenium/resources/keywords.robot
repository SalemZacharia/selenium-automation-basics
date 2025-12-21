** Settings ***

Library    SeleniumLibrary

*** Variables ***

${URL}      https://the-internet.herokuapp.com/login
${BROWSER}  chrome

*** Keywords ***
Open Browser To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_argument    --window-size=1920,1080

    Create Webdriver    Chrome    options=${options}
    Go To    ${URL}

Enter Username
    [Arguments]    ${username}
    Input Text    id=username    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    id=password    ${password}

Submit Login
    Click Button    css=button[type='submit']

Verify Login Success
    Wait Until Page Contains    secure are    timeout=10s

Verify Login Error
    Wait Until Page Contains   Your password is invalid!    timeout=10s