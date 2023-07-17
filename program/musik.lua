local aukit = require("aukit")
local austream = shell.resolveProgram("austream")

-- Téléchargement du fichier de la liste de lecture
local playlistURL = "https://raw.githubusercontent.com/Dartsgame974/eonmodded/main/musiclist.json"
local response = http.get(playlistURL)
if response then
  local playlistData = response.readAll()
  response.close()

  -- Parsing du fichier JSON de la liste de lecture
  local success, playlist = pcall(textutils.unserializeJSON, playlistData)
  if success and type(playlist) == "table" then
    -- Fonction pour lire une musique
    local function playMusic(title, musicURL)
      -- Lecture de la musique en utilisant AUStream
      shell.run(austream, musicURL)
      
      -- Affichage du titre de la musique en cours de lecture
      print("Lecture de la musique : " .. title)
      
      -- Attente jusqu'à la fin de la musique
      while true do
        local status, result = pcall(aukit.isPlaying)
        if not status or not result then
          break
        end
        sleep(1)
      end
    end

    -- Lecture des musiques dans la liste de lecture
    for _, entry in ipairs(playlist) do
      -- Récupération du titre et du lien de la musique
      local title = entry.title
      local musicURL = entry.link

      -- Lecture de la musique
      playMusic(title, musicURL)
    end
  else
    print("Erreur de parsing du fichier de la liste de lecture.")
  end
else
  print("Erreur lors du téléchargement du fichier de la liste de lecture.")
end
