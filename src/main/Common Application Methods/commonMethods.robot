*** Settings ***
Variables  ../../../Test Data/Variables.py
Resource  ../../../src/resources/Keywords/genericEvents.robot
Library  Process
Library  OperatingSystem
Library  String
Library  Collections
#Library           XML    use_lxml=true
#Library     CSVLib

*** Variables ***


*** Keywords ***
Launch ETR Application
    [Arguments]     ${url}
    [Documentation]  Launch the ETR application with url "${url}" and accept Privacy options
    run keyword if     "${tech}" == "MOBILE"    run keywords        Initiate Browser On Android
    ...     AND     Go To Url   ${url}
    ...     ELSE IF     "${tech}" == "MOBILE_EMULATOR"     Initiate MOBILE_EMULATOR_CHROME      Pixel 2 XL     ${url}
    ...     ELSE    run keyword     Launch Web Application      ${url}      ${browser}
    #Capture Element Screenshot      ${iAcceptBtn}       filename=iAcceptButton.png

Verify Featured Products Section alog with Product Counts
    [Arguments]     ${featuredProducts}      ${productsUnderFPSection}
    [Documentation]     Verify if the Featured Products section is being displayed and products are available under Featured Product
    wait until element is visible   ${featuredProducts}       ${Timeout}        "Featured Product Section is not visible"
    ${elementList}=    Get Webelements     ${productsUnderFPSection}
    ${Count}=   Get Length	    ${elementList}
    Run Keyword If  ${Count} > 1    Log     Products Available under Featured Product Section

Verify Product Details for Featured Products
    [Arguments]     ${productSection}
    [Documentation]     Verify the product details displayed on the screen for the products under Featured Products
    ${index}        set variable     0
    ${elemDetails}      Get WebElements    ${productSection}
    log to console      ${elemDetails}
    FOR    ${element}    IN    @{elemDetails}
        Length Should Be    ${element.find_elements_by_xpath(".//a/h4")}    1       "Product Name does not Exists for the Product"
        Length Should Be    ${element.find_elements_by_xpath(".//span[@class='price_info']")}    1      "Price Info for the product is not visible on the screen"
        Length Should Be    ${element.find_elements_by_xpath(".//span[@class='price_amount']")}    1        "Price amount for the product is not visible on the screen"
        Length Should Be    ${element.find_elements_by_xpath(".//a[@class='shop details']")}    1       "View details link is not visible on the screen"
        ${index}        Evaluate         ${index} + 1
    END
    log to console      "Product Information for ${index} products is visible on the screen"

Verify Product Details for Top Sellers Products
    [Arguments]     ${productSection}
    [Documentation]     Verify the product details displayed on the screen for the products under Top Sellers Products
    ${index}        set variable     0
    ${elemDetails}      Get WebElements    ${productSection}
    FOR    ${element}    IN    @{elemDetails}
        Length Should Be    ${element.find_elements_by_xpath(".//a//img")}    1       "Product Image does not Exists for the Product"
        Length Should Be    ${element.find_elements_by_xpath(".//a//div[@class='igo-desc']")}    1       "Product Name does not Exists for the Product"
        Length Should Be    ${element.find_elements_by_xpath(".//div[@class='inventory_holder']//a[@id='add2cart-btn']")}      1       "Add to Cart or Customize Button does not Exists for the Product"
        Length Should Be    ${element.find_elements_by_xpath(".//div[contains(@class,'sale_price')]")}    1      "Price Info for the product is not visible on the screen"
        Length Should Be    ${element.find_elements_by_xpath(".//a[@class='details']")}    1       "View details link is not visible on the screen"
        ${index}        Evaluate         ${index} + 1
    END
    log to console      "Product Information for ${index} products is visible on the screen"

Add STO Product to Cart from Home Page and Verify
    [Arguments]     ${stoProductName}
    [Documentation]     Verify STO product is being added to cart successfully
    ${productName} =    Get Text    ${stoProductName}
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Mouse Over      ${miniCartIcon}
    ...     AND     Verify Element Exists       ${miniCartTitle}
    ...     AND     Element Text Should Be      ${minicartProduct}      ${productName}      "Product Name is not visible on the Mini Cart"



###########################################  For MDP Pages  ###################################################
Verify Product Details for the products to Buy on MDP Page
    [Arguments]     ${productSection}
    [Documentation]     Verify the product details displayed on the screen for the products under Top Sellers Products
    ${index}        set variable     0
    ${elemDetails}      Get WebElements    ${productSection}
#    FOR    ${element}    IN    @{elemDetails}
#        Length Should Be    ${element.find_elements_by_xpath(".//div[@class='productInfo1']//div[@class='pdtImgs-orbit-container']")}    1       "Product orbit container does not Exists for the Product"
#        Length Should Be    ${element.find_elements_by_xpath(".//div[@class='productInfo1']//ol[@class='pdtImgs-orbit-bullets']")}    1       "Bullets to show 360 view of Product does not Exists for the Product"
#        Length Should Be    ${element.find_elements_by_xpath(".//div[@class='productInfo2']//h3/a")}      1       "Product Name is not visible for the product"
#        Length Should Be    ${element.find_elements_by_xpath(".//div[@class='productInfo2']//div[@class='productHdr2']")}      1       "Product Rating details does exists for the product"
#        Length Should Be    ${element.find_elements_by_xpath(".//div[@class='productInfo2']//ul[@class='productFeatLst']")}    1      "Feature List for the product is not visible on the screen"
#        Length Should Be    ${element.find_elements_by_xpath(".//div[@class='productInfo2']//div[@class='pipedInline']")}    1      "Technical Specification for the product is not visible on the screen"
#        Length Should Be    ${element.find_elements_by_xpath(".//div[@class='productInfo3']//div[@class='productPrice']")}    1      "Product price information is not visible on the screen"
#        ${listLength}       Get Length      ${element.find_elements_by_xpath(".//div[@class='productInfo3']//div[contains(@class,'productInv')]//a[@id='add2cart-btn']")}
#        Run Keyword If  ${listLength} < 1   log to console     "Option to Add to Card or Custmize is not visible"
#        ${index}        Evaluate         ${index} + 1
#    END
    log to console      "Product Information for ${index} products is visible on the screen"

Add STO Product to Cart and Verify
    [Arguments]     ${elem}     ${stoProductName}
    [Documentation]     Verify STO product is being added to cart successfully
    ${productName} =    Get Text    ${stoProductName}
    sleep       3s
    click on element    ${elem}
    sleep       3s
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Mouse Over      ${miniCartIcon}
    ...     AND     Verify Element Exists       ${miniCartTitle}
    ...     AND     Element Should Contain      ${minicartProduct}      ${productName}      "Product Name is not visible on the Mini Cart"

Add CTO Product and verify Configurator Screen
    [Arguments]     ${customizeButton}       ${addToCartBtnForCTO}
    [Documentation]     Verify CTO product is opening the Configurator screen after clicking on to Customize Button
    Click Element Using JavaScript   ${customizeButton}
    Verify Element Exists   ${addToCartBtnForCTO}

Enter Contact Information
    [Arguments]     ${firstNameLocator}     ${fisrtNameValue}   ${lastNameLocator}  ${lastNameValue}    ${phoneNumberLocator}
        ...     ${phoneNumberValue}     ${emailAddressLocator}     ${emailAddressValue}
    [Documentation]  "Enter the Contact information of the user"
    run keyword     Enter Value     ${firstNameLocator}    ${fisrtNameValue}
    run keyword     Enter Value    ${lastNameLocator}    ${lastNameValue}
    run keyword if      '${tech}'=='MOBILE'     Execute Script      window.document.getElementById('${phoneNumberLocator}').value='${phoneNumberValue}'
    ...     ELSE IF     '${tech}'!='WEB'    Execute Javascript  window.document.getElementById('${phoneNumberLocator}').value='${phoneNumberValue}'
    ...     ELSE    run keyword     Enter Value     ${phoneNumberLocator}    ${phoneNumberValue}
    run keyword     Enter Value     ${emailAddressLocator}    ${emailAddressValue}

Enter Shipping Information
    [Arguments]     ${addressLocator}     ${selectAddressLocator}   ${addressValue}  ${companyLocator}    ${companyValue}
    [Documentation]  "Enter the Billing and Shipping information of the user"
    Enter Value     ${addressLocator}    ${addressValue}
    Sleep   10
    click element   ${selectAddressLocator}
    Verify Element Exists   ${companyLocator}
    Enter Value     ${companyLocator}    ${companyValue}
    run keyword if      '${tech}'=='MOBILE'    Hide Keyboard On Mobile

Enter Credit Or Debit Card Details
    [Arguments]     ${creditDebitTabLocator}     ${txtCardLocator}   ${cardValue}  ${expiryDateLocator}
        ...     ${expiryDateValue}      ${cvvLocator}       ${cvvValue}     ${frame}
    [Documentation]  "Enter the credit/debit card information of the user"
    Click On Element  ${creditDebitTabLocator}
    Select Application Frame    ${frame}
    Enter Value     ${txtCardLocator}    ${cardValue}
    Enter Value     ${expiryDateLocator}    ${expiryDateValue}
    Enter Value     ${cvvLocator}    ${cvvValue}
    Unselect Application Frame
    run keyword if      '${tech}'=='MOBILE'     Hide Keyboard On Mobile

Review And Place Order
    [Arguments]     ${reviewOrderLocator}     ${placeOrderLocator}
    Verify Element Exists   ${reviewOrderLocator}
    Click Element Using JavaScript  ${reviewOrderLocator}
    Sleep   5
    Verify Element Exists   ${placeOrderLocator}
    Click On Element  ${placeOrderLocator}

###########################################  For MDP Features Pages  ###################################################
Verify Breadcrumb
    [Arguments]     ${BreadCrumb}
    @{BreadCrumbList}=  Get WebElements  //div[@id='brdcrmb']
       FOR  ${el}    IN  @{BreadCrumbList}
       ${txt}=  Get Text  ${el}
       Log  ${txt}
    END
    Should be equal    ${txt}   HOME / LAPTOPS / BUSINESS / HP PROBOOK 640   "Breadcrumb doesnot match"
    Log to Console  ${txt}  "BreadCrumb is displayed"

Verify Features Tab
    [Arguments]     ${FeaturesTabSection}
    [Documentation]     Verify the product details displayed on the screen for the products under Featured Products
    ${index}        set variable     0
    ${elemDetails}      Get WebElements    ${FeaturesTabSection}
    log to console      ${elemDetails}
    FOR    ${element}    IN    @{elemDetails}
        Length Should Be    ${element.find_elements_by_xpath("//div[@class='PB600_SeriesG4_q3fy18_videobanner']")}    1       "Features Tab doesnt contain banner"
        Length Should Be    ${element.find_elements_by_xpath("//div[@class='bodyCenterContent paddingbot']//img")}    1      "Features Tab doesnt contain image"
        Length Should Be    ${element.find_elements_by_xpath("(//*[contains(@class,'anner')]//*[contains(@class,'btn')])[1]")}    1   "Features Tab doesnot contain Link"
        ${index}        Evaluate         ${index} + 1
    END
    log to console      "Product Information for ${index} products is visible on the screen"



