# Page elements for MLP Page

### For the BreadCrumb
bread_crumb = "//div[@id='brdcrmb']"
grid_view = "//*[@id='gridView' and @class='page_view grid sprite gridlist active']"
loyalty_rewards = "(//span)[33]"
loyalty_text = "//body/div[@id='content']/div[@id='model-plp-body']/div[2]/div[1]/div[2]/div[3]/div[2]/p[1]"
viewdetail_locator = "(//a[@href='/us/en/mdp/Laptops/probook-600-14-243575--1#tab=features'])[3]"
mdplocator = "//html"
grid_modelname = "//a[contains(text(),'HP ProBook 640')]"
grid_modelimage = "//img[@class=' lazyloaded']"
view_Keysellingpoint = "//body/div[@id='content']/div[@id='model-plp-body']/div[2]/div[1]/div[2]/div[2]/div[3]"
View_all_productlink = "//a[@href='/us/en/mdp/Laptops/probook-600-14-243575--1#tab=vao']"
View_rating_review = "//body/div[@id='content']/div[@id='model-plp-body']/div[2]/div[1]/div[2]/div[2]/div[2]"
grid_Symbols = "//*[@id='modelBox_243575']/div[2]/div[2]/div[3]/ul[1]/li[2]"
list_view = "//a[@id='listView']"
list_symbols = "//body/div[@id='content']/div[@id='model-plp-body']/div[2]/div[1]/div[2]/div[2]/div[3]/ul[1]/li[2]"
Price_displayed = "//div[@id='price_holder_model_243575']"
###
list_modelname = "(//a[@href='/us/en/mdp/Laptops/probook-600-14-243575--1#tab=features'])[2]"
list_modelimage = "//img[@class=' lazyloaded']"
view_Keysellingpoint_list = "//body/div[@id='content']/div[@id='model-plp-body']/div[2]/div[1]/div[2]/div[2]/div[3]"
View_all_productlink_list = "//a[@href='/us/en/mdp/Laptops/probook-600-14-243575--1#tab=vao']"
list_rating_review = "//body/div[@id='content']/div[@id='model-plp-body']/div[2]/div[1]/div[2]/div[2]/div[2]"
loyalty_rewards_list = "(//span)[33]"
Price_displayed_list = "//body/div[@id='content']/div[@id='model-plp-body']/div[2]/div[1]/div[2]/div[5]/div[1]/span[2]"
list_displayedprice = "//body/div[@id='content']/div[@id='model-plp-body']/div[2]/div[1]/div[2]/div[5]/div[1]/span[1]"
viewdetail_listlocator = "(//a[@href='/us/en/mdp/Laptops/probook-600-14-243575--1#tab=features'])[3]"
###PRIVATE STORE EXCLUSIVE PRICE
Private_ExclText = "(//span[@id='price_tier'])[1]"
signin_private = "//body/div[@id='utilityNav']/div[1]/nav[1]/section[1]/ul[1]/li[5]/ul[1]/li[1]/a[1]"
User_Id = "Automation_EPPLive@hp.com"
User_password = "Auto@123"
Private_Store_Actual = "PRIVATE STORE EXCLUSIVE PRICE"








#Page elements for Home Page


### For the image showing as Red Banner
img_red_banner = '//div[@class="value-prop-container"]'
### For the rotatable hero banner
img_hero_banner = '//*[@id="hero_responsive"]/div/ul/li[2]/div'
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
