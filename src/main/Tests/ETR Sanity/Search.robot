*** Settings ***

Resource  ../../../main/Common Application Methods/commonMethods.robot
Variables    ../../../../Test Data/Variables.py
Variables       ../../../../Conf/conf.py
Variables       ../../../main/Page Objects/Search/SearchWeb.py
Variables       ../../../main/Page Objects/Search/SearchCommon.py
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
Verify SKU And Keyword Search
    [Tags]  WEB     MOBILE
    #Step 1: Launch the application in appropriate device/desktop
    #run keyword if     "${tech}" == "MOBILE"       Initiate Appium
    Launch ETR Application  ${Uat_url}

    #Step 2: Verify STO PDP is being displayed
     Search STO SKUID        ${txt_search_textbox}       ${sto_product_item}
    #Step 3: Navigate to home page
     Go Back
     #Step 3: Verify CTO PDP is being displayed
     Search CTO SKUID         ${txt_search_textbox}       ${cto_product_item}
      #Step 4: Navigate to home page
     Go Back
     #Step 5: Verify Search Result Pge with results
     Search Any Keyword     ${txt_search_textbox}      ${anyText}


##################################### Validate Facets & Filters in Search Results Page #######################
Validate Facets and filters Search
    [Tags]  WEB     MOBILE
#Step 1: Launch the application in appropriate device/desktop
    #run keyword if     "${tech}" == "MOBILE"       Initiate Appium
    Launch ETR Application  ${uat_url}
#    Click On Element    ${iAcceptBtn}
#    run keyword if      '${tech}'=='WEB'    run keywords
#    ...     Select Application Frame     ${frame_SSM}
#    ...     AND     click on element    ${closeForm_SSM}
#    ...     AND     Unselect Frame

#Step 2:Enter any keyword and click o searh icon
     Search Any Keyword     ${txt_search_textbox}      ${anyText}

#Step 3: Verify Category under filter tab and select dropdown
     Verify Category and dropdown        ${category_txt}     ${category_dropdown}

#Step 4: Select on any category displayed
    Sleep  2s
    Scroll To Element In View   ${LaptopsTablets}
    Wait Until Element is Visible  ${LaptopsTablets}
    Click Element  ${LaptopsTablets}
    Verify Element Exists  ${LaptopsTabletsFacetCrumb}

#Step 5: Select few facets and verify breadcrumb and facet trial
    Verify BreadcrumbandFacettrial in Search  ${FacetCrumbWrapper}

#Step 6: Verify results after selecting facets
    Verify Facet_Selection_Results in Search  ${SaleFacetCrumb}

#Step 7: Click on 'Clear all' in Filters
    Verify ClearAllFacets_inFilters in Search  ${ClearALlFilters}




###################################Validate Compare option in Search Results Page###################################
Validate Compare option in Search Results Page
    [Tags]  WEB     MOBILE
    #Step 1: Launch the application in appropriate device/desktop
    #run keyword if     "${tech}" == "MOBILE"       Initiate Appium
    Launch ETR Application  ${Uat_url}
#    Click On Element    ${iAcceptBtn}
#    run keyword if      '${tech}'=='WEB'    run keywords
#    ...     Select Application Frame     ${frame_SSM}
#    ...     AND     click on element    ${closeForm_SSM}
#    ...     AND     Unselect Frame
    #2. Click on Search bar > Enter any keyword in search field and click on search icon
    Verify Search Result Page  ${searched_value}

    #3. Verify Compare tab on left rail
    Verify Compare Tab   ${compare_tab}
    #4. Click on Compare for a STO product & 2 CTO products
    Verify STO_CTO Comparison   ${StoFst_link}   ${Sto_sec_link}  ${Cto_link}
    #5. Verify COMPARE button in Compare tab
    Validate Compare Button  ${Compare_Button}
    sleep  2
    #6. Click on COMPARE
    Verify Compare Popup   ${Compare_Button}
    #7. Click on ""ADD TO CART""
    Verify ComparePopup AddToCart   ${Comapare_addtocart}
    #8. Click on X for a product in 'Compare products' window
    Remove Product From_Compare_Popup   ${Remove_product}
    #9. Click on X in 'Compare products' window
    Click On Element    ${ComparePopUpClose}
    Log to Console      Compare products Popup Window is Closed
    #10. Click on X for a product in Compare tab
    Remove Product From_Compare_Tab      ${ProductCardClose}
    #11. Click on 'Clear all' in Compare tab
    Verify ClearAll Link     ${ClearAllLink}

#########################  Validate Search results page & sorting  ##############################################
TC_Validate_SearchResultPage_Sorting
#1. Launch the Storefront URL
    Launch ETR Application  ${uat_url}
#    Click On Element    ${iAcceptBtn}
    Log to Console    "Storefront Home page is displayed"

#2. Click on Search bar > Enter any keyword in search field and click on search icon
    Verify Search_Results   ${SearchBarTextbox}

#3. Verify "Sort by:" in SRP
#4. Verify the options displayed under 'Sort by:'
    Verify SortBy DropDown  ${SortBy}
    sleep   2

#5. Select "Highest price" from dropdown
    Select From List by Label    ${sortbyMenu}      Highest price
    List Selection Should Be     ${sortbyMenu}      Highest price
#6. Verify the details for the Product in Search Result Page
    Validate Product Details      ${ProductDetails}

#7. Verify for the "Registered & TM" symbols in the Key selling points
    #Verify Registered & TM" symbols    ${RegisteredSymbol}
    sleep  3s

#8. Click on 'Tech spec'
    mouse over    ${TechSpec}
    Click Element  ${TechSpec}
    Log to Console  "Pop up window is displayed with Product specification details"

#9. Click on X icon on the Tech Spec pop up
    Click Element  ${TechSpecClose}
    Log to Console  "Pop up is closed"
    Sleep  4s

#10. Verify 'See all offers' when user hover on it
    Verify See All Offers   ${SeeAllOffers}

#11. Mouse hover on ‘Earn 3% in HP Rewards with purchase’ & verify the loyalty message in the pop up
#    Verify ToolTip Content   ${HpPurchaseRewards}

#12. Click on "LOAD MORE"
    Verify LoadMore Button    ${LoadMoreButton}

#13. Click on "ADD TO CART" for STO product
    Verify AddToCart_STO_SearchPage        ${AddToCart_STO}

#14. Click on "Customize & Buy" for CTO product
#    Verify CTO_SearchPage      ${CTOCustnBuyButton}

# Step 6 Continued....."PRIVATE STORE EXCLUSIVE PRICE" should be displayed above the price if available for Private store users
    Login to Private application    ${SignIn}
#    Go To   ${url}

