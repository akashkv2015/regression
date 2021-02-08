*** Settings ***

Resource  ../../../main/Common Application Methods/commonMethods.robot
Variables    ../../../../Test Data/Variables.py
Variables       ../../../../Conf/conf.py
Variables       ../../../main/Page Objects/MDP/MDPCommon.py
Variables       ../../../main/Page Objects/commonPageObjects.py
Library  OperatingSystem
Library  DependencyLibrary
Library  Process

Suite Setup  SetupSuite
Suite Teardown  Browser Close
Test Teardown   Browser Close

*** Variables ***

*** Keywords ***
Browser Close
    run keyword if     "${tech}" == "MOBILE"       Quit Application
    ...     ELSE        Close Browser

Clear existing images
    [Tags]  folder  cleanup
    [Documentation]  folder  cleanup
    Empty Directory     ${CURDIR}${/}/AllScreenCaptures



SetupSuite
    Clear existing images
    run keyword if      '${tech}'=='MOBILE'    import library   AppiumLibrary
    ...     ELSE       import library       SeleniumLibrary
    run keyword if      '${tech}'!='WEB'     import Variables     ${MDPPOFiles}/MDPMobile.py
    ...     ELSE       import Variables     ${MDPPOFiles}/MDPWeb.py

*** Test Cases ***
#####################################       Test Cases for Home Page        ####################################
Verify Options From MDP Page
    [Tags]  WEB     MOBILE
    [Documentation]     Validate 'Add to cart' & 'Customize & buy' options from MDP
    #Step 1: Launch the application in appropriate device/desktop
    #run keyword if     "${tech}" == "MOBILE"       Initiate Appium
    Launch ETR Application  ${mdp_url}
    Click On Element    ${iAcceptBtn}
    #Step2: Click on to Buy Link available on the screen
    run keyword if  '${tech}'!='WEB'    Click On Element    ${feature_back}
    Click On Element    ${buyLink}
    Verify Element Exists   ${viewalloptions}
    #Step 3: Verify All the Product Details on the MDP Product Page
    sleep   3s
    Verify Product Details for the products to Buy on MDP Page      ${productSections}
    #Step 4: Add STO Product to Cart and Verify it is added to Cart
    Add STO Product to Cart and Verify      ${stoProduct}   ${stoProductName}
    #Step 5: Click on the CTO Product
    Sleep   10
    run keyword if  '${tech}'!='WEB'        Scroll To Element In View   ${ctoProduct}
    Add CTO Product and verify Configurator Screen      ${ctoProduct}       ${ctoAddToCartBtn}
    #Step 6: Add CTO Product to Cart
    Click On Element        ${ctoAddToCartBtn}
    #Step 7: Click on View Cart and Checkout Button
    Sleep   5
    Click On Element    ${viewCartAndCheckout}
    run keyword if  '${tech}'!='WEB'    Click On Element    ${checkout}
    #Step 8: Click on Checkout as Guest Button
    Click On Element    ${chkOutAsGuest}

######################################       Test Cases for Validate MDP Features        ####################################
TC_Validate_MDP_features
#1. Browse for an MDP page
    Launch ETR Application  ${mdp_Fea_url}
    Click On Element    ${iAcceptBtn}
    capture page screenshot     ${CURDIR}${/}/AllScreenCaptures/MDPPage.png
    Log to Console     "MDP Page is Displayed and Screenshot is Captured"

#2. Validate Breadcrumb shown on top
    Verify Breadcrumb    ${BreadCrumb}

#3. Validate the Features tab
    Verify Features Tab   ${FeaturesTabSection}

#4. Click on Buy tab
    Click on Buy Tab    ${BuyTab}

#5. Verify Product details displayed
    Validate Product Details      ${ProductDetails}
    Login to Private application    ${SignIn}
    Go To   ${mdp_buy_url}

#6. Verify for the "Registered & TM" symbols in the Key selling points
    Verify Registered & TM" symbols  ${RegisteredSymbol}

#7. Click on 'Tech spec'
    #Wait Until Element Is Visible   ${TechSpec}
    mouse over    ${TechSpec}
    #Click Element Using JavaScript    ${TechSpec}
    Click Element  ${TechSpec}
    Log to Console  "Pop up window is displayed with Product specification details"

#8. Click on X icon on the Tech Spec pop up

    Click Element  ${TechSpecClose}
    Log to Console  "Pop up is closed"

#9. Verify 'See all offers' when user hover on it
    Verify See All Offers   ${SeeAllOffers}

#10. Mouse hover on â€˜Earn 3% in HP Rewards with purchaseâ€™ & verify the loyalty message in the pop up
    Verify ToolTip Content   ${HpPurchaseRewards}

################################# Validate Compare option in MDP  #######################################

TC_Validate_Compare_Option_in_MDP
#1. Browse for an MDP page
    Launch ETR Application  ${mdp_Fea_url}
    Click On Element    ${iAcceptBtn}
    capture page screenshot     ${CURDIR}${/}/AllScreenCaptures/MDPCompare.png
    Log to Console     "MDP Page is Displayed and Screenshot is Captured"

#2. Click on Buy tab
    Click on Buy Tab    ${BuyTab}

#3. Click on Compare for 3 products
    Verify Compare_Products_in_MDP     ${MDPCompareSection}

#4. Verify Compare window by clicking on upward arrow
    Verify UpwardArrow_MDPCompareWindow    ${ToggleButtonCompareWindow}

#5. Verify the specifications displayed for products
    Verify Product_Spec_MDPCompareWindow     ${ToggleButtonCompareWindow}

#6. Click on Remove for an product
    Verify RemoveLink_MDPCompareWindow      ${RemoveLinkCompareWindow}

#7. Click on 'Clear all'
    Verify ClearAll_MDPCompareWindow     ${ClearAllCompareWindow}

    sleep   2

#PRIVATE STORE EXCLUSIVE PRICE label for applicable products  (Step 5 Continuation)
    Login to Private application    ${SignIn}
    #Go To   ${mdp_buy_url}




