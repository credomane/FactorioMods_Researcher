
--[[ Researcher GUI Main Frame ]]--
function gui.toggle_researcher(player)
    local researcher = gui.get(player, "researcher_frame")
    if not researcher then
        gui.mk_researcher(player)
    else
        researcher.destroy()
    end
end

function gui.rm_researcher(player)
    local researcher = gui.get(player, "researcher_frame")
    if researcher then
        researcher.destroy()
    end
end

function gui.mk_researcher(player)
    local researcher = gui.get(player, "researcher_frame")
    if researcher then return nil end

    researcher = player.gui.center.add({
        type = "frame",
        caption = {"researcher_title_text"},
        name = "researcher_frame",
        direction = "vertical"
    })

    gui.style.padding(researcher, 0)

    local container = researcher.add({
        type = flow,
        name = "researcher_container",
        direction = "horizontal"
    })

    gui.style.padding(container, 0)

    gui.mk_queue(player)
    gui.mk_tech(player)

    researcher.add({
        type = "button",
        name = "researcher_close",
        caption = "Close"
    })
end

function researcher_close_click(event)
    local player = game.players[event.player_index]
    gui.rm_frame(player)
end

Gui.on_click("researcher_close", researcher_close_click)
