
gui = {}

function gui.get_mb(player)
end

function gui.rm_mb(player)
    local mb=gui.get_mb(player)
    if mb then
        mb.destroy()
    end
end

function gui.mk_mb(player)
    local mb=gui.get_mb(player)
    if not mb then
    end
end
