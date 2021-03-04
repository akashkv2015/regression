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
    Launch ETR Application  ${Uat_url}
#    Click On Element    ${iAcceptBtn}
#    run keyword if      '${tech}'=='WEB'    run keywords
#    ...     Select Application Frame     ${frame_SSM}
#    ...     AND     click on element    ${closeForm_SSM}
#    ...     AND     Unselect Frame

    #2. Search for a 3PP SKU and add product to cart
    Search SKU and add to cart and verify      ${tpp_product_item}     ${locator_searchbox}

    #3. Search for an BTO product and add it to cart
    Search SKU and add to cart and verify      ${bto_product_items}     ${locator_searchbox_pdp}
    #4. Click on ""View Cart and Checkout"" in Mini cart
    Verify View Cart and Checkout         ${mouseon_monicart}    ${Click_guest}
#    Click on View all items in mini cart
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

########################## Verify Shipping Methods in Cart & Checkout pages ######################################
Verify Shipping Methods in cart & Checkout
    [Tags]  WEB     MOBILE
    Launch ETR Application  ${Uat_url}
#    Click On Element    ${iAcceptBtn}
#    run keyword if      '${tech}'=='WEB'    run keywords
#    ...     Select Application Frame     ${frame_SSM}
#    ...     AND     click on element    ${closeForm_SSM}
#    ...     AND     Unselect Frame

    #2. Search for any STO Product
    Verify Search STO Product     ${searched_vlue}

    #3. Click on ADD TO CART button for STO product
    Verify Add To Cart for Checkout STO Product   ${Sto_checkout}

    #4. Click on ""View Cart and Checkout"" in Mini cart
    Verify View Cart and Checkout         ${mouseon_monicart}    ${Click_guest}
    sleep  2

    #5. Verify details in Cart page
    Verify details in Cart page

    #6. Verify the Shipping methods displayed
    Verify the shipping Method displayed    ${shipping_meth}

    #10. Verify TOTAL & 'CART TOTAL' amount
    Verify TOTAL & 'CART TOTAL' amount

    #11. Click on 'Checkout as Guest' for Guest user
    Verify Checkout as Guest       ${checkout_guest}     ${Secure_checkout}

    #12. Enter 'Contact Information' and Shipping details
    Verify Contact Information and Shipping details

    #14. Verify the Shipping methods displayed
    Verify the Shipping Method      ${shipping_met}

    #17. Verify the Shipping Charge, Taxes, TOTAL
    Verify the Shipping Charge, Taxes, Total       ${ship_charge}  ${taxes}    ${total}

