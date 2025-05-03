fx_version "adamant"

description "ES-Scoreboard"
author "! Raider#0101"
version '1.0.0'
repository 'https://discord.gg/EkwWvFS'

game "gta5"


client_scripts { 
    "main/shared.lua",
    "main/client/*.lua"
}

server_scripts {
    "main/server/*.lua"
}

shared_script "main/shared.lua"

ui_page "index.html"

files {
    'index.html',
    'vue.js',
    'assets/**/*.*',
    'assets/font/*.otf',  
}

lua54 'yes'
-- dependency '/assetpacks'
