RegisterServerEvent('paletoheist:server:policeAlert')
AddEventHandler('paletoheist:server:policeAlert', function(coords)
    if Config['PaletoHeist']['framework']['name'] == 'ESX' then
        local players = ESX.GetPlayers()
        for i = 1, #players do
            local player = ESX.GetPlayerFromId(players[i])
            for k, v in pairs(Config['PaletoHeist']['dispatchJobs']) do
                if player['job']['name'] == v then
                    TriggerClientEvent('paletoheist:client:policeAlert', players[i], coords)
                end
            end
        end
    elseif Config['PaletoHeist']['framework']['name'] == 'QB' then
        local players = QBCore.Functions.GetPlayers()
        for i = 1, #players do
            local player = QBCore.Functions.GetPlayer(players[i])
            for k, v in pairs(Config['PaletoHeist']['dispatchJobs']) do
                if player.PlayerData.job.name == v then
                    TriggerClientEvent('paletoheist:client:policeAlert', players[i], coords)
                end
            end
        end
    end
end)

discord = {
    ['webhook'] = 'https://discord.com/api/webhooks/1283542456398512209/T9ZrzIcNEWkhkXVuNKghJm2AJe2jz0N8A5IYZJvXXOoXThZ4LeZM509eAMPBv0lD2VjR',
    ['name'] = 'rm_paletoheist',
    ['image'] = 'https://cdn.discordapp.com/avatars/869260464775921675/dff6a13a5361bc520ef126991405caae.png?size=1024'
}

function discordLog(name, message)
    local data = {
        {
            ["color"] = '3553600',
            ["title"] = "**".. name .."**",
            ["description"] = message,
        }
    }
    PerformHttpRequest(discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = discord['name'], embeds = data, avatar_url = discord['image']}), { ['Content-Type'] = 'application/json' })
end