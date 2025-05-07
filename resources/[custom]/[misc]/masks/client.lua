local QBCore = exports['qb-core']:GetCoreObject()

local function GetClosestPlayer()
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    for i = 1, #players do
        local target = players[i]
        
        if target ~= PlayerId() then -- Skip self
            local targetPed = GetPlayerPed(target)
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(playerCoords - targetCoords)
            
            if closestDistance == -1 or distance < closestDistance then
                closestDistance = distance
                closestPlayer = target
            end
        end
    end
    
    return closestPlayer, closestDistance
end

local function GetClosestPlayerPed()
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPed = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    
    for i = 1, #players do
        local target = players[i]
        
        if target ~= PlayerId() then -- Skip self
            local targetPed = GetPlayerPed(target)
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(playerCoords - targetCoords)
            
            if closestDistance == -1 or distance < closestDistance then
                closestDistance = distance
                closestPed = targetPed
            end
        end
    end
    
    return closestPed, closestDistance
end

RegisterCommand("mask", function()
    TriggerEvent("drm-masks:client:ToggleMask")
end, false)

RegisterNetEvent('drm-masks:client:TakeMask',  function() -- this function is ok 
    
    local player = GetClosestPlayer()
    local playerPed = GetClosestPlayerPed()

    player = GetPlayerServerId(player)
    print(player .. " " .. playerPed)

    local mask = GetPedDrawableVariation(playerPed, 1)
    local tex = GetPedTextureVariation(playerPed, 1)

    if mask == 0 then
        QBCore.Functions.Notify("Player is not wearing any mask!", "error")
    else
        maskOffByForce(mask, tex, playerPed, player)
    end
end)

RegisterNetEvent('drm-masks:client:ToggleMask',  function()
    local ped = PlayerPedId()
    local mask = GetPedDrawableVariation(ped, 1)
    local tex = GetPedTextureVariation(ped, 1)

    if mask == 0 then
        TriggerServerEvent("drm-masks:server:MaskOnByCommand")
    else
        maskOff(mask, tex)
    end
end)

RegisterNetEvent("drm-masks:client:openmenu", function(source)
    if Config.Appearance == 'illenium' then
        exports['illenium-appearance']:startPlayerCustomization(function(appearance)
            if appearance then
                TriggerServerEvent("illenium-appearance:server:saveAppearance", appearance)
            end
        end, {
            components = true, componentConfig = { masks = true, upperBody = false, lowerBody = false, bags = false, shoes = false, scarfAndChains = false, bodyArmor = false, shirts = false, decals = false, jackets = false },
            props = false, propConfig = { hats = false, glasses = false, ear = false, watches = false, bracelets = false },
            enableExit = true,
        })
    end
end)

RegisterNetEvent('drm-masks:client:MaskOn', function(item)
    local ped = PlayerPedId()
    if item.metadata.drawableId == nil then print("This mask has no data. Do not spawn it in. Instead go to a clothing store then remove the mask") end
    if GetPedDrawableVariation(ped, 1) ~= 0 then QBCore.Functions.Notify("You are already wearing a mask", "error") return end

    QBCore.Functions.Progressbar("maskon", "Putting Mask On..", 600, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = "mp_masks@standard_car@ds@",
        anim = "put_on_mask",
        flags = 49,
    }, {}, {}, function() -- Done
        SetPedComponentVariation(ped, 1, item.metadata.drawableId, item.metadata.textureId)
        TriggerServerEvent("drm-masks:server:RemoveMaskItem", item)
        SavePlayerAppearance()
    end, function() -- Cancel

    end)
end)

function maskOff(mask, tex)
    local ped = PlayerPedId()
    if GetPedDrawableVariation(ped, 1) == 0 then QBCore.Functions.Notify("You are not wearing a mask", "error") return end

    QBCore.Functions.Progressbar("maskoff", "Taking Mask Off..", 600, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = "missfbi4",
        anim = "takeoff_mask",
        flags = 49,
    }, {}, {}, function() -- Done
        SetPedComponentVariation(ped, 1, 0)
        TriggerServerEvent("drm-masks:server:GiveMaskItem", mask, tex)
        SavePlayerAppearance()
    end, function() -- Cancel

    end)
end

function maskOffByForce(mask, tex, playerped, player)
    local ped = PlayerPedId()
    print("maskoffbyforce")
    if GetPedDrawableVariation(playerped, 1) == 0 then QBCore.Functions.Notify("Player not wearing a mask", "error") return end
    
    QBCore.Functions.Progressbar("maskoff", "Taking Mask Off..", 600, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {}, {}, {}, function() -- Done
        -- SetPedComponentVariation(playerped, 1, 0)

        -- Wait(500)

        TriggerServerEvent("drm-masks:server:GiveMaskItemNearby", mask, tex)
        SavePlayerAppearance1(player)
    end, function() -- Cancel
    end)
end


-- Function to save player appearance
function SavePlayerAppearance()
    if Config.Appearance == 'illenium' then
            -- Get the player's current appearance
        local appearance = exports['illenium-appearance']:getPedAppearance(PlayerPedId())
    
        if not appearance then
            print("[ERROR] Failed to get player appearance of " .. PlayerPedId())
            return
        end

        -- Trigger server event to save the appearance
        TriggerServerEvent("illenium-appearance:server:saveAppearance", appearance)
    end
end

-- Function to save closest player appearance
function SavePlayerAppearance1(playerped)

    SetPedComponentVariation(playerped, 1, 0)

    Wait(500)
    
    if Config.Appearance == 'illenium' then
            -- Get the player's current appearance
        local appearance = exports['illenium-appearance']:getPedAppearance(playerped)
    
        if not appearance then
            print("[ERROR] Failed to get player appearance of " .. playerped)
            return
        end
        

        -- Trigger server event to save the appearance
        TriggerServerEvent("illenium-appearance:server:saveAppearance1", appearance, playerped)
        
    end
end