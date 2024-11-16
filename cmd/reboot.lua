
local reboot = false

local checkReboot

checkReboot = function()
    if reboot and next(minetest.get_connected_players()) == nil then
        -- Time to reboot
        if minetest.global_exists('irc') then
            irc.say("The server is empty! Rebooting...")
        end
        minetest.request_shutdown("Rebooting...", true, 1)
    end
end

minetest.register_on_leaveplayer(checkReboot)

minetest.register_chatcommand("reboot", {
    privs = {server = true},
    params = "",
    description = "Reboots the server next time it is empty.",
    func = function()
        if reboot then
            return false, "There is already a reboot pending!"
        end
        reboot = true
        checkReboot()
        return true, "Reboot scheduled!"
    end
})

minetest.register_chatcommand("cancelreboot", {
    privs = {server = true},
    params = "",
    description = "Cancels a pending reboot.",
    func = function()
        if not reboot then
            return false, "There is no reboot to cancel!"
        end
        reboot = false
        return true, "Reboot aborted!"
    end
})