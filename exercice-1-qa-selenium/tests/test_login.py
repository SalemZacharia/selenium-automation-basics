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

driver.find_element(By.ID,"username").send_keys("tomsmith")
driver.find_element(By.ID, "password").send_keys("SuperSecretPassword!")
driver.find_element(By.CSS_SELECTOR,"button[type='submit']").click()

time.sleep(2)

message = driver.find_element(By.ID, "flash").text
assert "You logged into a secure area!" in message

print("TEST OK : Connexion réussie")

driver.quit()