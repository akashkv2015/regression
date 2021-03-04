#####For gift card input
Input_giftcard = "Gift cards"
Giftcard_input = "//input[@id='search_focus_desktop']"
Clickicon_gift = "(//a[@title='Begin your search'])[2]"
## For customize and Buy
# Click_Buy = "(//a[@id='add2cart-btn'])[1]"
Click_Buy = "(//a[@id='add2cart-btn'])[1]"
#Amount_dropdown_customize = "//div[@class='dropdown ']"
Amount_dropdown_customize = "//div[@class='custom dropdown gcdropdown']"
From_locator = "//input[@name='fromName']"
From_locator = "//input[@name='from']"
To_locator = "//input[@name='toName']"
To_locator = "//input[@name='to']"
#personalized_msg_link = "//div[@class='show-more']"
personalized_msg_link = "//div[@id='personalized_label']"
#add_to_cart = "//button[@class='btn btn-primary purchase-btn']"
added_to_cart = "(//span [@class='cta_price']/a)[1]"
# price_locator = "//span[@class='sale-price  non-sale']"
price_locator = "(//span[@id='price_value'])[2]"
amount = "//div[@class='custom dropdown gcdropdown open']/ul/li[3]"
#####For Check Your Balance
balance_SRP = "//a[@class='check_your_balance js_overlay_trigger']"
checkbal_locator = "//h3[contains(text(),'Check your balance')]"
gift_card_no = "//label[@for='gcNumber']"
pin_text = "//input[@id='gcPin']"
balance = "//a[contains(text(),'Check Balance')]"
avail_bal = "//span[@id='balanceAmount']"
## For close check your bal popup
close_popup = "(//a[@class='btnClose js_pop_close'])[2]"
##to check amount is entered
# select_amount = "//option[contains(text(),'$10.00')]"
###For your name field
# name_locator = "//input[@name='fromName']"
name_locator = "//input[@name='from']"

# Recipient_name = "//input[@name='toName']"
Recipient_name = "//input[@name='to']"
#### Add a personalized message
Adding_personal_msg = "//div[text()='Add a personalized message']"
optional_message = "//textarea[@name='message']"
###For feature tab
# Featured_giftcard = "//li[@id='tab_0']"
Featured_giftcard = "//a[@id='initFeatures']"
# verified_feature = "//div[@class='pdp-features fv5  pdp-width-container']"
verified_feature = "//ul[@class='tabs_list']"
# Special_offer = "//li[@id='tab_1']"
Special_offer = "//a[@id='initOffers']"
# About_specialoffer = "//li[contains(text(),'Gift cards are delivered separately within 7 days.')]"
About_specialoffer = "(//ul[@class='specialofferlist'])[1]"
##For adding gift card
add_gift_carditem = "(//span [@class='cta_price']/a)[1]"
added_cartlocator = "//div[@class='minicart_contents']"
###dropdown under virtual gift card
# virtual_giftcard_dropdown = "//select[@class='dropdown-menu']"
virtual_giftcard_dropdown = "//a[@class='current']"
From_virtual = "//input[@name='from']"
To_virtual = "//input[@name='to']"
Recipient_email = "//input[@name='email']"
Confirm_email = "//input[@name='email_confirm']"
virtual_msg = "//div[@id='personalized_label']"
addcart_virtual = "(//a[@id='add2cart-btn'])[1]"
# virtual_giftprice = "//span[@class='sale-price  non-sale']"
virtual_giftprice = "(//span[@id='price_value'])[2]"
Vitual_dropdown = "//option[contains(text(),'$10.00')]"
From_virtual_name = "//input[@name='from']"

To_virtual_loc = "//input[@name='to']"
set_reciemail = "//input[@name='email']"

confirm_name = "//input[@name='email_confirm']"

