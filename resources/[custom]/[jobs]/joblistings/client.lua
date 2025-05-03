local display = false
local menuOpen = false
local markerVisible = false

-- Function to toggle UI display
function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        jobs = Config.Jobs
    })
end

-- Initialize display state
Citizen.CreateThread(function()
    SetDisplay(false)
end)

-- Handle NUI callbacks
RegisterNUICallback('exit', function(data, cb)
    SetDisplay(false)
    menuOpen = false
    cb('ok')
end)

RegisterNUICallback("jobSelected", function(data, cb)
    if data.job then
        TriggerServerEvent("setJob", data.job)
        SetDisplay(false)
        menuOpen = false
    end
    cb("ok")
end)

-- Marker and menu interaction
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - Config.Location)

        -- Marker visibility
        if distance < 10.0 and not markerVisible then
            markerVisible = true
        elseif distance >= 10.0 and markerVisible then
            markerVisible = false
        end

        -- Draw marker when visible
        if markerVisible then
            DrawMarker(1, -- marker type
                Config.Location.x, Config.Location.y, Config.Location.z - 1.0,
                0.0, 0.0, 0.0, -- direction
                0.0, 0.0, 0.0, -- rotation
                1.0, 1.0, 1.0, -- scale
                3, 252, 194, -- color (RGB)
                200, -- alpha
                false, -- bob up and down
                true, -- face camera
                2, -- p19
                false, -- rotate
                nil, -- texture dictionary
                nil, -- texture name
                false -- draw on entities
            )

            -- Show help text when close
            if distance < 2.0 then
                ShowHelpNotification('Press ~INPUT_CONTEXT~ to access the Job Center')
                
                -- Handle interaction
                if IsControlJustPressed(0, 38) then -- 'E' key
                    if not menuOpen then
                        SetDisplay(true)
                        menuOpen = true
                    end
                end
            end
        end
    end
end)

-- Helper function to show notifications
function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end
