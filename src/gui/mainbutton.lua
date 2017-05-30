
--[[ Researcher GUI Main Button]]--
function gui.rm_mb(player)
    local researcher = gui.get(player, "researcher_mb")
    if researcher then
        researcher.destroy()
    end
end

function gui.mk_mb(player)
    local researcher = gui.get(player, "researcher_mb")
    if not researcher then
        player.gui.top.add({
            type = "button",
            name = "researcher_mb",
            caption = "R"
        })
    end
end

function researcher_mb_click(event)
    local player = game.players[event.player_index]
    gui.toggle_researcher(player)
end

Gui.on_click("researcher_mb", researcher_mb_click)
