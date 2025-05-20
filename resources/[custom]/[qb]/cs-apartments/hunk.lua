
clinetIsReady = false

-- do not touch anything at below

-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-- about coords -------------------------------

local set_entity_coords = SetEntityCoords
local set_entity_coords_no_offset = SetEntityCoordsNoOffset
local set_ped_coords_keep_vehicle = SetPedCoordsKeepVehicle
local task_warp_ped = TaskWarpPedIntoVehicle

TaskWarpPedIntoVehicle = function(ped, vehicle, seatIndex)
    if IsEntityAPed(ped) then
        exports['HUNK-AC']:DontCheckTeleport()
    end
    
    return task_warp_ped(ped, vehicle, seatIndex)
end

SetEntityCoords = function(target, ...)
	if IsEntityAPed(target) and IsPedAPlayer(target) then
		exports['HUNK-AC']:DontCheckTeleport()
	end
	
	return set_entity_coords(target, ...)
end

SetEntityCoordsNoOffset = function(target, ...)
	if IsEntityAPed(target) and IsPedAPlayer(target) then
		exports['HUNK-AC']:DontCheckTeleport()
	end
	
	return set_entity_coords_no_offset(target, ...)
end

SetPedCoordsKeepVehicle = function(target, ...)
	if IsEntityAPed(target) and IsPedAPlayer(target) then
		exports['HUNK-AC']:DontCheckTeleport()
	end
	
	return set_ped_coords_keep_vehicle(target, ...)
end

-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-- about vision -------------------------------
local set_night_vision = SetNightvision
local set_see_through = SetSeethrough

SetNightvision = function(toggle)
	if toggle then
		exports['HUNK-AC']:DontCheckNightVision()
	else
		exports['HUNK-AC']:StartCheckNightVision()
	end
	
	return set_night_vision(toggle)
end

SetSeethrough = function(toggle)
	if toggle then
		exports['HUNK-AC']:DontCheckThermalVision()
	else
		exports['HUNK-AC']:StartCheckThermalVision()
	end
	
	return set_see_through(toggle)
end

-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-- about health -------------------------------
local set_entity_health = SetEntityHealth
local lastHealth = {}

SetEntityHealth = function(ped, amount)

	if IsPedAPlayer(ped) then
		if lastHealth[tostring(ped)] == nil then
			lastHealth[tostring(ped)] = amount
			if amount > GetEntityHealth(ped) then
				exports['HUNK-AC']:PlayerHealedByServer()
			end
		else
			if GetEntityHealth(ped) ~= lastHealth[tostring(ped)] then
				lastHealth[tostring(ped)] = GetEntityHealth(ped)
			end
			if amount > lastHealth[tostring(ped)] then
				exports['HUNK-AC']:PlayerHealedByServer()
			end
			
			lastHealth[tostring(ped)] = amount
		end	
	end

	return set_entity_health(ped, amount)
end

-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-- about armor --------------------------------
local set_ped_armor = SetPedArmour
local add_ped_armor = AddArmourToPed

AddArmourToPed = function(ped, amount)
	if IsPedAPlayer(ped) then
		exports['HUNK-AC']:ArmorAdded()
	end
	
	return add_ped_armor(ped, amount)
end

SetPedArmour = function(ped, amount)
	if IsPedAPlayer(ped) then
		exports['HUNK-AC']:ArmorAdded()
	end
	
	return set_ped_armor(ped, amount)
end

-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-- about invincible ---------------------------
local set_player_invincible = SetPlayerInvincible
local set_entity_invincible = SetEntityInvincible
local lastInvincible = {}
local lastInvincible2 = {}

SetEntityInvincible = function(entity, toggle)
	if IsEntityAPed(entity) and IsPedAPlayer(entity) then
		if lastInvincible[tostring(entity)] == nil then
			lastInvincible[tostring(entity)] = toggle
			if toggle then
				exports['HUNK-AC']:DontCheckGodMode()
			else
				exports['HUNK-AC']:StartCheckGodMode()
			end
		else
			if lastInvincible[tostring(entity)] ~= toggle then
				lastInvincible[tostring(entity)] = toggle
				if toggle then
					exports['HUNK-AC']:DontCheckGodMode()
				else
					exports['HUNK-AC']:StartCheckGodMode()
				end
			end
		end
	end

	return set_entity_invincible(entity, toggle)
end

SetPlayerInvincible = function(player, toggle)

	if lastInvincible2[tostring(player)] == nil then
		lastInvincible2[tostring(player)] = toggle
		if toggle then
			exports['HUNK-AC']:DontCheckGodMode()
		else
			exports['HUNK-AC']:StartCheckGodMode()
		end
	else
		if lastInvincible[tostring(player)] ~= toggle then
			lastInvincible[tostring(player)] = toggle
			if toggle then
				exports['HUNK-AC']:DontCheckGodMode()
			else
				exports['HUNK-AC']:StartCheckGodMode()
			end
		end
	end	

	return set_player_invincible(player, toggle)
