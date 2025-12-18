from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

#By enumeration de choix pour chercher un element ex ID/NAME/CSS_SELECTOR/XPATH
from selenium.webdriver.common.by import By

#faire une pause
import time

#
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))

driver.get("https://the-internet.herokuapp.com/login")

