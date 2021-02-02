*** Settings ***

Resource  ../../../main/Common Application Methods/commonMethods.robot
Variables    ../../../../Test Data/Variables.py
Variables       ../../../../Conf/conf.py
Variables       ../../../main/Page Objects/UserManagement/UserManagementCommon.py
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
    run keyword if      '${tech}'!='WEB'     import Variables     ${UserManagementPOFiles}/UserManagementMobile.py
    ...     ELSE       import Variables     ${UserManagementPOFiles}/UserManagementWeb.py

*** Test Cases ***
#####################################       Test Cases for My orders        ####################################
Verify My orders
    [Tags]  WEB     MOBILE
    #Step 1: Launch the application in appropriate device/desktop
    #run keyword if     "${tech}" == "MOBILE"       Initiate Appium
    Launch ETR Application  ${url}
    Click On Element    ${iAcceptBtn}
    run keyword if      '${tech}'=='WEB'    run keywords
    ...     Select Application Frame     ${frame_SSM}
    ...     AND     click on element    ${closeForm_SSM}
    ...     AND     Unselect Frame

    #2. Click on 'Sign in' under 'Sign in/Register' dropdown on top
    #3. Enter Email ID of registered user and click on NEXT
    #4. Enter valid Password and click on 'SIGN IN'
    Verify Sign In Functionality    ${user_data}     ${user_Password}
    sleep  2

    ${Welcome_text} =  Get Text    ${Welcome_txt_Actual}
    Should be equal   ${Welcome_text}    ${Welcome_txt_expected}   "User is not logged in"
    Log to Console   User successfully logged in displayed  Welcome, <user name> on top

    #5. Click on 'My orders' link under 'welcome,< user> dropdown in top
    Verify My Orders Page    ${Welcome_txt_Actual}   ${clk_My_orders}
    verify Element Exists     ${your_orderpage}

    #6. Verify search bar is displayed
    Verify Search Bar    ${search_bar}

    #7. verify the place holder text in 'search bar'
    Verify the Placeholder Text   ${placeholder_text}


    #8. Verify the total number of order is displayed as text
    Verify the Total no. of Orders     ${total_order}

    #9. verify the count and change in order text displayed while searching with H-order number in search bar
    #10. verify the count and change in order text displayed while searching with R-order number in search bar
    Verify User Management search Bar   ${anytext}

    #12. Verify the pagination For My Order page, if search term gives more than 5 results
    Verify the Pagination For My Order Page    ${load_more}

    #13. Verify 'clear search' link is displayed when searched with text
    Verify User Management Clear Search Link    ${anytext}    ${Clear_search_link}

    #14. Verify the search text is cleared using link 'clear search'
    Verify the search text is cleared    ${Clear_search_link}    ${placeholder_text}

    #15. verify the search result text displayed when search result give zero value
    Verify the Search Result with zero value      ${zero_text}

#####################################      Verify 'My Quotes' (  User Management  )     ####################################
TC_Verify_My_Quotes
#1. Browse for Storefront URL
    Launch ETR Application  ${url}
    Click On Element    ${iAcceptBtn}
    Log To Console      "Storefront homepage is displayed"

#2. Sign in with valid "SMB Private user" credentials and Click on My Account link Click on 'Sign in' under 'Sign in/Register' dropdown on top
#3. Enter Email ID of registered user and click on NEXT
#4. Enter valid Password and click on 'SIGN IN'
    Login to SMB_Private application    ${SignIn}

#5. Click on 'My quotes' from Welcome, <user name> top
    Verify MyQuotes     ${MyQuotesTitle}

#6. Verify Quote details
    Validate MyQuotesPage   ${QuoteNumberSearch}

#7. Click on 'View quote'
    Verify ViewQuoteLink     ${ViewQuoteLink}

#8. Verify 'Manage Quote' section
    Verify ManageQuoteSection     ${EmailToTextbox}

#9. Verify 'Quote Summary' section
    Verify QuoteSummarySection    ${QuoteNumber}

#10. Verify 'Quote Details' section
    Verify QuoteDetailsSection    ${ProdImgQuoteDetails}
