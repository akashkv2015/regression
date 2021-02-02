
*** Settings ***

Resource  ../../../main/Common Application Methods/commonMethods.robot
Variables    ../../../../Test Data/Variables.py
Variables       ../../../../Conf/conf.py
Variables       ../../../main/Page Objects/PDP/PDPCommon.py
Variables       ../../../main/Page Objects/commonPageObjects.py
Library  OperatingSystem
Library  DependencyLibrary
Library  Process

Suite Setup  SetupSuite
Suite Teardown  Browser Close
Test Setup      Set screenshot directory    ${CURDIR}${/}./Report./${TEST_NAME}


#Test Teardown   Run Keyword If Test Failed    Capture Page Screenshot
Test Teardown       run keywords
...     TakeScreenshot
...     Close Browser

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

TakeScreenshot
     Run Keyword If Test Failed       Capture page screenshot    filename=${SUITE_NAME}-{index}.png
#        ...        Close Browser

SetupSuite
    Clear existing images
    run keyword if      '${tech}'=='MOBILE'    import library   AppiumLibrary
    ...     ELSE       import library       SeleniumLibrary
    run keyword if      '${tech}'!='WEB'     import Variables     ${PDPPOFiles}/PDPMobile.py
    ...     ELSE       import Variables     ${PDPPOFiles}/PDPWeb.py

*** Test Cases ***
#####################################       Test Cases for PDP Page        ####################################

#################### Verify STO PDP ####################################################################################
Verify STO PDP
    [Tags]  WEB     MOBILE
    Launch ETR Application  ${pdp_url1}
    Click On Element    ${iAcceptBtn}

    Capture Page Screenshot

   # Verify the Product details
    Verify Product Name     ${STO_product}
    #Image - Full images and thumbnail images
    Verify Full Image and Thumbnail Image   ${Sto_image}
    #Videos - Thumbnail video image and on clicking thumbnail full video should
    #  be displayed (Configurable if not available make it as warning)
    #Verify Thumbnail Full Video   ${sto_thumbnail}
    #Ratings and Reviews with 'Write a review' option
    Verify Ratings and Reviews option     ${Sto_ratings}
    #SKU ID
    Verify SKU ID    ${STO_SKUID}
    #ENERGY STAR (If available)
#    Verify Energy Star    ${Sto_energy}
#    #Key selling points (KSP) and 'See all Specs' link
    Verify Key Selling point and see all specs link  ${Sto_ksp}
    Verify Element Exists   ${Sto_spec}
    #Price shown with $ superscript
    Verify Price superscript for STO   ${Sto_price}
    #Loyalty message "Earn XXX HP Reward points"
    Verify Loyalty Message For STO Product  ${Sto_reward}
    #'Add to Cart' button
    Verify Add To Cart For STO Product   ${Sto_add_cart}
    #3. Verify for the "Registered & TM" symbols in the Key selling points
    # 4. Validate Breadcrumb shown on top
    sleep       2s
    Verify BreadCrumb for STO PDP    ${STO_PDPbreadcrumb}
    #5. Click on "Add to cart"
    Verify Add To Cart For STO PDP Product  ${STO_Add_product}   ${STO_product}
    #6. Click on the Features tab
    Verify Features Tab For STO PDP Product    ${Sto_feature}  ${Sto_superscript}
    Verify Element Exists  ${avail_sto_features}
#    #7. Verify 'You might also be interested in..." section
    Verify You might also be interested in section   ${interested_prod}   ${int_price}  ${Sto_viewlink}
    #8. Click on the Specs tab
    Verify Specs Tab For STO PDP   ${sto_spec}   ${prod_specification}
    ${handle} =    Switch Window   Current
    Click Element   ${datatsheet}
    sleep  5
    ${titles}=     Get Window Titles
    Log To Console   ${titles}
    Switch Window  ${handle}
#    @{windows}=  List windows
#    Select Window   @{windows}[0]
    sleep      5
#    sleep  5
    #9. Click on the Accessories tab
#    Go To   ${pdp_url1}
#    sleep   5
    Verify Accessories Tab     ${Accessory_tab}      ${browse_accessories}
    # 10. Click on "Add to cart" for an product under accessories
    Verify Add To Cart for an product under accessories   ${add_access_prod}   ${aaccess_item_locator}
    #11. Click on 'Add to Cart' for any Browse Accessories product
    #Verify Add to Cart for any Browse Accessories product   ${Sto_browse_add}   ${Sto_browse_cart}
    #12. Click on "Special offers" tab
    Verify Special offers tab for STO PDP    ${Sto_special_offer}  ${offer_list}
    #13. Click on Support tab
    Verify Support tab for STO PDP    ${Sto_support}    ${Sto_support_hp}
    #14. Click on Reviews tab
    Verify Reviews tab For STO PDP     ${Reviews_stoTab}  ${views_Review}

