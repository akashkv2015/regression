*** Settings ***

Resource  ../../../main/Common Application Methods/commonMethods.robot
Variables    ../../../../Test Data/Variables.py
Variables       ../../../../Conf/conf.py
Variables       ../../../main/Page Objects/PLP/PLPCommon.py
Variables       ../../../main/Page Objects/PLP/PLPWeb.py
Variables       ../../../main/Page Objects/commonPageObjects.py
#Variables       ../../../main/Page Objects/MDP/MDPCommon.py
#Variables       ../../../main/Page Objects/MDP/MDPWeb.py
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
    ...     ELSE         Close Browser

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
#####################################       Validate View All Page & sorting       ####################################
TC_Validate_ViewAllPage_Sorting
#1. Browse 'View ALL'/PLP URL
    Launch ETR Application  ${plp_url}
    Click On Element    ${iAcceptBtn}
    capture page screenshot   ${CURDIR}${/}/AllScreenCaptures/PlPPage.png

    Take screenshot

#2. Verify ""Sort by:"" in PLP
#3. Click on the Sort by dropdown & verify the options displayed
    sleep       1s
    Verify SortBy DropDown      ${SortBy}
   # sleep       1s

#4. Select ""Lowest price"" from dropdown
    Select From List by Label   ${sortbyMenu}   Lowest price
    sleep       1s
    List Selection Should Be    ${sortbyMenu}   Lowest price
    #Select From List By Value   name:orderBy  6
    #sleep   2s
    #List Selection Should Be  name:orderBy   3

#5. Verify the details for the Product in PLP
    sleep       1s
    Ensure Product Details         ${ProductDetails}
    #sleep       1s
    Login to Private application        ${SignIn}
    Go To   ${plp_url}

#6. Click on ""LOAD MORE"" at the bottom
    Verify LoadMore Button    ${LoadMoreButton}

#####################################  Validate Compare option in View ALL page       #################################
TC_Validate_Compare_option_in_ViewALLpage

#1. Browse 'View ALL'/PLP URL
    Launch ETR Application  ${plp_url}
    Click On Element    ${iAcceptBtn}
    capture page screenshot   ${CURDIR}${/}/AllScreenCaptures/PLP2Page.png

#2. Click on Compare on left rail & verify Compare tab
    Verify Compare Tab   ${CompareTab}

##3. Click on Compare for 2 STO & 1 CTO products
    Verify Comparison STO_CTO   ${CTOCompareLink}

#4. Verify COMPARE button in Compare tab
    Validate Compare Button     ${CompareButton}

#5. Click on COMPARE
    Verify Compare Popup    ${CompareButton}

#6. Click on "ADD TO CART"
    Verify ComparePopup AddToCart    ${AddToCartonPopUp}

#7. Click on X for a product in 'Compare products' window
    Remove Product From_Compare_Popup     ${ProductCardPopupClose}

#8. Click on X in 'Compare products' window
    Click On Element    ${ComparePopUpClose}
    Log to Console      Compare products Popup Window is Closed

#9. Click on X for a product in Compare tab
    Remove Product From_Compare_Tab     ${ProductCardClose}

#10. Click on 'Clear all' in Compare tab
    Validate ClearAll Link      ${ClearAllLink}
###########################  Validate STO "Add to Cart" and CTO 'Customize & buy' from PLP  ###########################
TC3_Validate_STO_AddtoCart_&_CTO_Customize&buy_from_PLP

#1. Browse PLP page
    Launch ETR Application  ${plp_sto_cto_url}
    Click On Element    ${iAcceptBtn}
    capture page screenshot   ${CURDIR}${/}/AllScreenCaptures/PLP3Page.png
    Log to Console  "PLP Page is Successfully launched and Screenshot is Captured"

#2. Click on ""Add to Cart"" for an STO
#3. Verify the added product in Mini cart
    Verify Elements MiniCartPopup   ${AddToCart_STO}

#4. Click on ""Customize & buy"" for an CTO
    Verify CTO_Config_Page    ${CTOCustnBuyButton}

###########################  Validate Facets & Filters in View ALL page(PLP)  #############################
TC4_Verify_FacetsandFilters_ViewAllPage

#1. Browse 'View ALL'/PLP URL
    Launch ETR Application    ${plp_filters_facets}
    Click On Element    ${iAcceptBtn}
    capture page screenshot   ${CURDIR}${/}/AllScreenCaptures/PLP_FacetsFilters_Page.png
    Log to Console  "PLP Page is Successfully launched and Screenshot is Captured"

#2. Verify filters displayed on left navigation under Filter tab
    Verify Filters_in_PLP    ${BrandFilter}

#3. Select few facets and verify breadcrumb and facet trial
    Verify BreadcrumbandFacettrial      ${InStockCheckbox}

#4. Verify results after selecting facets
    Verify Facet_Selection_Results     ${plp_filtered_url}

#5. Click on 'Clear all' in Filters
    Verify ClearAllFacets_inFilters     ${ClearALlFilters}


