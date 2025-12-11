fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Flux'
github 'https://github.com/fluxcz'
description 'FX Paycheck | Flux Development'
version '1.2'

shared_scripts {
    'config.lua',
    'locales/*.lua',
    '@oxmysql/lib/MySQL.lua'
}
server_script 'game/src/sv/sv.lua'
client_script 'game/src/cl/cl.lua'

