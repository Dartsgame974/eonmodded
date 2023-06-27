local DiscordHook = require("DiscordHook")

local webhookURL = "https://discord.com/api/webhooks/1111395479385804850/QKq2lNKHUji9JXPKiw9Hqy2Qeluep3pyhOM2yJth70AcyxJXMaRkCoO1ifZmrLjkYBc1"
local chestSide = "front" -- Remplacez par le côté du coffre que vous utilisez

local success, hook = DiscordHook.createWebhook(webhookURL)
if not success then
    error("Échec de la connexion au webhook ! Raison : " .. hook)
end

function sendMessage(message)
    hook.send(message, nil, nil)
end

function getItemName()
    local chest = peripheral.wrap(chestSide)
    local itemStack = chest.pullItemStack()
    if itemStack then
        local itemName = itemStack.name
        return itemName
    end
    return nil
end

function sendItemNameToDiscord()
    while true do
        local itemName = getItemName()
        if itemName then
            sendMessage("Nouvel item trouvé dans le coffre : " .. itemName)
        end
        sleep(1) -- Attendre une seconde avant de vérifier à nouveau
    end
end

sendItemNameToDiscord()