end

-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-- about texture ------------------------------
local request_streamed_texture = RequestStreamedTextureDict
local draw_sprite = DrawSprite
local LoadedTextures = {}

DrawSprite = function(dict, ...)
	
	if LoadedTextures[string.lower(dict)] == nil then
		LoadedTextures[string.lower(dict)] = true
		
		while not NetworkIsSessionStarted() do 
			Citizen.Wait(0)
		end
		
		local success = false
		
		while success == false do
			success, result = pcall(function() isReady = exports['HUNK-AC']:ClientIsReady() end)
			if success then
				clinetIsReady = true
			end
			Citizen.Wait(0)
		end
		
		exports['HUNK-AC']:StreamedTexture(string.lower(dict))
	end

	return draw_sprite(dict, ...)
end

RequestStreamedTextureDict = function(dict, toggle)
	if LoadedTextures[string.lower(dict)] == nil then
		LoadedTextures[string.lower(dict)] = true
		
		while not NetworkIsSessionStarted() do 
			Citizen.Wait(0)
		end
		
		local success = false
		
		while success == false do
			success, result = pcall(function() isReady = exports['HUNK-AC']:ClientIsReady() end)
			if success then
				clinetIsReady = true
			end
			Citizen.Wait(0)
		end
		
		exports['HUNK-AC']:StreamedTexture(string.lower(dict))
	end
	
	return request_streamed_texture(dict, toggle)
end

-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-- about freecam ------------------------------
local set_cam_active_interp = SetCamActiveWithInterp
local render_script_cams = RenderScriptCams
local set_player_control = SetPlayerControl
local destroy_cam = DestroyCam

SetCamActiveWithInterp = function(...)
	exports['HUNK-AC']:DontCheckFreeCam()
	return set_cam_active_interp(...)
end

SetPlayerControl = function(player, hasControl, flags)
	if hasControl == 1 or hasControl == true then
		exports['HUNK-AC']:StartCheckMenyoo()
	else
		exports['HUNK-AC']:DontCheckMenyoo()
	end
	
	return set_player_control(player, hasControl, flags)
end

RenderScriptCams = function(render, ...)
	if render == 1 or render == true then
		exports['HUNK-AC']:DontCheckFreeCam()
	elseif render == 0 or render == false then
		exports['HUNK-AC']:StartCheckFreeCam()
	end
	
	return render_script_cams(render, ...)
end

DestroyCam = function(...)
	exports['HUNK-AC']:StartCheckFreeCam()
	return destroy_cam(...)
end

-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-- about invisibility -------------------------
local set_entity_visible = SetEntityVisible
local set_player_invisible_locally = SetPlayerInvisibleLocally
local set_local_player_invisible_locally = SetLocalPlayerInvisibleLocally
local set_entity_alpha = SetEntityAlpha

local lastVisible = {}
local lastVisible2 = {}
local LastVisible3 = true
local lastAlpha = {}

SetEntityVisible = function(target, toggle)
	if IsEntityAPed(target) and IsPedAPlayer(target) then
		if lastVisible[tostring(target)] == nil then
			lastVisible[tostring(target)] = toggle
			if not toggle then
				exports['HUNK-AC']:DontCheckInvis()
			end
		else
			if lastVisible[tostring(target)] ~= toggle then
				lastVisible[tostring(target)] = toggle
				if toggle then
					exports['HUNK-AC']:StartCheckInvis()
				else
					exports['HUNK-AC']:DontCheckInvis()
				end
			end	
		end
	end
	
	return set_entity_visible(target, toggle)
end

SetPlayerInvisibleLocally = function(playerId, toggle)
	if lastVisible2[tostring(playerId)] == nil then
		lastVisible2[tostring(playerId)] = toggle
		if not toggle then
			exports['HUNK-AC']:DontCheckInvis()
		end
	else
		if lastVisible2[tostring(playerId)] ~= toggle then
			lastVisible2[tostring(playerId)] = toggle
			if toggle then
				exports['HUNK-AC']:StartCheckInvis()
			else
				exports['HUNK-AC']:DontCheckInvis()
			end
		end	
	end	
	
	return set_player_invisible_locally(playerId, toggle)
end

SetLocalPlayerInvisibleLocally = function(toggle)

	if LastVisible3 ~= toggle then
		LastVisible3 = toggle
		if toggle then
			exports['HUNK-AC']:DontCheckInvis()
		else
			exports['HUNK-AC']:StartCheckInvis()
		end
	end
	
	return set_local_player_invisible_locally(toggle)
end

