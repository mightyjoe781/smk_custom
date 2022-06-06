------- created by smk --------

local function teleport_to_spawn(name)
    local player = minetest.get_player_by_name(name)
    -- fix if player is remotely executing the /spawn
    if not player then return end
    -- try to find the spawn location
    local spawn = {x=0, y=3, z= 0}
    local spawn_size = 10
    if minetest.setting_get_pos("static_spawnpoint") then
        spawn = minetest.setting_get_pos("static_spawnpoint")
    end
    local pos = player:get_pos()
    if math.abs(spawn.x - pos.x) < spawn_size and math.abs(spawn.y - pos.y) < spawn_size
            and math.abs(spawn.z - pos.z) < spawn_size then
        minetest.chat_send_player(name, "Already close to spawn!")
    else
        player:set_pos(spawn)
        minetest.chat_send_player(name, "Teleported to spawn!")
    end
end

minetest.register_chatcommand("spawn", {
    description = "Teleports you to the spawn point.",
    func = teleport_to_spawn,
})

minetest.register_chatcommand("set_spawn", {
    description = "set the spawnpoint",
    privs = {server=true},
    func = function(name, param)
    local player = minetest.get_player_by_name(name)
    local pos = player:get_pos()
    local x = pos.x
    local y = pos.y
    local z = pos.z
    local spawn_pos = x..","..y..","..z
        if not player then return
        elseif player then
                minetest.setting_set("static_spawnpoint",spawn_pos)
                minetest.chat_send_player(name, "Spawnpoint has been set to " .. spawn_pos)
        end
end
})
