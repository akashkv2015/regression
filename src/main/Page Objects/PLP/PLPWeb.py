# Page elements

# ###Private_Exclusive_Price Text
# Pvt_Exclusive_Price = "//span[@id='price_tier']"
# ###"PRIVATE STORE EXCLUSIVE PRICE"  text for Private store users
# Private_Store_Expected = "PRIVATE STORE EXCLUSIVE PRICE"
Pvt_Exclusive_Price = "(//div[@class='topReview']//div[@class='promotion-text'])[2]"
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
Energy_Star="//div[@class='productEnergy']"
###Key selling points (KSP)
ksp = "//ul[@class='productFeatLst']"
###Price starting with '$'
# PriceStart = "//span[starts-with(text(),'$')]"
PriceStart = "//span//sup[starts-with(text(),'$')]"
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
SortByItems = "Best Seller Default Name Lowest price Highest price Ratings Newest"
###Compare Tab Text/Message
CompareTabMsg  = "Select at least 2 products for compare"
###Compare Tab
CompareTab = "//li[@id='compareTab']"
###STO product 'Compare' Link
#STOCompareFirstLink = "//a[contains(@aria-label,'Add to cart')]/preceding::div[contains(@class,'inv_compare')]//span[@class='pc_3074457345619594318 add_compare_btn ']"
#STOCompareSecondlink = "//a[contains(@aria-label,'Add to cart')]/preceding::div[contains(@class,'inv_compare')]//span[@class='pc_3074457345619720319 add_compare_btn ']"
# ###STO product 'Compare' Link
STOCompareFirstLink = "(//a[text()='Add to cart'])[2]/../div[@class='inv_compare ']/span[text()='Compare']"
STOCompareSecondLink = "(//a[text()='Add to cart'])[5]/../div[@class='inv_compare ']/span[text()='Compare']"
###ClearAll Link
ClearAllLink = "//span[contains(text(),'Clear all')]"
###STO product 'Compare' Link
#STOCompareFirstLink = "//a[contains(@aria-label,'Add to cart')]/preceding::div[contains(@class,'inv_compare')]//span[@class='pc_3074457345619778326 add_compare_btn ']"
#STOCompareSecondlink = "//a[contains(@aria-label,'Add to cart')]/preceding::div[contains(@class,'inv_compare')]//span[@class='pc_3074457345619425319 add_compare_btn ']"
###CTO product 'Compare' Link
CTOComparelink = "(//div[@class='CTO-btn-container PCOnly']/preceding::div[contains(@class,'inv_compare')]//span[@title='Click to compare'])[1]"
###Product Card in Compare Tab Section
ProductCard = "//div[@class='pdtCard']"
###Compare Button in Compare Tab Section
CompareButton = "//a[@class='showCompare_btn']"
###Compare Popup Title
ComparePopupTitle =  "//h3[contains(text(),'Compare products')]"
###AddToCart on Compare Popup
AddToCartonPopUp = "(//div[@id='content']/div[@id='compareOverlay']//*[@id='add2cart-btn'])[1]"
###Close/Remove Product From 'Compare products' window Popup
ProductCardPopupClose = "(//div[@id='content']/div[@id='compareOverlay']//*[@class='removeCompare_btn'])[1]"
###Close 'Compare products' window Popup
ComparePopUpClose = "//a[@class='closeCompareBtn'] "
###Close/Remove Product From 'Compare' tab
ProductCardClose = "(//div[@class='removeCompare_btn'])[1]"
##Add product to compare Text in Compare Tab
AddProductText = "//div[@id='compareNav']//h4[@class='addCompareTxt']"
###Load More Button
LoadMoreButton = "//div//label[@for='page_more']"
###Single Product Section
UnitProductSection = "//div[@class='productCard']"

###Add to Cart STO Product
AddToCart_STO = "(//a[contains(text(),'Add to cart')])[1]"
#ProductName_STO = "(//a[@class='productHdr'])[1]"
#ProductName_STO = "(//a[contains(@aria-label,'Add to cart')]/../../preceding::a[@class='productHdr'])[1]"
ProductName_STO = "(//div[@class='productCard']//a[text()='Add to cart'])[1]/preceding::h3[1]"


##Just Added to Cart Popup when clicked on AddtoCart button
JustAddedtoCartPopup = "//div[@class='widget_content xo_minicart']"
### For mini cart icon
miniCartIcon = "//a[@title='Shopping Cart' and @data-uitype='minicart-activator']"
### For mini cart Container Title
miniCartTitle = "//div[contains(@class, 'minicart-container')]//div[@class='minicarttitle']"
###
minicartProductContent = "//div[@class='mcprodcont']"
###minicartItemQty
minicartItemQty = "//span[@id='minicart-itemcount']"
###minicartViewAllLink
minicartViewAllLink = "//a[contains(text(),'View all items')]"
######
minicartProductImg = "//a[@class='mcprodimg']"
######
minicartCheckoutButton = "//div[@class='mccta']"
#minicartCheckoutButton = "//a[@class='mcbtnblue']"
####
minicartPriceStart = "//div[@class='mcprodprice']//span[starts-with(text(),'$')]"
###PDP_block Popup
closePdpBlockpopup = "//a[@class='close-reveal-modal']"
####CTO Custom & Buy Button
CTOCustnBuyButton = "//div[@class='CTO-btn-container PCOnly']"
### Configuration Page Title
ConfTitle = "//h2[@id='confTitle']"

### Product Availability Filter Title
ProductAvailabilityFilter = "//h3[contains(text(),'PRODUCT AVAILABILITY')]"
### Sale Filter Title
SaleFilter = "//h3[contains(text(),'Sale')]"
### Use  Filter Title
UseFilter = "//h3[contains(text(),'USE')]"
### Brand Filter Title
BrandFilter = "//h3[contains(text(),'BRAND')]"
###In Stock checkbox
InStockCheckbox = "//span[@class='facetItemLbl']//a[contains(text(),'In Stock')]"
###Business Checkbox
BusinessCheckbox = "//span[@class='facetItemLbl']//a[contains(text(),'Business')]"
###Enterprise CheckBox
EnterpriseCheckBox= "//span[@class='facetItemLbl']//a[contains(text(),'Enterprise')]"
###FacetCrumbWrapper
FacetCrumbWrapper = "//h2[@id='facetCrumbWrapperId']"
###CLear All Facet Trail
ClearAllFacetTrail = "//span[@class='clearFacetsBC']"
###Clear All In Filters
ClearALlFilters = "//div[@class='clearFacets']"
