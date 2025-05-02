-- local QBCore = exports['qb-core']:GetCoreObject()

-- RegisterNetEvent('keep-crafting:client:local_mailer', function(data)
--     local msg = Lang:t('mail.message')
--     local level = Lang:t('mail.level')
--     local restricted = Lang:t('mail.no')
--     if data.restricted then restricted = Lang:t('mail.yes') end
--     msg = string.format(msg, data.gender, data.charinfo.lastname, data.item_name, data.success_rate, restricted,
--         data.level)

--     if data.level then
--         level = string.format(level, data.level)
--         msg = msg .. level
--     end

--     local mat = ''
--     for name, amount in pairs(data.materials) do
--         local _name = QBCore.Shared.Items[name]
--         mat = mat .. " " .. string.format(Lang:t('mail.materials_list'), _name.label, amount)
--     end
--     msg = msg .. Lang:t('mail.materials_list_header') .. mat .. Lang:t('mail.tnx_message')
--     TriggerServerEvent('qb-phone:server:sendNewMail', {
--         sender = Lang:t('mail.sender'),
--         subject = Lang:t('mail.subject'),
--         message = msg,
--         button = {}
--     })
-- end)

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('keep-crafting:client:local_mailer', function(data)
    local msg = "Hello " .. data.gender .. " " .. data.charinfo.lastname .. ",\n\n"
    msg = msg .. "You are attempting to craft: **" .. data.item_name .. "**\n"
    msg = msg .. "Success Rate: **" .. data.success_rate .. "%**\n"
    msg = msg .. "Restricted: **" .. (data.restricted and "Yes" or "No") .. "**\n"

    if data.level then
        msg = msg .. "Required Level: **" .. data.level .. "**\n"
    end

    msg = msg .. "\nRequired Materials:\n"
    for name, amount in pairs(data.materials) do
        local itemData = QBCore.Shared.Items[name]
        if itemData then
            msg = msg .. "- " .. itemData.label .. ": " .. amount .. "\n"
        end
    end

    msg = msg .. "\nThank you for using the crafting system!"

    exports["npwd"]:createNotification({
        notisId = "npwd:tweetBroadcast",
        appId = "MESSAGES",
        content = msg,
        secondaryTitle = "Crafting System",
        keepOpen = false,
        duration = 5000,
        path = "/messages",
    })
end)
