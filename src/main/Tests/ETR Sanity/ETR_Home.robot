*** Settings ***

Resource  ../../../main/Common Application Methods/commonMethods.robot
Variables    ../../../../Test Data/Variables.py
Variables       ../../../../Conf/conf.py
Variables       ../../../main/Page Objects/Home/homeCommon.py
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
    # Empty Directory     D:\\Users\\VansilAk\\Desktop\\etr\\ETR - Demo\\AllScreenCaptures
     Empty Directory  ${CURDIR}${/}/AllScreenCaptures


SetupSuite
    Clear existing images
    run keyword if      '${tech}'=='MOBILE'    import library   AppiumLibrary
    ...     ELSE       import library       SeleniumLibrary
    run keyword if      '${tech}'!='WEB'     import Variables     ${homePagePOFiles}/homeMobile.py
    ...     ELSE       import Variables     ${homePagePOFiles}/homeWeb.py

*** Test Cases ***
#####################################       Test Cases for Home Page        ####################################
Verify Home Page Features
    [Tags]  WEB     MOBILE
   # Step 1: Launch the application in appropriate device/desktop
    #run keyword if     "${tech}" == "MOBILE"       Initiate Appium
    Launch ETR Application  ${url}
#    Click On Element    ${iAcceptBtn}
#    run keyword if      '${tech}'=='WEB'    run keywords
#    ...     Select Application Frame     ${frame_SSM}
#    ...     AND     click on element    ${closeForm_SSM}
#    ...     AND     Unselect Frame
    #Step 2: Verify Red Banner is being displayed
    Verify Element Exists   ${img_red_banner}
    sleep   2s
    #Step 3: Verify Home Banner is being displayed
    Verify Element Exists   ${img_hero_banner}

    #Step 4: Verify Feedback Image is being displayed
    Verify Element Exists   ${feedback_img}
    #Step 5: Click on the Feedback Image
    click on element    ${feedback_img}
    #Step 6: Verify and Clode feedback form. As feedback form is inside the frame so switching to frame and then unselect frame once done
    Select Application Frame     ${frame_FeedbackForm}
    Verify Element Exists   ${feedbackForm}
    Scroll To Element In View   ${feedbackForm_CloseBtn}
    click on element    ${feedbackForm_CloseBtn}
    Unselect Application Frame

#    Sleep   5s
#    #Step 7: Verify Shopping Assistant is visible on the screen
    Verify Element Exists       ${lbl_shoppingAssistant}
    #Step 8: Verify Featured products section is being displayed with more than 1 section
    Verify Featured Products Section alog with Product Counts   ${featuredProducts}     ${featuredProductsSection}
    #Step 9: Verify the visiblity of product details for the featured product section
    Verify Product Details for Featured Products      ${featuredProductsSection}
    #Step 10: Click on the view details link for the first product and verify view details is displayed
    run keyword if  '${tech}'!='WEB'     Scroll To Element In View   ${viewDetails}
    Click Element Using JavaScript       ${viewDetails}
    Page Should Not Contain Element     ${featuredProducts}
    #Step 11: Go back to Home Page
    Go Back
    run keyword if  '${tech}'!='WEB'     Scroll To Element In View   ${featuredProducts}
    verify element exists       ${featuredProducts}
    #Step 12: Verify the Banner Top sellers displayed on the screen
    run keyword if  '${tech}'!='WEB'     Scroll To Element In View   ${topSellerPanel}
    sleep   2s
   # Verify Element Exists       ${topSellerPanel}
    sleep   3s
    #Step 13: 'Top sellers' section should be displayed with products and Carousel arrow on left & right if more than 3 products
    #Verify Product Details for Top Sellers Products      ${topSellerProductSection}

#####################################       Test Cases for Home Page        ####################################
Validate Home Page links And Cart to Cart from Top Seller
    [Tags]  WEB     MOBILE
    Launch ETR Application  ${url}
#    Click On Element    ${iAcceptBtn}
#    run keyword if      '${tech}'=='WEB'    run keywords
#    ...     Select Application Frame     ${frame_SSM}
#    ...     AND     click on element    ${closeForm_SSM}
#    ...     AND     Unselect Frame
    #Step 2: Click on the Shop link of Hero Banner
#     Wait Until Element Is Visible    ${shop_banner_links}   20
#     Click Link    ${shop_banner_links}
#     #Step 3: Navigate to home page
#     Go Back
#     #Step 4: Click on the Shop link of another  Hero Banner
#     Click On Element    ${shop_banner_link}
#     #Step 5: Navigate to home page
#     Go Back
#     sleep      1s
#     #step 8 click on shopping assitance link
    # Click On Element       ${shopping_ass_link}
     #step 9 Navigate to Home page
    # Go Back
     #step 10 Repeat clicking on shopping assitance link
     Click On Element       ${shopping_link}
      Go Back
     #step 11 Verify on clicking first product name feature products
     Click On Element       ${viewDetails}
    #step 12 Navigate to Home page
     Go Back
    #step 13 Repeate Steps
     #Go Back
     #step 14 Click on the first shop link in banner espot
    # Click On Element       ${banner_espot_link}
      #step 15 Navigate to Home page
      #step 16 Repeate Steps
      #step 17 Repeate Steps
      sleep     2s
      #Click On Element      ${top_seller_link}
      # step 18 Navigate to Home Page
      Go Back