virtual_opt_msg = "//textarea[@name='message']"
Virtual_feature_loc = "//a[@id='initFeatures']"
feature_virtual_msg = "//ul[@class='tabs_list']"
virtual_offer_set = "//a[@id='initOffers']"
get_offer = "(//div[@id='specialoffertab'])[1]"
Click_to_add = "(//a[@id='add2cart-btn'])[1]"
item_added = "//div[@class='minicart_contents']"
# STO_product = "//div[@class='product-detail with-bundle']/h1"
STO_product = "//h1[@class='prodTitle no-margin flushed']"
# Sto_image = "//div[@class='pdp-image']"
Sto_image = "//ul[@class='pdp_featured_image']/li/img"
##For thumbnail video
sto_thumbnail = "//div[@class='vjs-poster']"
# Sto_ratings = "//div[@class='prd-hdr-2']"
Sto_ratings = "//div[@class='bv_main_container']"
# STO_SKUID = "//span[@class='pdp-sku']"
STO_SKUID = "(//span[@class='prodNum'])[2]"
# Sto_ksp = "//ul[@class='ksps']"
Sto_ksp = "//ul[@class='_desktop_only']"
# Sto_spec = "//span[text()='See all Specs']"
Sto_spec = "//div[@class='specLink _desktop_only']"
# Sto_price = "//div[@class='prd-price total-price']"
Sto_price = "(//span[@class='price_amount'])[2]"
Sto_reward = "//div[text()='Earn 1X HP Rewards Points']"
# Sto_add_cart = "(//button[@class='btn btn-primary purchase-btn'])[1]"
Sto_add_cart = "(//span[@class='cta_price']//a)[1]"
# STO_PDPbreadcrumb = "//div[@class='pdp-breadcrumb-container']"
STO_PDPbreadcrumb = "//div[@id='brdcrmb']//ul"
# STO_Add_product = "(//button[@class='btn btn-primary purchase-btn'])[1]"
STO_Add_product = "(//span[@class='cta_price']//a)[1]"
Sto_feature = "//a[@id='initFeatures']"
avail_sto_features = "//div[@class='box-sizing']"
Sto_superscript = "(//div[@class='tooltip'])[1]"
Sto_sup_element = "(//div[text()='[1]'])[1]"
interested_prod = "(//a[@class='pdp-xsell-title']/h3)[1]"
int_price = "(//div[@class='prd-price '])[1]"
Sto_viewlink = "(//a[@class='pdp-xsell-link'])[1]"
sto_spec = "//a[@id='initSpecs']"
prod_specification = "//p[@class='tabheader']"
datatsheet = "//div[@class='large-7 columns nosidepaddings']//a"
Accessory_tab = "//li[@id='tab_2']"
browse_accessories = "//div[@class='pdp-acc']"
add_access_prod = "(//button[@class='btn btn-primary purchase-btn'])[3]"
aaccess_item_locator = "(//h3[@title='HP 3 Year Next Day Exchange Service for Consumer Monitors'])[3]"
Sto_browse_add = "(//h3[@title='HP 2 Year Next Day Exchange Service for Consumer Monitors'])[5]"
Sto_browse_cart = "(//h3[@title='HP 2 Year Next Day Exchange Service for Consumer Monitors'])[5]"
Sto_special_offer = "//a[@id='initOffers']"
offer_list = "(//ul[@class='specialofferlist'])[1]"
Sto_support = "//li[@id='tab_3']"
Sto_support_hp = "//div[@class='pdp-supp']"
Reviews_stoTab = "//a[@id='initReviews']"
views_Review = "//div[@class='bv-header']"


esd_product_name = "//h1[@class='prodTitle no-margin flushed']"
esd_product_image = "//div[@class='bx-viewport']"
esd_rating = "//div[@class='ratings_energy']"
esd_Sku = "(//span[@class='prodNum'])[2]"
ESD_actual_ksp = '''Corel PaintShop Pro v.X9 - License - 1 User - Download - Multilingual - PC'''
esd_ksp = "//ul[@class='_desktop_only']"
esd_specs = "//div[@class='specLink _desktop_only']"
esd_price = "(//div[@id='price_holder_1623652'])[2]"
esd_add_tocart = "(//span[@class='cta_price']//a)[1]"
digital_link = "//span[@id='esdFaq']"
esd_faq = "//a[@id='esdFaq']"
esd_features = "//a[@id='initFeatures']"
return_feature = "(//h2[@class='txtsize30'])[1]"
esd_spec = "//a[@id='initSpecs']"
spec_feature = "//p[@class='tabheader']"
esd_review = "//a[@id='initReviews']"
list_reviews = "//div[@id='reviews']"
esd_prod_added = "//div[@id='minicart-contents']"

#########################Validate Bundle PDP####################################################################

bundle_prd_name = "//h1[@class='prodTitle no-margin flushed']"
Bundle_rating = "//div[@class='ratings_energy']"
Bundle_SKU = "(//span[@class='prodNum'])[2]"
ksp_bundle = "//ul[@class='_desktop_only']"
bundle_actual_ksp = '''One XL black ink and standard color inks bundled together for your convenience
Get up to 2x the pages with XL inks vs. standard cartridges.
XL Black yields up to 2,300 pages. Color cartridges yield up to 700 pages each.
XL inks fit just like the standard cartridge'''
bundle_spec = "//div[@class='specLink _desktop_only']"
Bundle_product_price = "(//span[@class='price_amount'])[2]"
bundle_cart = "//span[@class='cta_price']/a"
bundle_images = "//div[@class='showcase pdpLeft _desktop_only positionRelative']"
bundle_added = "//div[@class='widget_content xo_minicart']"
####Carousel Arrow
element_count = "//ul[@id='featured_image_pager']//img"
Arrow_disable = "//a[@class='bx-prev disabled']"
Arrow_enabled = "//div[@id='pager-next']"
bundle_features = "//a[@id='initFeatures']"
features_exist = "//div[@class='locate_with_container']"
Bundle_spec = "//a[@id='initSpecs']"
prod_spec_bundle = "//div[@id='specs']"
Bundle_SKU_data = "//p[@class='specsDescription']"
bundle_review = "//a[@id='initReviews']"
# Review_ver = "//div[@class='bv-section-summary']"
Review_ver = "//div[@class='bv-action-bar']"









# Page elements for Home Page

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
