local use_player_monoids = minetest.global_exists("player_monoids")

local storage = minetest.get_mod_storage()
local global_fly_enabled = storage:get_int("global_fly") == 1
local skybox_exists = minetest.get_modpath("skybox")

local player_can_fly = function(player)
	local pos = player:get_pos()
	if skybox_exists then
		for _, box in pairs(skybox.list) do
			local match = false
			if box.miny and box.maxy then
				match = pos.y > box.miny and pos.y < box.maxy
			elseif type(box.match) == "function" then
				match = box.match(player, pos)
			end

			if match and box.fly then
				return true
			end
		end
	end

	return global_fly_enabled
end

-- returns:
--  true = manipulate fly privs
--  false = no manipulation on privs
local do_fly_priv_manipulation = function(name)
    local privs = minetest.get_player_privs(name)
    local protected_privs = minetest.string_to_privs(
        minetest.settings:get("smk_custom.protected_privs") or "privs,server,ban,staff,player_fly,vip"
    )
    for priv, _ in pairs(privs) do
        if protected_privs[priv] then
            return false
        end
    end
    return true
end

local update_fly = function(player)
	local name = player:get_player_name()

	if not do_fly_priv_manipulation(name) then
		return
	end

	local can_fly = player_can_fly(player)
	if use_player_monoids then
		if player_monoids.fly:value(player) ~= can_fly then
			player_monoids.fly:add_change(player, can_fly, "smk_custom:fly")
		end
	else
		local privs = minetest.get_player_privs(name)
		if privs.fly ~= can_fly then
			privs.fly = can_fly or nil
			minetest.set_player_privs(name, privs)
		end
	end
end

-- strip away fly privs on non-admins
minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()

	if not do_fly_priv_manipulation(name) then
		return
	end

	local privs = minetest.get_player_privs(name)
	privs.fly = nil
	minetest.set_player_privs(name, privs)
end)

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	if timer < 2 then return end
	timer=0
	local t0 = minetest.get_us_time()
	local players = minetest.get_connected_players()
	for i, player in pairs(players) do
		update_fly(player)
	end
	local t1 = minetest.get_us_time()
	local delta_us = t1 -t0
	if delta_us > 150000 then
		minetest.log("warning", "[fly] update took " .. delta_us .. " us")
	end
end)

minetest.register_chatcommand("global_fly_enable", {
	description = "enables global fly",
	privs = {fly_event=true},
	func = function(name)
    global_fly_enabled = true
    storage:set_int("global_fly", 1)
	end
})

minetest.register_chatcommand("global_fly_disable", {
	description = "disables global fly",
	privs = {fly_event=true},
	func = function(name)
    global_fly_enabled = false
    storage:set_int("global_fly", 0)
	end
})
