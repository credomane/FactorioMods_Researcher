
--[[ Researcher ]]--
researcher = {}
require "src.commands"
require "src.events"
require "src.gui.gui"


function researcher.init_all()
	for i, player in ipairs(game.players) do
        researcher.init_player(player)
    end
end

function researcher.init_player(player)
    gui.mk_mb(player)
end
