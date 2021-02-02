###Welcome Text Dropdown
WelcomeTextDropdown = "//li[@class='lastIteminList hasdropdown']"
Welcome_txt_Expected = '''Welcome, GERP EUA'''
###My Account in Welcome Text Dropdown
MyAccount = "(//li//a[contains(text(),'My Account')])[1]"
###My Quotes Link
MyQuotes = "//li//a[contains(text(),'My quotes')]"
###My Quotes Header Title
MyQuotesTitle = "//div[@class='tyHeaderContainer']//div[contains(text(),'My quotes')]"
### Quotes Filter According to Months
QuotesMonthsFilter = "//select[@id='QuoteFilter']"
### Quote Number Search Field
QuoteNumberSearch = "//input[@id='quoteSearch']"
### Quote Number
QuoteNumber = "//div[contains(text(),'Quote number')]"
### Valid - From and To Date
ValidFromToDate = "//div[contains(text(),'Valid')]"
###Total Amount Starting with '$'
TotalAmt = "//div[@class='lblVal' and starts-with(text(),'$')]"
###Quote's Status
QuoteStatus = "//div[contains(text(),'Status')]"
###View Quote Link
ViewQuoteLink = "//a[@class='viewQuoteTxt fl']"
###Product Image on MyQuotes Page
ProductImgMyQuotes = "//div[@class='prodImg']"
###Product Price on My Quotes Page
ProductPriceMyQuotes= "//div[@class='pdtPrice' and starts-with(text(),'$')]"
###Product Price on My Quotes Page
ProductQtyMyQuotes= "//div[@class='pdtQty' and starts-with(text(),'Qty')]"
###Manage Quote Section
ManageQuoteSection = "//div[@class='manageQuoteInp']"
###Quote Summary Section
QuoteSummarySection = "//div[@id='quoteSummary']"
###Quote Details Section
QuoteDetailsSection = "//div[@id='quoteDetails']"
###Quote Shipment Section
QuoteShipmentSection = "//div[@class='quoteShipment']"
### 'Email To'  TextBox
EmailToTextbox = "//input[@id='emailTo']"
### Send Quote Button in Manage Quote Section'
SendQuoteButton = "//div[@class='btnSendQuote']"
###Agent ID in Quote Summary Section
AgentID = "//div[@class='secLt' and contains(text(),'Agent ID')]"
###Subtotal in Quote Summary Section
SubTotal = "//div[@class='secLt' and contains(text(),'Sub-total')]"
###Tax in Quote Summary Section
Tax = "//div[@class='secLt' and contains(text(),'Tax')]"
###Shipping in Quote Summary Section
ShippingDetails = "//div[@class='secLt' and contains(text(),'shipping')]"
###Total Amount in Quote Summary Section
TotalAmtQuoteSummary = "//div[@class='secRt total' and starts-with(text(),'$')]"
###Product Image in Quote Details Section
ProdImgQuoteDetails = "//div[@class='quoteDetailsItem']//*//a[@class='mcprodimg']"
###Product Name in Quote Details Section
ProdNameQuoteDetails = "//a[@class='aProdName']"
###Product SKUID in Quote Details Section
SKUIDQuoteDetails = "//span[@class='grey']"
###Return Message in Quote Details Section
ReturnsMessage = "//span[@class='textmsg']"
###Product Quantity in Quote Details Section
ProdQtyQuoteDetails = "//div[@class='quoteDetailsItem']//*//div[@class='mcprodqty']"
###Product Price in Quote Details Section
ProdPriceQuoteDetails = "//div[@class='quoteDetailsItem']//*//div[@class='mcprodprice']"

###Private_Exclusive_Price Text
Pvt_Exclusive_Price = "(//span[@id='price_tier'])[1]"
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
