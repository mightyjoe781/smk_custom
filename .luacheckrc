unused_args = false
allow_defined_top = true
exclude_files = {".luacheckrc"}

globals = {
    "minetest",
}

read_globals = {
    string = {fields = {"split"}},
    table = {fields = {"copy", "getn"}},

    -- Builtin
    "vector", "ItemStack",
    "dump", "DIR_DELIM", "VoxelArea", "Settings",

    -- MTG
    "default", "sfinv", "creative", "carts","sethome",

    --depends
    "bonemeal","pipeworks","unified_inventory","irc",
    --for fly manipulation
    "skybox","player_monoids",
}
