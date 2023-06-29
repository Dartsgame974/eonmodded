-- Fonction pour récupérer les données d'une chaîne
function getChannelData(channelIdentifier)
    local url
    -- Vérifier si l'identifiant de la chaîne est un ID ou un nom
    if tonumber(channelIdentifier) then
        url = "https://pipedapi.kavin.rocks/channel/" .. channelIdentifier
    else
        url = "https://pipedapi.kavin.rocks/channelByName/" .. channelIdentifier
    end

    local response = http.get(url)
    local data = response.readAll()
    response.close()

    local json = textutils.unserializeJSON(data)
    if json then
        return json
    else
        return nil
    end
end

-- Fonction pour obtenir le nombre d'abonnés d'une chaîne
function getSubscriberCount(channelData)
    if channelData and channelData.subscriberCount then
        return channelData.subscriberCount
    else
        return nil
    end
end

-- Demander à l'utilisateur de saisir le nom ou l'ID de la chaîne
print("Veuillez saisir le nom ou l'ID de la chaîne :")
local channelIdentifier = read()

-- Obtenir les données de la chaîne
local channelData = getChannelData(channelIdentifier)
if channelData then
    -- Obtenir le nombre d'abonnés
    local subscriberCount = getSubscriberCount(channelData)
    if subscriberCount then
        print("Nombre d'abonnés de la chaîne " .. channelIdentifier .. " : " .. subscriberCount)
    else
        print("Impossible d'obtenir le nombre d'abonnés de la chaîne.")
    end
else
    print("Impossible de récupérer les données de la chaîne.")
end
