-- Define custom privileges with optional mod dependencies
local custom_privileges = {
    player_fly = {
        description = "can always fly",
        give_to_singleplayer = false,
        mod_condition = "beacon", -- Register only if 'beacons' mod is installed
    },
    fly_event = {
        description = "can toggle global fly event",
    },
    staff = {
        description = "privs given to staff of server",
        give_to_singleplayer = false,
    },
    jailer = {
        description = "privs for jailing others",
        give_to_singleplayer = false,
    },
    vip = {
        description = "special status players in server",
        give_to_singleplayer = false,
    },
    builder = {
        description = "allows advanced building features",
    },
}

-- Register privileges conditionally based on mod presence
for priv_name, priv_def in pairs(custom_privileges) do
    local mod_required = priv_def.mod_condition
    if not mod_required or minetest.get_modpath(mod_required) then
        minetest.register_privilege(priv_name, {
            description = priv_def.description,
            give_to_singleplayer = priv_def.give_to_singleplayer or false,
        })
        -- minetest.log("action", "Registered privilege '" .. priv_name .. "'")
    else
        minetest.log("info",
            "[smk_custom] Skipped privilege '" .. priv_name .. "' (requires mod '" .. mod_required .. "')")
    end
end
