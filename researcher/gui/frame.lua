function gui.get_frame(player)
    if player.gui.center.researcher_frame then
        return player.gui.center.researcher_frame
    else
        return nil
    end
end

function gui.rm_frame(player)
    local researcher=gui.get_frame(player)
    if researcher then
        researcher.destroy()
    end
end

function gui.mk_frame(player)
    local researcher=gui.get_frame(player)
    if not researcher then
        player.gui.center.add({
            name = "researcher_frame",
            caption = "R",
            type = "button",
            
        })
    end
end

function researcher_frame_click(event)
    local player = game.players[event.player_index]
    local researcher=gui.get_frame(player)
    if researcher then
        gui.rm_frame(player)
    else
        gui.mk_frame(player)
    end
end

Gui.on_click("researcher_frame", researcher_mb_click)
