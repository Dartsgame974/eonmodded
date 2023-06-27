local xmlparser = require("xmlparser")
local http = require("http")

local url = "https://www.lemonde.fr/rss/une.xml"

-- Fonction pour télécharger le fichier XML
local function downloadXML(url)
  local response = http.get(url)
  if response then
    local content = response.readAll()
    response.close()
    return content
  end
  return nil
end

-- Fonction pour afficher le contenu sur le moniteur
local function afficherContenu(contenu)
  local moniteur = peripheral.wrap("top") -- Assurez-vous que le moniteur est connecté sur le dessus de l'ordinateur
  moniteur.setTextScale(0.5)
  moniteur.clear()

  local x, y = 1, 1
  for i = 1, #contenu do
    moniteur.setCursorPos(x, y)
    moniteur.write(contenu[i])
    y = y + 1
    if y > moniteur.getHeight() then
      break
    end
  end
end

-- Fonction principale
local function main()
  local xmlContent = downloadXML(url)
  if xmlContent then
    local document = xmlparser.parse(xmlContent)

    -- Obtention des titres des articles
    local articles = document.children[1].children
    local titres = {}
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

    afficherContenu(titres)
  else
    print("Erreur lors du téléchargement du fichier XML.")
  end
end

-- Exécution du script
main()
