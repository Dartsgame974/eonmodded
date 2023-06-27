local http = require("http")
local xmlparser = require("xmlparser")
local modem = peripheral.find("modem")

local url = "https://www.lemonde.fr/rss/une.xml"

-- Fonction pour afficher le contenu XML sur le moniteur
local function afficherContenuXML(contenuXML)
  local moniteur = peripheral.wrap("top") -- Assurez-vous que le moniteur est connecté sur le dessus de l'ordinateur
  moniteur.setTextScale(0.5)
  moniteur.clear()

  local x, y = 1, 1
  for i = 1, #contenuXML do
    moniteur.setCursorPos(x, y)
    moniteur.write(contenuXML[i])
    y = y + 1
    if y > moniteur.getHeight() then
      break
    end
  end
end

-- Fonction principale
local function main()
  local success, response = http.get(url)

  if success then
    local content = response.readAll()
    response.close()

    local document = xmlparser.parse(content)

    -- Extraire le contenu XML souhaité (par exemple, les titres des articles)
    local titres = {}
    local articles = document.children[1].children
    for i = 1, #articles do
      if articles[i].tag == "item" then
        for j = 1, #articles[i].children do
          if articles[i].children[j].tag == "title" then
            table.insert(titres, articles[i].children[j].text)
            break
          end
        end
      end
    end

    -- Afficher les titres des articles sur le moniteur
    afficherContenuXML(titres)
  else
    print("Erreur lors de la requête HTTP.")
  end
end

-- Exécution du script
main()
