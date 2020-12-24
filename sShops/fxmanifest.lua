fx_version 'adamant'
game 'gta5'

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
}

client_scripts {
    "shared/blips.lua",
    "shared/marker.lua",
    "shared/ped.lua",

    "config.lua",

    --"client/cl_shops.lua",
    --"client/cl_weapons.lua",
    "client/cl_informatique.lua",

}

server_scripts {
    'server/sv_shops.lua',
}