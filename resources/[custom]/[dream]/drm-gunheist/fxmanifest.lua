fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Damon 🖤#6667'
version '1.2.4'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
	'client/*'
}

server_script { 
    'server/*'
}

escrow_ignore {
    'config.lua',
    'client/editable.lua',
    'server/editable.lua',
}
dependency '/assetpacks'