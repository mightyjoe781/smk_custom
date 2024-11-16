-- Reset player privileges based on protected and default settings
local function reset_privileges_on_login(player)
    local name = player:get_player_name()
    local privs = minetest.get_player_privs(name)
    local protected_privs = minetest.string_to_privs(minetest.settings:get("smk_custom.protected_privs") or "server,ban,staff,player_fly,vip")
    local default_privs = minetest.string_to_privs(minetest.settings:get("default_privs") or "interact,shout")

    for priv in pairs(privs) do
        if protected_privs[priv] then
            return
        end
    end

    minetest.chat_send_player(name, "Your privileges have been reset to the default privileges.")
    minetest.set_player_privs(name, default_privs)
end

minetest.register_on_joinplayer(reset_privileges_on_login)