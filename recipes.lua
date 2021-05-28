

-- Add recipes for silver and mithril hoes
-- moreoes does not add recipes due to "rare material" hoes being removed from Minetest Game:
-- https://github.com/minetest-mods/moreores/blob/3fe0ba8fcb3a19222c23c0d1b01a671df43d655c/init.lua#L219-L222
if minetest.get_modpath("farming") and minetest.get_modpath("moreores") then
	minetest.register_craft({
		output = "moreores:hoe_silver",
		recipe = {
			{"moreores:silver_ingot", "moreores:silver_ingot", ""},
			{"", "group:stick", ""},
			{"", "group:stick", ""}
		}
	})
	minetest.register_craft({
		output = "moreores:hoe_mithril",
		recipe = {
			{"moreores:mithril_ingot", "moreores:mithril_ingot", ""},
			{"", "group:stick", ""},
			{"", "group:stick", ""}
		}
	})
end

-- Recipes for converting between pipeworks injector variants
-- https://github.com/pandorabox-io/pandorabox.io/issues/622
if minetest.get_modpath("pipeworks") then
	minetest.register_craft({
		output = "pipeworks:filter",
		recipe = {{"pipeworks:mese_filter", "default:mese_crystal"}},
		replacements = {{"pipeworks:mese_filter", "default:mese"}}
	})
	minetest.register_craft({
		output = "pipeworks:mese_filter",
		recipe = {{"pipeworks:filter", "default:mese"}},
		replacements = {{"pipeworks:filter", "default:mese_crystal"}}
	})
	if minetest.get_modpath("digilines") then
		minetest.register_craft({
			output = "pipeworks:digiline_filter",
			recipe = {{"pipeworks:mese_filter", "digilines:wire_std_00000000"}},
			replacements = {{"pipeworks:mese_filter", "default:mese"}}
		})
		minetest.register_craft({
			output = "pipeworks:digiline_filter",
			recipe = {{"pipeworks:filter", "digilines:wire_std_00000000"}},
			replacements = {{"pipeworks:filter", "default:mese_crystal"}}
		})
		minetest.register_craft({
			output = "pipeworks:filter",
			recipe = {{"pipeworks:digiline_filter", "default:mese_crystal"}},
			replacements = {{"pipeworks:digiline_filter", "digilines:wire_std_00000000"}}
		})
		minetest.register_craft({
			output = "pipeworks:mese_filter",
			recipe = {{"pipeworks:digiline_filter", "default:mese"}},
			replacements = {{"pipeworks:digiline_filter", "digilines:wire_std_00000000"}}
		})
	end
end

-- custom craft recipes for digilines rtc and lightsensor
if minetest.get_modpath("digilines") and minetest.get_modpath("basic_materials") then
	minetest.clear_craft({output = "digilines:rtc"})
	minetest.register_craft({
		output = "digilines:rtc",
		recipe = {
			{"basic_materials:plastic_sheet", "default:mese_crystal_fragment", "basic_materials:plastic_sheet"},
			{"dye:black", "basic_materials:ic", "dye:black"},
			{"basic_materials:plastic_sheet", "digilines:wire_std_00000000", "basic_materials:plastic_sheet"}
		}
	})
	minetest.clear_craft({output = "digilines:lightsensor"})
	minetest.register_craft({
		output = "digilines:lightsensor",
		recipe = {
			{"basic_materials:plastic_sheet", "default:glass", "basic_materials:plastic_sheet"},
			{"basic_materials:plastic_sheet", "basic_materials:ic", "basic_materials:plastic_sheet"},
			{"basic_materials:plastic_sheet", "digilines:wire_std_00000000", "basic_materials:plastic_sheet"}
		}
	})
end