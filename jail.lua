local jail = minetest.setting_get_pos("jail") or {x=0, y=0, z=0}
local admin = minetest.settings:get("name")
local jailed = {}
local storage = minetest.get_mod_storage()
if storage:contains("jailed") then
  jailed = minetest.deserialize(storage:get_string("jailed"))
end

minetest.register_chatcommand("jail", {
	description = "Put player in a jail",
	params = "<name>",
	privs = {jailer = true},
	func = function(name, param)
	local player = minetest.get_player_by_name(param)
		if param == "" then
	return false, "Please provide a player name!"
		elseif param == admin then	
	return false, "Admins can't be jailed!"
		elseif param == name then
	return false, "You can't jail yourself!"
		else
  		if player then
		jailed[param] = true
    		player:set_pos(jail)
    			minetest.chat_send_player(param, "You were jailed by " .. name .. "!")
	return true, "Succesfully jailed " .. param .. "!"
		else
	return false, param .. " is not online or does not exist!"
			end
  		end
	end
})

minetest.register_chatcommand("unjail", {
	description = "Unjail a player",
	params = "<name>",
	privs = {server = true, ban = true},
	func = function(name, param)
	local unjail = minetest.setting_get_pos("static_spawnpoint") or minetest.get_player_by_name(name):get_pos()
	local player = minetest.get_player_by_name(param)
		if param == "" then
	return false, "Please provide a player name!"
		elseif param == admin then	
	return false, "Admins can't be unjailed because you also can't put them in jail!"
		elseif param == name then
	return false, "You can't unjail yourself!"
		else
  		if player then
		jailed[param] = false
    		player:set_pos(unjail)
    			minetest.chat_send_player(param, "You were unjailed by " .. name .. "!")
	return true, "Succesfully unjailed " .. param .. "!"
		else
	return false, param .. " is not online or does not exist!"
			end
		end
	end
})
		
		
minetest.register_globalstep(function()
  for _, player in ipairs(minetest.get_connected_players()) do
    local name = player:get_player_name()
    if jailed[name] then
      local pos = player:get_pos()
      if vector.distance(jail, pos) > 6 then
        player:set_pos(jail)
	minetest.chat_send_player(name, "You're jailed, you can't get out of here!")
      end
    end
  end
end)

minetest.register_on_shutdown(function()
  storage:set_string("jailed", minetest.serialize(jailed))
end)
