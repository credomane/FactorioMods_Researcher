function gui.get_mb(player)
    if player.gui.top.researcher_mb then
        return player.gui.top.researcher_mb
    else
        return nil
    end
end

function gui.rm_mb(player)
    local researcher=gui.get_mb(player)
    if researcher then
        researcher.destroy()
    end
end

function gui.mk_mb(player)

gui.rm_mb(player)

    local researcher=gui.get_mb(player)
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
    local researcher=gui.get_frame(player)
    if researcher then
        gui.rm_frame(player)
    else
        gui.mk_frame(player)
    end
end

Gui.on_click("researcher_mb", researcher_mb_click)
