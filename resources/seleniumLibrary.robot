*** Settings ***
Documentation     This resource define keywords of SeleniumHQ in Robot Framework
Library           Selenium2Library

*** Keywords ***
open
    [Arguments]    ${element}
    Maximize Browser Window
    Set Selenium Implicit Wait    10
    Set Selenium Speed    .3
    Go To    ${undefined}${element}

clickAndWait
    [Arguments]    ${element}
    ${element}    Get Webelement    ${element}
    Wait Until Element Is Enabled    ${element}
    Click Element    ${element}

click
    [Arguments]    ${element}
    ${element}    Get Webelement    ${element}
    Wait Until Element Is Enabled    ${element}
    Click Element    ${element}

type
    [Arguments]    ${element}    ${value}
    ${element}    Get Webelement    ${element}
    Wait Until Element Is Enabled    ${element}
    Input Text    ${element}    ${value}
    ${text}    get text    xpath=/html/body/div[5]/div[1]/div[1]/div/div[2]/div[1]/span[2]

selectAndWait
    [Arguments]    ${element}    ${value}
    ${element}    Get Webelement    ${element}
    Wait Until Element Is Enabled    ${element}
    Select From List    ${element}    ${value}

select
    [Arguments]    ${element}    ${value}
    ${element}    Get Webelement    ${element}
    Wait Until Element Is Enabled    ${element}
    Select From List    ${element}    ${value}

verifyValue
    [Arguments]    ${element}    ${value}
    Run Keyword And Continue On Failure    assertValue    ${element}    ${value}

verifyText
    [Arguments]    ${element}    ${value}
    Run Keyword And Continue On Failure    assertText    ${element}    ${value}

verifyElementPresent
    [Arguments]    ${element}
    Run Keyword And Continue On Failure    assertElementPresent    ${element}

verifyVisible
    [Arguments]    ${element}
    Run Keyword And Continue On Failure    assertVisible    ${element}

verifyTitle
    [Arguments]    ${title}
    Run Keyword And Continue On Failure    assertTitle    ${title}

verifyTable
    [Arguments]    ${element}    ${value}
    Run Keyword And Continue On Failure    assertTable    ${element}    ${value}

verifyTextContain
    [Arguments]    ${locator}    ${value}
    Run Keyword And Continue On Failure    assertTextContain    ${locator}    ${value}

verifyHasClass
    [Arguments]    ${locator}    ${classname}
    Run Keyword And Continue On Failure    assertHasClass    ${locator}    ${classname}

assertConfirmation
    [Arguments]    ${value}
    Alert Should Be Present    ${value}

assertText
    [Arguments]    ${element}    ${value}
    Element Should Contain    ${element}    ${value}

assertValue
    [Arguments]    ${element}    ${value}
    ${attr_value}    Get Element Attribute    ${element}@value
    Should Be Equal    ${attr_value}    ${value}

assertElementPresent
    [Arguments]    ${element}
    Page Should Contain Element    ${element}

assertVisible
    [Arguments]    ${element}
    Element Should Be Visible    ${element}

assertTitle
    [Arguments]    ${title}
    Title Should Be    ${title}

assertTable
    [Arguments]    ${element}    ${value}
    Table Should Contain    ${element}    ${value}

assertTextContain
    [Arguments]    ${locator}    ${value}
    ${text}    Get Text    ${locator}
    Should Contain    ${text}    ${value}

assertHasClass
    [Arguments]    ${locator}    ${classname}
    ${class_val}    Get Element Attribute    ${locator}@class
    Should Contain    ${class_val}    ${classname}

waitForText
    [Arguments]    ${element}    ${value}    ${timeout}=5
    Wait Until Page Contains Element    ${element}    ${timeout}
    Element Should Contain    ${element}    ${value}

waitForValue
    [Arguments]    ${element}    ${value}    ${timeout}=5
    Wait Until Page Contains Element    ${element}    ${timeout}
    ${attr_value}    Get Element Attribute    ${element}@value
    Should Be Equal    ${attr_value}    ${value}

waitForElementPresent
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}

WaitForLocation
    [Arguments]    ${path}    ${timeout}=10    ${endswith}=false
    Wait For Condition    var href = window.location.href;return ('${endswith}' == 'true') ? href.endsWith('${path}') : href.indexOf('${path}') > -1    ${timeout}

waitForVisible
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

waitForTitle
    [Arguments]    ${title}    ${timeout}=5
    Wait For Condition    return document.title == '${title}'    ${timeout}

waitForTable
    [Arguments]    ${element}    ${value}
    Wait Until Page Contains Element    ${element}
    Table Should Contain    ${element}    ${value}

doubleClick
    [Arguments]    ${element}
    ${element}    Get Webelement    ${element}
    Double Click Element    ${element}

doubleClickAndWait
    [Arguments]    ${element}
    ${element}    Get Webelement    ${element}
    Double Click Element    ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]    ${code}
    Execute Javascript    ${code}

runScriptAndWait
    [Arguments]    ${code}
    Execute Javascript    ${code}

setSpeed
    [Arguments]    ${value}
    Set Selenium Timeout    ${value}

setSpeedAndWait
    [Arguments]    ${value}
    Set Selenium Timeout    ${value}

verifyAlert
    [Arguments]    ${value}
    Alert Should Be Present    ${value}

getLink
    [Arguments]    ${locator}
    ${link_val}    Get Element Attribute    ${locator}@href
    Return From Keyword    ${link_val}
