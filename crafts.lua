-- 2018-08-08 cookable stairs

minetest.register_craft({
	type = "cooking",
	output = "moreblocks:stair_stone",
	recipe = "moreblocks:stair_cobble",
})

-- 2018-09-07
-- bronze block to ingots

minetest.register_craft({
	type = "shapeless",
	output = 'default:bronze_ingot 9',
	recipe = {
		'default:bronzeblock'
	}
})
-- 2019-12-22
-- dirt with dry grass crafting

minetest.register_craft({
	output = "default:dry_dirt_with_dry_grass",
	type = "shapeless",
	recipe = {"default:dry_grass_1", "default:dry_dirt"},
})

minetest.register_craft({
	output = "default:dirt_with_dry_grass",
	type = "shapeless",
	recipe = {"default:dry_grass_1", "default:dirt"},
})
