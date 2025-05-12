fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Gh0st'
website 'www.5Mservers.com'
description 'Job listing script'
version '1.0.0'


server_scripts {
	--'@es_extended/locale.lua',
	'@qb-core/shared/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server.lua'

}

client_scripts {
	--'@es_extended/locale.lua',
	'@qb-core/shared/locale.lua',
	'config.lua',
	'client.lua'
}

ui_page{
    'ui/index.html'
}

files {
    'ui/*.*',
    'ui/**/*.*',
}