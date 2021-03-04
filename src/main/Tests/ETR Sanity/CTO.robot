*** Settings ***

Resource  ../../../main/Common Application Methods/commonMethods.robot
Variables    ../../../../Test Data/Variables.py
Variables       ../../../../Conf/conf.py
Variables       ../../../main/Page Objects/CTO/CTOCommon.py
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
    run keyword if      '${tech}'!='WEB'     import Variables      ${CTOPOFiles}/CTOMobile.py
    ...     ELSE       import Variables     ${CTOPOFiles}/CTOWeb.py

*** Test Cases ***
####################################       Validate CTO and add to cart        ####################################
Verify CTO and add to cart
    [Tags]  WEB     MOBILE
    #1. Browse for an Color swatch CTO
    Launch ETR Application  ${pdp_url2}
#    Click On Element    ${iAcceptBtn}
#    run keyword if      '${tech}'=='WEB'    run keywords
#    ...     Select Application Frame     ${frame_SSM}
#    ...     AND     click on element    ${closeForm_SSM}
#    ...     AND     Unselect Frame

#2. Verify the details displayed in product details page (PDP)
    Verify the details displayed in product details page        //div[@class="pdp-content clearfix"]
#3. Change the color and verify the product images
    Change the color and verify the product images
#Expected Result:
#Product should be updated with the color selected for full images and thumbnail images

#4. Click on the Features tab
    #click on tab and verify    //div[@class="tabs-container"]//li[@aria-label="Features"]    ${feature_tab_content}
    click on tab and verify    //*[@id="initFeatures"]    ${feature_tab_content}
    sleep   2s
#Expected Result:
#- Product features should be displayed
#- Superscript numbers if configured should appear, on mouse hover tool tip should be displayed
#- ""Registered & TM"" symbols should be shown correctly wherever displayed
#5. Verify 'You might also be interested in..."" section
    Verify You might also be interested in      ${interestedSection}

#6. Click on the Specs tab
    #click on tab and verify        //div[@class="tabs-container"]//li[@aria-label="Specs"]    //div[@class="pdp-specs"]
    click on tab and verify        //*[@id="initSpecs"]     //*[@id="specsTab"]

#Expected Result:
#- Product specifications should be displayed
#- Document(datasheet) link will be present if available, on click of document link should open document in new window
#7. Verify Accessories tab
  #  Verify Accessorie tab       //div[@class="tabs-container"]//li[@aria-label="Accessories"]
    #change
    Verify Accessorie tab       //*[@id="initAccessories"]

#8. Click on Support tab
    #Verify Support tab          //div[@class="tabs-container"]//li[@aria-label="Support"]
    #change
    Verify Support tab          //*[@id="initServices"]

    #Recommended HP Care Packs should be displayed with ""Add to cart"" button and 'View Details"" link should be displayed
#9. Click on ""Special offers"" tab
    #click on tab and verify        //div[@class="tabs-container"]//li[@aria-label="Special offers"]    //ul[@class="offers-list"]
    #change
    click on tab and verify        //*[@id="initOffers"]    //ul[@class='specialofferlist']

#10. Click on Reviews tab
    #click on tab and verify        //div[@class="tabs-container"]//li[@aria-label="Reviews"]    //div[@id="BVRRContainer"]
    #change
    click on tab and verify        //*[@id="initReviews"]    //div[@id="BVRRContainer"]

#11. Click on 'Customize & buy' button for the CTO
    Add CTO Product and verify Configurator Screen  ${cto_add_customize_btn}     ${configurator_add_to_cart_btn}

Validate CTO Configurator page, Attach accessories page
    [Tags]  WEB
    #1. Browse for an Color swatch CTO
    Launch ETR Application  ${conf_url}
