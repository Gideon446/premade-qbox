-- add your custom dispatch here
function Dispatch()
    -- exports['ps-dispatch']:gunCreateRobbery()
end

function sendNotify(text, type, time)
	if Config.Notify == 'qb' then
		
		if type == 'info' then
			type = 'success'
		end

		QBCore.Functions.Notify(text, type, time)
	elseif Config.Notify == 'dream' then
		exports['drm-notify']:notify(text, texttype, length)
	end
end

-- add your custom game here
RegisterNetEvent('d_gunheist:hackingMinigame')
AddEventHandler('d_gunheist:hackingMinigame', function()
	sendNotify('Wait 5 seconds another hack starting', 'info', 3000)
	Wait(5000)
	if Config.hackingMinigame == 'mhacking' then
		TriggerEvent("mhacking:show")
		TriggerEvent("mhacking:start", 7, 20, hackingCompleted)
	elseif Config.hackingMinigame == 'ps-ui' then
		exports['ps-ui']:VarHack(function(success)
			if success then
				hackingCompleted(true)
			else
				return sendNotify('Failed', 'error', 3000)
			end
		end, numBlocks, time)
	elseif Config.hackingMinigame == 'ox_lib' then
		local success = lib.skillCheck({'easy', 'easy', 'easy', 'easy' }, {'1', '2', '3', '4'})
		if success then
			hackingCompleted(true)
		else
			return sendNotify('Failed', 'error', 3000)
		end
	end
end)

-- you can add you custom game completion
function hackingCompleted(success, timeremaining)
	if success then
		TriggerServerEvent('d_gunheist:hackingCompleted')
	else
		sendNotify('Failed', 'error', 3000)
	end
	if Config.hackingMinigame == 'mhacking' then
		TriggerEvent('mhacking:hide')
	end
end