-- Always use `core` for Luanti APIs
local storage = core.get_mod_storage()

local reboot = {}

-- Store the reboot state in mod storage, defaulting to false
-- Use a function to set and get the value for clarity and consistency
function reboot.get_status()
    -- Get the string from storage. If it's "true", return true. Otherwise, return false.
    return storage:get_string("reboot") == "true"
end

function reboot.set_status(value)
    -- Store the boolean as a string "true" or "false"
    if value then
        storage:set_string("reboot", "true")
    else
        storage:set_string("reboot", "false")
    end
end

-- Reboot check function
function reboot.execute()
    -- Only check if a reboot is scheduled
    if reboot.get_status() and next(core.get_connected_players()) == nil then
        -- Time to reboot, announce in irc
        if core.global_exists('irc') then
            irc.say("The server is empty! Rebooting...")
        end
        -- already reboot so reset
        reboot.set_status(false)
        core.request_shutdown("Rebooting...", true, 1)
    end
end

-- on player leave register shutdown check
core.register_on_leaveplayer(function(player)
    -- Call the RebootServer function directly, after global player tables is empty
    -- wasted 1/2 hr debugging this code lol
    core.after(0.1, function()
        reboot.execute()
    end)
end)

-- Register the chatcommand
core.register_chatcommand("reboot", {
    privs = { server = true },
    params = "",
    description = "Reboots the server next time it is empty.",
    func = function()
        if reboot.get_status() then
            return false, "There is already a reboot pending!"
        end
        reboot.set_status(true)
        reboot.execute()
        return true, "Reboot scheduled!"
    end
})

-- Register the cancel command
core.register_chatcommand("cancelreboot", {
    privs = { server = true },
    params = "",
    description = "Cancels a pending reboot.",
    func = function()
        if not reboot.get_status() then
            return false, "There is no reboot to cancel!"
        end
        reboot.set_status(false)
        return true, "Reboot aborted!"
    end
})
