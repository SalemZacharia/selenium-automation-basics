#selenium = la librairie qui permet de piloter un navigateur
#webdriver = cest le pilote que l'on importe de Selenium
from selenium import webdriver


#Service cest un objet  qui va 
# décrire comment lancer le prog chromedriver 
# (Selenium passe par les drivers pour ouvrir les navig)
from selenium.webdriver.chrome.service import Service


#webdriver-manager cest la librairie qui nous permet d'importe 
# ChromeDriverManage, avec ca on a la bonne version de 
# chromeDriver avec son chemin ca évite de telecharger le driver nous meme et de gerer sa version
from webdriver_manager.chrome import ChromeDriverManager

#Ici on va lancer Chrome mais on passe 
# par 1)telecharger / trouve chromdriver.exe et renvoie son chemin
#2) Service cest lui qui va lance chromedriver avec le chemin ci-dessus
#3) webdriver.Chrome lance le navigateur et renvoie un objet driver 
# qu'on va pouvoir utiliser
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))


#On ouvre Chrome on va naviguer vers l'url donné la

driver.get("https://www.google.com")

# notre teste ici cest tester le titre de la page google
#1) driver.title : ca va chercher le titre qu'il trouve
#sur l'onglet de la page
#2) assert lui va faire la verification automatique
# cest booelan , Vrai le test continue / faux python va relever une erreur AssertionError
#Ici on parle d'expected result

assert "Google" in driver.title

#affichage simple pour confirmer que le test est arrivé à fin
print("TEST OK : Google est ouvert")


#ferme toutes les fenetre / coupe le process chromedriver / netoie la session
driver.quit()