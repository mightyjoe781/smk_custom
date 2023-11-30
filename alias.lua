-- 2019-08-16 bushes removal
minetest.register_alias("bushes:youngtree2_bottom", "air")
minetest.register_alias("bushes:bushbranches1", "air")
minetest.register_alias("bushes:bushbranches2", "air")
minetest.register_alias("bushes:bushbranches3", "air")
minetest.register_alias("bushes:bushbranches4", "air")
minetest.register_alias("bushes:BushLeaves1", "air")
minetest.register_alias("bushes:BushLeaves2", "air")

-- 2021-08-25 player killer removal and some mesecon stuff removal
minetest.register_alias("moremesecons_playerkiller:playerkiller","air")
minetest.register_alias("pipeworks:dispenser_off","air")
minetest.register_alias("basic_machines:recycler","air")
-- weird issue with multicraft where entire server was filled with

-- display node
minetest.register_alias("postool:display_node","air")
-- smk hates constructors
minetest.register_alias_force("technic:constructor_mk1_off","air")
minetest.register_alias_force("technic:constructor_mk2_off","air")
minetest.register_alias_force("technic:constructor_mk3_off","air")
-- these blocks are not useful, should be disabled in the mod
minetest.register_alias_force("basic_machines:ball_spawner","air")

-- spaaaaaaace...
--minetest.register_alias_force("basic_machines:enviro","air")

