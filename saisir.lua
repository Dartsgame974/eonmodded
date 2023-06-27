local DiscordHook = require("DiscordHook")

local webhookURL = "https://discord.com/api/webhooks/1111395479385804850/QKq2lNKHUji9JXPKiw9Hqy2Qeluep3pyhOM2yJth70AcyxJXMaRkCoO1ifZmrLjkYBc1"

local success, hook = DiscordHook.createWebhook(webhookURL)
if not success then
    error("Échec de la connexion au webhook ! Raison : " .. hook)
end

function sendMessage(message)
    hook.send(message, nil, nil)
end

function getInput()
    while true do
        term.clear()
        term.setCursorPos(1, 1)
        print("Entrez votre message (ou 'exit' pour quitter) :")
        local input = read()
        if input == "exit" then
            break
        end
        sendMessage(input)
        sleep(1) -- Attendre une seconde entre chaque message
    end
end

getInput()
