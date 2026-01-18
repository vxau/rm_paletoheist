function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0, 1)
end

RegisterNetEvent('paletoheist:client:showNotification')
AddEventHandler('paletoheist:client:showNotification', function(str)
    ShowNotification(str)
end)

getClosestPlayers = function(coords, maxDistance)
    local players = GetActivePlayers()
    local ped = PlayerPedId()
    coords = coords and (type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords) or GetEntityCoords(ped)
    local maxDistance = maxDistance or 5
    local closePlayers = {}
    for _, player in pairs(players) do
        local target = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(target)
        if maxDistance >= #(targetCoords - coords) then
            closePlayers[#closePlayers + 1] = player
        end
    end
    return closePlayers
end

getClosestPlayer = function(coords, maxDistance)
    local ped = PlayerPedId()
    coords = coords and (type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords) or GetEntityCoords(ped)
    local maxDistance = maxDistance or 5
    local players = GetActivePlayers()
    local closestDistance, closestPlayer = false
    for i = 1, #players, 1 do
        local p = players[i]
        if p and p ~= PlayerId() then
            local target = GetPlayerPed(p)
            local targetCoords = GetEntityCoords(target)
            local distance = #(targetCoords - coords)
            if maxDistance >= distance and (not closestDistance or closestDistance > distance) then
                closestPlayer = p
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

--This event send to all police players
RegisterNetEvent('paletoheist:client:policeAlert')
AddEventHandler('paletoheist:client:policeAlert', function(targetCoords)
    ShowNotification(Strings['police_alert'])
    local alpha = 250
    local paletoBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 50.0)

    SetBlipHighDetail(paletoBlip, true)
    SetBlipColour(paletoBlip, 1)
    SetBlipAlpha(paletoBlip, alpha)
    SetBlipAsShortRange(paletoBlip, true)

    while alpha ~= 0 do
        Citizen.Wait(500)
        alpha = alpha - 1
        SetBlipAlpha(paletoBlip, alpha)

        if alpha == 0 then
            RemoveBlip(paletoBlip)
            return
        end
    end
end)
