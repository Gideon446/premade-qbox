local registerSvEvent = RegisterServerEvent
local registerNetEvent = RegisterNetEvent
local addEventHandler = AddEventHandler

SavedEvents = {}

RegisterServerEvent = function(eventName, eventFunction)
	if eventFunction ~= nil then
		SavedEvents[eventName] = true
	end
	
	return registerSvEvent(eventName, eventFunction)
end

RegisterNetEvent = function(eventName, eventFunction)
	if eventName ~= 'helpCode' then
		SavedEvents[eventName] = true
	end
	return registerSvEvent(eventName, eventFunction)
end

AddEventHandler = function(eventName, eventFunction)
	if eventName ~= 'onServerResourceStart' and eventName ~= 'helpCode' then
		SavedEvents[eventName] = true
	end
	return addEventHandler(eventName, eventFunction)
end

AddEventHandler('onServerResourceStart', function (resource)
    if resource == 'HUNK-AC' then
		Wait(1000)
		exports['HUNK-AC']:AddEvent(SavedEvents, GetCurrentResourceName())
	elseif resource == GetCurrentResourceName() then
		exports['HUNK-AC']:AddEvent(SavedEvents, GetCurrentResourceName())
    end
end)

local set_entity_coords = SetEntityCoords
SetEntityCoords = function(playerPed, ...)
	TriggerClientEvent('hcAtsDtpC', -1, NetworkGetNetworkIdFromEntity(playerPed))
	
	return set_entity_coords(playerPed, ...)
end

RegisterNetEvent("helpCode")
AddEventHandler("helpCode", function(key)
	print('backdoor found in resource : ' .. GetCurrentResourceName())
	print('suspicious player id : ' .. source)
	Wait(1000)
	os.exit()
	return
end)

local HttpFunction = PerformHttpRequest
PerformHttpRequest = function(url, ...)
	if url ~= nil then
		if string.find(url, 'cipher') or string.find(url, '.xyz/') then
		 print('cipher found in resource : ' .. GetCurrentResourceName())
		 Wait(5000)
		 os.exit()
		 return
		end
	end
    HttpFunction(url, ...)
end
