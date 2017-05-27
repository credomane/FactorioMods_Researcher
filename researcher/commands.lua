
if not researcher then researcher = {} end

function researcher.command(event)
--[[
event.name
event.tick
event.player_index
event.parameter
]]--
end
commands.add_command("researcher", "No help", researcher.command)
