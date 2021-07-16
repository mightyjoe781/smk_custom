-- staff privs for custom modding the mod
minetest.register_privilege("staff", {
	description = "privs given to staff of server",
	give_to_singleplayer = false
})

-- staff privs for custom modding the mod
minetest.register_privilege("jailer", {
	description = "privs for jailing others",
	give_to_singleplayer = false
})

