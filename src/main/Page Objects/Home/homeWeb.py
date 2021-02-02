# Page elements

### For the Close button on the feedback form
feedbackForm_CloseBtn = "//div[@id='liveForm']//button[@aria-label='Exit']"

# Validate Home page elements
shopping_ass_link='//*[@id="productFinder"]/div[1]/div/div[1]/div/div[2]/a'
shop_banner_link = '//a[@class="nHeroBannerCta cta1"]'

shop_banner_links='//*[@id="hero_responsive"]/div/ul/li//a'
shopping_link='//*[@id="productFinder"]/div[1]/div/div[2]/div[1]/a'
top_seller_link='//div[@class="bsoCTAWRap"]/a'
banner_espot_link='//*[@id="content"]/div[13]/div/div/div[1]/div/div[3]/a'
sto_home_product='//div[@class="inventory_holder"]//a[@class="btn bluebtn text-center add2cart-btn"]'
next_page_link='//*[@id="crsl_next2"]/a'
stoProduct = "xpath=(//div[@id='viewalloption']//div[@class='products']//div[@class='productInfo3']//div[contains(@class,'productInv')]//a[@id='add2cart-btn'])[1]"
### STO Product name
stoProductName = "xpath=(//a[text()='Add to cart']/../../preceding::div[@class='productInfo2']//a)[1]"