Validate Product Details
    [Arguments]     ${ProductDetails}
    [Documentation]     Verify the product details displayed under Buy Tab
    Page Should Contain Element  ${ProductName}  "Buy Tab doesnot contain Product Name"
    Wait Until Element Is Visible    ${CarouselIcon}
    Click Element  ${CarouselIcon}
    Page Should contain Element  ${AltImg}  "Image and alternate images is not displayed when we click on carousel icon"
    Page Should Contain Element  ${RatingsnReview}  "Buy Tab doesnot contain Ratings & Reviews"
    Page Should Contain Element  ${sku_id}  "SKU ID doesnot exist"
    Run Keyword And Ignore Error    Page Should Contain Element  ${Energy_Star}  "ENERGY STAR doesnot exist"
    #Page Should Contain Element  ${EnergyStar}  "ENERGY STAR doesnot exist"
    Page Should Contain Element  ${ksp}  "Key selling points (KSP) doesnot exist"
    Page Should Contain Element  ${TechSpec}   "'Tech spec' link doesnot exist"
    Page Should Contain Element   ${HpPurchaseRewards}  "Loyalty generic message â€˜Earn 3% in HP Rewards with purchaseâ€™ doesnot exist"
    Page Should Contain Element  ${PriceStart}  "Price is not displayed with 'Starting at' and $ displayed"
    Run Keyword And Ignore Error    Page Should Contain Element   ${OnlyXleft}  "Inventory label (Only X left in stock) is not displayed for applicable products"
    Run Keyword And Ignore Error    Page Should Contain Element   ${ViolatorMsg}  "Violator Message is not available"
    Wait Until Element Is Visible   ${AddtoCartButton}
    Page Should Contain Element  ${AddtoCartButton}  "'Add to Cart' /'Customize & Buy'/'Out of stock' doesnot exist"
    Page Should Contain Element  ${CompareLink}  "#Compare link doesnot exist"
    Log to Console   "All Product details are displayed"


Click on Buy Tab
    [Arguments]     ${BuyTab}
    Click element   ${BuyTab}
    ${Productcount}     Get Element Count   ${ProductHPProBook}
    ${ProductCardCount}     Get Element Count   ${UnitProductSection}
    Should be Equal   ${Productcount}   ${ProductCardCount}
    Log to Console   "Products of the selected model are displayed"


Verify Registered & TM" symbols
    [Arguments]     ${RegisteredSymbol}
    Page Should Contain Element  ${RegisteredSymbol}
    Page Should Contain Element  ${TMSymbol}
    Log to Console  "Registered & TM" symbols are visible"


Verify See All Offers
    [Arguments]     ${SeeAllOffers}
    Mouse Over  ${SeeAllOffers}
    Page Should Contain Element  ${SeeAllOffersToolTip}
    Log to Console  "Tooltip is visible"

Verify ToolTip Content
    [Arguments]     ${HpPurchaseRewards}
    [Documentation]     Mouse hover on â€˜Earn 3% in HP Rewards with purchaseâ€™ & verify the loyalty message in the pop up
    Mouse Over   ${HpPurchaseRewards}
    ${text}=  Get Text  ${LoyaltyTooltip}
    Log  ${text}
    Should be equal    ${text}   ${LoyaltyTxt}   "Tooltip Text doesnot match"
    Log to Console  "Loyalty Message is Visible in Pop up"

Login to Private application
    [Arguments]     ${SignIn}
    Click Element   ${SignIn}
    Click Element   ${SignIn_DropDown}
    Enter Value      ${UserName}   ${pvt_username}
    Click Element   ${NextButton}
    Enter Value        ${Password}      ${pvt_password}
    Click Element   ${SignInButton}
    Wait Until Element is Visible       ${Pvt_Exclusive_Price}
    ${Private_Store_Actual} =  Get Text    ${Pvt_Exclusive_Price}
    Should be equal   ${Private_Store_Expected}    ${Private_Store_Actual}    "PRIVATE STORE EXCLUSIVE PRICE label is not visible above the price"
    Log to Console   "PRIVATE STORE EXCLUSIVE PRICE label is visible above the price"
################################# Validate Compare option in MDP  #######################################

Verify Compare_Products_in_MDP
    [Arguments]     ${MDPCompareSection}
    [Documentation]     Verify Compare window is displayed at the bottom with the selected products
