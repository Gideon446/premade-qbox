shared_script '@WaveShield/resource/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'adamant'
game 'gta5'
lua54 'yes'
author 'devx32'

shared_scripts {
    '@ox_lib/init.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}

ui_page 'web/index.html'

files {
	'client/modules/*lua',
	'shared/**/*',
	'web/**/*',
}