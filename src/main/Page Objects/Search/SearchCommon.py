###Validate Compare option in Search Results Page
search_laptop = "//input[@id='search_focus_desktop']"
click_element = "//body/div[@id='header']/div[2]/div[1]/div[1]/div[2]/div[1]/a[1]"
searched_value = "Laptop"
laptop_search = "Results for 'Laptop'"
search_result='//*[@id="PLPPageTitle"][contains(text(),"Results")]'
###For compare tab
compare_tab = "//ul[@class='filterTabs']/li[3]"
#ClearAllLink = "//span[contains(text(),'Clear all')]"
CompareTabMsg  = "Select at least 2 products for compare"
#####for Sto-Cto compare
StoFst_link = "//a[contains(@aria-label,'Add to cart')]/preceding::div[contains(@class,'inv_compare')]//span[@class='pc_3074457345619376819 add_compare_btn ']"
Sto_sec_link = "//a[contains(@aria-label,'Add to cart')]/preceding::div[contains(@class,'inv_compare')]//span[@class='pc_3074457345619722321 add_compare_btn ']"
Cto_link = "(//div[@class='CTO-btn-container PCOnly']/preceding::div[contains(@class,'inv_compare')]//span[@title='Click to compare'])[1]"
ProductCard = "//ul[@class='filterTabs']/li"
Compare_Button = "//div[@id='compareNav']/a"
ComparePopupTitle = "//div[@class='compareContent']/h3"
Comapare_addtocart = "//div[@class='inventory_holder']//a[@id='add2cart-btn']"
Remove_product = "(//div[@class='pdtCard']//div[@class='removeCompare_btn'])[2]"
ComparePopUpClose = "//a[@class='closeCompareBtn']"
ProductCardClose = "(//div[@class='removeCompare_btn'])[1]"
ClearAllLink = "//span[@class='clearCompare_btn']"
AddProductText = "//div[@id='compareNav']//h4[@class='addCompareTxt']"
