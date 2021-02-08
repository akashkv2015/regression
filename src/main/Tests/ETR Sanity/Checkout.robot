*** Settings ***

Resource  ../../../main/Common Application Methods/commonMethods.robot
Variables    ../../../../Test Data/Variables.py
Variables       ../../../../Conf/conf.py
Variables       ../../../main/Page Objects/Checkout/CheckoutCommon.py
Variables       ../../../main/Page Objects/commonPageObjects.py
Library  OperatingSystem
Library  DependencyLibrary
Library  Process

Suite Setup  SetupSuite
Suite Teardown  Browser Close
Test Teardown   Browser Close

*** Variables ***

*** Keywords ***
Close Sauce Lab Session
    Run Keyword If  '${PREV_TEST_STATUS}'== 'PASS'  Execute Script  sauce:job-result=passed
    ...  ELSE  Execute Script  sauce:job-result=failed

Browser Close
    run keyword if     "${tech}" == "MOBILE"    run keywords
    ...     Quit Application
    ...     AND     Close Sauce Lab Session
    ...     ELSE        Close Browser

Clear existing images
    [Tags]  folder  cleanup
    [Documentation]  folder  cleanup
    Empty Directory     ${CURDIR}${/}/AllScreenCaptures

SetupSuite
    Clear existing images
    run keyword if      '${tech}'=='MOBILE'    import library   AppiumLibrary
    ...     ELSE       import library       SeleniumLibrary
    run keyword if      '${tech}'!='WEB'     import Variables     ${CheckoutPOFiles}/CheckoutMobile.py
    ...     ELSE       import Variables     ${CheckoutPOFiles}/CheckoutWeb.py

*** Test Cases ***
######################################       Guest user checkout with PayPal        ####################################
Guest user checkout with PayPal
    [Tags]  WEB     MOBILE
    #1. Launch the storefront URL
    Launch ETR Application  ${url}
    Click On Element    ${iAcceptBtn}
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Select Application Frame     ${frame_SSM}
    ...     AND     click on element    ${closeForm_SSM}
    ...     AND     Unselect Frame

    #2. Search for a 3PP SKU and add product to cart
    Search SKU and add to cart and verify      ${tpp_product_item}     ${locator_searchbox}

    #3. Search for an BTO product and add it to cart
    Search SKU and add to cart and verify      ${bto_product_item}     ${locator_searchbox_pdp}
    #4. Click on ""View Cart and Checkout"" in Mini cart
    Click on View all items in mini cart
    sleep   2s
    #5. Click on ""PayPal Checkout"" button
    Click On Element        ${locator_btn_paypalcheckout}
    sleep       5s
    Capture Page Screenshot
    #Expected Result:
    #PayPal sign in page should be displayed as a Popup
    #6. Click on Login button
    #Expected Result:
    #Pay with PayPal login page should be displayed
    #7. Enter the email and click on Next button
    #Expected Result:
    #Page to enter the password should be dispalyed
    #8. Enter the password and click on Next
    #Expected Result:
    #User should be logged into PayPal account and PayPal preferred address should be shipping address
    #9. Click on Continue
    #Expected Result:
    #'Order Review' page should be displayed and the Payment details (Payment method, user name and cart amount) should be verified
    #10. Click on ""Place Order""
    #Expected Result:
    #Order Confirmation page should be displayed with the Order details
    #
    #Capture the screenshot which display Order data, Product details, Shipping, billing and Payment method details"