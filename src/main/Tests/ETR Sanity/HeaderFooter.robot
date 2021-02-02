*** Settings ***

Resource  ../../../main/Common Application Methods/commonMethods.robot
Variables    ../../../../Test Data/Variables.py
Variables       ../../../../Conf/conf.py
Variables       ../../../main/Page Objects/HeaderFooter/HeaderFooterCommon.py
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
    Empty Directory      ${CURDIR}${/}/AllScreenCaptures

SetupSuite
    Clear existing images
    run keyword if      '${tech}'=='MOBILE'    import library   AppiumLibrary
    ...     ELSE       import library       SeleniumLibrary
    run keyword if      '${tech}'!='WEB'     import Variables     ${HeaderFooterPOFiles}/HeaderFooterMobile.py
    ...     ELSE       import Variables     ${HeaderFooterPOFiles}/HeaderFooterWeb.py

*** Test Cases ***
#####################################       Verify Header & Footer links in Homepage, Checkout and PGS pages        ####################################
Verify Header Footer links in Homepage Checkout and PGS pages
    [Tags]  WEB     MOBILE
    #1. Launch the Storefront URL
    Launch ETR Application  ${url}
    Click On Element    ${iAcceptBtn}
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Select Application Frame     ${frame_SSM}
    ...     AND     click on element    ${closeForm_SSM}
    ...     AND     Unselect Frame

    #2. Verify the Header links
    Verify the Header links

     #For Private store users - validate the private store label that shows on top
    #3. Verify the 'Footer' links
    Verify the Footer links

     #4. Verify the Bottom row links
    Verify the Bottom row links

     #5. Go to Top sellers section and click on Add to cart button for a STO product
    Go to Top sellers section and add STO product

     #6. Click on "View all items" or "VIEW CART & CHECKOUT" in mini cart
    Click on View all items in mini cart

     #7. Click on "CHECKOUT AS GUEST" for Guest or
    click on element   ${locator_checkoutasguest_btn}

     #8. Verify top header in Checkout page
    Verify top header in Checkout page

     #9. Enter all the required mandatory details in 'Contact information','Shipping section'
     #Expected Result:
    Enter Contact Information   firstNameLocator=${locator_firstName}  fisrtNameValue=${firstName}     lastNameLocator=${locator_lastName}
        ...     lastNameValue=${lastName}   phoneNumberLocator=${locator_contactNumber}    phoneNumberValue=${contactNumber_desktop}
        ...     emailAddressLocator=${locator_emailAddress}    emailAddressValue=${emailAddress}


    Enter Shipping Information      addressLocator=${locator_address}      selectAddressLocator=${locator_selectaddress}
        ...     addressValue=${shipping_Address}
        ...     companyLocator=${locator_company}   companyValue=${companyName}

    sleep   1s
     #10. Verify PGS iframe is displayed in credit tab
    Verify Element Exists  //iframe[@id="pgsIframe"]
     #11. Enter valid card number, expiration date, CVV and click on "REVIEW ORDER"
#    Enter Credit Or Debit Card Details      creditDebitTabLocator=${btn_credit_debit_Card}      txtCardLocator=${txt_card}
#        ...     cardValue=${cardNumber}     expiryDateLocator=${txt_expiry_date}    expiryDateValue=${cardExpiry}
#        ...     cvvLocator=${txt_cvv}   cvvValue=${cardCVV}     frame=${psg_frame}
    Enter Credit Or Debit Card Details      creditDebitTabLocator=//div[@id="payTab1"]      txtCardLocator=//input[@id="txtCardNumber"]
        ...     cardValue=${cardNumber}     expiryDateLocator=//input[@id="txtExpDate"]   expiryDateValue=${cardExpiry}
        ...     cvvLocator=//input[@id="txtCVV"]   cvvValue=${cardCVV}     frame=//iframe[@id="pgsIframe"]

    Review And Place Order      reviewOrderLocator=//div[@id='btnReviewOrder']      placeOrderLocator=//div[@id='placeOrderTop']

     #12. Verify top header in 'Order Review' page
     Verify top header in Checkout page

     #13. Repeat all the above steps with Private user logged in
     #Expected Result:
     #All the steps should be Passed
