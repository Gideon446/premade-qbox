local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(6000)
		PlayerData = QBCore.Functions.GetPlayerData()
	end
end)


RegisterNetEvent('dev_rpchat:sendPolice', function(playerId, title, message, color)
    -- Obtener la calle y zona donde está el oficial
    local target = GetPlayerFromServerId(playerId)
    local targetPed = GetPlayerPed(target)
    local targetCoords = GetEntityCoords(targetPed)

    local streetName, crossingRoad = GetStreetNameAtCoord(targetCoords.x, targetCoords.y, targetCoords.z)
    local streetLabel = GetStreetNameFromHashKey(streetName)

    if crossingRoad and crossingRoad ~= 0 then
        local crossingLabel = GetStreetNameFromHashKey(crossingRoad)
        streetLabel = streetLabel .. " y " .. crossingLabel
    end

    -- Limitar el nombre de la calle a 15 caracteres
    local function truncateString(str, length)
        if str and #str > length then
            return str:sub(1, length) .. "..."
        end
        return str
    end

    streetLabel = truncateString(streetLabel, 15)

    -- Obtener el nombre y el rango del oficial
    QBCore.Functions.TriggerCallback('dev_rpchat:getPlayerJobData', function(playerData)
        if playerData then
            local rankLabel = playerData.job.grade.name or "Oficial" -- Usar el nombre del rango o "Oficial" por defecto
            local playerName = playerData.name

            -- Enviar la alerta a TODOS los clientes conectados
            TriggerEvent('chat:addMessage', {
                template =
                    '<div class="pd_box">' ..
                        '<div class="barra_pd"></div>' ..
                        '<div class="pd_label"><i class="fa-solid fa-bullhorn"></i> SAPD</div>' ..
                        '<div class="player_id_pd"><i class="fa-solid fa-road"></i> {0}</div>' ..
                        '<div class="player_name_box_pd"><i class="fa-solid fa-user-shield"></i> {1} - {2}</div>' ..
                        '<div class="message_box_pd">{3}</div>' ..
                    '</div>',
                args = { streetLabel, rankLabel, playerName, message }
            })
        end
    end, playerId)
end)




RegisterNetEvent('dev_rpchat:sendEms', function(playerId, title, message, color)
    -- Obtener la calle y zona donde está el EMS
    local target = GetPlayerFromServerId(playerId)
    local targetPed = GetPlayerPed(target)
    local targetCoords = GetEntityCoords(targetPed)

    local streetName, crossingRoad = GetStreetNameAtCoord(targetCoords.x, targetCoords.y, targetCoords.z)
    local streetLabel = GetStreetNameFromHashKey(streetName)

    if crossingRoad and crossingRoad ~= 0 then
        local crossingLabel = GetStreetNameFromHashKey(crossingRoad)
        streetLabel = streetLabel .. " y " .. crossingLabel
    end

    -- Limitar el nombre de la calle a 15 caracteres
    local function truncateString(str, length)
        if str and #str > length then
            return str:sub(1, length) .. "..."
        end
        return str
    end

    streetLabel = truncateString(streetLabel, 15)

    -- Obtener el nombre y el rango del EMS
    QBCore.Functions.TriggerCallback('dev_rpchat:getPlayerJobData', function(playerData)
        if playerData then
            local rankLabel = playerData.job.grade.name or "Médico" -- Usar el nombre del rango o "Médico" por defecto
            local playerName = playerData.name

            -- Enviar la alerta a TODOS los clientes conectados
            TriggerEvent('chat:addMessage', {
                template =
                    '<div class="ems_box">' ..
                        '<div class="barra_ems"></div>' ..
                        '<div class="ems_label"><i class="fa-solid fa-bullhorn"></i> SAMD</div>' ..
                        '<div class="player_id_ems"><i class="fa-solid fa-road"></i> {0}</div>' ..
                        '<div class="player_name_box_ems"><i class="fa-solid fa-truck-medical"></i> {1} - {2}</div>' ..
                        '<div class="message_box_ems">{3}</div>' ..
                    '</div>',
                args = { streetLabel, rankLabel, playerName, message }
            })
        end
    end, playerId)
end)

-- RegisterNetEvent('dev_rpchat:sendMe', function(playerId, title, message, color)
--     local source = PlayerId()
--     local target = GetPlayerFromServerId(playerId)

--     if target ~= -1 then
--         local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
--         local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

--         if targetPed == source or #(sourceCoords - targetCoords) < 20 then
--             -- Solicitar el nombre completo del jugador al servidor
--             QBCore.Functions.TriggerCallback('dev_rpchat:getPlayerName', function(playerName)
--                 if playerName then
--                     TriggerEvent('chat:addMessage', 
--                     {
--                         template =
--                             '<div class="me_box">' ..
--                                 '<div class="barra_me"></div>' ..
--                                 '<div class="me_label"><i class="fa-solid fa-hands"></i> ME</div>' ..
-- 								'<div class="player_id_me">{0}</div>' ..
--                                 '<div class="player_name_box">{1}</div>' ..
--                                 '<div class="message_box">{2}</div>' ..
--                             '</div>',
--                         args = { playerId, playerName, message }
--                     })
--                 end
--             end, playerId)
--         end
--     end
-- end)

