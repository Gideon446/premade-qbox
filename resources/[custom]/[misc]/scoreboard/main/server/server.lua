Framework = nil
Framework = GetFramework()

if Framework == nil then
    print("^1ERROR: Framework could not be loaded!")
    return
end

print("^2Framework loaded: " .. Config.Framework)

local Callback
if Config.Framework == "ESX" or Config.Framework == "NewESX" then
    Callback = Framework.RegisterServerCallback
    print("^2ESX Callback created")
elseif Config.Framework == "QBCore" then
    Callback = Framework.Functions.CreateCallback
    print("^2QBCore Callback created")
elseif Config.Framework == "OLDQBCore" then
    Callback = Framework.Functions.CreateCallback
    print("^2OLDQBCore Callback created")
else
    print("^1ERROR: Unknown framework: " .. Config.Framework)
end

if not Callback then
    print("^1ERROR: Callback could not be defined! Fake data will be used.")
    Callback = function(name, cb)
        print("^1WARNING: Fake callback is being created: " .. name)
        RegisterNetEvent("callback:" .. name)
        AddEventHandler("callback:" .. name, function(cbIndex, ...)
            local source = source
            local result = cb(source, ...)
            TriggerClientEvent("callback:return:" .. name, source, cbIndex, result)
        end)
    end
end

local activePlayers = {}

