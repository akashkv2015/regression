# Page elements for Home Page

### For the image showing as Red Banner
img_red_banner = '//div[@class="value-prop-container"]'
### For the rotatable hero banner
#img_hero_banner = '//a[@class="nHeroBannerCta cta1"]'
img_hero_banner = '//*[@id="hero_responsive"]'

iAcceptBtn = "//button[text()='I ACCEPT']"

#### For the Feedback Image displayed on the screen
feedback_img = "//img[@alt='Feedback']"
### Frame for the feedback form
frame_FeedbackForm = "//iframe[starts-with(@id,'kampyleForm')]"
### For the Feedback form
feedbackForm = "//div[@data-aut='livePreview-label']//span[contains(text(), 'provide feedback')]"
### For the Shopping Assistant
lbl_shoppingAssistant = "//*[@id='productFinder']"


### For Featured Product Section
featuredProducts = "//div[@id='featuredProducts']"
### For Featured Product Sections containing Products
featuredProductsSection = "//div[@id='featuredProducts']//section"
### For the first View Details link
viewDetails = "//div[@id='featuredProducts']//section//a[@class='shop details']"
### For the Top Sellers Panel
topSellerPanel = "//div[@aria-label='Start of top sellers']"
### For the Top Sellers Product Section
topSellerProductSection = "//div[contains(@id,'top_seller')]//div[@class='igo_product showProduct']"

###################################################################################################
begingSearchIcon = "//div[contains(@class, 'wpr-search-icon')]//a[@tilte='Begin your search']"
productSearch = "id:search_focus_desktop"
productReSearch = "//input[@placeholder= 'Search hp.com']"
searchButton = "//input[@title='Search HP.com']/..//a[@title='Begin your search']"
reSearchButton = "//input[@placeholder='Search hp.com']/..//i[contains(@class,'search')]"
addToCart = "//button[text()='Add to cart']"
reAddToCart = "//div[@id='cta_submit']//a[text()='ADD TO CART']"
customizeAndBuy = "//button[text()='Customize & buy']"
busyBtn = "//button[contains(@class, 'busy')]"
disabledBtn = "//button[contains(@class, 'disabled')]"
cartIcon = "//i[@class='icon icon-cart']"
viewCartCheckout = "//a[text()='VIEW CART & CHECK OUT ']"
checkOutAsGuest = "//a[text()='checkout as guest']"

firstName = "id:cFN"
lastName = "id:cLN"
phoneNumber = "id:cPN"
emailAddress = "id:cEmail"
physicalAddress = "name:addrTypeAheadInput"
streetAddress = "name:addrTypeAheadInputEdit"
aptSuite = "id:sA2"
city = "id:sCity"
state = "id:sState"
zipCode = "id:sZip"
enterAddressManually = "//a[text()='Enter address manually']"
cardNumber = "id:txtCardNumber"
expiryDate = "id:txtExpDate"
securityCode = "txtCVV"
reviewOrder = "id:btnReviewOrder"
