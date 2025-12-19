*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Suite Setup    Open Browser To Login Page 
Suite Teardown    Close Browser 

*** Test Cases ***
Login With Valid Credentials
    Enter Username    tomsmith
    Enter Password    SuperSecretPassword!
    Submit Login
    Verify Login Success