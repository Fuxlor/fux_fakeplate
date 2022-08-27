fx_version 'adamant'
game 'gta5'

author 'Fuxlor#4367'

description 'Fausse Plaque d\'Immatriculation'

version '1.0'


client_scripts {
    '@es_extended/locale.lua',  
    'client/src/RMenu.lua',
    'client/src/menu/RageUI.lua',
    'client/src/menu/Menu.lua',
    'client/src/menu/MenuController.lua',
    'client/src/components/*.lua',
    'client/src/menu/elements/*.lua',
    'client/src/menu/items/*.lua',
    'client/src/menu/panels/*.lua',
    'client/src/menu/windows/*.lua',      
    'client/cl_fakeplate.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/sv_fakeplate.lua'
} 