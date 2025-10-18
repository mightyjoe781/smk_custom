-- Reset player privileges based on protected and default settings
local function reset_privileges_on_login(player)
    local name = player:get_player_name()
    local privs = core.get_player_privs(name)
    local protected_privs = core.string_to_privs(minetest.settings:get("smk_custom.protected_privs") or
        "privs,server,ban,staff,player_fly,vip")
    local default_privs = core.string_to_privs(minetest.settings:get("default_privs") or "interact,shout")

    -- don't reset privs for staff/admin
    for priv in pairs(privs) do
        if protected_privs[priv] then
            return
        end
    end

    -- check if there is a priv which should have not been there then reset all privs
    for priv in pairs(privs) do
        if not default_privs[priv] then
            -- resetting privs
            core.chat_send_player(name, "Your privileges have been reset to the default privileges.")
            core.set_player_privs(name, default_privs)
            return
        end
    end
end

core.register_on_joinplayer(reset_privileges_on_login)
