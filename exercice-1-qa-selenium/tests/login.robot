*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/keywords.robot
Test Setup    Open Browser To Login Page 
Suite Teardown    Close Browser 

*** Test Cases ***
Login With Valid Credentials
    Enter Username    tomsmith
    Enter Password    SuperSecretPassword!
    Submit Login
    Verify Login Success

Login With Invalid Credentials
    Enter Username    tomsmith
    Enter Password    SuperWeakPassword?
    Submit Login
    Verify Login Error