import sys
import os
import pathlib
cur_path = pathlib.Path.cwd()
#cur_path = pathlib.Path('D:\ETR')
print(cur_path)

# tech = "MOBILE_EMULATOR"
tech = 'WEB'
url = 'https://store.hp.com/us/en'
#################MDP URL#################
mdp_url = 'https://store.hp.com/us/en/mdp/desktops/hp-envy-32-all-in-ones#!&tab'
mlp_url = r'https://store.hp.com/us/en/mlp/laptops/elitebook--zbook---probook'
#MDPPOFiles = r"D:\ETR\src\main\Page Objects\MDP"
MDPPOFiles = cur_path / "src\main\Page Objects\MDP"

mdp_Fea_url = 'https://store.hp.com/us/en/mdp/laptops/probook-600-14-243575--1#!&tab=features'
mdp_buy_url = 'https://store.hp.com/us/en/mdp/laptops/probook-600-14-243575--1#!&tab=vao'

#################PDP URL#################
pdp_url = "https://store.hp.com/us/en/pdp/hp-presents-e-gift-card"
pdp_url1 = "https://store.hp.com/us/en/pdp/hp-23er-23-inch-display"
pdp_url2 = "https://store.hp.com/us/en/pdp/hp-pavilion-gaming-laptop-17t-cd100-8ww21av-1"
pdp_esd_url = " https://store.hp.com/us/en/pdp/corel-paintshop-pro-vx9---license---1-user?etr_pdp=true"
pdp_bundle_url = "https://store.hp.com/us/en/pdp/hp-950xl-951-high-yield-black-and-standard-color-ink-cartridge-bundle-950xl-black-951-standard-color-kit?etr_pdp=true"
#PDPPOFiles = r"D:\ETR\src\main\Page Objects\PDP"
PDPPOFiles = cur_path / "src\main\Page Objects\PDP"

################CTO URL and Files###########################
cto_url="https://store.hp.com/us/en/pdp/hp-935xl-high-yield-yellow-original-ink-cartridge"
CTOPOFiles = cur_path / "src\main\Page Objects\CTO"
#CTOPOFiles = r"D:\ETR\src\main\Page Objects\CTO"
conf_url = 'https://store.hp.com/us/en/ConfigureView?catalogId=10051&langId=-1&storeId=10151&urlLangId=&catEntryId=3074457345619203820&quantity=1'

######################PLP URL and Files #####################
plp_url = 'https://store.hp.com/us/en/vwa/laptops'
plp_sto_cto_url = 'https://store.hp.com/us/en/vwa/desktops'
plp_filters_facets = 'https://store.hp.com/us/en/vwa/printers'
plp_filtered_url = 'https://store.hp.com/us/en/vwa/printers/availability=In-Stock;segm=Business,Enterprise'

#################MLP URL and Files#############################
#MLPPOFiles = r"D:\ETR\src\main\Page Objects\MLP"
MLPPOFiles =  cur_path / "src\main\Page Objects\MLP"

################CLP URL and Files##############################
#CLPPOFiles = r"D:\ETR\src\main\Page Objects\CLP"
CLPPOFiles =  cur_path / "src\main\Page Objects\CLP"

###################Home Pages######################################
#homePagePOFiles = r"D:\ETR\src\main\Page Objects\Home"
homePagePOFiles = cur_path / "src\main\Page Objects\Home"
HeaderFooterPOFiles = cur_path / "src\main\Page Objects\HeaderFooter"
CheckoutPOFiles = cur_path / "src\main\Page Objects\Checkout"
#CheckoutPOFiles = r"D:\ETR\src\main\Page Objects\Checkout"
#HeaderFooterPOFiles = r"D:\ETR\src\main\Page Objects\HeaderFooter"
#UserManagementPOFiles = r"D:\ETR\src\main\Page Objects\UserManagement"
UserManagementPOFiles = cur_path / r"src\main\Page Objects\UserManagement"

###############Search Module##################
#UserManagementPOFiles = r"D:\ETR Project\ETR-Demo\src\main\Page Objects\UserManagement"
##########################PLP#####################
capitable_hw_ecare= 'https://store.hp.com/us/en/pdp/hp-pavilion-gaming-tp01-1125xt#ABA&beginIndex=0&pageSize=12&pageView=grid&resultCatEntryType=2&sType=SimpleSearch&searchSource=Q'
ecare_url='https://store.hp.com/us/en/pdp/hp-2-years-3-day-onsite-hw-support-with-accidental-damage-protection-for-consumer-desktops-p-ua5s4e-1?etr_pdp=true'
