local FrameworkObject = nil

-- Initialize framework object based on config
function GetFrameworkObject()
    if Config.Framework == "esx" or Config.Framework == "legacy" then
        FrameworkObject = exports["es_extended"]:getSharedObject()
    elseif Config.Framework == "newqb" then
        FrameworkObject = exports["qb-core"]:GetCoreObject()
    elseif Config.Framework == "oldqb" then
        while FrameworkObject == nil do
            TriggerEvent('QBCore:GetObject', function(obj) FrameworkObject = obj end)
            Citizen.Wait(200)
        end
    end
end

GetFrameworkObject()

-- Handle job change requests
RegisterServerEvent('setJob')
AddEventHandler('setJob', function(jobName)
    local _source = source
    local formattedJobName = string.lower(jobName)
    
    -- Validate job exists in config
    local jobExists = false
    for _, job in ipairs(Config.Jobs) do
        if job.name == formattedJobName then
            jobExists = true
            break
        end
    end
    
    if not jobExists then
        print("Invalid job requested: " .. formattedJobName)
        return
    end

    -- Set job based on framework
    if Config.Framework == 'esx' or Config.Framework == 'legacy' then
        local xPlayer = FrameworkObject.GetPlayerFromId(_source)
        if xPlayer then
            xPlayer.setJob(formattedJobName, 0)
            TriggerClientEvent('esx:showNotification', _source, 'You are now a ' .. formattedJobName)
        else
            print('Failed to retrieve player for source: ' .. _source)
        end
    elseif Config.Framework == 'newqb' or Config.Framework == 'oldqb' then
        local Player = FrameworkObject.Functions.GetPlayer(_source)
        if Player then
            Player.Functions.SetJob(formattedJobName, 0)
            TriggerClientEvent('QBCore:Notify', _source, 'You are now a ' .. formattedJobName)
        else
            print('Failed to retrieve player for source: ' .. _source)
        end
    end
end)

-- Helper function to get current job
function GetCurrentJobForPlayer(source)
    if Config.Framework == 'esx' or Config.Framework == 'legacy' then
        local xPlayer = FrameworkObject.GetPlayerFromId(source)
        if xPlayer then
            return xPlayer.getJob().name
        end
    elseif Config.Framework == 'newqb' or Config.Framework == 'oldqb' then
        local Player = FrameworkObject.Functions.GetPlayer(source)
        if Player then
            return Player.PlayerData.job.name
        end
    end
    return nil
end
