# # Page elements
# # Page elements for Home Page
# txt_search_textbox = 'search_focus_desktop'
# btn_begin_your_search = '//input[@id="search_focus_desktop"]/..//a[@title="Begin your search"]'
# btn_add_to_cart='//button[@class="btn btn-primary purchase-btn"]'
# cto_button_custom='//button[@class="btn btn-primary purchase-btn"]'
# search1_result='//*[@id="PLPPageTitle"]'
# search_result='//*[@id="PLPPageTitle"][contains(text(),"Results")]'
# category_txt='//*[@id="subCatForm"]/div[1]'
# category_dropdown='//*[@id="subCatForm"]/h3'
# Category_dropdown_values='//*[@id="subCatForm"]/div[2]/label[3]/span'
#
# Category_dropdown_Items = "All HP Store Laptops & Tablets   Desktops    Displays & Accessories  Care Packs"


# Page elements
# Page elements for Home Page
txt_search_textbox = 'search_focus_desktop'
btn_begin_your_search = '//input[@id="search_focus_desktop"]/..//a[@title="Begin your search"]'
btn_add_to_cart="(//span[@class='cta_price']/a)[1]"
cto_button_custom="(//div[@class='CTO-btn-container PCOnly']/a)[1]"
search1_result='//*[@id="PLPPageTitle"]'
search_result='//*[@id="PLPPageTitle"][contains(text(),"Results")]'
category_txt='//*[@id="subCatForm"]/div[1]'
category_dropdown='//*[@id="subCatForm"]/h3'
Category_dropdown_values='//*[@id="subCatForm"]/div[2]/label[3]/span'

Category_dropdown_Items = "All HP Store Laptops & Tablets   Desktops    Displays & Accessories  Care Packs"


txt_result = "Results"
anyText="pavilion"
### For the Accept Privacy Button
iAcceptBtn = "//button[text()='I ACCEPT']"
### For the Sign up & Save Modal window frame
frame_SSM = "//iframe[@id='iframe']"
### For the Close button on Sign up & Save Modal form
closeForm_SSM = "//div[@id='closeForm']"
## For Checkout as Guest Button
chkOutAsGuest = "//a[text()='checkout as guest']"
#Shippin And Billing View Elements
txt_first_name = '//input[@id="cFN"]'
txt_last_name = '//input[@id="cLN"]'
txt_contact_number = 'cPN'     #using javascript executor for this element, no need to add locator strategy in variable
txt_email_address = '//input[@id="cEmail"]'
txt_shipping_address = '//input[@name="addrTypeAheadInput"]'
searched_address_list_item = '//ul[@id="mainAddrList"]/li[1]'
txt_company = '//input[@id="sCN"]'
psg_frame = '//iframe[@id="pgsIframe"]'
btn_credit_debit_Card = '//div[@id="payTab1"]'
txt_card = '//input[@id="txtCardNumber"]'
txt_expiry_date = '//input[@id="txtExpDate"]'
txt_cvv = '//input[@id="txtCVV"]'
btn_review_order = '//div[@id="btnReviewOrder"]'


# ###Private_Exclusive_Price Text
# Pvt_Exclusive_Price = "//span[@id='price_tier']"
# ###"PRIVATE STORE EXCLUSIVE PRICE"  text for Private store users
# Private_Store_Expected = "PRIVATE STORE EXCLUSIVE PRICE"
Pvt_Exclusive_Price = "//div[@class='topReview']//div[@class='promotion-text']"
Private_Store_Expected = "Private Store Exclusive SKU"
###User SignIn Option
SignIn = "//a[contains(text(),'Sign in/Register')]"
SignIn_DropDown = "(//li//a[text()='Sign in'])[1]"
###UserName Textbox
UserName = "//input[@id='username']"
###User Password Textbox
Password = "//input[@id='password']"
###Next Button
NextButton = "//button[@id='next_button']"
###SignIn Button
SignInButton = "//button[@type='submit']"
###3% HP Rewards Loyalty Text to verify exact text
LoyaltyTxt = """3% back in HP Rewards
HP Rewards is a loyalty program where users earn HP Rewards points by buying eligible HP Products.
Learn more"""
### Product Details
ProductDetails = "//div[@class='row']"
##ProductName
ProductName = "//div[@class='productInfo2']//h3/a"
##Carousel Icon
CarouselIcon = "(//a[@class='pdtImgs-orbit-next'])[1]"
##Image/Alternate Image
AltImg = "//div[@class='productInfo1']//div[@class='pdtImgs-orbit-container']"
##Ratings& Review
RatingsnReview = "//div[@class='productRating']"
##SKU ID
sku_id = "//div[@class='partNo']"
###ENERGY STAR
EnergyStar = "//*[text()='ENERGY STAR']"
###Key selling points (KSP)
ksp = "//ul[@class='productFeatLst']"
###Price starting with '$'
# PriceStart = "//span[starts-with(text(),'$')]"
PriceStart ="//span//sup[starts-with(text(),'$')]"
####Compare link (If available
CompareLink = "//div[@class='inv_compare ']"
###Only X Left in Stock    (If inventory is less than threshold) / Shipping status label
OnlyXleft = "//span[@class='lowinventoryinfo']"
###Violator Message
ViolatorMsg = "//div[contains(@class,'productWrapper')]//*[@class='promotion-text']"
### For the SortBy Dropdown
sortby = "//form[@id='sortForm']"
###SortBy List Elements Text
sortbyMenu = "//select[@class='sort-menu']"
SortByItems = "Default Lowest price Highest price Ratings Name Newest"

