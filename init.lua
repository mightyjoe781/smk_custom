local MP = core.get_modpath("smk_custom")

-- unknown item aliasing
dofile(MP .. "/alias.lua")

-- death fix stuff (Block City Server)
dofile(MP .. "/fix_dead_on_login.lua")

-- add new/modified commands to server
dofile(MP .. "/cmd/who.lua")
dofile(MP .. "/cmd/spawn.lua")
dofile(MP .. "/cmd/reboot.lua")

-- priv management
dofile(MP .. "/privs/register.lua")

-- this should be use in case default privs needs to manipulated server wide
-- dofile(MP .. "/privs/reset.lua")

-- dofile(MP.."/privs/protection.lua")

-- death message patch -- from pandorabox_customs
dofile(MP .. "/death.lua")

-- join-limit bypass
dofile(MP .. "/userlimit.lua")

-- protected sethome
dofile(MP .. "/sethome.lua")

-- recipe redefinitions
dofile(MP .. "/recipes.lua")

-- craft overrides
dofile(MP .. "/crafts.lua")

-- server_news
dofile(MP .. "/server_news.lua")

-- rules
dofile(MP .. "/rules.lua")

-- wiki mod -- should not be part of this
-- if not core.get_modpath("wiki") then
--     -- found wiki mod separately then don't override
--     dofile(MP .. "/wiki.lua")
-- end

dofile(MP .. "/fly.lua")

-- maptools custmization
if core.get_modpath("maptools") then
    dofile(MP .. "/maptools.lua")
end

if core.get_modpath("bonemeal") then
    dofile(MP .. "/bonemeal.lua")
end

-- if pipeworks is present, load teleport tube patch
if core.get_modpath("pipeworks") then
    if pipeworks.tptube then
        dofile(MP .. "/tp_tube_fixer.lua")
    end
end

dofile(MP .. "/disallow_new_players.lua")

dofile(MP .. "/uninstall.lua")

-- (optional multicraft fix)
core.register_on_joinplayer(function(player)
    player:hud_set_hotbar_itemcount(9)
end)

--core.override_item('', {wield_image = 'wieldhand.png'})

print("[smk_custom] OK")