RegisterNetEvent('dev_rpchat:sendDo', function(playerId, title, message, color)
    local source = PlayerId()
    local target = GetPlayerFromServerId(playerId)

    if target ~= -1 then
        local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
        local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

        if targetPed == source or #(sourceCoords - targetCoords) < 20 then
            -- Solicitar el nombre completo del jugador al servidor
            QBCore.Functions.TriggerCallback('dev_rpchat:getPlayerName', function(playerName)
                if playerName then
                    TriggerEvent('chat:addMessage', 
                    {
                        template =
                            '<div class="do_box">' ..
                                '<div class="barra_do"></div>' ..
                                '<div class="do_label"><i class="fa-brands fa-cloudflare"></i> DO</div>' ..
								'<div class="player_id_do">{0}</div>' ..
                                '<div class="player_name_box">{1}</div>' ..
                                '<div class="message_box">{2}</div>' ..
                            '</div>',
                        args = { playerId, playerName, message }
                    })
                end
            end, playerId)
        end
    end
end)

-- RegisterNetEvent('dev_rpchat:sendAyuda', function(playerId, title, message, color)
-- 	local source = PlayerId()
-- 	local target = GetPlayerFromServerId(playerId)

-- 	if target ~= -1 then
-- 		TriggerEvent('chat:addMessage', {template = '<div style="font-weight:bold;font-size: 1.35vh;margin-bottom: 2px;color:rgb(255, 174, 0)"> {0}: <span style="color:white;font-weight:normal">'.. message ..'</span></div>',
-- 			args = { "Ayuda · " .. playerId .. "", message }
--     })
-- end
-- end)



RegisterNetEvent('dev_rpchat:sendLocalOOC', function(playerId, title, message, color)
    local source = PlayerId()
    local target = GetPlayerFromServerId(playerId)

    if target ~= -1 then
        local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
        local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

        if targetPed == source or #(sourceCoords - targetCoords) < 20 then
            -- Solicitar nombre y citizenid del jugador al servidor
            QBCore.Functions.TriggerCallback('dev_rpchat:getPlayerDetails', function(playerDetails)
                if playerDetails then
                    local playerName = playerDetails.name
                    local citizenId = playerDetails.citizenid

                    TriggerEvent('chat:addMessage', 
                    {
                        template =
                            '<div class="oop_box">' ..
                                '<div class="barra_oop"></div>' ..
                                '<div class="oop_label"><i class="fa-solid fa-splotch"></i> OOC</div>' ..
                                '<div class="player_id_box">ID: {0}</div>' ..
                                '<div class="player_name_box">Name: {1}</div>' ..
                                '<div class="player_citizenid_box">CID: {2}</div>' ..
                                '<div class="message_box">{3}</div>' ..
                            '</div>',
                        args = { playerId, playerName, citizenId, message }
                    })
                end
            end, playerId)
        end
    end
end)



RegisterNetEvent('dev_rpchat:sendDados', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)
	if target ~= -1 then
	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if targetPed == source or #(sourceCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {
			-- template = '<div style="font-weight:bold;margin-bottom: 2px;width:fit-content;padding: .3vw;margin-right: 0.40vw;font-size:.8vw;background-color: rgba(0, 0, 0, 0.698);border-radius: 1px;border-left: rgba(196, 29, 202, 0.863) 4px solid;color: rgb(255, 255, 255)">{0}: <span style="color:white;font-weight:normal">Has sacado un: '.. message ..'</span></div>',
			-- args = { "DADOS · " .. playerId .. "", message }
			
                        template =
                            '<div class="dices_box">' ..
                                '<div class="barra_dices"></div>' ..
                                '<div class="dices_label"><i class="fa-solid fa-dice"></i> DICES</div>' ..
                                '<div class="player_id_box_dices">{0}</div>' ..
                                '<div class="message_dices">{1}</div>' ..
                            '</div>',
                        args = { playerId, message }
		})
	end
  end
end)



RegisterNetEvent('dev_rpchat:Send')
AddEventHandler('dev_rpchat:Send', function(messageFull, job)
    if PlayerData.job.name == job and PlayerData.job.onduty then
	    TriggerEvent('chat:addMessage', messageFull)
	end
end)