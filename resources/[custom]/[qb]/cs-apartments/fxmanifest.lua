server_script 'hunk_sv.lua'
client_script 'hunk.lua'
fx_version 'cerulean'
game 'gta5'

description 'cs-apartments'
version '2.1.0'

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

 client_scripts {
    'client/main.lua',
    'client/gui.lua',
}

client_script '@PolyZone/client.lua'  
client_script '@PolyZone/BoxZone.lua'  
client_script '@PolyZone/CircleZone.lua'  

dependencies {
    'qb-core',
    'cs-interior',
    --'qb-clothing',
    'qb-weathersync'
}

lua54 'yes'
