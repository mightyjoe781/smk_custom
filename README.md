# smk_custom

Features(Mods) Added :

* Server Reboot
  * `/reboot` : Schedules a reboot and when server is empty it restarts the server.
  * `/cancelreboot` : cancels a pending reboot.
* Server News
  * Create a news.txt file in world directory and write news into it.
  * `/news` : shows news formspec to users.
  * Doesn't require server restart to update the news.
* Server Rules/notify
  * Create a rules.txt file in world directory and write rules into it.
  * `/rules` : shows rules formspec to users.
  * `/notify <name>` : notifies player with rules formspec. (requires `staff` privs)
  * Doesn't require server restart to update the rules.
* Jail
  * Created a new priv called `jailer` that allows a player to jail other players.
* Wiki Mod
  * now you can have all info at one place using commands `/wiki`

Hacks (from pandorabox_custom):

* Softlimit Bypass for admins/moderators.
* Sethome-Protection fix
* Bones HUD location
* Beacons fly fix
  * Added a priv called `player_fly` when granted to players will make them immune to beacons.
* Sethome prevention on protection
* Teleport Tube fix
* Blockcity - Fix on dead on login
* Global Fly Event
  * requires `fly_event` privs to use commands.
  * `/global_fly_enable` : allows to enable global fly privs.
  * `/global_fly_disable` : allows to disable global fly privs.

License (for textures)

* [Texture License](textures/license.txt)
