fx_version 'cerulean'
games { 'gta5' };

name 'Menu FreeRoam (RageUI V2)';
author 'Bape 🐕#9021';

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",


    "cl_freeroam.lua",
    "cfg_freeroam.lua"
}

server_scripts {
    "sv_freeroam.lua",
    "cfg_freeroam.lua"
}