Verify Header Footer links in Homepage Checkout and PGS pages Private User

    [Tags]  WEB     MOBILE
    #1. Launch the Storefront URL
    Launch ETR Application  ${url}
    Click On Element    ${iAcceptBtn}
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Select Application Frame     ${frame_SSM}
    ...     AND     click on element    ${closeForm_SSM}
    ...     AND     Unselect Frame

    Login to application    ${pvt_username}     ${pvt_password}
    Go To   ${url}

    #2. Verify the Header links
    Verify the Header links

     #For Private store users - validate the private store label that shows on top
    #3. Verify the 'Footer' links
    Verify the Footer links
     #Expected Result:
     #Footer links should be displayed with below options
     #'About us', 'Ways to buy', 'Support', 'HP Partners', 'Stay Connected'
     #4. Verify the Bottom row links
    Verify the Bottom row links

     #5. Go to Top sellers section and click on Add to cart button for a STO product
    Go to Top sellers section and add STO product

     #6. Click on "View all items" or "VIEW CART & CHECKOUT" in mini cart
    Click on View all items in mini cart

     #7. Click on "CHECKOUT AS GUEST" for Guest or
    #click on element   ${locator_checkoutasguest_btn}
    click on element    //div[@class='guestcheckout']/a[text()='checkout']

    #    Enter Value        //input[@id='password']      ${pvt_password}
    #    Click Element   //button[@id='']
    #    Sleep   3s

     #8. Verify top header in Checkout page
    Verify top header in Checkout page
     #Expected Result:
     #It should just show HP logo on left without any other header links
     #9. Enter all the required mandatory details in 'Contact information','Shipping section'
     #Expected Result:
#    Enter Contact Information   firstNameLocator= ${locator_firstName}  fisrtNameValue=${firstName}     lastNameLocator=${locator_lastName}
#        ...     lastNameValue=${lastName}   phoneNumberLocator=${locator_contactNumber}    phoneNumberValue=${contactNumber_desktop}
#        ...     emailAddressLocator=${locator_emailAddress}    emailAddressValue=${emailAddress}

#    Enter Shipping Information      addressLocator=${locator_address}      selectAddressLocator=${locator_selectaddress}
#        ...     addressValue=${shipping_Address}
#        ...     companyLocator=${locator_company}   companyValue=${companyName}

    sleep   1s
     #10. Verify PGS iframe is displayed in credit tab
    Verify Element Exists  //iframe[@id="pgsIframe"]
     #11. Enter valid card number, expiration date, CVV and click on "REVIEW ORDER"
#    Enter Credit Or Debit Card Details      creditDebitTabLocator=${btn_credit_debit_Card}      txtCardLocator=${txt_card}
#        ...     cardValue=${cardNumber}     expiryDateLocator=${txt_expiry_date}    expiryDateValue=${cardExpiry}
#        ...     cvvLocator=${txt_cvv}   cvvValue=${cardCVV}     frame=${psg_frame}
    Enter Credit Or Debit Card Details      creditDebitTabLocator=//div[@id="payTab1"]      txtCardLocator=//input[@id="txtCardNumber"]
        ...     cardValue=${cardNumber}     expiryDateLocator=//input[@id="txtExpDate"]   expiryDateValue=${cardExpiry}
        ...     cvvLocator=//input[@id="txtCVV"]   cvvValue=${cardCVV}     frame=//iframe[@id="pgsIframe"]

    Review And Place Order      reviewOrderLocator=//div[@id='btnReviewOrder']      placeOrderLocator=//div[@id='placeOrderTop']

     #12. Verify top header in 'Order Review' page
    Verify top header in Checkout page

     #13. Repeat all the above steps with Private user logged in
     #Expected Result:
     #All the steps should be Passed