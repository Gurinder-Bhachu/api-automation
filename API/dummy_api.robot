*** Settings ***
Resource   ../Api/Keywords/common.robot
Library    RequestsLibrary

*** Test Cases ***
Check Status code
    Validate Status code
    Validate response
