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
###################################       Test Cases for My orders        ####################################
Verify My orders
    [Tags]  WEB     MOBILE
    #Step 1: Launch the application in appropriate device/desktop

    Launch ETR Application  ${Uat_url}


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
    Launch ETR Application  ${uat_url}
    #Click On Element    ${iAcceptBtn}
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



#################################Validate registering GS user and Edit#########################################
Validate registering GS user and Edit
    Launch ETR Application       ${Uat_url}

    #2. Enter the First Name, Last Name, Email address, Create password & Confirm password
    Login to GS user application     ${check_robot}

    #3.Check the I'm not a robot button and click on 'SIGN UP'
    Verify the I'm not a robot button and Sign up

    #Verify First Name, Last Name, Email address fields are auto populated with the data given in HPID registration page
    Verify HPID registration page data

    # Click on COMPLETE
    Click on COMPLETE       ${completed}

    #Click on 'Update personal details' link
    Verify Update personal details    ${update_personal}   ${personal_loc}
    #Update First name, Last name, Address, Phone number, City, State, Zip code and click on Update in 'Change Billing Address' section
    Verify & Update Personal Details
    #9 Click on Logout under Welcome, <username> on top
    Verify Logout under Welcome     ${welcome_user}    ${logout}
    # 10 Click on 'Sign in' under 'Sign in/Register' dropdown on top
    Verify Sign In Page

    #11 Enter Email ID registered above and click on NEXT
    Enter Email Id

    #Enter Password used above while registering and click on 'SIGN IN'
    Verify Password and sign in functionality


###################################Validate registering Private store user and Edit###############
Validate registering Private store user and Edit

     Launch ETR Application       ${Uat_url}
     # Enter the First Name, Last Name, Email address, Create password & Confirm password
     Login to GS user application     ${check_robot}
     #Check the I'm not a robot button and click on 'SIGN UP'
     Verify the I'm not a robot button and Sign up
     #Verify First Name, Last Name, Email address fields are auto populated with the data given in HPID registration page
     Verify HPID registration page data
      # Click on COMPLETE
     Click on COMPLETE       ${completed}
     #Click on 'My address book' link
     Verify My address book
     # Click on 'Add new shipping address'
     Verify new shipping address
     #Enter 'Address nick name', 'First name', 'Last name', Address, Phone number, City, State, ZIP Code and click on 'Submit Shipping address'
     Verify & add new shipping address
     #Click on 'Make default' for the address
     Verify My default functionality
     #Click on Ok
     Verify Alert Box
     #Click on Logout under Welcome, <username> on top
     Verify Logout under Welcome      ${welcome_user}    ${logout}
     #Click on 'Sign in' under 'Sign in/Register' dropdown on top
     Verify Sign In Page
     # Enter Email ID registered above and click on NEXT
     Enter Email Id
     #Enter Password used above while registering and click on 'SIGN IN'
     Verify Password and sign in functionality

########################    Validate registering SMB Public user and Edit #############################
TC_Validate_Registering_SMB_PublicUserandEdit
#1. Launch the Store url and click on Register from 'Sign in/Register' dropdown
    Launch ETR Application  ${uat_url}
    Log To Console      "Storefront homepage is displayed"
    Wait until Element is Visible   ${SignIn}
    Click Element   ${SignIn}
    Click Element   ${Register_Dropdown}

#2. Enter the First Name, Last Name, Email address, Create password & Confirm password
#3. Check the I'm not a robot button and click on 'SIGN UP'
    Enter Registration Page Details   ${FirstName}

#4.Verify First Name, Last Name, Email address fields are auto populated with the data given in HPID registration page
    Verify Registration Page      ${FirstNameLabel}

#5. Enter valid company name in 'Company name' field
    Enter Value   ${CompanyNameInput}     ${CompanyNameText}
    Log to Console  "'Company name' is entered"

#6. Click on 'COMPLETE' button
    Verify Complete Button     ${CompleteButton}

#7. Click on 'Update Personal details' link
    Click On Element    ${UpdatePersonalDetails}
    Log to Console   "Update Button Clicked successfully"

#8. Enter new email address, confirm new email address and then click 'Update' under 'Change Email' section
    Verify New Email Address    ${NewEmailId}

#9. Click on Logout under Welcome, <username> on top
    Verify Logout   ${LogoutDropdown}

#10. Click on 'Sign in' under 'Sign in/Register' dropdown on top
#11. Enter Email ID registered above and click on NEXT
#12. Enter Password used above while registering and click on 'SIGN IN'
    New Registered User Login    ${SignIn}




