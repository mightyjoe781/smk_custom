prismo = {}
local MP = minetest.get_modpath("prismo_custom")

-- unknown item aliasing
dofile(MP.."/alias.lua")

-- death fix stuff (Block City Server)
dofile(MP.."/fix_dead_on_login.lua")

-- privilages
dofile(MP.."/privs/fly.lua")
-- dofile(MP.."/privs/protection.lua")

-- death message
dofile(MP.."/death.lua")

if minetest.get_modpath("pipeworks") then
	if pipeworks.tptube then
		dofile(MP.."/tp_tube_fixer.lua")
	end
end

-- item/nodes stats
-- dofile(MP.."/stats.lua")

-- join-limit bypass
dofile(MP.."/userlimit.lua")

-- protected sethome
dofile(MP.."/sethome.lua")

-- recipe redefinitions
dofile(MP.."/recipes.lua")

-- craft overrides
dofile(MP.."/crafts.lua")

-- general hacks
dofile(MP.."/hacks.lua")

-- server-reboot
dofile(MP.."/reboot.lua")

-- maptools custmization
if minetest.get_modpath("maptools") then
	dofile(MP.."/maptools.lua")
end

if minetest.get_modpath("bonemeal") then
	dofile(MP.."/bonemeal.lua")
end
if minetest.get_modpath("beacon") then
	-- fly check
	dofile(MP.."/fly.lua")
end