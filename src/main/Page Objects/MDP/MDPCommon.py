# Page elements for Home Page
iAcceptBtn = "//button[text()='I ACCEPT']"
### For the Value Prop Red Banner
mdpValueProp = "//div[@class='hp-value-prop']"
### For the Buy Link
buyLink = "//a[text()='Buy']"
### For all the products options available on the page
viewalloptions = '//div[@id="viewalloption"]'
### For products section
productSections = "//div[@id='viewalloption']//div[@class='products']//div[@class='productWrapper']"
### For the first Add to Cart button for STO Product
stoProduct = "xpath=(//div[@id='viewalloption']//div[@class='products']//div[@class='productInfo3']//div[contains(@class,'productInv')]//a[@id='add2cart-btn'])[1]"
### STO Product name
stoProductName = "xpath=(//a[text()='Add to cart']/../../preceding::div[@class='productInfo2']//a)[1]"