local function AddFakePlayers()
    if not Config.FakePlayers then 
        print("^3FakePlayers disabled, no fake players will be added.")
        return 
    end
    
    print("^2Adding fake players...")
    
    local fakeCount = Config.FakePlayerCount or 20 -- Default to 20 if not set
    
    if fakeCount <= 0 then
        print("^3FakePlayerCount is set to 0 or negative, no fake players will be added.")
        return
    end
    
    print("^3Generating " .. fakeCount .. " fake players...")
    
    local fakeNames = {
        "Shadowblade", "Phoenix", "Stardust", "Nighthawk", "Frostbite",
        "Thunder", "Eclipse", "Blaze", "Storm", "Viper",
        "Ghost", "Dragon", "Wolf", "Eagle", "Tiger", 
        "Raven", "Cobra", "Falcon", "Panther", "Bear",
        "Titan", "Maverick", "Spectre", "Reaper", "Bandit",
        "Ranger", "Sentinel", "Hunter", "Venom", "Knight",
        "Shadow", "Striker", "Warlock", "Paladin", "Sorcerer",
        "Sniper", "Warden", "Guardian", "Phantom", "Crusader"
    }
    
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
    jobDistribution.unemployed = math.max(0, fakeCount - assignedJobs)
    
    if Config.Debug then
        print("^3Job distribution for " .. fakeCount .. " fake players:")
        for job, count in pairs(jobDistribution) do
            print("^3  - " .. job .. ": " .. count)
        end
    end
    
    local usedNames = {}

    local function GetInitials(name)
        if not name then return "NA" end
        local initials = string.upper(string.sub(name, 1, 2))
        return initials
    end
    
    local function GetColorForName(name)
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
    
    for job, count in pairs(jobDistribution) do
        for i = 1, count do
            local id = math.random(1000, 9999)
            
            local attempts = 0
            local selectedName
            repeat
                local randomNameIndex = math.random(1, #fakeNames)
                selectedName = fakeNames[randomNameIndex]
                attempts = attempts + 1
                if attempts > #fakeNames then
                    selectedName = "Player" .. id
                    break
                end
            until not usedNames[selectedName]
            
            usedNames[selectedName] = true
            
            local fakePing = math.random(20, 100)
            
            local fakePlayer = {
                id = '#' .. id,
                name = selectedName,
                ping = fakePing,
                job = job,
                source = id,
                roleLabel = Config.JobLabels[job] or job,
                avatarInitials = GetInitials(selectedName),
                avatarBgColor = GetColorForName(selectedName)
            }
            
            activePlayers["fake_"..id] = fakePlayer
        end
    end
    
    local totalFake = 0
    for id, _ in pairs(activePlayers) do
        if string.find(id, "fake_") then
            totalFake = totalFake + 1
        end
    end
    
    print("^2Fake players successfully added: " .. totalFake .. " players")
end

local function GetPlayerInfo(playerId)
    local xPlayer = nil
    local playerInfo = nil

    if Config.Debug then
        print("^3Getting info for player: " .. tostring(playerId) .. ", ID type: " .. type(playerId))
    end

    if type(playerId) == "string" then
        playerId = tonumber(playerId)
    end

    if Config.Framework == "ESX" or Config.Framework == "NewESX" then
        xPlayer = Framework.GetPlayerFromId(playerId)
        if xPlayer then
            playerInfo = {
                id = '#' .. playerId,
                name = GetPlayerName(playerId),
                ping = GetPlayerPing(playerId),
                job = xPlayer.job.name,
                source = playerId,
                roleLabel = Config.JobLabels[xPlayer.job.name] or xPlayer.job.name
            }
            
            if Config.Debug then
                print("^2ESX player info retrieved: " .. GetPlayerName(playerId) .. " - " .. xPlayer.job.name)
            end
        else
            if Config.Debug then
                print("^1ESX player not found: " .. tostring(playerId))
            end
        end
    elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
        xPlayer = Framework.Functions.GetPlayer(playerId)
        if Config.Debug then
            if xPlayer then
                print("^2QBCore player found by source: " .. tostring(playerId))
            else
                print("^1QBCore player not found by source: " .. tostring(playerId))
                local name = GetPlayerName(playerId)
                if name then
                    print("^3GetPlayerName succeeded for ID: " .. tostring(playerId) .. ", Name: " .. name)
                else
                    print("^1GetPlayerName failed for ID: " .. tostring(playerId))
                end
            end
        end
        
        if xPlayer then
            playerInfo = {
                id = '#' .. playerId,
                name = GetPlayerName(playerId),
                ping = GetPlayerPing(playerId),
                job = xPlayer.PlayerData.job.name,
                source = playerId,
                roleLabel = Config.JobLabels[xPlayer.PlayerData.job.name] or xPlayer.PlayerData.job.name
            }
            
            if Config.Debug then
                print("^2QBCore player info retrieved: " .. GetPlayerName(playerId) .. " - " .. xPlayer.PlayerData.job.name)
            end
        else
            local name = GetPlayerName(playerId)
            if name and name ~= "" then
                playerInfo = {
                    id = '#' .. playerId,
                    name = name,
                    ping = GetPlayerPing(playerId),
                    job = "unemployed",
                    source = playerId,
                    roleLabel = Config.JobLabels["unemployed"] or "Unemployed"
                }
                
                if Config.Debug then
                    print("^3Created fallback player info for: " .. name)
                end
            else
                if Config.Debug then
                    print("^1Failed to create fallback player info for ID: " .. tostring(playerId))
                end
            end
        end
    end
    
    if playerInfo then
        playerInfo.avatarInitials = GetInitials(playerInfo.name)
        playerInfo.avatarBgColor = GetColorForName(playerInfo.name)
    end
    
    return playerInfo
end

local function GetAllPlayers()
    print("^3GetAllPlayers function called")
    
    local allPlayers = {}

    local xPlayers = {}
    if Config.Framework == "ESX" or Config.Framework == "NewESX" then
        xPlayers = Framework.GetPlayers()
        print("^3ESX: Found " .. #xPlayers .. " players")
    elseif Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
        if Config.Framework == "QBCore" then
            xPlayers = Framework.Functions.GetQBPlayers()
            print("^3QBCore: Using GetQBPlayers, found " .. (xPlayers and #xPlayers or 0) .. " players")
        end

        if not xPlayers or #xPlayers == 0 then
            xPlayers = {}
            local players = GetPlayers()
            for _, playerId in ipairs(players) do
                table.insert(xPlayers, playerId)
            end
            print("^3Using GetPlayers fallback, found " .. #xPlayers .. " players")
        end
    end
    
    print("^3Processing " .. #xPlayers .. " players")
    for _, playerId in ipairs(xPlayers) do
        local playerInfo = GetPlayerInfo(playerId)
        if playerInfo then
            print("^2Successfully got player info for ID: " .. playerId .. " - " .. playerInfo.name)
            table.insert(allPlayers, playerInfo)
        else
            print("^1Failed to get player info for ID: " .. playerId)
        end
    end
    
    print("^2Total real players processed: " .. #allPlayers)

    if Config.FakePlayers then
        print("^3Adding fake players to list")
        local fakePlayers = {}
        for id, player in pairs(activePlayers) do
            if string.find(id, "fake_") then
                table.insert(fakePlayers, player)
            end
        end

        for _, player in ipairs(fakePlayers) do
            table.insert(allPlayers, player)
        end
        
        print("^2Total with fake players: " .. #allPlayers)
    end
    
    return allPlayers
end

Callback('getPlayerInfo', function(source, cb)
    print("^2getPlayerInfo callback called: " .. tostring(source))

    activePlayers = {}

    local players = GetPlayers()
    print("^3Native GetPlayers found: " .. #players .. " players")
    
    -- Add real players
    for _, playerId in ipairs(players) do
        local playerInfo = GetPlayerInfo(playerId)
        if playerInfo then
            activePlayers[tostring(playerId)] = playerInfo
            print("^2Successfully added player: " .. playerInfo.name)
        else
            print("^1Failed to get player info for ID: " .. playerId)
        end
    end

    if Config.FakePlayers then
        AddFakePlayers()
    end

    local allPlayers = {}

    for _, player in pairs(activePlayers) do
        table.insert(allPlayers, player)
    end
    
    print("^2Total number of players returned via callback: " .. #allPlayers)
    
    cb(allPlayers)
end)

function GetInitials(name)
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

AddEventHandler('playerJoining', function(source)
    if Config.Debug then
        print("^3Player connecting: " .. GetPlayerName(source) .. " (ID: " .. source .. ")")
    end
end)

AddEventHandler('playerDropped', function(reason)
    local source = source
    if activePlayers[tostring(source)] then
        activePlayers[tostring(source)] = nil
        if Config.Debug then
            print("^3Player left: " .. GetPlayerName(source) .. " (ID: " .. source .. ")")
        end
    end
end)

if Config.Framework == "ESX" or Config.Framework == "NewESX" then
    RegisterServerEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(source)
        if Config.Debug then
            print("^3ESX: Player job changed: " .. GetPlayerName(source))
        end
    end)
end

if Config.Framework == "QBCore" or Config.Framework == "OLDQBCore" then
    RegisterServerEvent('QBCore:Server:OnJobUpdate')
    AddEventHandler('QBCore:Server:OnJobUpdate', function(source)
        if Config.Debug then
            print("^3QBCore: Player job changed: " .. GetPlayerName(source))
        end
    end)
end


AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    print("^2Scoreboard resource started: " .. resourceName)

    activePlayers = {}

    local players = GetPlayers()
    print("^3Resource start: Found " .. #players .. " players")
    
    for _, playerId in ipairs(players) do
        local playerInfo = GetPlayerInfo(playerId)
        if playerInfo then
            activePlayers[tostring(playerId)] = playerInfo
            print("^2Added player: " .. playerInfo.name)
        end
    end

    if Config.FakePlayers then
        print("^3Fake players are enabled, adding fake data")
        AddFakePlayers()
    else
        print("^3Fake players are disabled in config")
    end

    print("^2Total players (real+fake): " .. #GetAllPlayers())
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    print("^1Scoreboard resource has been stopped: " .. resourceName)
end)
