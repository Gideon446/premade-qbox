fx_version 'cerulean'
lua54 'yes'
games { 'gta5' }
author 'Dream Scripting'
description 'An Interactive CoolDown System For Fivem [QBCore/QBx_Core]'
version '1.8.2'

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
    'config.lua',
    'server/editable.lua',
}
dependency '/assetpacks'