shared_script '@WaveShield/resource/waveshield.lua' --this line was automatically written by WaveShield

fx_version 'cerulean'
lua54 'yes'
games { 'gta5' }
author 'Dream Scripts'
description 'An Interactive CoolDown System For Fivem [QBCore]'
version '1.5.0'

client_scripts {
    'client/**.lua',
}

server_scripts {
    'server/**.lua',
}

shared_scripts {
    'config.lua',
}

files {
    'ui/index.html',
    'ui/app.js',
    'ui/css/style.css',
}

ui_page {'ui/index.html'}

escrow_ignore { 
    'config.lua'
}
dependency '/assetpacks'