if not researcher then researcher = {} end
if not global.config then global.config = {} end
if not global.forces then global.forces = {} end
if not global.players then global.players = {} end

require "researcher.main"
require "researcher.commands"
require "researcher.events"
require "researcher.gui.gui"