#    Click On Element    ${iAcceptBtn}
#    run keyword if      '${tech}'=='WEB'    run keywords
#    ...     Select Application Frame     ${frame_SSM}
#    ...     AND     click on element    ${closeForm_SSM}
#    ...     AND     Unselect Frame


    #    1. Browse for an CTO product and click on "Customize & buy"
    #    Ex: https://store.hp.com/us/en/pdp/omen-laptop-17t-gaming-3aw55av-1
    #
    #    Expected Result:
    #    CTO Configurator page should be displayed
    #
    #    2. Verify CTO configurator page
    Verify CTO configurator page    ${locator_addtocart}

    #    3. Verify the CTO Recommended Configurations in configurator page
    Verify the CTO Recommended Configurations

    #    4. Verify that the user is able to click on the below configurations
    Verify user click in configurations

    #    5. Click on 'Compare options'
    Click On Element    ${locator_compareoption}
    Verify Element Exists       ${locator_comparewindow}
    capture page screenshot

    #    6. Click on X in 'Compare recommended configurations' window
    Click On Element        ${locator_comparewindowclosebtn}
    #scroll to element in view   //*[@id="label_span_HardDrive_HardDrive_2"]

    #    7. Select few components in configurator page which shows $0.00
    #    Expected Result:
    #    Component should be selected and component price should display 'Included in price' text
    #    8. Verify the CTO price after selecting component with $0.00 price
    #    Expected Result:
    #    CTO price should not be updated when Component with $0.00 is selected
    #    9. Go to Accessories/'Popular, useful and fun software' section in Configurator page and select few of them
    #    Expected Result:
    #    Selected accessories should be shown in Specs section and product price should be updated
    #    10. Modify few configurations/components in configurator page
    #    Expected Result:
    #    Selected configuration/component should be shown under 'Specs' and price should be updated
    #    11. Click on 'ADD TO CART' button in Configurator page after updating configurations

   #commented  Click On Element    ${locator_addtocart}
    sleep   10
    Verify Element Text     //h2[@id='accTitle']    Accessories for your PC

    #    12. Click on 'ADD TO CART' button for multiple Accessories
    Verify add to cart for multiple Accessories     ${locator_acclist}  ${locator_productsummary}

    #    13. Click on 'Remove' for an accessory from the 'Cart summary'
    Verify remove from cart summary     ${locator_acclist}  ${locator_productsummary}

    #    14. Click on Details for an accessory
    Verify details for accessory     ${locator_acclist}
    #    15. Click on 'VIEW CART & CHECK OUT'
    Click On Element        //a[text()='VIEW CART & CHECK OUT ']
    #    16. Verify the CTO price in Configurator page and Cart page
    #    Expected Result:
    #    CTO price should be same in Configurator page and Cart page
    #    17. Verify the Sub-total price in Cart
    #    Expected Result:
    Verify the Sub-total price in Cart      ${locator_xcartproduct}
    #    Sub-total price should be the sum of the individual products price in the cart
    #    18. Verify the Sub-total price, TOTAL, CART TOTAL prices in Cart
    Verify the Sub-total price, TOTAL, CART TOTAL prices in Cart   ${cartTotal}     ${cartSubtotal}    ${cartSliderTotal}

    #    19. Click on 'View/edit customization' link for CTO product
    Verify View/edit customization for CTO          ${locator_viewedit_link}    ${locator_cusimg}    ${locator_edit_link}

    #    20. Verify the configurations shown in Cart page is same as configurator page
    #    Expected Result:
    #    Configurations should be same in Cart page and CTO configurator page
    #    21. Click on 'Edit your configuration'
    #   Verify edit your configuration      ${locator_edit_link}    ${locator_addtocart}

    #    22. Modify few configurations/components in configurator page
    #    Expected Result:
    #    Selected configuration/component should be shown under 'Specs' and price should be updated
    #    23. Click on 'Update Configuration'
    #   Click On Element      ${locator_addtocart}
    #    Expected Result:
    #    CTO Accessories page should be displayed if available if not Cart page should be displayed
    #    24. Click on 'View/edit customization' link for CTO product
    #    Expected Result:
    #    CTO configurations should be displayed
    #    25. Verify for the Updated configuration in Step 18
    #    Expected Result:
    #    Updated configuration in Step 18 should be displayed



