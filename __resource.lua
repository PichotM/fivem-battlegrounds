resource_manifest_version "05cfa83c-a124-4cfa-a768-c24a5811d8f9"

client_scripts {
	"shared.lua",
	"cl_init.lua",
	"cl_spawn.lua",
	"cl_game.lua",
	"cl_commands.lua",
	"cl_cheat.lua",
	"cl_debug.lua",
	"audio/cl_audio.lua"
}

server_scripts {
	"shared.lua",
	"sv_init.lua",
	"sv_debug.lua",
	"maps/mapmaker.lua"
}

files {
	"maps/sandy.json",

	"audio/ui.html",
	"audio/audio.js",
	"audio/pubg.ogg",
}

ui_page "audio/ui.html"