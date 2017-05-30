
--[[ Researcher GUI Queue Frame]]--
function gui.mk_queue(player)
    local container = gui.get(player, "researcher_container")
    if not container then return nil end

    local queue_frame = container.add({
        type = "frame",
        caption = {"researcher_queue_title_text"},
        direction = "vertical"
    })

    local queue = queue_frame.add({
        type = "scroll-pane",
        name = "Researcher_Q",
        direction = "vertical",
        vertical_scroll_policy = "always",
        horizontal_scroll_policy = "never"
    })

    queue.add({
        type = "label",
        caption = "TEST1"
    })
    queue.add({
        type = "label",
        caption = "TEST2"
    })
    queue.add({
        type = "label",
        caption = "TEST3"
    })
    queue.add({
        type = "label",
        caption = "TEST4"
    })
    queue.add({
        type = "label",
        caption = "TEST5"
    })
end