###Add to Cart STO Product
AddToCart_STO = "(//a[contains(text(),'Add to cart')])[1]"
#ProductName_STO = "(//a[@class='productHdr'])[1]"
#ProductName_STO = "(//a[contains(@aria-label,'Add to cart')]/../../preceding::a[@class='productHdr'])[1]"
ProductName_STO = "(//a[contains(@aria-label,'Add to cart')]/../../preceding::a[@class='productHdr'])[3]"

##Just Added to Cart Popup when clicked on AddtoCart button
JustAddedtoCartPopup = "//div[@class='widget_content xo_minicart']"
### For mini cart icon
miniCartIcon = "//a[@title='Shopping Cart' and @data-uitype='minicart-activator']"
### For mini cart Container Title
miniCartTitle = "//div[contains(@class, 'minicart-container')]//div[@class='minicarttitle']"
###
minicartProductContent = "//div[@class='mcprodcont']"

TechSpec = "//label[contains(text(),'Tech spec')]"
HpPurchaseRewards = "(//span[contains(text(),'3% back in HP Rewards')])[position()=1]"
AddtoCartButton = "//div[@class='productInv inventory_holder']//a[@role='button']"
TechSpecClose = "(//span[@class='closeSpecsBtn'])[position()=1]"
###Earn 3% in HP Rewards Tooltip Lolayty Message
LoyaltyTooltip = "(//div[@class='rewards-tooltip'])[position()=1]"
### See All Offers
SeeAllOffers = "(//label[contains(text(),'See all offers')])[4]"
### See All Offers ToolTip
SeeAllOffersToolTip = "//span[@class='tooltipContent']"

###Load More Button
LoadMoreButton = "//div//label[@for='page_more']"
###Single Product Section
UnitProductSection = "//div[@class='productCard']"

closePdpBlockpopup = "//a[@class='close-reveal-modal']"
####CTO Custom & Buy Button
CTOCustnBuyButton = "//div[@class='CTO-btn-container PCOnly']"
### Configuration Page Title
ConfTitle = "//h2[@id='confTitle']"

###Search Bar TextBox
SearchBarTextbox = "//input[@id='search_focus_desktop']"
###Search Icon
SearchIcon = "(//a[@title='Begin your search'])[2]"
###"Laptops" Search title
SearchTitle = "//h1[contains(text(),'laptops')]"

###Registered Symbol in Product Details
RegisteredSymbol = "//span[contains(@title, '®')]"
###TM Symbol in Product Details
TMSymbol = "//span[contains(@title, '™')]"

###facetCrumb Wrapper ID
FacetCrumbWrapper = "//h1[@id='facetCrumbWrapperId']"
###CLear All Facet Trail
ClearAllFacetTrail = "//span[@class='clearFacetsBC']"
###Clear All In Filters
ClearALlFilters = "//div[@class='clearFacets']"
###category - Laptops & Tablets
LaptopsTablets = "//span[@class='subCatName' and contains(text(),'Laptops & Tablets')]"
###FacetCrumb - Laptops & Tablets
LaptopsTabletsFacetCrumb = "//div[@class='catCrumbs' and contains(text(),'Laptops & Tablets')]"
###Sale Dropdown
# SaleDropdown = "//div//h3[@id='facetName_x_onsale']"
SaleDropdown ="//div//h3[@id='facetName_x_onsale']"
###Sale Checkbox
SaleCheckbox = "//span[@class='facetItemLbl' and contains(text(),'Sale')]"
###In Cart Pricing Checkbox
InCartPricingCheckbox = "//span[@class='facetItemLbl' and contains(text(),'In Cart Pricing')]"
###Sale FacetCrumb
SaleFacetCrumb = "//span[@class='facetCrumb' and contains(text(),'Sale')]"
###InCartPricing FacetCrumb
InCartPricingFacetCrumb = "//span[@class='facetCrumb' and contains(text(),'In Cart Pricing')]"
###Results For Pavilion
ResultsForPavilion = "//h2[@class='pageTitle' and contains(text(),'Results for') and contains(text(),'pavilion')]"
