function gui.get_frame(player)
    if player.gui.center.researcher_frame then
        return player.gui.center.researcher_frame
    else
        return nil
    end
end

function gui.rm_frame(player)
    local researcher = gui.get_frame(player)
    if researcher then
        researcher.destroy()
    end
end

function gui.mk_frame(player)
    local researcher = gui.get_frame(player)
    if not researcher then
        researcher = player.gui.center.add({
            type = "frame",
            name = "researcher_frame",
            caption = "Researcher",
            direction = "vertical"
        })

        researcher.add({
            type = "button",
            name = "researcher_close",
            caption = "Close"
        })

        researcher.style.top_padding = 0
        researcher.style.bottom_padding = 0
        researcher.style.left_padding = 0
        researcher.style.right_padding = 0

        container = researcher.add({
            type = "flow",
            name = "container",
            direction = "horizontal"
        })

        container.style.top_padding = 0
        container.style.bottom_padding = 0
        container.style.left_padding = 0
        container.style.right_padding = 0

        queue = container.add({
            type = "frame",
            name = "queue",
            caption = "Queue",
            direction = "vertical"
        })

        tech = container.add({
            type = "frame",
            name = "tech",
            caption = "Technologies",
            direction = "vertical"
        })
    end
end

function researcher_close_click(event)
    local player = game.players[event.player_index]
    gui.rm_frame(player)
end

Gui.on_click("researcher_close", researcher_close_click)
