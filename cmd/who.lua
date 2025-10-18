-- Register the /who command if irc_commands is not installed
if not core.get_modpath("irc_commands") then
    core.register_chatcommand("who", {
        description = "Displays all online players",
        privs = { shout = true },
        func = function(name)
            local players = core.get_connected_players()

            local player_names = {}
            for _, player in ipairs(players) do
                table.insert(player_names, player:get_player_name())
            end
            local player_list = table.concat(player_names, ", ")
            local player_count = #players
            return true, player_count .. " player(s) online: " .. player_list
        end
    })
end
