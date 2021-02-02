from AppiumLibrary import AppiumLibrary
from appium import webdriver
from appium.webdriver import webelement
from appium.webdriver.common.mobileby import MobileBy
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn


@keyword(name="Switch Frame By Id")
def switch_frame_by_id(frame_locator: str):
    appium_library: AppiumLibrary = BuiltIn().get_library_instance('AppiumLibrary')
    driver: webdriver = appium_library._current_application()
    if driver is None:
        print("driver not initialised")
    else:
        frame_element = driver.find_element(MobileBy.ID, "pgsIframe")
        print(frame_element)
        driver.switch_to.frame(frame_element)


@keyword(name="Switch Frame By XPath")
def switch_frame_by_xpath(frame_locator: str):
    appium_library: AppiumLibrary = BuiltIn().get_library_instance('AppiumLibrary')
    driver: webdriver = appium_library._current_application()
    if driver is None:
        print("driver not initialised")
    else:
        frame_element = driver.find_element_by_xpath(frame_locator)
        driver.switch_to.frame(frame_element)


@keyword(name="Switch To Default Frame")
def switch_to_default_frame():
    appium_library: AppiumLibrary = BuiltIn().get_library_instance('AppiumLibrary')
    driver: webdriver = appium_library._current_application()
    if driver is None:
        print("driver not initialised")
    else:
        driver.switch_to.default_content()


@keyword(name="Scroll To Element")
def scroll_element_into_view(element: webelement):
    appium_library: AppiumLibrary = BuiltIn().get_library_instance('AppiumLibrary')
    driver: webdriver = appium_library._current_application()
    if driver is None:
        print("driver not initialised")
    else:
        driver.execute_script("arguments[0].scrollIntoView();", element)


@keyword(name="Click Element Using JS")
def click_element(element: webelement):
    appium_library: AppiumLibrary = BuiltIn().get_library_instance('AppiumLibrary')
    driver: webdriver = appium_library._current_application()
    if driver is None:
        print("driver not initialised")
    else:
        driver.execute_script("arguments[0].click();", element)


@keyword(name="Mouse Over On Element")
def hover_on_element(element: webelement):
    appium_library: AppiumLibrary = BuiltIn().get_library_instance('AppiumLibrary')
    driver: webdriver = appium_library._current_application()
    if driver is None:
        print("driver not initialised")
    else:
        driver.execute_script("arguments[0].click();", element)
