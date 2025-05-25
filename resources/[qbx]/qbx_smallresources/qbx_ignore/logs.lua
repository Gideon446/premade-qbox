local Webhooks = {
    ['default'] = 'https://ptb.discord.com/api/webhooks/1376296989557264435/jOtZFhmmSuq4sntEEtgPzdOguF1_hgV9oFGIdA3QtWvJy7mhH84DvNSQFku-olylIq3X',
    ['Loaded'] = 'https://ptb.discord.com/api/webhooks/1376296989557264435/jOtZFhmmSuq4sntEEtgPzdOguF1_hgV9oFGIdA3QtWvJy7mhH84DvNSQFku-olylIq3X',
}

local colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ['lightgreen'] = 65309,
}

local logQueue = {}
local Logging = 'discord'  -- discord or fivemanage

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone, imageUrl)
    local tag = tagEveryone or false

    if Logging == 'discord' then
        local cyan = '\27[36m'
        local green = '\27[32m'
        local yellow = '\27[33m'
        local magenta = '\27[35m'
        local red = '\27[31m'
        local yellow = '\27[33m'
        local reset = '\27[0m'
        
        if not Webhooks[name] then

            print(cyan .. 'Tried to call a log that isn\'t configured with the name of ' .. yellow .. name .. magenta .. ', add it in qbx_smallresources/qbx_ignore/logs.lua line:3' .. reset)
            -- return
        end
        local webHook = Webhooks[name] ~= '' and Webhooks[name] or Webhooks['default']
        if not Webhooks[name] or Webhooks[name] == '' then webHook = Webhooks['default'] end
        local embedData = {
            {
                ['color'] = colors[color] or colors['default'],
                ['footer'] = {
                    ['text'] = os.date('%c'),
                },
                ['description'] = message,
                ['author'] = {
                    ['name'] = name,
                    ['icon_url'] = 'https://r2.fivemanage.com/H69RQc4BdRXtWaufdSM5p/487f09da00379ec37422e7dabf794306-removebg-preview(1).png',
                },
                ['image'] = imageUrl and imageUrl ~= '' and { ['url'] = imageUrl } or nil,
            }
        }

        if not logQueue[name] then logQueue[name] = {} end
        logQueue[name][#logQueue[name] + 1] = { webhook = webHook, data = embedData }

        if #logQueue[name] >= 10 then
            local postData = { username = 'Dream Logger', embeds = {embedData},  avatar_url = 'https://r2.fivemanage.com/H69RQc4BdRXtWaufdSM5p/487f09da00379ec37422e7dabf794306-removebg-preview(1).png' }

            if tag then
                postData.content = '@everyone'
            end

            for i = 1, #logQueue[name] do postData.embeds[#postData.embeds + 1] = logQueue[name][i].data[1] end
            PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
            logQueue[name] = {}
        end
    elseif Logging == 'fivemanage' then
        local FiveManageAPIKey = GetConvar('FIVEMANAGE_LOGS_API_KEY', 'false')
        if FiveManageAPIKey == 'false' then
            print('You need to set the FiveManage API key in your server.cfg')
            return
        end
        local extraData = {
            level = tagEveryone and 'warn' or 'info', -- info, warn, error or debug
            message = title,                          -- any string
            metadata = {                              -- a table or object with any properties you want
                description = message,
                playerId = source,
                playerLicense = GetPlayerIdentifierByType(source, 'license'),
                playerDiscord = GetPlayerIdentifierByType(source, 'discord')
            },
            resource = GetInvokingResource(),
        }
        PerformHttpRequest('https://api.fivemanage.com/api/logs', function(statusCode, response, headers)
            -- Uncomment the following line to enable debugging
            -- print(statusCode, response, json.encode(headers))
        end, 'POST', json.encode(extraData), {
            ['Authorization'] = FiveManageAPIKey,
            ['Content-Type'] = 'application/json',
        })
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 30 then -- If 30 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'Dream Logger', embeds = {},  avatar_url = 'https://r2.fivemanage.com/H69RQc4BdRXtWaufdSM5p/487f09da00379ec37422e7dabf794306-removebg-preview(1).png' }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds + 1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)