############Validate ESD PDP ###################################################################################
Verify ESD PDP
    [Tags]  WEB     MOBILE
    Launch ETR Application  ${pdp_esd_url}
    Click On Element    ${iAcceptBtn}

    Capture Page Screenshot
    #2. Verify the Product details
    Verify ESD Product Name  ${esd_product_name}
    #Image
    Verify ESD Product Image        ${esd_product_image}
    #Ratings and Reviews with 'Write a review' option
    Verify ESD Ratings and Reviews   ${esd_rating}
    #SKU ID
    Veriy ESD SKU ID          ${esd_Sku}
    #Key selling points (KSP) and 'See all Specs' link
    Verify KSP For ESD Product    ${esd_ksp}
    Verify Element Exists    ${esd_specs}
    # Price shown with $
    Verify Price superscript for ESD   ${esd_price}
    #'Add to Cart' button
    Verify Add To Cart Button For ESD    ${esd_add_tocart}
    #'Digital Download' link
    Verify Digital Download link     ${digital_link}
    #3. Click on "Digital Download"
    Validate Digital Download       ${digital_link}    ${esd_faq}
    #4. Click on the Features tab
    Verify Features Tab For ESD      ${esd_features}
    sleep  2
    Verify Element Exists       ${return_feature}
    #5. Click on the Specs tab
    Verify Spec Tab For ESD     ${esd_spec}
    Verify Element Exists    ${spec_feature}
    #6. Click on "Special offers" tab
    #7. Click on Reviews tab
    Verify Reviews Tab For ESD     ${esd_review}
    Verify Element Exists    ${list_reviews}
    sleep  1
    #8. Click on "Add to cart"
    Verify ADD To Cart Functionality   ${esd_add_tocart}
    Verify Element Exists     ${esd_prod_added}


#########Validate Bundle PDP#######
Verify Bundle PDP
    [Tags]  WEB     MOBILE
    Launch ETR Application  ${pdp_bundle_url}
    Click On Element    ${iAcceptBtn}

    Capture Page Screenshot

    #2. Verify for the Bundle product details in PDP
    #Name
    Verify Bundle Product Name   ${bundle_prd_name}
    #Ratings and Reviews with 'Write a review' option
    Verify Ratings and Reviews For Bundle Product    ${bundle_rating}
    #SKU ID
    Verify SKU ID For Bundle Product        ${Bundle_SKU}
    #Key selling points (KSP) and 'See all Specs' link
    Verify KSP and Se all Specs For Bundle Product    ${ksp_bundle}
    Verify Element Exists   ${bundle_spec}
    #Price shown with $ superscript
    Verify Price for Bundle Product     ${Bundle_product_price}
    #'Add to Cart' button
    Verify Add To Cart For Bundle Product    ${bundle_cart}
    #4. Verify images
    Verify Images For Bundle Product    ${bundle_images}
    #5. Verify the Carousel arrows for thumbnail image and by clicking thumbnail image corresponding full image should be displayed
    Verify Carousel Arrows For Bundle Product   ${Arrow_enabled}   ${Arrow_disable}

    #6. Click on "Add to cart"
    Verify Add To Cart Functionality for Bundle     ${bundle_cart}
    Verify Element Exists   ${bundle_added}

    #7. Click on the Features tab
    Verify Features Tab For Bundle Product     ${bundle_features}
    sleep  2
    Verify Element Exists     ${features_exist}
    #8. Click on the Specs tab
    Verify Specs Tab For Bundle Product     ${Bundle_spec}   ${prod_spec_bundle}
    ${handle} =    Switch Window   Current
    Click Element   ${Bundle_SKU_data}
    sleep  5
    ${titles}=     Get Window Titles
    Log To Console   ${titles}
    Switch Window  ${handle}
    #12. Click on Reviews tab
    Verify Reviews Tab For Bundle Product  ${bundle_review}   ${Review_ver}
###########################################################################################
Verify for eCarepack product and Add to cart feature
    #    1. Browse storefront url
    [Tags]  WEB     MOBILE
    #Step 1: Launch the application in appropriate device/desktop
    #run keyword if     "${tech}" == "MOBILE"       Initiate Appium
    Launch ETR Application  ${url}
    Click On Element    ${iAcceptBtn}
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Select Application Frame     ${frame_SSM}
    ...     AND     click on element    ${closeForm_SSM}
    ...     AND     Unselect Frame
    #    2. Enter a eCarepack SKU ID in search bar & click on the search icon
    #    Ex: U7897E, UE373E
    Search SKU      ${eCarepack_product_item}   ${locator_searchbox}
    #    Expected Result:
    #    eCarepack PDP should be displayed
    #    3. Verify product details
    Verify the details displayed in PDP     ${locator_pdpSection}

    #    4. Verify the Breadcrumb
    Verify BreadCrumblist   ${locator_breadcrumb}

    #    5. Click on "Add to cart" button
    Add to cart and verify eCare    ${locator_addtocart}

    #    6. Enter the any Alphanumeric number with more than 5 characters in the serial number field and click on CONTINUE
    #    Expected Result:
    Enter Value     ${locator_serial_txtbox}    ${eCarepack_product_item}
    Click On Element    ${locator_continue_btn}
    sleep   5s
    #    7. Browse for an 'Compatible Hardware' product and click on 'Add to cart'
    Browse and add Compaitable Hardware     ${capitable_hw_ecare}   ${locator_addtocart}

    #    8. Browse for eCarepack SKU and click on 'Add to cart '
    Browse for eCarepack SKU    ${ecare_url}    ${locator_addtocart_pdp}

    #    9. Select the hardware listed in the window and click on CONTINUE
    Select Hardware and Verify      ${locator_hw}   //a[@id='continueBtn']