#    Wait Until Element Is Visible   ${CompareLink}
#    FOR    ${i}    IN RANGE    1   2
#        Log      ${i}
#        Click On Element      xpath=(//div[@class='inv_compare ']//span[@title='Click to compare'])[${i}]
#
#    END
    Click on Element      xpath=(//div[@class='inv_compare ']//span[@title='Click to compare'])[1]
    #Click Element      xpath=(//div[@class='inv_compare ']//span[@title='Click to compare'])[2]
    Wait Until Element Is Visible       ${MDPCompareSection}    12s

    Log to Console     "Compare window should be displayed at the bottom with the products selected"


Verify UpwardArrow_MDPCompareWindow
    [Arguments]     ${ToggleButtonCompareWindow}
    [Documentation]     Verify Elements in Compare Window
    Click Element            ${ToggleButtonCompareWindow}
    Wait Until Element Is Visible       ${RemoveLinkCompareWindow}
    Verify Element Exists       ${MaxProductsText}
    Verify Element Exists       ${ProductSpec}
    Verify Element Exists       ${ClearAllCompareWindow}
    Verify Element Exists       ${RemoveLinkCompareWindow}
    Log to Console     "Compare window is displayed with Compare products (max, 4), 'Clear all', Products with specifications, Remove link"


Verify Product_Spec_MDPCompareWindow
    [Arguments]     ${ToggleButtonCompareWindow}
    [Documentation]     Verify Product Specifications in Compare Window
    Verify Element Exists      ${ProductNameCompareWindow}
    Verify Element Exists      ${ProductImgCompareWindow}
    Verify Element Exists      ${ProductPriceCompareWindow}
    Log to Console     "Product specifications is displayed along with name, image and price"


Verify RemoveLink_MDPCompareWindow
    [Arguments]     ${RemoveLinkCompareWindow}
    [Documentation]     Verify Product removed from 'Compare products' window
    Click On Element    ${RemoveLinkCompareWindow}
    ${ProductCount}   Get Element Count    ${ProductImgCompareWindow}
    Log   ${ProductCount}
    Should Be True     ${ProductCount}    2
    Log to Console      "Product is removed from 'Compare products' window"


Verify ClearAll_MDPCompareWindow
    [Arguments]     ${ClearAllCompareWindow}
    [Documentation]    Verify All Products removed from 'Compare products' window
    Click On Element    ${ClearAllCompareWindow}
    Wait Until Element Is Not Visible       ${MDPCompareSection}
    Log to Console      "All Products are removed from 'Compare products' window"

###########################################  For Search Pages  ###################################################

Search STO SKUID
    [Arguments]     ${enter_search}     ${stoskuId}
    Enter Value     ${enter_search}     ${stoskuId}
    Click on element    ${btn_begin_your_search}
    Sleep   6
    verify element exists   ${btn_add_to_cart}

Search CTO SKUID
     [Arguments]     ${enter_search}     ${ctoskuId}
    Enter Value     ${enter_search}     ${ctoskuId}
    Click on element    ${btn_begin_your_search}
    Sleep   6
    verify element exists   ${cto_button_custom}

Search Any Keyword
    [Arguments]     ${enter_search}     ${anytext}
    Enter Value     ${enter_search}     ${anytext}
    Click on element    ${btn_begin_your_search}
    Sleep   6
    Element Should Contain     ${search_result}        ${txt_result}
    #Verify Element Text   ${search_result}      ${txt_result}

Verify Category and Select dropdown
    [Arguments]     ${category_txt}     ${dropdown_ele}
    verify element exists   ${category_txt}
     mouse over     ${dropdown_ele}
     create list
     Click On Element    ${dropdown_ele}
     sleep      3s
     Click On Element    ${Category_dropdown_values}
################################################END OF Code######################################
############################ Validate Compare option in Search Results Page #######################################
Verify Search Result Page
    [Arguments]   ${searched_values}
    Enter Value    ${search_laptop}   ${searched_values}
    sleep   2
    Click Element    ${click_element}
#    ${search}=    Get Text   ${laptop_search}
#    sleep   2
    Element Should Contain     ${search_result}        ${laptop_search}

Verify STO_CTO Comparison
    [Arguments]       ${Sto_fst_loc}  ${Sto_sec_loc}  ${Cto_loc}
    Click Element      ${Sto_fst_loc}
    Click Element        ${Sto_sec_loc}
#    sleep  1
    Click Element         ${Cto_loc}
    #Checkbox Should Be Selected    ${Checkbox}
    ${ProductCount}   Get Element Count    ${ProductCard}
    Should Be True     ${ProductCount}    3
    Log To Console   Products are added, shown in compare section and checkbox is also checked

#Verify Compare Button
#    [Arguments]    ${Compare_Button_loc}
#    ${ProductCount}   Get Element Count    ${ProductCard}
#    Should Be True     ${ProductCount}    > 2
#    Element Should be Enabled   ${Compare_Button_loc}
#     Log To Console   "COMPARE button is displayed when minimum 2 products are added to Compare"

Verify ClearAll Link
    [Arguments]     ${ClearAllLink}
    [Documentation]    Verify all the Products are Removed From Compare Tab
    Click On Element    ${ClearAllLink}
    Log To Console   All the products added to compare should be removed

##########################  Validate Search results page & sorting  ######################################

Verify Search_Results
    [Arguments]     ${SearchBarTextbox}
    [Documentation]     Verify Search Results
    Input Text      ${SearchBarTextbox}     laptops
    Click Element   ${SearchIcon}
    Wait Until Element Is Visible    ${SearchTitle}
    Log to Console     "Search Result page is displayed"
    capture page screenshot   ${CURDIR}${/}/AllScreenCaptures/SearchResultPage.png
    Log to Console     "Screenshot is Captured"


Verify AddToCart_STO_SearchPage
    [Arguments]     ${AddToCart_STO}
    [Documentation]     Verify Add to Cart for STO Product
    ${productName} =    Get Text    ${ProductName_STO}
    Click On Element     ${AddToCart_STO}
    Wait Until Element Is Visible    ${JustAddedtoCartPopup}
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Mouse Over      ${miniCartIcon}
    ...     AND     Verify Element Exists       ${miniCartTitle}
    ...     AND     Element Should Contain      ${minicartProductContent}      ${productName}      "Product Name is not visible on the Mini Cart"
    Log to Console   "STO Product is Added to the Cart"

Verify CTO_SearchPage
    [Arguments]     ${CTOCustnBuyButton}
    [Documentation]     Verify CTO Search Page
    Click On Element    ${CTOCustnBuyButton}
    Wait Until Element Is Visible    ${ConfTitle}   12s
    Log to Console      "Customize & Buy button clicked Successfully and Configurator Page is Displayed!"

###########################  Validate Search results page & sorting  ######################################
#
##Verify Search_Results
##    [Arguments]     ${SearchBarTextbox}
##    [Documentation]     Verify Search Results
##    Input Text      ${SearchBarTextbox}     laptops
##    Click Element   ${SearchIcon}
##    Wait Until Element Is Visible    ${SearchTitle}
##    Log to Console     "Search Result page is displayed"
##    capture page screenshot   ${CURDIR}${/}/AllScreenCaptures/SearchResultPage.png
##    Log to Console     "Screenshot is Captured"
#
#
##Verify AddToCart_STO_SearchPage
##    [Arguments]     ${AddToCart_STO}
##    [Documentation]     Verify Add to Cart for STO Product
##    ${productName} =    Get Text    ${ProductName_STO}
##    Click On Element     ${AddToCart_STO}
##    Wait Until Element Is Visible    ${JustAddedtoCartPopup}
##    run keyword if      '${tech}'=='WEB'    run keywords
##    ...     Mouse Over      ${miniCartIcon}
##    ...     AND     Verify Element Exists       ${miniCartTitle}
##    ...     AND     Element Should Contain      ${minicartProductContent}      ${productName}      "Product Name is not visible on the Mini Cart"
##    Log to Console   "STO Product is Added to the Cart"
#
#Verify CTO_SearchPage
#    [Arguments]     ${CTOCustnBuyButton}
#    [Documentation]     Verify CTO Search Configurator Page
#    Click On Element    ${CTOCustnBuyButton}
#    Wait Until Element Is Visible    ${ConfTitle}
#    Log to Console      "Customize & Buy button clicked Successfully and Configurator Page is Displayed!"


#####################################           For PLP Page(Validate View All Page & sorting )                      #######################################

Verify SortBy DropDown
    [Arguments]     ${sortby}
    [Documentation]    Verify 'Sort by:' drop down is displayed with multiple sort options
    Click On Element    ${sortby}
    @{SortByList}  Get List Items   ${sortbyMenu}
    FOR    ${ListItems}    IN    @{SortByList}
       LOG     ${ListItems}
    END

    ${List1} =  Catenate   @{SortByList}
    Should be equal    ${List1}   ${SortByItems}   "SortBy Tab doesnot contain all the Elements"
    Log to Console   "SortBy Dropdown contains all the specified List elements"

Ensure Product Details
    [Arguments]     ${ProductDetails}
    [Documentation]     Verify the product details displayed under Buy Tab
    Page Should Contain Element  ${ProductName}  "Buy Tab doesnot contain Product Name"
    sleep       2s
    Click Element  ${CarouselIcon}
    Page Should contain Element  ${AltImg}  "Image and alternate images is not displayed when we click on carousel icon"
    Page Should Contain Element  ${RatingsnReview}  "Buy Tab doesnot contain Ratings & Reviews"
    Page Should Contain Element  ${sku_id}  "SKU ID doesnot exist"
    #verify element exists   ${Energy_Star}
    Run Keyword And Ignore Error    Page Should Contain Element  ${Energy_Star}  "ENERGY STAR doesnot exist"
    Page Should Contain Element  ${ksp}  "Key selling points (KSP) doesnot exist"
    Page Should Contain Element  ${TechSpec}   "Tech spec link doesnot exist"
    Page Should Contain Element  ${HpPurchaseRewards}  "Loyalty generic message â€˜Earn 3% in HP Rewards with purchaseâ€™ doesnot exist"
    Page Should Contain Element  ${PriceStart}  "Price is not displayed with 'Starting at' and $ displayed"
    Run Keyword And Ignore Error    Page Should Contain Element   ${OnlyXleft}  "Inventory label (Only X left in stock) is not displayed for applicable products"
    Run Keyword And Ignore Error    Page Should Contain Element   ${ViolatorMsg}  "Violator Message is not available"
    Page Should Contain Element  ${AddtoCartButton}  "'Add to Cart' /'Customize & Buy'/'Out of stock' doesnot exist"
    Page Should Contain Element  ${CompareLink}  "#Compare link doesnot exist"
    Log to Console   "All Product details are displayed"


#Click on Buy Tab
#    [Arguments]     ${BuyTab}
#    Click element   ${BuyTab}
#    ${Productcount}     Get Element Count   ${ProductHPProBook}
#    ${ProductCardCount}     Get Element Count   ${UnitProductSection}
#    Should be Equal   ${Productcount}   ${ProductCardCount}
#    Log to Console   "Products of the selected model are displayed"


#Verify Registered & TM" symbols
#    [Arguments]     ${productSections}
#    Page Should Contain Element  //span[contains(@title, '®')]
#    Page Should Contain Element  //span[contains(@title, '™')]
#    Log to Console  "Registered & TM" symbols are visible"


#Verify See All Offers
#    [Arguments]     ${SeeAllOffers}
#    Mouse Over  ${SeeAllOffers}
#    Page Should Contain Element  ${SeeAllOffersToolTip}
#    Log to Console  "Tooltip is visible"

#Verify ToolTip Content
#    [Arguments]     ${HpPurchaseRewards}
#    [Documentation]     Mouse hover on â€˜Earn 3% in HP Rewards with purchaseâ€™ & verify the loyalty message in the pop up
#    Mouse Over   ${HpPurchaseRewards}
#    ${text}=  Get Text  ${LoyaltyTooltip}
#    Log  ${text}
#    Should be equal    ${text}   ${LoyaltyTxt}   "Tooltip Text doesnot match"
#    Log to Console  "Loyalty Message is Visible in Pop up"

#Login to Private application
#    [Arguments]     ${SignIn}
#    Click Element   ${SignIn}
#    Click Element   ${SignIn_DropDown}
#    Enter Value      ${UserName}   ${pvt_username}
#    Click Element   ${NextButton}
#    Enter Value        ${Password}      ${pvt_password}
#    Click Element   ${SignInButton}
#    sleep   4
#    ${Private_Store_Actual} =  Get Text    ${Pvt_Exclusive_Price}
#    #textfield value should be    ${Private_Store_Expected}    ${Private_Store_Actual}    "PRIVATE STORE EXCLUSIVE PRIC"
#    Should be equal   ${Private_Store_Expected}    ${Private_Store_Actual}    "PRIVATE STORE EXCLUSIVE PRICE label is not visible above the price"
#    Log to Console   "PRIVATE STORE EXCLUSIVE PRICE label is visible above the price"

Verify LoadMore Button
    [Arguments]     ${LoadMoreButton}
    [Documentation]    Verify Next set of results is displayed
    click element    ${LoadMoreButton}
    Sleep  2
    ${ProductCount}   Get Element Count    ${UnitProductSection}
    Should Be True     ${ProductCount}    >12
    Log To Console     "Next set of resutls is displayed Successfully!"

Verify Compare Tab
    [Arguments]     ${CompareTab}
    [Documentation]    Verify Elements in Compare Tab
    Sleep   1
    Click On Element    ${CompareTab}
    Page Should contain   ${CompareTabMsg}
    Page Should contain Element     ${ClearAllLink}
    Log to Console  "Compare Tab contains message or link"

#####################################           For PLP Page(Validate Compare option in View ALL page )               #######################################


Verify Comparison STO_CTO
    [Arguments]     ${CTOComparelink}
    [Documentation]    Verify Elements in Compare Tab
    Click On Element    ${LoadMoreButton}
    Click On Element    ${LoadMoreButton}
    Sleep   1
    Click On Element    ${STOCompareFirstLink}
    Sleep   1
    Click On Element    ${STOCompareSecondlink}
    Click On Element    ${CTOComparelink}
    Sleep   1
#    #Checkbox Should Be Selected    ${Checkbox}
    ${ProductCount}   Get Element Count    ${ProductCard}
    Should Be True     ${ProductCount}    3
    Log To Console   "Compare checkbox is checked & Products are shown in Compare section"





Validate Compare Button
    [Arguments]     ${CompareButton}
    [Documentation]    Validate Compare Button in Compare Tab
    Sleep   1
    ${Count}   Get Element Count    ${ProductCard}
    Should Be True     ${Count}    >2
    Element Should be Enabled   ${CompareButton}
    Log To Console   "COMPARE button is displayed when minimum 2 products are added to Compare"


Verify Compare Popup
    [Arguments]     ${CompareButton}
    [Documentation]    Verify All the added Products are Displayed
    Click on Element   ${CompareButton}
    Page should contain element    ${ComparePopupTitle}
    ${ProductCount}   Get Element Count    ${ProductCard}
    Should Be True     ${ProductCount}    3
    Log to Console   "All the added Products are Displayed"


Verify ComparePopup AddToCart
    [Arguments]     ${AddToCartonPopUp}
    [Documentation]    Verify Product is added to the Cart
    Sleep   1
    Click on Element     ${AddToCartonPopUp}
    Sleep   1
    ${CartItemsqty}   Get Element Count   ${miniCartIcon}
    Should Be True     ${CartItemsqty}    1
    Log to Console   "Product should be added to cart"


Remove Product From_Compare_Popup
    [Arguments]     ${ProductCardPopupClose}
    [Documentation]    Verify Product is Removed From Compare Popup window
    Click on Element     ${ProductCardPopupClose}
    ${ProductCount}   Get Element Count    ${ProductCard}
    Should Be True     ${ProductCount}    2
    Log to Console      "Product is removed from 'Compare products' window"

Remove Product From_Compare_Tab
    [Arguments]     ${ProductCardClose}
    [Documentation]    Verify Product is Removed From Compare Tab
    Click On Element    ${ProductCardClose}
    ${ProductCount}   Get Element Count    ${ProductCard}
    Should Be True     ${ProductCount}    1
    Log to Console      "Product is removed from 'Compare' Tab"


Validate ClearAll Link
    [Arguments]     ${ClearAllLink}
    [Documentation]    Verify all the Products are Removed From Compare Tab

    Click On Element    ${ClearAllLink}
    ${AddProductTextCount}   Get Element Count    ${AddProductText}
    Should Be True     ${AddProductTextCount}    4
    Log to Console      "All the Products are removed from 'Compare' Tab"
############################ Validate STO "Add to Cart" and CTO 'Customize & buy' from PLP  ############################

Verify Elements MiniCartPopup
    [Arguments]     ${AddToCart_STO}
    [Documentation]     Verify STO product is being added to cart successfully
    ${productName} =    Get Text    ${ProductName_STO}
    Sleep  2
    Click On Element     ${AddToCart_STO}
    Sleep   2
    Verify Element Exists    ${JustAddedtoCartPopup}
    Sleep   2
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Mouse Over      ${miniCartIcon}
    ...     AND     Verify Element Exists       ${miniCartTitle}
    ...     AND     Element Should Contain      ${minicartProductContent}      ${productName}      "Product Name is not visible on the Mini Cart"
    ...     AND     Verify Element Exists       ${minicartItemQty}
    ...     AND     Verify Element Exists       ${minicartViewAllLink}
    ...     AND     Verify Element Exists       ${minicartProductImg}

    Log to Console      "Product is added to cart and popup is displayed as 'Just added to cart'"
    Log to Console      "Product is displayed in the Mini cart with Product name, Image, Qty, Price with $, 'View Cart & Checkout' button & 'View all items' link"


Verify CTO_Config_Page
    [Arguments]     ${CTOCustnBuyButton}
    [Documentation]     Verify Customize & Buy Button and CTO Configurator Page
    Click On Element    ${closePdpBlockpopup}
    Click On Element    ${CTOCustnBuyButton}
    Sleep    3s
    Element Should be Visible   ${ConfTitle}
    Log to Console      "Customize & Buy button clicked Successfully and Configurator Page is Displayed!"

############################    Validate Facets & Filters in View ALL page  ###########################################

Verify Filters_in_PLP
    [Arguments]     ${BrandFilter}
    [Documentation]     Verify Filters displayed in the Filter Section
    Verify Element Exists       ${ProductAvailabilityFilter}
    Verify Element Exists       ${SaleFilter}
    Verify Element Exists       ${UseFilter}
    Verify Element Exists       ${BrandFilter}
    Log To Console      "Filters are displayed such as Sale,PRODUCT AVAILABILITY,USE,BRAND... etc"

Verify BreadcrumbandFacettrial
    [Arguments]     ${InStockCheckbox}
    [Documentation]     Verify Breadcrumb and facet trail format
    Click Element     ${InStockCheckbox}
    Sleep    2
    Click Element     ${BusinessCheckbox}
    Sleep    2
    Click Element     ${EnterpriseCheckBox}
    Sleep    2
    @{FacetCrumbList}=  Get WebElements   ${FacetCrumbWrapper}
       FOR  ${el}    IN  @{FacetCrumbList}
       ${txt}=  Get Text  ${el}
       Log  ${txt}
    END
    Should be equal    ${txt}   	Printers In StockBusinessEnterprise   "FacetCrumbcrumb doesnot match"
    Verify Element Exists       ${ClearAllFacetTrail}
    Log to Console  ${txt}  "Category + Facet trail + Clear all is Displayed"


Verify Facet_Selection_Results
    [Arguments]     ${plp_filtered_url}
    [Documentation]     Verify Results refined based on the facet selection
    ${CurrentURL} =   Get Location
    Log   ${CurrentURL}
    Should be equal    ${CurrentURL}    ${plp_filtered_url}     "Results are not refined based on the facet selection"
    Log to Console      "Results are refined based on the facet selection"

Verify ClearAllFacets_inFilters
    [Arguments]     ${ClearALlFilters}
    [Documentation]     Verify Results refined to default
    Click Element       ${ClearALlFilters}
    Sleep   2
    ${CurrentURL} =   Get Location
    Log   ${CurrentURL}
    Should be equal    ${CurrentURL}    ${plp_filters_facets}     "Results are not refined to default"
    Log to Console      "Results are refined to default"


##################################Validate MLP Features##########################################################################
Validate Breadcrumb Text
    [Arguments]    ${breadcrumblocator}
#    @{BreadCrumbList}=  Get WebElements  ${breadcrumblocator}
#    FOR    ${el}    IN  @{BreadCrumbList}
#        ${txt}=    Get Text    ${el}
#        Log    ${txt}
#    END
    ${breadcrumb_expected}=    Get Text     ${breadcrumblocator}
    Should be equal   ${breadcrumb_expected}    ${breadcrumb_text}    "BreadCrumb not displayed in MLP"
    Log to Console   Breadcrumb Displayed in MLP and matches with Actual text

Verify Model Displayed in Grid View
    [Arguments]  ${gridmodel}
    ${grid_view_model}=  run keyword and return status  Element Should Be Visible  ${gridmodel}
    Run Keyword If  ${grid_view_model}==True  Log  models are displayed in 'Grid view' by default
    ...  ELSE  Fail  models are not displayed in Grid View

Verify Model Name in Grid View
    [Arguments]   ${View_model_name}
    ${model_name}=  run keyword and return status  Element Should Be Visible  ${View_model_name}
    Run Keyword If  ${model_name}==True  Log  Name is Visible
    ...  ELSE  Fail  Name is not visible

Verify Model image in Grid View
    [Arguments]   ${View_model_image}
    ${model_image}=  run keyword and return status  Page Should Contain Image  ${View_model_image}
    Run Keyword If  ${model_image}==True  Log  image is displayed
    ...  ELSE  Fail  image is not displayed


Verify Key selling points in Grid View
    [Arguments]  ${View_ksp}
    ${KeySellingPoint_expected}=    Get Text     ${View_ksp}
   # Should be equal   ${KeySellingPoint_expected}    ${Keyselling_Actual_grid}    "Key selling point not displayed in Grid View"
   # Page Should not Contain    ${KeySellingPoint_expected}    ${Keyselling_Actual_grid}
    Log to Console   Key selling point  Displayed in Grid View and matches with Actual text


Verify View All Link with count of Product in Grid View
    [Arguments]  ${View_product}
    ${View_all_product}=  run keyword and return status  Element Should Be Visible  ${View_product}
    Run Keyword If  ${View_all_product}==True  Log  View All link with count of product is displayed
    ...  ELSE   Fail   View All link with count of product is not displayed

Verify Ratings & Revies in Grid View
    [Arguments]  ${rating_review}
    [Documentation]     Verify Ratings & Reviews are displayed in Grid View
    Verify Element Exists  ${rating_review}

Verify Loyalty Generic Message in Grid View
    [Arguments]  ${elem}
    [Documentation]     Loyalty generic message ‘Earn 3% in HP Rewards with purchase’
    Verify Element Exists  ${elem}

Verify Price displayed in Grid View
    [Arguments]  ${Price_disp}
    [Documentation]     Verify Price displayed with 'Starting at' and $ displayed as Superscript
    Verify Element Exists  ${Price_disp}

Verify View Details displayed in Grid View
    [Arguments]  ${View_detail_Page}
    Verify Element Exists  ${View_detail_Page}

Verify the Registered & TM symbols in Grid View
    [Arguments]   ${Reg_symbol}  ${gridReg_Tmsymbol}
    [Documentation]   Verify the ""Registered & TM"" symbols in the Key selling points Grid View
    ${Reg_Tm}=  run keyword and return status  Element Text Should Be  ${Reg_symbol}   ${gridReg_Tmsymbol}
    Run Keyword If  ${Reg_Tm}==True  Log  ® and ™ is present in the text
    ...  ELSE  Fail  ® and ™ is not present in the text
     Sleep  3

Verify Model Displayed in List View
    [Arguments]  ${listmodel}
    ${list_view_model}=  run keyword and return status  Element Should Be Visible  ${listmodel}
    Run Keyword If  ${list_view_model}==True  Log  models are displayed in List View
    ...  ELSE  Fail  models are not displayed in List View

Verify Model Name in List View
    [Arguments]   ${list_model_name}
    Verify Element Exists   ${list_model_name}

Verify Model image in List View
    [Arguments]   ${list_model_image}
    Verify Element Exists   ${list_model_image}

Verify Key selling points in List View
    [Arguments]  ${View_ksp_list}
    ${KeySellingPoint_expected_list}=    Get Text     ${View_ksp_list}
   # Should be equal   ${KeySellingPoint_expected_list}    ${Keyselling_Actual_list}    "Key selling point not displayed in List View"
    Log to Console   Key selling point  Displayed in List View and matches with Actual text

Verify View All Link with count of Product in list View
    [Arguments]  ${View_allLink_list}
    Verify Element Exists  ${View_allLink_list}

Verify Ratings & Revies in List View
    [Arguments]  ${rating_review_list}
    [Documentation]     Verify Ratings & Reviews are displayed in List View
    Verify Element Exists  ${rating_review_list}

Verify Loyalty Generic Message in List View
    [Arguments]  ${Gen_Msg}
    [Documentation]     Loyalty generic message ‘Earn 3% in HP Rewards with purchase’
    Verify Element Exists  ${Gen_Msg}

Verify Price displayed in List View
    [Arguments]  ${Price_disp_list}  ${Listview_price}
    [Documentation]     Verify Price displayed with 'Starting at' and $ displayed as Superscript
    ${list_view_pricesub}=  run keyword and return status  Element Should Be Visible  ${Price_disp_list}   ${Listview_price}
    Run Keyword If  ${list_view_pricesub}==True  Log  Price displayed in List View
    ...  ELSE  Fail  Price not displayed in List View

Verify View Details displayed in List View
    [Arguments]  ${View_detail_Pagelist}
    Verify Element Exists  ${View_detail_Pagelist}


Verify the Registered & TM symbols in List View
    [Arguments]   ${Regis_symbol}   ${Reg_textt_verif}
    [Documentation]   Verify the ""Registered & TM"" symbols in the Key selling points List View
    ${Reg_Tm_list}=  run keyword and return status  Element Text Should Be  ${Regis_symbol}   ${Reg_textt_verif}
    Run Keyword If  ${Reg_Tm_list}==True  Log  ® and ™ is present in the text
    ...  ELSE  Fail   ® and ™ is not present in the text
     Sleep  3


Mose Hover and Verify The Loyalty Message
    [Arguments]     ${elem}  ${loyaltymessage}
    [Documentation]     Verify loyalty message is displayed in the pop up
    Sleep  3
    Mouse Over    ${elem}
    ${Loyalty_text_popup} =    Get Text    ${loyaltymessage}
    Should be equal   ${Loyalty_text_popup}     ${Loyalty_msg_Actual}    "The loyalty message is not dislplayed with learn more link in the in the pop up"
    Log to Console   The loyalty message is dislplayed with learn more link in the in the pop up"




Click On View Detail and Verify MDP Page
    [Arguments]    ${View_detail_Page}  ${View_Mdp_Page}
    [Documentation]  "Click on View Details"
    click element   ${View_detail_Page}
    Verify Element Exists   ${View_Mdp_Page}


Login to application
    [Arguments]     ${username}  ${password}

    Click Element   //a[contains(text(),'Sign in/Register')]
    sleep   1
    Click Element   //a[contains(text(),'Sign in/Register')]
    Capture Page Screenshot
    Click Element   //ul[@class="lastBox topmenuchild myAccountDd"]//a[text()="Sign in"]
    Enter Value        //input[@id='username']      ${username}
    Click Element   //button[@id='next_button']
    sleep   1
    Enter Value        //input[@id='password']      ${password}
    Click Element   //button[@id='']
    sleep   1

    Capture page screenshot

##################################End Of MLP Scenerio##############################################################



###################################Validate PDP  Features####################################################
Verify SRP with Gift Card
    [Arguments]     ${Gift_cards}   ${Giftcard_search}  ${Gift_icon}
    Enter Value    ${Giftcard_search}   ${Gift_cards}
    sleep    3
    Click Element    ${Gift_icon}
    Page Should Contain   Results for  'Gift cards'

Verify Check Your Balance Link
    [Arguments]   ${Check_balance}    ${check_urbalance}
    Click Element  ${Check_balance}
    ${Checkbalance_popup}=  run keyword and return status  Element Should Be Visible  ${check_urbalance}
    Run Keyword If  ${Checkbalance_popup}==True  Log  Check your balance popup is displayed
    ...  ELSE  Fail Check your balance popup is not displayed

Verify Gift Card Balance Pop Up is Closed
    [Arguments]   ${pop_close}  ${check_yourbalance}
    Click Element   ${pop_close}
    ${giftcard_popup_closed}=  run keyword and return status  Element Should Be Visible  ${check_yourbalance}
    Run Keyword If  ${giftcard_popup_closed}==True  Log  Gift card balance pop up is closed
    ...  ELSE  Fail Gift card balance pop up is not closed
    sleep  5


Verify Amount Dropdown under Customize and Buy for physical gift card
    [Arguments]   ${Cutomize_dropdown}   ${Amountdropdown}
    Click Element   ${Cutomize_dropdown}
    Verify Element Exists     ${Amountdropdown}

Verify From and To Text Field
    [Arguments]  ${from_text}  ${To_text}
    Verify Element Exists   ${from_text}
    Verify Element Exists    ${To_text}

Verify Add a personalized message link
    [Arguments]  ${msg_link}
    Verify Element Exists    ${msg_link}

Verify Add to Cart button
    [Arguments]   ${addto_cart_locator}
    Verify Element Exists    ${addto_cart_locator}

Verify Price under Physical gift card
    [Arguments]   ${price_gift}
    Verify Element Exists    ${price_gift}

Verify Amount is selected in the dropdown
    [Arguments]     ${amount_selected}
    Click Element   //div[@class='dropdown ']
    Click Element   //option[contains(text(),'$10.00')]
    Verify Element Exists    ${amount_selected}

Verify Your Name Field
    [Arguments]   ${enter_name}
    Enter Value    ${enter_name}    ${value_name}

Verify Recipient's name Field
    [Arguments]    ${enter_recipname}
    Enter Value    ${enter_recipname}   ${Recip_name}

Verify Add a personalized message link in PDP
    [Arguments]    ${msg_link}    ${optional_msglocator}
    Click Element   ${msg_link}
    Enter Value      ${optional_msglocator}   ${recipent_msg}

Verify Features of Gift card
    [Arguments]   ${giftcard_feature}    ${features_locator}
    Click Element   ${giftcard_feature}
    Verify Element Exists   ${features_locator}
    sleep  2

Verify Special Offers of the Gift Card
    [Arguments]    ${Special_offrtab}  ${offer_display}
    Click Element   ${Special_offrtab}
    Verify Element Exists   ${offer_display}
    sleep  2

Verify Add To Cart by adding Gift Card
    [Arguments]        ${add_gift}   ${just_addedcart}
    Click Element       ${add_gift}
    Verify Element Exists   ${just_addedcart}

Verify Amount Dropdown for Virtual gift card
    [Arguments]   ${dropdown_virtual}
    Verify Element Exists     ${dropdown_virtual}

Verify From and To Text Field for Virtual gift card
    [Arguments]  ${from_text_virtual}  ${To_text_virtual}
    Verify Element Exists   ${from_text_virtual}
    Verify Element Exists    ${To_text_virtual}

Verify Recipient email & Confirm email fields
    [Arguments]  ${Recipient_virtual}  ${Confirm_virtual}
    Verify Element Exists   ${Recipient_virtual}
    Verify Element Exists    ${Confirm_virtual}

Verify Add a personalized message link for Virtual gift card
    [Arguments]  ${msg_link_virtual}
    Verify Element Exists    ${msg_link_virtual}

Verify Add to Cart button for Virtual gift card
    [Arguments]   ${addto_cart_virtual}
    Verify Element Exists    ${addto_cart_virtual}

Verify Price under Virtual gift card
    [Arguments]   ${price_virtualgift}
    Verify Element Exists    ${price_virtualgift}

Verify dropdown Amount is selected in PDP
    [Arguments]     ${Virtual_amount}
    Click Element   //select[@class='dropdown-menu']
    Click Element   //option[contains(text(),'$10.00')]
    Verify Element Exists    ${Virtual_amount}

Verify Your Name for Virtual Gift Card
    [Arguments]    ${Virtualgift_name}
    Enter Value    ${Virtualgift_name}    ${name_value}
    sleep  3

Verify Recipient Name for Virtual Gift Card
    [Arguments]  ${get_to_name}
    Enter Value   ${get_to_name}    ${set_To_value}
    sleep  2

Verify Recipient Email Field for virtual gift card
    [Arguments]    ${get_email}
    Enter Value   ${get_email}   ${Setting_email}
    sleep  3

Verify Confirm email Field
    [Arguments]    ${confirm_name_locator}
    Enter Value    ${confirm_name_locator}  ${Recip_value_virtual}
    sleep  3
Verify Add a personalized message For Vitual gift
    [Arguments]    ${msg_link_virtual}    ${opt_msglocator}
    Click Element   ${msg_link_virtual}
    Enter Value      ${opt_msglocator}   ${recipent_msg}

Verify Features of Virtual Gift card
    [Arguments]   ${virtualcard_feature}    ${featuresvirtual_locator}
    Click Element   ${virtualcard_feature}
    Verify Element Exists  ${featuresvirtual_locator}
    sleep  2

Verify Special Offers of Virtual Gift Card
    [Arguments]    ${Special_virtualtab}  ${offervirtual_display}
    Click Element   ${Special_virtualtab}
    Verify Element Exists   ${offervirtual_display}
    sleep  2

Verify Add To Cart by adding Virtual Gift Card
    [Arguments]        ${add_virtualgift}   ${just_addedvirtual}
    Click Element       ${add_virtualgift}
    Verify Element Exists   ${just_addedvirtual}

################################End Of PDP#############################################################
###############################Validate STO PDP#######################################################################
Verify Product Name
    [Arguments]     ${sto_product_name}
    Verify Element Exists     ${sto_product_name}

Verify Full Image and Thumbnail Image
    [Arguments]   ${sto_img_locator}
    Verify Element Exists     ${sto_img_locator}

Verify Thumbnail Full Video
    [Arguments]       ${thumbnail_locator}
    Verify Element Exists      ${thumbnail_locator}

Verify Ratings and Reviews option
    [Arguments]    ${sto_rating_review}
    Verify Element Exists     ${sto_rating_review}

Verify SKU ID
    [Arguments]   ${Sto_sku}
    Verify Element Exists      ${Sto_sku}


Verify Key Selling point and see all specs link
    [Arguments]   ${STO_key_selling}
    ${Sto_keySellingpoint}=    Get Text     ${STO_key_selling}
    Should be equal   ${Sto_keySellingpoint}    ${Sto_actual_ksp}    "BreadCrumb not displayed in MLP"
    Log to Console   Breadcrumb Displayed in MLP and matches with Actual text

Verify Price superscript for STO
    [Arguments]     ${Sto_price_locator}
    Verify Element Exists     ${Sto_price_locator}

Verify Loyalty Message For STO Product
    [Arguments]    ${Sto_msg_locator}
    Verify Element Exists    ${Sto_msg_locator}

Verify Add To Cart For STO Product
    [Arguments]    ${Sto_cart}
    Verify Element Exists     ${Sto_cart}

Verify BreadCrumb for STO PDP
    [arguments]    ${STO_breadcrumblocator}
    ${STO_breadcrumb}=    Get Text     ${STO_breadcrumblocator}
    Should be equal   ${STO_breadcrumb}    ${breadcrumb_STOtext}    "BreadCrumb not displayed in STO PDP"
    Log to Console   Breadcrumb Displayed in STO PDP and matches with Actual text

Verify Add To Cart For STO PDP Product
    [Arguments]     ${elem}     ${stoProductName}
    [Documentation]     Verify STO product is being added to cart successfully
    ${productName} =    Get Text    ${stoProductName}
    click on element    ${elem}
    sleep      2
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Mouse Over     //button[@class="button-icon "]
    ...     AND     Verify Element Exists       //div[@class='minicart_title']
    ...     AND     Element Should Contain      //div[@class="mcprodcont"]      ${productName}      "Product is not added to the cart"

Verify Features Tab For STO PDP Product
    [Arguments]    ${Sto_feature_locate}  ${Sto_mouse_super}
    Click Element    ${Sto_feature_locate}
    Mouse Over        ${Sto_mouse_super}
    Verify Element Exists   ${Sto_sup_element}
    sleep  2

Verify You might also be interested in section
    [Arguments]   ${Stoprod_name}   ${stoprod_pice}   ${stoprodview}


    Verify Element Exists    //h2[text()='You might also be interested in...']
    Capture Page Screenshot
#    sleep   20
#    Capture Page Screenshot
#    Verify Element Exists    //div[@class="pdp-acc-list"]//ul/li[1]
#    Verify Element Exists    ${stoprod_pice}
#    Verify Element Exists      ${stoprodview}

Verify Specs Tab For STO PDP
    [Arguments]    ${sto_spec_locator}    ${Specification_loc}
    Click Element     ${sto_spec_locator}
    Verify Element Exists    ${Specification_loc}
    sleep  3

Verify Accessories Tab
    [Arguments]     ${Accessory_locator}     ${browse_acces_locator}
    Click Element    ${Accessory_locator}
    Verify Element Exists     ${browse_acces_locator}
    sleep  2

Verify Add To Cart for an product under accessories
    [Arguments]     ${elem}     ${stoProductName}
    [Documentation]     Verify STO product is being added to cart successfully
    ${productName} =    Get Text    ${stoProductName}
    click on element    ${elem}
    sleep      2
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Mouse Over     //button[@class="button-icon "]
    ...     AND     Verify Element Exists       //div[@class='minicart_title']
    ...     AND     Element Should Contain      //div[@class='mcprodcont']     ${productName}      "Product is not added to the cart"

Verify Add to Cart for any Browse Accessories product
#    [Arguments]    ${browse_cart}
#    Click Element      ${browse_cart}
#    Verify Element Exists  ${browse_cart_added}
    [Arguments]     ${elem}     ${stoProductName}
    [Documentation]     Verify STO product is being added to cart successfully
    ${productName} =    Get Text    ${stoProductName}
    click on element    ${elem}
    sleep      2
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Mouse Over     //button[@class="button-icon "]
    ...     AND     Verify Element Exists       //div[@class='minicart_title']
    ...     AND     Element Should Contain      //div[@class='mcprodcont']     ${productName}      "Product is not added to the cart"



Verify Special offers tab for STO PDP
    [Arguments]   ${speacial_offer}    ${offerlist_locator}
    Click Element         ${speacial_offer}
    Verify Element Exists   ${offerlist_locator}

Verify Support tab for STO PDP
    [Arguments]     ${support_tab}    ${Support_hptab}
    Click Element    ${support_tab}
    Verify Element Exists   ${Support_hptab}

Verify Reviews tab For STO PDP
    [Arguments]     ${support_tab_review}    ${Support_hptab_review}
    Click Element    ${support_tab_review}
    Verify Element Exists   ${Support_hptab_review}
    Close Browser

    ################# Validate ESD PDP#########################################################################

Verify ESD Product Name
    [Arguments]   ${esd_name}
    Verify Element Exists     ${esd_name}

Verify ESD Product Image
    [Arguments]   ${esd_image}
    Verify Element Exists        ${esd_image}

Verify ESD Ratings and Reviews
    [Arguments]    ${esd_review}
    Verify Element Exists      ${esd_review}

Veriy ESD SKU ID
    [Arguments]    ${esd_id_loc}
    Verify Element Exists     ${esd_id_loc}

Verify KSP For ESD Product
    [Arguments]   ${ESD_key_selling}
    ${ESD_keySellingpoint}=    Get Text     ${ESD_key_selling}
    Should be equal   ${ESD_keySellingpoint}    ${ESD_actual_ksp}    "Key selling point and see all spec link is not displayed"
    Log to Console   Key selling point and see all spec link is displayed


Verify Price superscript for ESD
    [Arguments]     ${ESD_price_locator}
    Verify Element Exists     ${ESD_price_locator}

Verify Add To Cart Button For ESD
    [Arguments]    ${esd_cart}
    Verify Element Exists     ${esd_cart}

Verify Digital Download link
    [Arguments]    ${digital_download}
    Verify Element Exists    ${digital_download}

Validate Digital Download
    [Arguments]      ${click_digilink}    ${faq}
    Click Element     ${click_digilink}
    Verify Element Exists    ${faq}

Verify Features Tab For ESD
    [Arguments]    ${feattures_esd}
    Click Element     ${feattures_esd}

Verify Spec Tab For ESD
    [Arguments]    ${spec_tab}
    Click Element    ${spec_tab}

Verify Reviews Tab For ESD
    [Arguments]   ${Reviews_tab}
    Click On Element     ${Reviews_tab}

Verify ADD To Cart Functionality
    [Arguments]     ${add_to_cart}
    Click Element    ${add_to_cart}
####################End Of ESD###########################################

##################################################Validate Bundle PDP###############################################
Verify Bundle Product Name
    [Arguments]   ${bundle_name}
    Verify Element Exists     ${bundle_name}

Verify Ratings and Reviews For Bundle Product
    [Arguments]   ${Reviews_bundle}
    Verify Element Exists     ${Reviews_bundle}

Verify SKU ID For Bundle Product
    [Arguments]    ${Sku_id}
    Verify Element Exists    ${Sku_id}

Verify KSP and Se all Specs For Bundle Product
    [Arguments]   ${bundle_specs}
    ${bundle_keySellingpoint}=    Get Text     ${bundle_specs}
    Should be equal   ${bundle_keySellingpoint}    ${bundle_actual_ksp}    "BreadCrumb not displayed in Bundle"
    Log to Console   Breadcrumb Displayed in Bundle and matches with Actual text

Verify Price for Bundle Product
    [Arguments]   ${Bundle_price}
    Verify Element Exists    ${Bundle_price}

Verify Add To Cart For Bundle Product
    [Arguments]    ${add_to_cart}
    Verify Element Exists    ${add_to_cart}

Verify Images For Bundle Product
    [Arguments]    ${Bundle_img}
    Verify Element Exists     ${Bundle_img}

Verify Carousel Arrows For Bundle Product
    [Arguments]   ${Arrow_enabled_loc}     ${Arrow_disable_loc}
    ${count}=       Get Element count      ${element_count}
    Log to console      ${count}
    Run Keyword If   ${count} > 4   Verify Element Exists    ${Arrow_enabled_loc}
    ...  ELSE     Verify Element Exists    ${Arrow_disable_loc}

Verify Add To Cart Functionality for Bundle
    [Arguments]   ${add_cart}
    Click Element   ${add_cart}

Verify Features Tab For Bundle Product
    [Arguments]      ${feature_loc}
    Click Element    ${feature_loc}

Verify Specs Tab For Bundle Product
    [Arguments]    ${spec_loc}   ${spec_detail}
    Click Element     ${spec_loc}
    Verify Element Exists    ${spec_detail}

Verify Reviews Tab For Bundle Product
    [Arguments]     ${Review_loc}     ${review_tab}
    Click Element   ${Review_loc}
    Verify Element Exists    ${review_tab}

#########################################End Of STO PDP###########################################################

Search SKU
    [Arguments]     ${skuid}    ${searchbox}
    [Documentation]      Search the SKUID and add to cart
    Enter Value     ${searchbox}     ${skuid}
    Sleep   2s
    Press Keys    ${searchbox}    ENTER
    #Click on element    ${searchboxbtn}
    Sleep   6

Verify the details displayed in PDP
    [Arguments]     ${pdpSection}
    [Documentation]     Verify the details displayed in PDP
    #Name
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   ${pdpSection}//div[@class="product-detail"]/h1
    Run Keyword If    ${present}    log to console      "Name Visible in Screen"
    #Image
    ${present}=  Run Keyword And Return Status    Page Should Contain Image   ${pdpSection}//div[@class="pdp-image"]//div[@class="featured-image-container"]//img
    Run Keyword If    ${present}    log to console      "Full Image Visible in Screen"

    ${present}=  Run Keyword And Return Status    Element Should Be Visible   //button[@id='ratings-summary']
    Run Keyword If    ${present}    log to console      "Rating abd review Visible in screen "

    ${present}=  Run Keyword And Return Status    Element Should Be Visible   //button[@id='WAR']
    Run Keyword If    ${present}    log to console      "Write a review Visible in Screen"

    ${present}=  Run Keyword And Return Status    Element Should Be Visible       //span[@class="pdp-sku"]
    Run Keyword If    ${present}    log to console      "SKU ID Visisble On screen"

    ${present}=  Run Keyword And Return Status    Element Should Contain    //span[@id="currency-symbol"]      $
    Run Keyword If    ${present}    log to console      "Price shown with $ superscript"
    #Shipping status label as 'HP Care Packs are delivered electronically. 'See details' link
    ${present}=  Run Keyword And Return Status    Element Should Contain    //div[@class="ecarepack-msg"]      HP Care Packs are delivered electronically.
    Run Keyword If    ${present}    log to console      "Shipping status label as 'HP Care Packs are delivered electronically."

    ${present}=  Run Keyword And Return Status    Element Should Contain    //div[@class="loyalty-badge"]      HP Rewards Points
    Run Keyword If    ${present}    log to console      "Loyality Badge Configured"

    Verify Element Exists   //div[@class='purchase-info ']//button[text()='Add to cart']

Verify BreadCrumblist
    [arguments]    ${breadcrumb_locator}
    Verify Element Exists       ${breadcrumb_locator}
    ${txt}=    Get Text     ${breadcrumb_locator}
    Log to Console       ${txt}

Add to cart and verify eCare
    [arguments]    ${btn_locator}
    Click On Element    ${btn_locator}
    Sleep   1s
    Verify Element Exists   //input[@id='serial-textbox']
    Verify Element Exists   //button[@id='continue']
    Element Should Contain  //div[@class='how-to']/h2    How do I find my serial number?
    Page should contain image   //div[@class='how-to']//img
    Verify Element Exists   //div[@class='pdp-bg clearfix pdp']//button[@class='modal-close-btn']
    Capture page screenshot


Browse and add Compaitable Hardware
    [arguments]    ${url}   ${addtocart}
    Go to      ${url}
    sleep  5s
    Verify Add To Cart For STO PDP Product     ${addtocart}        //div[@class='product-detail with-bundle']/h1

Browse for eCarepack SKU
    [arguments]    ${ecare_url}   ${addtocart}
    Go to      ${ecare_url}
    sleep  5s
    Click On Element    ${addtocart}
    Sleep   1s
    Verify Element Exists   //h2[contains(text(),'Which product would you like to protect?')]
    Capture Page Screenshot


Select Hardware and Verify
    [arguments]   ${hw}   ${continue_btn}
    Click On Element    ${hw}
    Sleep   2s
    Click On Element    ${continue_btn}
    #Verify Add To Cart For STO PDP Product  ${continue_btn}     ${hw}//h3


 ## PDP_NEW_SUBHASH_END


#Verify 'My orders  #############################################################
Verify Sign In Functionality

    [Arguments]     ${username}   ${password}

    Click Element      ${click_sign_in}
    sleep   1
    Capture Page Screenshot
    Click Element    ${signin_user}
    Enter Value         ${enter_user}    ${username}
    Click Element    ${Clk_nex}
    sleep   1
    Enter Value         ${enter_pass}    ${password}
    Wait Until Element is Visible   ${clk_next}    20
    Click Element    ${clk_next}
    sleep   1

Verify My Orders Page
    [Arguments]    ${click_wlcome}    ${ver_My_orders}
    Wait Until Element is Visible   ${click_wlcome}    20
    Click Element      ${click_wlcome}
    Click Element    ${ver_My_orders}

Verify Search Bar
    [Arguments]    ${search_bar_loc}
    Verify Element Exists      ${search_bar_loc}

Verify the Placeholder Text
    [Arguments]     ${placeholder}
    ${Placeholder_status}=  run keyword and return status  Page Should Contain    ${placeholder}
    Run Keyword If  ${Placeholder_status}==True  Log  Placeholder text is displayed as "search hp.com"
    ...  ELSE  Fail  Placeholder text is not displayed

Verify the Total no. of Orders
    [Arguments]    ${get_txt_loc}
    ${vailable_order} =  Get Text    ${get_txt_loc}
    sleep  2

Verify User Management search Bar
    [Arguments]  ${get_text}
    Enter Value    ${search_text}   ${get_text}
    sleep  2
    Click Element     ${Click_search_icon}
    Page Should Contain    ${get_result}

Verify the Pagination For My Order Page
    [Arguments]    ${load_more_loc}
    ${pagi_count}=  Get Element Count  ${pagination_count}
    Log to console      ${pagi_count}
    Run Keyword If   ${pagi_count}>5    Verify Element Exists    ${load_more_loc}
    ...  ELSE    Log    Pagination is disabled

Verify User Management Clear Search Link
    [Arguments]     ${get_text}   ${search_link}
    Enter Value    ${search_text}   ${get_text}
    sleep  2
    Verify Element Exists   ${search_link}

Verify the search text is cleared
    [Arguments]      ${search_link}   ${placeholder}
    Click Element     ${search_link}
    ${Placeholder_status}=  run keyword and return status  Page Should Contain    ${placeholder}
    Run Keyword If  ${Placeholder_status}==True  Log  Placeholder text is displayed as "search hp.com"
    ...  ELSE  Fail  Placeholder text is not displayed

Verify the Search Result with zero value
    [Arguments]  ${get_text}
    Enter Value    ${search_text}   ${get_text}
    sleep  2
    Click Element     ${Click_search_icon}
    Page Should Contain    ${Zerovalue_result}






############################################# For CLP PAGE ##############################################
Verify Banner
    [Arguments]     ${img_banner}   ${banner_name}
    [Documentation]     Verify the ${banner_name} banner displayed
    Verify Element Exists   ${img_banner}

Validate Breadcrumb
    [Arguments]     ${locator}     ${items}
    @{list}=    Create List
    @{BreadCrumbList}=  Get WebElements  ${locator}
    FOR    ${el}    IN  @{BreadCrumbList}
        ${txt}=    Get Text    ${el}
        Append To List  ${list}     ${txt}
    END
    log to console    ${list}

Validate the intel logo
    [Arguments]     ${img_intel_logo}
    [Documentation]     Validate the intel logo
    Page Should Contain Image   ${img_intel_logo}

Verify Product Details In Landing Page
    [Arguments]     ${productSection}
    [Documentation]     Verify the product details displayed on the screen
    ${index}        set variable     0
    ${elemDetails}      Get WebElements    ${productSection}
    FOR    ${element}    IN    @{elemDetails}
        Length Should Be    ${element.find_elements_by_xpath(".//a//img")}    1       "Product Image does not Exists for the Product"
        Length Should Be    ${element.find_elements_by_xpath(".//a//div[@class='title-wrapper']")}    1       "Product Name does not Exists for the Product"
        Length Should Be    ${element.find_elements_by_xpath(".//span[contains(@class,'landingStartingLabel')]")}    1      "Price Info for the product is not visible on the screen"
        Length Should Be    ${element.find_elements_by_xpath(".//div[@class='gutter cta']")}    1       "View details link is not visible on the screen"
        ${index}        Evaluate         ${index} + 1
    END
    log to console      "Product Information for ${index} products is visible on the screen"

Verify the products under Shop section
    [Arguments]     ${shopSection}
    [Documentation]     Verify the products under Shop section
    ${index}        set variable     0
    ${elemDetails}      Get WebElements    ${shopSection}
    FOR    ${element}    IN    @{elemDetails}
        Length Should Be    ${element.find_elements_by_xpath(".//img")}    1       "Product Image does not Exists for the Product"
        Length Should Be    ${element.find_elements_by_xpath(".//a//div[@class='title-wrapper']")}    1       "Product Name does not Exists for the Product"
        Length Should Be    ${element.find_elements_by_xpath(".//div[@class='gutter cta']")}    1       "View details link is not visible on the screen"
        ${index}        Evaluate         ${index} + 1
    END
    log to console      "Product Information for ${index} products is visible on the screen"

Validate Shop link in banner
    [Arguments]     ${bannerId}
    [Documentation]     Validate Shop Link in Banner
    Click On Element   ${bannerId}
    sleep   1

Validate the products under bottom Espot
    [Arguments]     ${espotSection}
    [Documentation]     Verify the products products under bottom Espot
    ${index}        set variable     0
    ${elemDetails}      Get WebElements    ${espotSection}
    FOR    ${element}    IN    @{elemDetails}
        Length Should Be    ${element.find_elements_by_xpath(".//img")}    1       "Product Image does not Exists for the Product"
        Length Should Be    ${element.find_elements_by_xpath(".//a[@class='btn'][text()='SHOP']")}    1       "SHOP btn does not Exists for the Product"
        ${index}        Evaluate         ${index} + 1
    END
    log to console      "Product Information for ${index} products is visible on the screen"


Validate the View All link under Life style
    [Arguments]     ${lifestyleSectionId}
    [Documentation]     Verify the View All link under Life style section
    Click On Element    //div[@id='lifestyleTab']//a[@targetsection='${lifestyleSectionId}']
    Click On Element    //div[@id="lifestyleTab"]//section[@id="${lifestyleSectionId}"]//a[@class="btn"]


Validate the Shop link under Innovation banner
    [Arguments]     ${shopLinkInnovation}
    [Documentation]     Validate the Shop link under Innovation banner
    Click On Element    ${shopLinkInnovation}

Validate the products under Shop section
    [Arguments]     ${shopLinkShop}
    [Documentation]     Validate the Shop Link under Shop section
    Click On Element    ${shopLinkShop}//a[text()="Shop now"]


############################################# For User Management PAGE ##############################################
Enter registartion data
    [Arguments]     ${firstNameLocator}    ${firstNameValue}
            ...     ${lastNameLocator}    ${lastNameValue}
            ...     ${emailocator}    ${emailValue}
            ...     ${createPasswordLocator}    ${createPasswordValue}
            ...     ${confirmPasswordLocator}    ${confirmPasswordValue}
    [Documentation]     Enter registration data
    run keyword     Enter Value     ${firstNameLocator}    ${firstNameValue}
    run keyword     Enter Value     ${lastNameLocator}    ${lastNameValue}
    run keyword     Enter Value     ${emailocator}    ${emailValue}
    run keyword     Enter Value     ${createPasswordLocator}    ${createPasswordValue}
    run keyword     Enter Value     ${confirmPasswordLocator}    ${confirmPasswordValue}


Pass Captcha and click SignUp
   [Arguments]     ${recaptchaLocator}         ${signUpBtnLocator}
   [Documentation]    Pass Captcha and click SignUp
   #Click On Element    ${recaptchaLocator}

   Click On Element    ${signUpBtnLocator}
   sleep    5

   ######################################### for CLP Page ######################################
Verify the details displayed in product details page
    [Arguments]     ${pdpSection}
    [Documentation]     Verify the details displayed in PDP
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   ${pdpSection}//div[@class="product-detail"]/h1
    Run Keyword If    ${present}    log to console      "Name Visible in Screen"

    ${present}=  Run Keyword And Return Status    Page Should Contain Image   ${pdpSection}//div[@class="pdp-image"]//div[@class="featured-image-container"]//img
    Run Keyword If    ${present}    log to console      "Full Image Visible in Screen"

    ${present}=  Run Keyword And Return Status    Page Should Contain Image   (${pdpSection}//div[@class="pdp-image"]//div[@class="pdp-image-select"]//img)[1]
    Run Keyword If    ${present}    log to console      "Thumbnail Image Visible in Screen"

    ${present}=  Run Keyword And Return Status    Element Should Be Visible   //button[@id='ratings-summary']
    Run Keyword If    ${present}    log to console      "Rating abd review Visible in screen "

    ${present}=  Run Keyword And Return Status    Element Should Be Visible   //button[@id='WAR']
    Run Keyword If    ${present}    log to console      "Write a review Visible in Screen"

    ${present}=  Run Keyword And Return Status    Element Should Be Visible       //span[@class="pdp-sku"]
    Run Keyword If    ${present}    log to console      "SKU ID Visisble On screen"


    ${present}=  Run Keyword And Return Status    Element Should Be Visible       //span[@class="energy-star"]
    Run Keyword If    ${present}    log to console      "ENERGY STAR  Visisble On screen"

    ${present}=  Run Keyword And Return Status    Element Should Be Visible       //ul[@class="ksps"]
    Run Keyword If    ${present}    log to console      "KSP Visisble On screen"

    ${present}=  Run Keyword And Return Status    Element Should Be Visible      //span[contains(text(),'See all Specs')]
    Run Keyword If    ${present}    log to console      "See all Specs Visisble On screen"

    ${present}=  Run Keyword And Return Status    Element Should Be Visible      //span[@class='list-price']
    Run Keyword If    ${present}    log to console      "Price Visisble On screen"
    #//span[@class="sale-price "]//span[@class="currency-symbol"]

    ${present}=  Run Keyword And Return Status    Element Should Be Visible         ${cto_add_customize_btn}
    Run Keyword If    ${present}    log to console      "Customize and buy Button Visisble On screen"

    ${count}=  Get Element Count         //div[@class="swatches color-swatches"]/span
    log to console      "${count} color option available"


Change the color and verify the product images
    #[Arguments]     ${swatchSection}        ${
    [Documentation]     Verify the details displayed in PDP
    ${count}=  Get Element Count         //div[@class="swatches color-swatches"]/span
    log to console      "${count} color option available"

Verify You might also be interested in
    [Arguments]     ${locator}
    [Documentation]     Verify You might also be interested in Section
    Scroll Element Into View    //h2[contains(text(),'You might also be interested in...')]
    sleep    5
#    ${index}        set variable     0
#    ${elemDetails}      Get WebElements    ${locator}
#    FOR    ${element}    IN    @{elemDetails}
#        Length Should Be    ${element.find_elements_by_xpath(".//a[@class='pdp-xsell-title']/h3")}    1       "Product Name does not Exists for the Product"
#        Length Should Be    ${element.find_elements_by_xpath(".//div[@class='prd-price ']")}    1       "Product Price does not Exists for the Product"
#        Length Should Be    ${element.find_elements_by_xpath(".//a[@class='pdp-xsell-link']")}    1       "View details link is not visible on the screen"
#        ${index}        Evaluate         ${index} + 1
#    END
#    log to console      "Product Information for ${index} products is visible on the interested in screen"


click on tab and verify
    [Arguments]     ${tab_locator}      ${element_to_verify}
    [Documentation]     CLick on the tab and verify the tab content
    click on element    ${tab_locator}
    sleep   2
    Verify Element Exists     ${element_to_verify}


Verify Accessorie tab
    [Arguments]     ${tab_locator}
    [Documentation]     CLick on the tab and verify the tab content
    click on element    ${tab_locator}
    sleep   2
    Verify Element Exists     //div[contains(text(),'Browse Accessories')]
    ${count}=  Get Element Count         //div[@class="cat-acc-carousel"]//li
    log to console      "${count} Browse Accessories product available"

Verify Support tab
    [Arguments]     ${tab_locator}
    [Documentation]     CLick on the tab and verify the tab content
    click on element    ${tab_locator}
    sleep   2
    Verify Element Exists     //h2[contains(text(),'Recommended HP Care Packs')]
    ${index}        set variable     0
    ${elemDetails}      Get WebElements    //div[@class='pdp-supp-list']//li
    FOR    ${element}    IN    @{elemDetails}
        Length Should Be    ${element.find_elements_by_xpath(".//button[text()='Add to cart']")}    1       "Add to cart does not Exists for the Product"
        Length Should Be    ${element.find_elements_by_xpath(".//a[text()='View Details']")}    1       "View Details does not Exists for the Product"
        ${index}        Evaluate         ${index} + 1
    END
    log to console      "Recommended HP Care Packs should be displayed ${index} products."

Verify CTO configurator page
    [Arguments]      ${btn_locator}
    [Documentation]     Verify CTO pages
    Verify Element Exists   //h2[@id='confTitle']
    Page Should Contain Image   //div[@id="section_summary"]//img
    Verify Element Exists   //div[@id="shipDate_sideBar"]
    Verify Element Exists   //div[@id="PST"]
    Element Should Contain    //div[@id="PST"]      $
    Verify Element Exists   ${btn_locator}
    Verify Element Exists   //div[@class="specSummary"]
##################CTO############################################################################
Verify the CTO Recommended Configurations
    [Documentation]     Verify the CTO Recommended Configurations
    Verify Element Exists   ${locator_recconfig}
    Verify Element Exists   ${locator_bstvalue}
    Verify Element Exists   ${locator_performance}
    Verify Element Exists   ${locator_compareoption}
    Capture Page Screenshot

Verify user click in configurations
    Click On Element    ${locator_bstvalue}
    Click On Element    ${locator_performance}
    sleep   3

Verify add to cart for multiple Accessories
    [Arguments]      ${accList}     ${productSummary}
    [Documentation]     Verify CTO configurator page

    click on element   //div[@class='slick-track']/div[1]//a[text()='Add to cart']
    sleep   3s
    Element Should Be Visible   //div[@class='slick-track']/div[1]//a[text()='In Cart']
    ${text}=    Get Text   //div[@class='slick-track']/div[1]//h3
    Element Should Contain      ${productSummary}  ${text}  ignore_case=True
    click on element   //div[@class='slick-track']/div[2]//a[text()='Add to cart']
    sleep   3s
    Element Should Be Visible   //div[@class='slick-track']/div[2]//a[text()='In Cart']
    ${text}=    Get Text   //div[@class='slick-track']/div[2]//h3
    Element Should Contain      ${productSummary}  ${text}  ignore_case=True

#    FOR    ${INDEX}    IN RANGE    1   4
#        click on element   //div[@class='slick-track']/div[${INDEX}]//a[text()='Add to cart']
#        sleep   3s
#        Element Should Be Visible   //div[@class='slick-track']/div[${INDEX}]//a[text()='In Cart']
#        ${text}=    Get Text   //div[@class='slick-track']/div[${INDEX}]//h3
#        Element Should Contain      ${productSummary}  ${text}  ignore_case=True
#    END

Verify remove from cart summary
    [Arguments]      ${acclist}  ${productsummary}
    [Documentation]     Verify remove from cart summary Add to cart
    Element Should Be Visible   //div[@class='slick-track']/div[1]//a[text()='In Cart']

    click on element    ${productsummary}/div[1]//a[text()='Remove']
    sleep   5s
    Element Should Be Visible   //div[@class='slick-track']/div[2]//a[text()='Add to cart']

Verify details for accessory
    [Arguments]      ${acclist}
    [Documentation]     Verify details for accessory
    Click On Element   //div[@class='slick-track']/div[1]//div[@class='detailsLink']
    Sleep   5s
    Element Should Be Visible       //div[@id='moreinfoDgSub']
    Click On Element        //div[@id='moreinfoDgSub']//a[@class='closemoreinfo']

Verify the Sub-total price in Cart
    [Arguments]      ${productSummaryList}
    [Documentation]     Verify details for accessory
    #//div[@class='xocart_cont ']/div[@class='productrow']
    ${price_str}=       Get Text    //span[@id='cartSubtotal']
    ${price}=       Convert to Number   ${price_str}[1:]
    ${price_count}=     Get Element Count   //div[@class='product-price-tab']/span[1]
    ${price_sub}=   Set Variable    ${0.0}
    FOR    ${INDEX}    IN RANGE    1   ${price_count}+1
        ${p_str}=       Get Text    (//div[@class='product-price-tab']/span[1])[${INDEX}]
        ${p}=       Convert to Number   ${p_str}[1:]
        ${price_sub}=   Evaluate    ${price_sub}+${p}
    END
    log to console      ${price}
    Should Be Equal As Numbers      ${price}    ${price_sub}

Verify the Sub-total price, TOTAL, CART TOTAL prices in Cart
    [Arguments]      ${total}       ${subTotal}     ${cartTotal}
    [Documentation]     Verify the Sub-total price, TOTAL, CART TOTAL prices in Cart
    ${total_txt}=   Get Text    ${total}
    ${subTotal_txt}=   Get Text    ${subTotal}
    ${cartTotal_txt}=   Get Text    ${cartTotal}
    Should Be True      '${total_txt}'=='${subTotal_txt}'
    Should Be True      '${total_txt}'=='${cartTotal_txt}'

Verify View/edit customization for CTO
    [Arguments]     ${viewedit_link}    ${cusimg}    ${edit_link}
    [Documentation]     Verify View/edit customization for CTO
    click on element    ${viewedit_link}
    Sleep   5s
    Page Should Contain Image       ${cusimg}
    Element Should Be Visible   ${edit_link}

Verify edit your configuration
    [Arguments]     ${edit_link}    ${addtocart}
    [Documentation]     Verify edit your configuration

    Execute javascript  document.body.style.zoom="70%"
    sleep  3




    Set Focus To Element  ${edit_link}
    Press Keys    ${edit_link}    ENTER
    #Set Focus To Element  //div[@class='prodSpecs reveal-modal modalBorder fullbleed open']
    #Verify Element Exists    //a[text()='Edit your configuration'][1]
    #Scroll To Element In View   //div[@class='prodSpecs reveal-modal modalBorder fullbleed open']//div[@class='techDetails']
    #Sleep  5s

#    mouse down with offset    //a[text()='Edit your configuration'][1]    300    300
#    mouse move     //a[text()='Edit your configuration'][1]
     #Execute JavaScript      window.scrollTo(0,300)
     #maximize browser window
    #Scroll To Element In View     //p[text()=' Custom built to your specs']
    #click on element     //a[text()='Edit your configuration'][1]
    #click on element    ${edit_link}
    #reset:
    Execute javascript  document.body.style.zoom="0%"
    Sleep   5s
    Element Should Contain      ${addtocart}    Update Configuration



########################### Verify Quotes (User Management)  ###########################################

Login to SMB_Private application
    [Arguments]     ${SignIn}
    Click Element   ${SignIn}
    Click Element   ${SignIn_DropDown}
    Enter Value      ${UserName}   ${smb_pvt_username}
    Click Element   ${NextButton}
    Enter Value        ${Password}      ${smb_pvt_password}
    Click Element   ${SignInButton}
    Wait Until Element Is Visible    ${WelcomeTextDropdown}
    ${Welcome_text} =  Get Text   ${WelcomeTextDropdown}
    Should be equal   ${Welcome_text}    ${Welcome_txt_Expected}  "User is not logged in"
    Log To Console      "HPID Sign in page is displayed with User name field"
    Log To Console      "User is successfully logged in displayed on top with Welcome, <user name>"


Verify MyQuotes
    [Arguments]     ${MyQuotesTitle}
    [Documentation]   "Test"
    Wait Until Element is Visible   ${WelcomeTextDropdown}    20
    Click Element   ${WelcomeTextDropdown}
    Click Element   ${MyAccount}
    Wait Until Element is Visible   ${MyQuotes}
    Click Element                   ${MyQuotes}
    Verify Element Exists           ${MyQuotesTitle}
    List Selection Should Be        ${QuotesMonthsFilter}          Last 6 months
    capture page screenshot         ${CURDIR}${/}/AllScreenCaptures/MyQuotesPage.png
    Log To Console                  "My Quotes Page is Displayed and Screenshot is Captured"

#6. Verify Quote details
Validate MyQuotesPage
    [Arguments]     ${QuoteNumberSearch}
    [Documentation]     Verify Quote is Displayed with all the Details
    Verify Element Exists       ${QuoteNumberSearch}
    Verify Element Exists       ${QuoteNumber}
    Verify Element Exists       ${ValidFromToDate}
    Verify Element Exists       ${TotalAmt}
    Verify Element Exists       ${QuoteStatus}
    Verify Element Exists       ${ViewQuoteLink}
    Verify Element Exists       ${ProductImgMyQuotes}
    Verify Element Exists       ${ProductPriceMyQuotes}
    Verify Element Exists       ${ProductQtyMyQuotes}
    Log To Console              "Quote is displayed with all the details"

#7. Click on 'View quote'
Verify ViewQuoteLink
    [Arguments]     ${ViewQuoteLink}
    [Documentation]     Verify Manage Quote', 'Quote Summary', 'Quote Details' , 'Shipping' sections
    Click Element               ${ViewQuoteLink}
    Verify Element Exists       ${ManageQuoteSection}
    Verify Element Exists       ${QuoteSummarySection}
    Verify Element Exists       ${QuoteDetailsSection}
    Verify Element Exists       ${QuoteShipmentSection}
    Log To Console         "'Manage Quote', 'Quote Summary', 'Quote Details' , 'Shipping' sections are Displayed"

#8. Verify 'Manage Quote' section
Verify ManageQuoteSection
    [Arguments]     ${EmailToTextbox}
    [Documentation]     Verify Manage Quote Section
    Verify Element Exists       ${EmailToTextbox}
    Verify Element Exists       ${SendQuoteButton}
    Log to Console      "Manage Quote Section is Displayed with the Details"

#9. Verify 'Quote Summary' section
Verify QuoteSummarySection
    [Arguments]     ${QuoteNumber}
    [Documentation]     Verify Quote Summary Section
    Verify Element Exists       ${QuoteNumber}
    Verify Element Exists       ${QuoteStatus}
    Verify Element Exists       ${AgentID}
    Verify Element Exists       ${ValidFromToDate}
    Verify Element Exists       ${SubTotal}
    Verify Element Exists       ${Tax}
    Verify Element Exists       ${ShippingDetails}
    Verify Element Exists       ${TotalAmtQuoteSummary}
    Log to Console      "Quote Summary Section is Displayed with the Details"

#10. Verify 'Quote Details' section
Verify QuoteDetailsSection
    [Arguments]     ${ProdImgQuoteDetails}
    [Documentation]     Verify Quote Details Section
    Verify Element Exists       ${ProdImgQuoteDetails}
    Verify Element Exists       ${ProdNameQuoteDetails}
    Verify Element Exists       ${SKUIDQuoteDetails}
    Verify Element Exists       ${ReturnsMessage}
    Verify Element Exists       ${ProdQtyQuoteDetails}
    Verify Element Exists       ${ProdPriceQuoteDetails}
    Log to Console      "Quote Details Section is Displayed with the Details"



########################################## Header and FOoter #################################
Verify the Header links
    [Documentation]     Ensure Header Links is displayed
    #HP direct hotline number, 'Need Help', 'Customer Service', 'Sign in/Register'
    Element Should Contain      ${locator_hp_hotline}   ${hp_hotline_number}
    Verify Element Exists       ${locator_needhelp}
    Verify Element Exists       ${locator_customerservice}

Verify the Footer links
    [Documentation]     Ensure Footer Links
    #'About us', 'Ways to buy', 'Support', 'HP Partners', 'Stay Connected'
    Verify Element Exists       ${locator_aboutus}
    Verify Element Exists       ${locator_waystobuy}
    Verify Element Exists       ${locator_support}
    Verify Element Exists       ${locator_hppartner}
    Verify Element Exists       ${locator_stayconnected}

Verify the Bottom row links
    [Documentation]     Ensure the Bottom row links
    FOR  ${item}  IN  @{list_footer_text}
        log to console      ${item}
        Element Should Contain      ${locator_footer_privacylins}   ${item}
    END

Go to Top sellers section and add STO product
    [Documentation]     Navigate to Top sellers section and add STO product
    Go To   ${cto_url}
    Add STO Product to Cart and Verify    ${locator_addtocart_btn}      ${locator_stoproduct_title}

Click on View all items in mini cart
    [Documentation]     Navigate to View all items in mini cart
    #Mouse Over      ${miniCartIcon}
    click on element    ${miniCartIcon}
    sleep   5s

Verify top header in Checkout page
    [Documentation]     Ensure to check top header in Checkout page
    Verify Element Exists       ${locator_hplogo}


Take screenshot
    log to console     "This will take my screenshot"


######################################################## Checkout #####################################################
Search SKU and add to cart and verify
    [Arguments]     ${skuid}    ${searchbox}
    [Documentation]      Search the SKUID and add to cart
    Enter Value     ${searchbox}     ${skuid}
    Sleep   2s
    Press Keys    ${searchbox}    ENTER
    #Click on element    ${searchboxbtn}
    Sleep   6
    ${productName} =    Get Text    //div[contains(@class,'product-detail')]/h1
    Click on element    ${locator_btn_addtocart}
    sleep   2s
    ${present}=  Run Keyword And Return Status    Element Should Be Visible   (//button[@class='modal-close-btn'])[3]
    Run Keyword If    ${present}    Click on Element    //div[contains(@class,'xsell-modal-container-default')]//button[@class='modal-close-btn']
    sleep   1s
    Mouse Over     //button[@class="button-icon "]
    Verify Element Exists       //div[@class='minicart_title']
    Element Should Contain      //div[@class="mcprodcont"]      ${productName}      "Product is not added to the cart"
    Click On Element    //a[@class='hf_close_btn']











