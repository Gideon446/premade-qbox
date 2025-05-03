if GetResourceState('qb-core') ~= 'started' then return end

QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("loot_cases:client:notfiy", function(text, textType, length)
    lib.notify({
        title = 'Notification',
        description = text,
        type = textType,
        duration = length or 5000 -- default duration if not provided
    })
end)