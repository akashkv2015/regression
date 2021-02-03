# Page elements

### For mini cart icon
miniCartIcon = "//a[@title='Shopping Cart' and @data-uitype='minicart-activator']"
### For mini cart Container Title
miniCartTitle = "//div[contains(@class, 'minicart-container')]//div[@class='minicarttitle']"
### For Product name displayed on mini cart
minicartProduct = "//div[@id='minicart-contents']/div[@class='mcprodcont']//div[@class='mcprodname']/a"
### For the first Customize & Buy button for CTO Product
ctoProduct = "//div[@id='viewalloption']//div[@class='products']//div[@class='productInfo3']//div[contains(@class,'productInv')]//div[contains(@class,'PCOnly')]//a[text()='Customize & buy']"
### For the Add to cart button for CTO Product on Configurator Page
ctoAddToCartBtn = "//a[@class='btn-addtocart']"
### For View Cart and Checkout Button
viewCartAndCheckout = "//div[@id='cartSummaryRight']//a[contains(@class,'viewCartCheckoutBtn')]"
### Shipping and billing
btn_place_order = 'placeOrderTop'

###################    MDP Features    ##########################
###Registered Symbol in Product Details
RegisteredSymbol = "//span[contains(@title, '®')]"
###TM Symbol in Product Details
TMSymbol = "//span[contains(@title, '™')]"
###3% HP Rewards Loyalty Text to verify exact text
LoyaltyTxt = """3% back in HP Rewards
HP Rewards is a loyalty program where users earn HP Rewards points by buying eligible HP Products.
Learn more"""
###Private_Exclusive_Price Text
Pvt_Exclusive_Price = "//span[@id='price_tier']"
###"PRIVATE STORE EXCLUSIVE PRICE"  text for Private store users
Private_Store_Expected = "PRIVATE STORE EXCLUSIVE PRICE"
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
### BreadCrumb
BreadCrumb = "//div[@class='breadcrumb-container']"
### Features Tab
FeaturesTabSection = "//body[@class='left-to-right']"
### See All Offers
SeeAllOffers = "(//label[contains(text(),'See all offers')])[position()=1]"
### See All Offers ToolTip
SeeAllOffersToolTip = "//span[@class='tooltipContent']"
### Tech Spec Link
TechSpec = "(//label[contains(text(),'Tech spec')])[position()=1]"
### Tech Spec Popup Close
TechSpecClose = "(//span[@class='closeSpecsBtn'])[position()=1]"
###Earn 3% in HP Rewards with purchaseâ€™ Link
HpPurchaseRewards = "(//span[contains(text(),'3% back in HP Rewards')])[position()=1]"
###Earn 3% in HP Rewards Tooltip Lolayty Message
LoyaltyTooltip = "(//div[@class='rewards-tooltip'])[position()=1]"
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
PriceStart = "//span[starts-with(text(),'$')]"
###'Add to Cart' /'Customize & Buy'/'Out of stock'
AddtoCartButton = "//div[@class='productInv inventory_holder']//a[@role='button']"
####Compare link (If available
CompareLink = "//div[@class='inv_compare ']"
###Only X Left in Stock    (If inventory is less than threshold) / Shipping status label
OnlyXleft = "//span[@class='lowinventoryinfo']"
###Violator Message
ViolatorMsg = "//div[contains(@class,'productWrapper')]//*[@class='promotion-text']"
###Buy Tab ID
BuyTab = "id:vao"
###Product : HP ProBook
ProductHPProBook= "//div[@class='productInfo2']//h3/a[contains(text(),'HP ProBook')]"
###Single Product Section
UnitProductSection = "//div[@class='productCard']"

##Compare Links
FirstCompareLink = "(//div[@class='inv_compare ']//span[@title='Click to compare'])[1]"
SecondCompareLink = "(//div[@class='inv_compare ']//span[@title='Click to compare'])[2]"
###MDP Product Compare Window Section
MDPCompareSection = "//div[@class='productCompare']"
### Upward arrow toggle button of Compare Window Section
ToggleButtonCompareWindow = "(//span[@id='toggleProductCompare_btn'])"
### Maximum Products that can be compared Text
MaxProductsText = "//div//h3[contains(text(),'Compare Products (max. 4)')]"
###Product Specification
ProductSpec = "//p[@class='specValue']"
###Clear All button to remove all Products from Compare window
ClearAllCompareWindow = "//span[@id='clearProductCompare_btn']"
###Remove Link to remove a Single Product from Compare window
RemoveLinkCompareWindow = "(//div[@class='remove_btn'])[1]"
### Product Name in Compare Window
ProductNameCompareWindow = "//a[@class='productName']"
### Product Image in Compare Window
ProductImgCompareWindow = "//div[@class='productImg' and @style='display: block;']"
###Product Price in Compare Window
ProductPriceCompareWindow = "//a[@class='productName']/following::div[@class='productPrice']"
