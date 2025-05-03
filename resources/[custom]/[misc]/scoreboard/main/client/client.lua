RegisterKeyMapping('eyestore', 'Open Eyes Scoreboard', 'keyboard', 'J')

local isMenuOpen = false
local lastToggleTime = 0
local actionInProgress = false
local failedAttempts = 0
local cachedPlayerData = nil
local cachedPlayerDataTime = 0
local isCachingInProgress = false
local displayingScoreboard = false

Framework = nil
Framework = GetFramework()

Citizen.CreateThread(function()
    while Framework == nil do 
        print("^3Waiting for Framework...")
        Citizen.Wait(500) 
    end
    print("^2Framework loaded: " .. Config.Framework)
    
    if Config.Framework == "ESX" or Config.Framework == "NewESX" then
        Callback = Framework.TriggerServerCallback
        print("^2ESX Callback defined")
    elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
        Callback = Framework.Functions.TriggerCallback
        print("^2QBCore Callback defined")
    else
        print("^1ERROR: Unknown framework: " .. Config.Framework)
    end
    
    Citizen.SetTimeout(2000, function()
        PreloadPlayerData()
    end)
end)

function PreloadPlayerData()
    if isCachingInProgress then return end
    
    isCachingInProgress = true
    print("^3Loading player data...")
    
    if Callback then
        Callback('getPlayerInfo', function(players)
            if players and type(players) == "table" and #players > 0 then
                cachedPlayerData = players
                cachedPlayerDataTime = GetGameTimer()
                print("^2Player data loaded: " .. #players .. " players")
                isCachingInProgress = false
            else
                print("^1Data could not be loaded, fake data will be used")
                cachedPlayerData = CreateFakePlayerData()
                cachedPlayerDataTime = GetGameTimer()
                isCachingInProgress = false
            end
        end)
    else
        print("^1Callback not found, fake data will be used")
        cachedPlayerData = CreateFakePlayerData()
        cachedPlayerDataTime = GetGameTimer()
        isCachingInProgress = false
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000)
        
        if not isMenuOpen then
            PreloadPlayerData()
        end
        
        Citizen.Wait(1000)
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    Citizen.SetTimeout(1000, function()
        PreloadPlayerData()
    end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    Citizen.SetTimeout(1000, function()
        PreloadPlayerData()
    end)
end)

