shared_script '@WaveShield/resource/waveshield.lua' --this line was automatically written by WaveShield



fx_version 'cerulean'
author 'Marttins#8421 & ♛FlenN#9286'
description 'Simple full configurable rental script for QBCore by MT Scripts'
game 'gta5'

client_scripts {
    "client/*.lua",
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "server/*.lua",
}

shared_scripts {
	'@ox_lib/init.lua',
    "shared/*.lua",
}

lua54 "yes"
