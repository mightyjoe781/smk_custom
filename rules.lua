
-- create formspec from text file
local function get_rule_formspec()
	local rules_file = io.open(minetest.get_worldpath().."/wiki/rules.txt", "r")
	local rules_fs = 'size[12,8.25]'..
		"button_exit[-0.05,7.8;2,1;exit;Close]"
	if rules_file then
		local rules = rules_file:read("*a")
		rules_file:close()
		rules_fs = rules_fs.."textarea[0.25,0;12.1,9;rules;;"..minetest.formspec_escape(rules).."]"
	else
		rules_fs = rules_fs.."textarea[0.25,0;12.1,9;rules;;rules not set yet!]"
	end
	return rules_fs
end

-- command to display server rules at any time
minetest.register_chatcommand("rules", {
	description = "Shows server rules to the player",
	func = function (name)
		--local player = minetest.get_player_by_name(name)
		minetest.show_formspec(name, "rules", get_rule_formspec())
	end,
})

-- command to send notice to anyone with privs staff
minetest.register_chatcommand("notify", {
	description = "Notifies a players with rules",
	params = "<name> | name of player",
	func = function (name,param)
		local privs = minetest.get_player_privs(name)
		local player_is_staff = privs.staff

		if player_is_staff then
			if param and param~="" then
				local player_to_notified_online = minetest.get_player_by_name(param);
				if player_to_notified_online then
				minetest.show_formspec(param, "rules", get_rule_formspec())
				else
					return false, param .. " is not online";
				end
			else
				return false, "Usage: /notify <player_name>"
			end
		else
			return false, "Only staff can send notices!"
		end
	end,
})
