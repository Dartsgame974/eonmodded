-- Importez la bibliothèque DiscordHook
local DiscordHook = require("DiscordHook")

-- Créez une instance de DiscordHook avec l'URL du Webhook
local webhook = DiscordHook("https://discordapp.com/api/webhooks/1111395479385804850/QKq2lNKHUji9JXPKiw9Hqy2Qeluep3pyhOM2yJth70AcyxJXMaRkCoO1ifZmrLjkYBc1")

-- Exemple 1: Envoi d'un message simple
webhook:send("C'est juste un message normal.", "Votre webhook fantaisie", "https://media.energetic.pw/pm5rod-3pp.jpg")

-- Exemple 2: Envoi d'un message JSON personnalisé
local jsonMessage = "{ \"content\": \"On va dîner ! :pizza:\", \"username\": \"Votre chère maman\", \"avatar_url\": \"https://media.energetic.pw/pm5rsm-cJT.jpg\" }"
webhook:sendJSON(jsonMessage)

-- Exemple 3: Envoi d'un message avec un embed
webhook:sendEmbed("@everyone", "Système de défense de base", "Un intrus a été détecté ! L'utilisateur **'HydroNitrogen'** est entré dans l'espace aérien privé à `123, 100, 321` ! Veuillez envoyer des unités de défense maintenant !", nil, 0xFF0000, nil, "https://media.energetic.pw/pm5s32-c9z.png", "Système de défense de base", "https://media.energetic.pw/pm5sfo-82l.jpg")

print("Jusqu'à présent, nous avons envoyé " .. webhook.sentMessages .. " messages avec succès !")
