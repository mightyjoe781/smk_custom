-- fix digiline nic functionality temporarily
-- issue: https://github.com/pandorabox-io/pandorabox.io/issues/539
if minetest.get_modpath("digistuff") and minetest.registered_nodes["digistuff:nic"] then
	local old_action = minetest.registered_nodes["digistuff:nic"].digiline.effector.action
	minetest.override_item("digistuff:nic",{
		digiline = {
			receptor = {},
			effector = {
				action = function(pos,node,channel,msg)
					if type(msg) ~= "string" then return end
					msg = string.gsub(msg, "%s", "%%20")
					return old_action(pos,node,channel,msg)
				end
			}
		}
	})
end