local DiscordHook = require("DiscordHook")

local webhookURL = "https://discord.com/api/webhooks/1111395479385804850/QKq2lNKHUji9JXPKiw9Hqy2Qeluep3pyhOM2yJth70AcyxJXMaRkCoO1ifZmrLjkYBc1"

local success, hook = DiscordHook.createWebhook(webhookURL)
if not success then
    error("Échec de la connexion au webhook ! Raison : " .. hook)
end

function sendMessage(message)
    hook.send(message, nil, nil)
end

function mainLoop()
    while true do
        sendMessage("Serveur Privé ouvert UP")
        sleep(120) -- Attendre 2 minutes
    end
end

mainLoop()