RegisterCommand('eyestore', function()
    print("^3Opening menu...")
    
    if actionInProgress then
        print("^1Action in progress, preventing open")
        return
    end
    
    if not isMenuOpen then
        actionInProgress = true
        
        print("^2Menu is not open, opening now and setting focus")
        isMenuOpen = true
        
        SendNUIMessage({
            action = 'hideScrollbars'
        })
        
        SendNUIMessage({
            action = 'show',
            data = 'MENU',
            open = true,
            events = Config.Events
        })
        
        SetNuiFocus(true, true)
        
        local dataIsReady = (cachedPlayerData ~= nil and #cachedPlayerData > 0)
        
        if dataIsReady then
            print("^2Sending cached data immediately: " .. #cachedPlayerData .. " players")
            ProcessAndSendPlayerData(cachedPlayerData)
            
            Citizen.SetTimeout(100, function()
                RefreshPlayerData()
            end)
        else
            print("^3No cached data, loading data quickly...")
            LoadPlayerDataFast()
        end
        
        Citizen.SetTimeout(100, function()
            actionInProgress = false
            failedAttempts = 0
        end)
    else
        print("^3Menu is already open, trying to close")
        close()
    end
end)

function LoadPlayerDataFast()
    if not Callback then
        print("^1Callback not defined, using fake data")
        SendFakePlayersToUI()
        return
    end
    
    local callbackSuccess = false
    
    SendNUIMessage({
        action = 'showLoading',
        message = 'Loading Players...'
    })
    
    print("^3Requesting player data from server...")
    
    Callback('getPlayerInfo', function(players)
        callbackSuccess = true
        
        if players and type(players) == "table" then
            print("^2Callback successful: " .. #players .. " players received")
            
            for i, player in ipairs(players) do
                if i <= 5 then
                    print("^3Player " .. i .. ": " .. player.name .. " (ID: " .. player.id .. ", Job: " .. player.job .. ")")
                end
            end
            
            cachedPlayerData = players
            cachedPlayerDataTime = GetGameTimer()
            
            ProcessAndSendPlayerData(players)
            
            SendNUIMessage({
                action = 'hideLoading'
            })
        else
            print("^1Player data could not be retrieved or empty, using fake data")
            SendFakePlayersToUI()
        end
    end)
    
    Citizen.SetTimeout(2000, function()
        if not callbackSuccess then
            print("^1Callback never returned, using backup data")
            if cachedPlayerData and #cachedPlayerData > 0 then
                ProcessAndSendPlayerData(cachedPlayerData)
            else
                SendFakePlayersToUI()
            end
            
            SendNUIMessage({
                action = 'hideLoading'
            })
        end
    end)
end

function RefreshPlayerData()
    if not Callback then
        return
    end
    
    Callback('getPlayerInfo', function(players)
        if players and type(players) == "table" and #players > 0 then
            cachedPlayerData = players
            cachedPlayerDataTime = GetGameTimer()
            
            if isMenuOpen then
                ProcessAndSendPlayerData(players)
            end
        end
    end)
end

function ProcessAndSendPlayerData(players)
    if not players or #players == 0 then
        print("^1No players to process, using fake data instead")
        SendFakePlayersToUI()
        return
    end

    print("^3Processing " .. #players .. " players for UI")

    local policeCount = 0
    local emsCount = 0
    local mechanicCount = 0
    local taxiCount = 0
    local lawyerCount = 0
    local realtorCount = 0
    local citizenCount = 0
    
    for _, player in ipairs(players) do
        player.roleLabel = Config.JobLabels[player.job] or player.job
        
        if not player.avatarInitials or not player.avatarBgColor then
            player.avatarInitials = GetInitialsFromName(player.name)
            player.avatarBgColor = GetColorForName(player.name)
        end
        
        if player.job == 'police' then
            policeCount = policeCount + 1
        elseif player.job == 'ambulance' then
            emsCount = emsCount + 1
        elseif player.job == 'mechanic' then
            mechanicCount = mechanicCount + 1
        elseif player.job == 'taxi' then
            taxiCount = taxiCount + 1
        elseif player.job == 'lawyer' then
            lawyerCount = lawyerCount + 1
        elseif player.job == 'realtor' then
            realtorCount = realtorCount + 1
        else
            citizenCount = citizenCount + 1
        end
    end
    
    print("^2Sending data to UI: " .. #players .. " players - " .. 
          "Police: " .. policeCount .. ", " .. 
          "EMS: " .. emsCount .. ", " ..
          "Citizens: " .. citizenCount)
    
    SendNUIMessage({
        action = 'updatePlayers',
        players = players,
        policeCount = policeCount,
        emsCount = emsCount,
        mechanicCount = mechanicCount,
        taxiCount = taxiCount,
        lawyerCount = lawyerCount,
        realtorCount = realtorCount,
        citizenCount = citizenCount
    })
end

function GetInitialsFromName(name)
    if not name then return "NA" end
    local initials = string.upper(string.sub(name, 1, 2))
    return initials
end

function GetColorForName(name)
    if not name then return "#6c757d" end
    
    local hash = 0
    for j = 1, #name do
        hash = string.byte(name, j) + ((hash * 5) - hash)
    end
    
    local colors = {
        "#3498db", "#2ecc71", "#e74c3c", "#f39c12", "#9b59b6",
        "#1abc9c", "#d35400", "#c0392b", "#16a085", "#8e44ad",
        "#2980b9", "#27ae60", "#e67e22", "#f1c40f", "#7f8c8d"
    }
    
    local index = math.abs(hash) % #colors + 1
    return colors[index]
end

function CreateFakePlayerData()
    local fakePlayers = {}
    local fakeCount = Config.FakePlayerCount or 20 -- Default to 20 if not set
    
    local fakeNames = {"John", "Michael", "Alex", "Sarah", "Emma", "Zoe", "Henry", "Mark", "Matthew", "Ellen", 
                      "James", "Robert", "David", "Jennifer", "Lisa", "William", "Richard", "Thomas", "Linda", "Karen",
                      "Chris", "Daniel", "Paul", "George", "Mary", "Patricia", "Barbara", "Elizabeth", "Susan", "Jessica"}
    
    local fakeJobs = {"police", "ambulance", "mechanic", "taxi", "lawyer", "realtor", "unemployed"}
    
    -- Calculate job distribution - dynamic based on total player count
    local jobDistribution = {
        police = math.max(1, math.floor(fakeCount * 0.15)),     -- 15% are police
        ambulance = math.max(1, math.floor(fakeCount * 0.1)),   -- 10% are EMS
        mechanic = math.max(1, math.floor(fakeCount * 0.1)),    -- 10% are mechanics
        taxi = math.max(1, math.floor(fakeCount * 0.05)),       -- 5% are taxi drivers
        lawyer = math.max(1, math.floor(fakeCount * 0.05)),     -- 5% are lawyers
        realtor = math.max(1, math.floor(fakeCount * 0.05))     -- 5% are realtors
    }
    
    -- Calculate how many civilians needed to reach the total
    local assignedJobs = 0
    for _, count in pairs(jobDistribution) do
        assignedJobs = assignedJobs + count
    end
    
    -- The rest are civilians/unemployed
    local unemployedCount = math.max(0, fakeCount - assignedJobs)
    
    -- Generate fake players based on job distribution
    local playerIndex = 1
    
    -- Create players for each job type
    for job, count in pairs(jobDistribution) do
        for i = 1, count do
            if playerIndex <= fakeCount then
                local nameIndex = (playerIndex % #fakeNames) + 1
                local fullName = fakeNames[nameIndex] .. (1000 + playerIndex)
                
                table.insert(fakePlayers, {
                    id = '#' .. (1000 + playerIndex),
                    name = fullName,
                    ping = math.random(20, 100),
                    job = job,
                    roleLabel = Config.JobLabels[job] or job,
                    avatarInitials = GetInitialsFromName(fullName),
                    avatarBgColor = GetColorForName(fullName),
                    source = 1000 + playerIndex
                })
                
                playerIndex = playerIndex + 1
            end
        end
    end
    
    -- Add remaining unemployed players
    for i = 1, unemployedCount do
        if playerIndex <= fakeCount then
            local nameIndex = (playerIndex % #fakeNames) + 1
            local fullName = fakeNames[nameIndex] .. (1000 + playerIndex)
            
            table.insert(fakePlayers, {
                id = '#' .. (1000 + playerIndex),
                name = fullName,
                ping = math.random(20, 100),
                job = "unemployed",
                roleLabel = Config.JobLabels["unemployed"] or "Unemployed",
                avatarInitials = GetInitialsFromName(fullName),
                avatarBgColor = GetColorForName(fullName),
                source = 1000 + playerIndex
            })
            
            playerIndex = playerIndex + 1
        end
    end
    
    return fakePlayers
end

function SendFakePlayersToUI()
    local fakePlayers = CreateFakePlayerData()
    
    local policeCount = 0
    local emsCount = 0
    local mechanicCount = 0
    local taxiCount = 0
    local lawyerCount = 0
    local realtorCount = 0
    local citizenCount = 0
    
    for _, player in ipairs(fakePlayers) do
        if player.job == 'police' then
            policeCount = policeCount + 1
        elseif player.job == 'ambulance' then
            emsCount = emsCount + 1
        elseif player.job == 'mechanic' then
            mechanicCount = mechanicCount + 1
        elseif player.job == 'taxi' then
            taxiCount = taxiCount + 1
        elseif player.job == 'lawyer' then
            lawyerCount = lawyerCount + 1
        elseif player.job == 'realtor' then
            realtorCount = realtorCount + 1
        else
            citizenCount = citizenCount + 1
        end
    end
    
    SendNUIMessage({
        action = 'updatePlayers',
        players = fakePlayers,
        policeCount = policeCount,
        emsCount = emsCount,
        mechanicCount = mechanicCount,
        taxiCount = taxiCount,
        lawyerCount = lawyerCount,
        realtorCount = realtorCount,
        citizenCount = citizenCount
    })
    
    SendNUIMessage({
        action = 'hideLoading'
    })
end

function close()
    Citizen.CreateThread(function()
        SetNuiFocus(false, false)
        print("^2NUI focus removed successfully")
    end)
    
    SendNUIMessage({
        action = 'hide'
    })
    SendNUIMessage({
        action = 'updatePlayers',
        players = {},
        policeCount = 0,
        emsCount = 0,
        mechanicCount = 0,
        taxiCount = 0,
        lawyerCount = 0, 
        realtorCount = 0,
        citizenCount = 0
    })
    displayingScoreboard = false
    isMenuOpen = false
end

RegisterNUICallback('close', function(data, cb)
    close()
    cb('ok')
end)

RegisterCommand('+scores', function()
    if IsPauseMenuActive() then return end
    
    if not displayingScoreboard then
        displayingScoreboard = true
        isMenuOpen = true
        
        SendNUIMessage({
            action = 'hideScrollbars'
        })
        
        SendNUIMessage({
            action = 'show',
            events = Config.Events
        })
        SetNuiFocus(true, true)
        
        if Callback then
            Callback('getPlayerInfo', function(players)
                if players and type(players) == "table" then
                    ProcessAndSendPlayerData(players)
                else
                    SendFakePlayersToUI()
                end
            end)
        else
            SendFakePlayersToUI()
        end
    else
        close()
    end
end)

RegisterCommand('-scores', function()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    
    print("^3Resource stopping: " .. resourceName)
    SetNuiFocus(false, false)
    isMenuOpen = false
    actionInProgress = false
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    print("^3Client resource started: " .. resourceName)
    Citizen.SetTimeout(3000, function()
        PreloadPlayerData()
    end)
end)
