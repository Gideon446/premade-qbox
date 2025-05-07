local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("mask", function(source, item)
    TriggerClientEvent("drm-masks:client:MaskOn", source, item)
end)

QBCore.Functions.CreateUseableItem("maskcreator", function(source)
    if exports.ox_inventory:RemoveItem(source, "maskcreator", 1) then
        TriggerClientEvent('drm-masks:client:openmenu', source)
    else
        TriggerClientEvent("QBCore:Notify", src, "Failed to use mask creator", "error")
    end
end)

RegisterNetEvent('drm-masks:server:MaskOnByCommand', function(mask, tex)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local mask = Player.Functions.GetItemByName("mask")
    if mask then
        TriggerClientEvent("drm-masks:client:MaskOn", source, mask)
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have a mask", "error")
    end
end)

RegisterNetEvent('drm-masks:server:GiveMaskItem', function(mask, tex)
    if mask == 0 then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local info = {
        drawableId = mask, 
        textureId = tex,
        description = "Wear it to do something illegal! Mask ID : " ..mask .. " Texture : " .. tex
    }

    exports.ox_inventory:AddItem(source, "mask", 1, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["mask"], "add")
end)

RegisterNetEvent('drm-masks:server:GiveMaskItemNearby', function(mask, tex)
    if mask == 0 then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local info = {
        drawableId = mask, 
        textureId = tex,
        description = "Wear it to do something illegal! Mask ID : " ..mask .. " Texture : " .. tex
    }

    exports.ox_inventory:AddItem(source, "mask", 1, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["mask"], "add")
end)

RegisterNetEvent('drm-masks:server:RemoveMaskItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(item.name, 1, item.slot)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)