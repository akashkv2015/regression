*** Settings ***

Resource  ../../../main/Common Application Methods/commonMethods.robot
Variables    ../../../../Test Data/Variables.py
Variables       ../../../../Conf/conf.py
Variables       ../../../main/Page Objects/MLP/MLPCommon.py
Variables       ../../../main/Page Objects/MLP/MLPWeb.py
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
    Empty Directory    ${CURDIR}${/}/AllScreenCaptures

SetupSuite
    Clear existing images
    run keyword if      '${tech}'=='MOBILE'    import library   AppiumLibrary
    ...     ELSE       import library       SeleniumLibrary
    run keyword if      '${tech}'!='WEB'     import Variables     ${MLPPOFiles}/MLPMobile.py
    ...     ELSE       import Variables     ${MLPPOFiles}/MLPWeb.py

*** Test Cases ***
#####################################       Test Cases for MLP Page        ####################################
VVerify MLP Page Features
    [Tags]  WEB     MOBILE
    #Step 1: Launch the application in appropriate device/desktop
    #run keyword if     "${tech}" == "MOBILE"       Initiate Appium
    Launch ETR Application     ${mlp_url}

    #Capture Page Screenshot

#    run keyword if      '${tech}'=='WEB'    run keywords
#    ...     Select Application Frame     ${frame_SSM}
#    ...     AND     click on element    ${closeForm_SSM}
#    ...     AND     Unselect Frame
    #Step 2: Validate Breadcrumb shown on top

    Validate Breadcrumb Text   ${bread_crumb}

    #Step 3: Verify models are displayed in 'Grid view' by default
    #Verify Model Displayed in Grid View   ${grid_view}
    #Step 4: Verify Model Name in Grid View
    Verify Model Name in Grid View  ${grid_modelname}
    #Image
    Verify Model image in Grid View   ${grid_modelimage}
    #Key selling points
    Verify Key selling points in Grid View   ${view_Keysellingpoint}
    #'View all' link with count of products
    Verify View All Link with count of Product in Grid View  ${View_all_productlink}
    #Ratings & Reviews
    Verify Ratings & Revies in Grid View   ${View_rating_review}
    #Loyalty generic message ‘Earn 3% in HP Rewards with purchase’ (if any)
    Verify Loyalty Generic Message in Grid View   ${loyalty_rewards}
    #Price displayed with 'Starting at' and $ displayed as Superscript
    Verify Price displayed in Grid View  ${Price_displayed}
    #View Detail
    Verify View Details displayed in Grid View   ${viewdetail_locator}
    #5. Verify for the ""Registered & TM"" symbols in the Key selling points
    Verify the Registered & TM symbols in Grid View   ${grid_Symbols}  ${grid_reg_tm}
    #6. Click on 'List view'
    Verify Model Displayed in List View   ${list_view}
    #7.Verify the Model displayed
    #Name
    Verify Model Name in List View    ${list_modelname}
    #Image
    Verify Model image in List View     ${list_modelimage}
    #Key selling points (KSP)
    Verify Key selling points in List View   ${view_Keysellingpoint_list}
    #'View all' link with count of products
    Verify View All Link with count of Product in list View   ${View_all_productlink_list}
    #Ratings & Reviews
    Verify Ratings & Revies in List View   ${list_rating_review}
    #Loyalty generic message ‘Earn 3% in HP Rewards with purchase’ (if any)
    Verify Loyalty Generic Message in List View    ${loyalty_rewards_list}
    #Price displayed with 'Starting at' and $ displayed as Superscript
    Verify Price displayed in List View  ${Price_displayed_list}   ${list_displayedprice}
    #View Details
    Verify View Details displayed in List View   ${viewdetail_listlocator}


    #8. Verify for the ""Registered & TM"" symbols in the Key selling points
    #Verify the Registered & TM symbols in List View   ${list_symbols}   ${Reg_Tmtext_verif}

    #Step 9:Mouse hover on ‘Earn 3% in HP Rewards with purchase’ & verify the loyalty message in the pop up
    #Mose Hover and Verify The Loyalty Message  ${loyalty_rewards}  ${loyalty_text}
    # Step 10: Verify for ""PRIVATE STORE EXCLUSIVE PRICE"" label above the price for Private store users
    Login to application    ${User_Id}    ${User_password}
    sleep   5

    ${Private_Store_Expected} =  Get Text   ${Private_ExclText}
    Should be equal   ${Private_Store_Expected}    ${Private_Store_Actual}    "PRIVATE STORE EXCLUSIVE PRICE label is not visible above the price"
    Log to Console   PRIVATE STORE EXCLUSIVE PRICE label is visible above the price
    Go To   ${mlp_url}
    #Step 11: Click on ""View all"" / 'View Details'
    Click On View Detail and Verify MDP Page   ${viewdetail_locator}  ${mdplocator}