local QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('chatMessage', function(source, name, message)
  if string.sub(message, 1, string.len('/')) ~= '/' then
    CancelEvent()
    TriggerClientEvent('dev_rpchat:sendLocalOOC', -1, source, name, message, {30, 144, 255});
  end
end)

QBCore.Commands.Add('clear', 'Clear Chat', {}, false, function(source, args)
  TriggerClientEvent('chat:clear', source)
end, 'user')

QBCore.Commands.Add('clearall', 'Clear All Chat(Admin Only)', {}, false, function(source, args)
  TriggerClientEvent('chat:clear', -1)
end, 'admin')



QBCore.Functions.CreateCallback('dev_rpchat:getPlayerName', function(source, cb, playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if Player then
        local firstname = Player.PlayerData.charinfo.firstname
        local lastname = Player.PlayerData.charinfo.lastname
        cb(firstname .. " " .. lastname)
    else
        cb(nil) -- Si no se encuentra al jugador, devuelve nil
    end
end)

QBCore.Functions.CreateCallback('dev_rpchat:getPlayerJobData', function(source, cb, playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if Player then
        local playerName = Player.PlayerData.charinfo.lastname
        local jobGrade = Player.PlayerData.job.grade.name or "Oficial" -- Si no tiene nombre de rango, usar "Oficial"
        cb({ name = playerName, job = Player.PlayerData.job })
    else
        cb(nil) -- Si no se encuentra al jugador, devuelve nil
    end
end)


QBCore.Functions.CreateCallback('dev_rpchat:getPlayerDetails', function(source, cb, playerId)
    local targetPlayer = QBCore.Functions.GetPlayer(playerId)
    if targetPlayer then
        cb({
            name = targetPlayer.PlayerData.name,
            citizenid = targetPlayer.PlayerData.citizenid
        })
    else
        cb(nil)
    end
end)


RegisterCommand('pm', function(source, args, rawCommand)
	if source == 0 then
		return
	end
	
	if tonumber(args[1]) and args[2] then

		local id=tonumber(args[1])
	
		msg = table.concat(args, ' ', 2)
	 
		local name =  GetPlayerNameSteam(source)

		local nombre =  GetPlayerName(source)
	
		local characterName = GetPlayerName(source)
	
		name = '' .. source .. ' '.. name
	
		local xPlayers = QBCore.Functions.GetPlayers()
	
		local target = QBCore.Functions.GetPlayer(id)

		if(target ~= nil) then
	   
			TriggerClientEvent('chat:addMessage', id, {
                        template =
                            '<div class="msg_box">' ..
                                '<div class="barra_msg"></div>' ..
                                '<div class="msg_label"><i class="fa-solid fa-comment-sms"></i> PM</div>' ..
								'<div class="player_id_msg">{1}</div>' ..
                                '<div class="player_name_box_msg">Received <i class="fa-solid fa-inbox"></i></div>' ..
                                '<div class="message_box_msg">{2}</div>' ..
                            '</div>',
				--template = '<div style="font-weight:bold;margin-bottom: 2px;width:fit-content;font-size:.8vw;padding: .3vw;margin-right: 0.40vw;background-color: rgba(0, 0, 0, 0.698);border-radius: 1px;border-left: #5dc91e 4px solid;color: rgb(255, 255, 255)"> <b> <b style=color:#ffffff>MSG ·<b style=color:#ffffff> ID {1}:<b style=color:#ffffff;font-weight:normal> {2}  </br></div>',
				args = { fal, name, msg }
			})
			TriggerClientEvent('chat:addMessage', source, {
                       template =
                            '<div class="msg_box">' ..
                                '<div class="barra_msg"></div>' ..
                                '<div class="msg_label"><i class="fa-solid fa-comment-sms"></i> PM</div>' ..
								'<div class="player_id_msg">{1}</div>' ..
                                '<div class="player_name_box_msg">Sent <i class="fa-solid fa-paper-plane"></i></div>' ..
                                '<div class="message_box_msg">{2}</div>' ..
                            '</div>',
				--template = '<div style="font-weight:bold;margin-bottom: 2px;width:fit-content;font-size:.8vw;padding: .3vw;margin-right: 0.40vw;background-color: rgba(0, 0, 0, 0.698);border-radius: 1px;border-left: #5dc91e 4px solid;color: rgb(255, 255, 255)"> <b> <b style=color:#ffffff>MSG ·<b style=color:#ffffff> ID {1}:<b style=color:#ffffff;font-weight:normal> {2}  </br></div>',
				args = { fal, name, msg }
			})
		else
			TriggerClientEvent('QBCore:Notify', source, "Esta ID no corresponde a ningún usuario activo.", "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', source, "No estás usando el comando bien: /msg id mensaje.", "error")
	end
end, false)



RegisterCommand('dices', function(source, args, user)
  local name = GetCharacterName(source)
  num = math.random(1, 10)
  TriggerClientEvent("dev_rpchat:sendDados", -1, source, name, num, table.concat(args, " "))
end, false)




RegisterCommand('ooc', function(source, args, raw)
  if source == 0 then
    print('dev_rpchat: you can\'t use this command from rcon!')
    return
  end
  args = table.concat(args, ' ')
  local name = GetCharacterName(source)
  if Config.firstname then name = GetPlayerName2(source) 
elseif Config.lastname then name = GetLastName(source) 
elseif Config.job then name = GetJobName(source) end

  TriggerClientEvent('dev_rpchat:sendLocalOOC', -1, source, name, args, { 196, 33, 246 })

end)


RegisterCommand('me', function(source, args, raw)
  if source == 0 then
    print('dev_rpchat: you can\'t use this command from rcon!')
    return
  end
  args = table.concat(args, ' ')
  local name = GetCharacterName(source)
  if Config.firstname then name = GetPlayerName2(source) 
elseif Config.lastname then name = GetLastName(source) 
elseif Config.job then name = GetJobName(source) end

  TriggerClientEvent('dev_rpchat:sendMe', -1, source, name, args, { 196, 33, 246 })

end)

RegisterCommand('do', function(source, args, raw)
  if source == 0 then
    print('dev_rpchat: you can\'t use this command from rcon!')
    return
  end

  args = table.concat(args, ' ')
  local name = GetCharacterName(source)
  if Config.firstname then name = GetPlayerName2(source) 
elseif Config.lastname then name = GetLastName(source) 
elseif Config.job then name = GetJobName(source) end

  TriggerClientEvent('dev_rpchat:sendDo', -1, source, name, args, { 255, 198, 0 })
end)



RegisterServerEvent('dev_rpchat:chat')
AddEventHandler('dev_rpchat:chat', function(job, msg)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	firstname = Player.PlayerData.job.grade.name.. " " ..Player.PlayerData.charinfo.firstname
	lastname = Player.PlayerData.charinfo.lastname.. " "
	jobName = string.upper(job)
	local messageFull = {
        template = '<div style="font-weight:bold;font-size:.8vw;margin-bottom: 2px;width:fit-content;padding: .3vw;margin-right: 0.40vw;background-color: rgba(0, 0, 0, 0.698);border-radius: .1px;border-left: rgb(19, 114, 202) 4px solid;color: rgb(255, 255, 255)">LSPD · {1} {2} : <b style=color:#ffffff;font-weight:normal>{3}</font></i></b></div>',
        args = {jobName, firstname, lastname, msg}
    }
    TriggerClientEvent('dev_rpchat:Send', -1, messageFull, job)
end)



RegisterCommand('police', function(source, args, raw)
    if source == 0 then
        print('dev_rpchat: you can\'t use this command from rcon!')
        return
    end

    local Player = QBCore.Functions.GetPlayer(source)
    if not Player or Player.PlayerData.job.name ~= "police" then
        TriggerClientEvent('QBCore:Notify', source, "Solo los policías pueden usar este comando.", "error")
        return
    end

    args = table.concat(args, ' ')
    local name = GetCharacterName(source)
    
    if Config.firstname then 
        name = GetPlayerName2(source) 
    elseif Config.lastname then 
        name = GetLastName(source) 
    elseif Config.job then 
        name = GetJobName(source) 
    end

    TriggerClientEvent('dev_rpchat:sendPolice', -1, source, name, args, { 196, 33, 246 })
end)


RegisterCommand('medic', function(source, args, raw)
    if source == 0 then
        print('dev_rpchat: you can\'t use this command from rcon!')
        return
    end

    local Player = QBCore.Functions.GetPlayer(source)
    if not Player or Player.PlayerData.job.name ~= "ambulance" then
        TriggerClientEvent('QBCore:Notify', source, "Solo los medicos pueden usar este comando.", "error")
        return
    end

    args = table.concat(args, ' ')
    local name = GetCharacterName(source)
    
    if Config.firstname then 
        name = GetPlayerName2(source) 
    elseif Config.lastname then 
        name = GetLastName(source) 
    elseif Config.job then 
        name = GetJobName(source) 
    end

    TriggerClientEvent('dev_rpchat:sendEms', -1, source, name, args, { 196, 33, 246 })
end)