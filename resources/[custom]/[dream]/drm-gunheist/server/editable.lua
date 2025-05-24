Webhook = 'https://ptb.discord.com/api/webhooks/1372900480618991646/ZPV86jVYzaAueyBqhg0erF4-OBT1q_3gIMrZvk9UhKmKZNo-A7fb0BByfjiFTScVJAv6'

function sendNotify(source, text, type)
    local time = 5000
    local src = source
	if Config.Notify == 'qb' then
		
		if type == 'info' then
			type = 'success'
		end

        TriggerClientEvent("QBCore:Notify", src, text, type)
	elseif Config.Notify == 'dream' then
		TriggerClientEvent('drm-notify:client:sendNotify', src, text, type)
	end
end