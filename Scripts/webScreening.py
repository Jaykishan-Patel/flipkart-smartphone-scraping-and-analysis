from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import time

chrome_options = Options()
chrome_options.add_experimental_option("detach", True)
s = Service("C:/Users/lenovo/OneDrive/Desktop/chromedriver.exe")
driver = webdriver.Chrome(service=s, options=chrome_options)
driver.get('https://www.flipkart.com/search?q=touch+mobile&as=on&as-show=on&otracker'
           '=AS_Query_OrganicAutoSuggest_3_12_na_na_ps&otracker1=AS_Query_OrganicAutoSuggest_3_12_na_na_ps&as-pos=3'
           '&as-type=RECENT&suggestionId=touch+mobile&requestId=8fdbce9d-b251-4169-8b29-435adde41b1e&as-backfill=on&p'
           '%5B%5D=facets.availability%255B%255D%3DExclude%2BOut%2Bof%2BStock&p%5B%5D=facets.type%255B%255D'
           '%3DSmartphones&page=1')

with open("all_pages.html", "w", encoding="utf-8") as f:
    f.write("<html><body>\n")  # start of file
    a = 1
    while a < 42:
        print(f'page no={a}')
        # Get full page source of current page
        page_html = driver.page_source

        # Save to file
        f.write("<hr><h2>New Page</h2><hr>\n")  # separator between pages
        f.write(page_html)

        if a == 1:
            driver.find_element(by=By.XPATH, value='//*[@id="container"]/div/div[3]/div/div[2]/div[26]/div/div/nav/a['
                                                   '11]/span').click()
        else:
            driver.find_element(by=By.XPATH, value='//*[@id="container"]/div/div[3]/div/div[2]/div[26]/div/div/nav/a['
                                                   '12]/span').click()
        time.sleep(2)
        a = a + 1
# //*[@id="container"]/div/div[3]/div/div[2]/div[26]/div/div/nav/a[12]/span