SetEntityAlpha = function(ped, amount, skin)

	if lastAlpha[tostring(ped)] == nil then
		lastAlpha[tostring(ped)] = amount
	end

	if lastAlpha[tostring(ped)] ~= amount and IsPedAPlayer(ped) then
		lastAlpha[tostring(ped)] = amount
		if amount < 50 then
			exports['HUNK-AC']:DontCheckAlpha()
		else
			exports['HUNK-AC']:StartCheckAlpha()
		end
	end
	
	return set_entity_alpha(ped, amount, skin)
end

-----------------------------------------------
-----------------------------------------------
-- others -------------------------------------

local add_blip_entity = AddBlipForEntity
local resurrect_player = NetworkResurrectLocalPlayer
local set_player_model = SetPlayerModel
local set_run_sprint = SetRunSprintMultiplierForPlayer
local lastSpeed = {}
local calculate_curosr_timer = false

ShowCursorThisFrame = function()
	last_cursor_timer = GetGameTimer()
	if calculate_curosr_timer == false then
		calculate_curosr_timer = true
		exports['HUNK-AC']:McStC(true)
		Citizen.CreateThread(function()
			while true do
				if GetGameTimer() - last_cursor_timer > 1000 then
					exports['HUNK-AC']:McStC(false)
					calculate_curosr_timer = false
					return
				end
				Wait(1000)
			end
		end)
	end
	
	Citizen.InvokeNative(0xAAE7CE1D63167423)
end

AddBlipForEntity = function(target)
	if IsEntityAPed(target) and IsPedAPlayer(target) then
		exports['HUNK-AC']:DontCheckBlip(target)
	end
	
	return add_blip_entity(target)
end

NetworkResurrectLocalPlayer = function(...)
	exports['HUNK-AC']:PlayerHealedByServer()
	exports['HUNK-AC']:DontCheckTeleport()
	return resurrect_player(...)
end

SetPlayerModel = function(player, model)
	exports['HUNK-AC']:PlayerPedChanged(model)

	return set_player_model(player, model)
end

SetRunSprintMultiplierForPlayer = function(pedid, speed)
	if lastSpeed[tostring(pedid)] == nil then
		lastSpeed[tostring(pedid)] = speed
	end
	
	if speed ~= lastSpeed[tostring(pedid)] then
		lastSpeed[tostring(pedid)] = speed
		exports['HUNK-AC']:SetRunSprint(speed)
	end
	return set_run_sprint(pedid, speed)
end

local delete_vehicle = DeleteVehicle
local delete_entity = DeleteEntity

DeleteEntity = function(entity)
	if IsEntityAVehicle then
		exports['HUNK-AC']:VehicleDeleted()
	end
	return delete_entity(entity)
end

DeleteVehicle = function(entity)
	exports['HUNK-AC']:VehicleDeleted()
	return delete_vehicle(entity)
end

local trigger_server_event = TriggerServerEvent
local trigger_server_event_internal = TriggerServerEventInternal
local trigger_Latent_server_event = TriggerLatentServerEventInternal

TriggerServerEvent = function(eventName, ...)
	
	if clinetIsReady == false then
		while not NetworkIsSessionStarted() do 
			Citizen.Wait(0)
		end
		
		local success, result = pcall(function() isReady = exports['HUNK-AC']:ClientIsReady() end)	
		if success then
			clinetIsReady = true
			exports['HUNK-AC']:TriggerSvEvent(eventName, 'normal' , ...)
		else
			return trigger_server_event(eventName, ...)
		end
	else
		exports['HUNK-AC']:TriggerSvEvent(eventName, 'normal', ...)
	end
end

TriggerServerEventInternal = function(eventName, payload, payloadLen)
	
	if clinetIsReady == false then
		while not NetworkIsSessionStarted() do 
			Citizen.Wait(0)
		end
		
		local success, result = pcall(function() isReady = exports['HUNK-AC']:ClientIsReady() end)	
		if success then
			clinetIsReady = true
			exports['HUNK-AC']:TriggerSvEvent(eventName, 'internal', payload, payloadLen)
		else
			return trigger_server_event_internal(eventName, payload, payloadLen)
		end
	else
		exports['HUNK-AC']:TriggerSvEvent(eventName, 'internal', payload, payloadLen)
	end
end

TriggerLatentServerEventInternal = function(eventName, payload, payloadLen, bps)
	
	if clinetIsReady == false then
		while not NetworkIsSessionStarted() do 
			Citizen.Wait(0)
		end
		
		local success, result = pcall(function() isReady = exports['HUNK-AC']:ClientIsReady() end)	
		if success then
			clinetIsReady = true
			exports['HUNK-AC']:TriggerSvEvent(eventName, 'latent', payload, payloadLen, bps)
		else
			return trigger_Latent_server_event(eventName, payload, payloadLen, bps)
		end
	else
		exports['HUNK-AC']:TriggerSvEvent(eventName, 'latent', payload, payloadLen, bps)
	end
end


