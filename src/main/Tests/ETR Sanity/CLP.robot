*** Settings ***

Resource  ../../../main/Common Application Methods/commonMethods.robot
Variables    ../../../../Test Data/Variables.py
Variables       ../../../../Conf/conf.py
Variables       ../../../main/Page Objects/CLP/CLPCommon.py
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
    run keyword if      '${tech}'!='WEB'     import Variables     ${CLPPOFiles}/CLPMobile.py
    ...     ELSE       import Variables     ${CLPPOFiles}/CLPWeb.py

*** Test Cases ***
####################################       Test Cases for CLP PAGE Page        ####################################
Verify CLP Page Features
    [Tags]  WEB     MOBILE
    #Step 1: Launch the application in appropriate device/desktop
    #run keyword if     "${tech}" == "MOBILE"       Initiate Appium
    #log to console      ${name}
    Launch ETR Application  ${url}
    Click On Element    ${iAcceptBtn}
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Select Application Frame     ${frame_SSM}
    ...     AND     click on element    ${closeForm_SSM}
    ...     AND     Unselect Frame
    #Step 1a: Click on submenu
    Click On Menu Submenu   ${shop_menu_locator}    ${submenu_laptop_locater}

    #Step 2: Verify Red Banner is being displayed
    Verify Banner    ${img_red_banner}  "Red"

    #Step 3:Validate Breadcrumb shown on top
    Validate Breadcrumb     ${breadcrump_locator}   ${breadcrump_items}

    #Step 4: Validate the CLP banner
    Verify Banner   ${img_hero_banner}  "CLP"

    # Step 5: Validate the intel logo below
    Validate the intel logo  ${intel_logo}

    # Step 6:

    #Step 7: Verify the models in lifestyle section
    Verify the Models and Validate    ${lifestyle_section}  ${lifestyle_section_text}

    #Step 8: Validate the Products name, image, Starting at Price and Shop now link of life style models
    Verify Product Details In Landing Page  ${product_section_landing}
    sleep   2
    #Step 9: Verify the Innovation banner
    Verify CLP Banner   ${img_innovation_banner}
   # Verify Banner   ${img_innovation_banner}  "Innovation"
    Verify Element Exists   ${shop_link_innovation}

    #Step 10:Verify the products under ""Shop"" section
    Verify the products under Shop section     ${product_section_shop}
    Verify Element Exists   ${locator_corosel_next}

    #Step 11: Validate the products under bottom Espot
    Validate the products under bottom Espot    ${espot_section}

Verify CLP Link
    [Tags]  WEB     MOBILE
    #    "1. Launch storefront URL
    #run keyword if     "${tech}" == "MOBILE"       Initiate Appium
    Launch ETR Application  ${url}
    Click On Element    ${iAcceptBtn}
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Select Application Frame     ${frame_SSM}
    ...     AND     click on element    ${closeForm_SSM}
    ...     AND     Unselect Frame

    #    2. Go to Desktops CLP page by clicking on Desktops under header Shop-->Shop PCs
    Click On Menu Submenu   ${shop_menu_locator}    ${submenu_desktop_locator}
    Capture Page Screenshot

    #    3. Validate 'Shop' link of first CLP Hero banner
    Validate Shop link in banner      ${hero_banner_1}

    #   4. Navigate back to the CLP Page
    Go Back

    #   5. Repeat 3-4 steps for all Hero Banners
    Validate Shop link in banner      ${hero_banner_2}
    Go Back
    sleep   1
    Validate Shop link in banner      ${hero_banner_3}
    Go Back

    #    6. Validate the 'Shop' link under ""Featured tiles""
    #    Expected Result:
    #    The link should be clickable and redirect to respective page without error.
    #    If the page redirect to store URL update to Test environment.
    #    7. Navigate back to the CLP Page
    #    Expected Result:
    #    CLP page should be displayed
    #    8. Repeat 6-7 steps for all Featured Tiles
    #    Expected Result:
    #    All steps should pass

    #    9. Click on the 'Shop now' link under ""Life style"" section
    Validate Shop link in banner        ${shop_now_lifestyle}

    #    10. Navigate back to the CLP Page
    Go Back

    #    11. Validate the 'View All' link under Life style
    Validate the View All link under Life style     section1

    #    12. Navigate back to the CLP Page
    Go Back

    #    13. Repeat step 11-12 for few more 'View All' link under Life style
    Validate the View All link under Life style     section2
    Go Back

    Validate the View All link under Life style     section3
    Go Back

#    Validate the View All link under Life style     section4
#    Go Back

    #    14. Validate the 'Shop' link under Innovation banner
    Validate the Shop link under Innovation banner    ${shop_link_innovation}
    #    15. Navigate back to the CLP Page
    Go Back
    #    16. Validate the 'Shop now' link under ""Shop"" section

    Validate the products under Shop section     (${product_section_shop})[5]

    #    17. Navigate back to the CLP Page

    Go Back

    #    18. Repeat step 16-17 for few more 'Shop now' link under ""Shop"" section

    Validate the products under Shop section     (${product_section_shop})[6]
    Go Back
    Validate the products under Shop section     (${product_section_shop})[7]
    Go Back
    sleep   2

    #    19. Click on the first 'Shop' link under bottom eSpot
    Validate Shop link in banner    (${espot_section})[1]//a[text()="SHOP"]

    #    20. Navigate back to the CLP Page
    Go Back
    #    21. Repeat step 19-20 for other 'Shop' link under bottom eSpot
    Validate Shop link in banner    (${espot_section})[2]//a[text()="SHOP"]
    Go Back
