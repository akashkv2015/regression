*** Settings ***
Variables  ../../../Test Data/Variables.py
Library  Process
Library  OperatingSystem
Library  String
Library  Collections
#Library     CSVLib
Library     customappium.py

*** Variables ***


*** Keywords ***
Launch Web Application
    [Arguments]     ${url}      ${browser}
    [Documentation]     "Launch the application with url ${url} in browser ${browser}"
    OPEN BROWSER    ${url}   ${browser}
    maximize browser window

Initiate MOBILE_EMULATOR_CHROME
    [Arguments]     ${deviceName}   ${url}
    [Documentation]     Instantiate chrome browser in mobile simulation mode on device ${deviceName}
    log to console      "Mobile_Emulator"
    ${mobile emulation}=    Create Dictionary    deviceName=${deviceName}
    #${mobile emulation}=    Create Dictionary    deviceName=Nexus 5
    ${chrome options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome options}    add_experimental_option    mobileEmulation    ${mobile emulation}
    Create Webdriver    Chrome    chrome_options=${chrome options}
    Goto    ${url}

Initiate Browser On Android
    [Documentation]     "launch web browser ${browser} on android device ${deviceName}"
#    Open Application  http://127.0.0.1:4723/wd/hub  automationName=${androidAutomationName}
#    ...  platformName=${androidPlatformName}  platformVersion=${androidPlatformVersion}
#    ...  deviceName=${deviceName}  browserName=${browser}   chromedriverExecutable=/Users/kamal/Desktop/HP/ETR/ETR/resources/chromedriver

    Open Application  https://skumark9224_1:f6aa2c565125425caff016d28c904469@ondemand.us-west-1.saucelabs.com:443/wd/hub
    ...  platformName=${androidPlatformName}  platformVersion=${androidPlatformVersion}
    ...  deviceName=${deviceName}  browserName=${browser}

Enter Value
    [Arguments]     ${elem}     ${value}
    [Documentation]     Enter the value "${value}" in textbox "${elem}"
    wait until element is visible   ${elem}       ${Timeout}
    wait until keyword succeeds     ${Timeout}     ${Retry}     input text      ${elem}     ${value}
    log to console     "Value ${value} entered into ${elem} successfully"

Setup Device
    [Arguments]     ${appiumServer}     ${automatorName}    ${deviceID}     ${deviceBrowser}    ${platform}     ${platformVersion}
    [Documentation]     Instantiate the "${platform}" device "${deviceID}" with appium server running at "${appiumServer}"
    Open Application  ${appiumServer}  automationName=${automatorName}
    ...  platformName=${platform}  platformVersion=${platformVersion}
    ...  deviceName=${deviceID}  browserName=${deviceBrowser}
    log to console     "Device ${deviceID} instantiate successfully on the ${platform}"


Clear Text
    [Arguments]     ${elem}
    [Documentation]     Clear the test already exists in the element ${elem}
    wait until element is visible   ${elem}       ${Timeout}
    Clear Element Text      ${elem}
    log to console      "Existing text removed from the element ${elem} successfully"

Click On Element
    [Arguments]     ${elem}
    [Documentation]     Click on the element "${elem}" visible on the screen
    wait until element is visible   ${elem}       ${Timeout}    "${elem}" is not visible on the screen
    wait until keyword succeeds     ${Timeout}     ${Retry}     Click Element   ${elem}
    log to console      "Element ${elem} clicked successfully"

Click Element Using JavaScript
    [Arguments]     ${elem}
    [Documentation]     Click on the element "${elem}" via javascript
    ${webElement}=    Get WebElement    ${elem}
    run keyword if    '${tech}'!='MOBILE'      Execute Javascript    arguments[0].click();     ARGUMENTS    ${webElement}
    ...     ELSE    Click Element Using JS      ${webElement}
    log to console      "Element ${elem} clicked successfully via javascript"

click on element inside Frame
    [Arguments]     ${frameElem}    ${elem}
    [Documentation]     Click on the element "${elem}" visible on the screen inside frame
    run keyword if      '${tech}'!='MOBILE'    Select Frame     ${frameElem}
    wait until element is visible   ${elem}       ${Timeout}    "${elem}" is not visible on the screen inside the frame
    wait until keyword succeeds     ${Timeout}     ${Retry}     Click Element   ${elem}
    log to console      "Element ${elem} clicked successfully inside the frame"
    run keyword if      '${tech}'!='MOBILE'     Unselect Frame


Verify Element Exists
    [Arguments]     ${elem}
    [Documentation]     Verify "${elem}" is visible on the screen
    wait until element is visible   ${elem}       ${Timeout}    "${elem}" is not visible on the screen
    Element Should be visible   ${elem}     "${elem}" is not visible on the screen
    log to console      "Element ${elem} is visible on the screen"

Verify Element Text
    [Arguments]     ${elem}     ${expectedText}
    [Documentation]     Verify "${elem}" is visible on the screen
    wait until element is visible   ${elem}       ${Timeout}    "${elem}" is not visible on the screen
    element text should be      ${elem}     ${expectedText}     "${elem}" text does not match with expected text "${expectedText}"
    log to console      "Element ${elem} text matches the expected"

Select Application Frame
    [Arguments]     ${elem}
    [Documentation]    Switch to the "${elem}" frame
    wait until element is visible   ${elem}       60  "${elem}" is not visible on the screen
    run keyword if  '${tech}'!='MOBILE'     Select Frame    ${elem}
    ...     ELSE     Switch Frame By XPath      ${elem}
    log to console      "Context switched to frame ${elem}"

Unselect Application Frame
    [Documentation]    Switch to the default frame context
    run keyword if  '${tech}'!='MOBILE'     Unselect Frame
    ...     ELSE     Switch To Default Frame
    log to console      "Context switched to default frame"

Scroll To Element In View
    [Arguments]     ${elem}
    [Documentation]     Scroll to the "${elem}" in to view
    ${element}=     Get Webelement     ${elem}
    run keyword if  '${tech}'!='MOBILE'     wait until keyword succeeds     ${Timeout}  ${Retry}    Scroll Element Into View   ${elem}
    ...     ELSE    Scroll To Element       ${element}
    Element Should be visible   ${elem}     "${elem}" is not visible on the screen
    log to console      "Screen scroll to the element ${elem}"

Hide Keyboard On Mobile
    ${isKeyboardShown}=      Is Keyboard Shown
    run keyword if      '${isKeyboardShown}'=='True'     Hide Keyboard


Verify the Models and Validate
    [Arguments]     ${elem}     ${items}
    [Documentation]     Verify "${elem}" is visible on the screen and print the loop
    wait until element is visible   ${elem}       ${Timeout}    "${elem}" is not visible on the screen
    Element Should be visible   ${elem}     "${elem}" is not visible on the screen
    log to console      "${elem} is visible on the screen"
    ${txt}=    Get Text    ${elem}
    Should Be Equal	${txt}	${items}	ignore_case=True

Click On Menu Submenu
    [Arguments]     ${menu}     ${submenu}
    [Documentation]     Hover on menu and then click on submenu
    Click On Element  ${menu}
    Click On Element    ${submenu}


Go Back
    Execute Javascript  history.back()
    log to console    "Navigate Back"
    sleep   2










