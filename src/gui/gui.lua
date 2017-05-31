
--[[ Researcher GUI ]]--
gui = {}
gui.style = {}

require "stdlib.gui.gui"
require "stdlib.string"
require "stdlib.table"

require "src.gui.mainbutton"
require "src.gui.researcher"
require "src.gui.queue"
require "src.gui.tech"

--[[
    TODO: PR to stdlib?
    TODO: loop cleanup. Suggestions?
    Factorio GUI manipulation is so cumbersome without a "fancy" element selector. So I made one.
    
    Accepts * as a wildcard in these forms "query*" or "*query*" or "*query" for basic starts_with, contains and ends_with searches
    All other forms are passed directly to string.match
    if optional third parameter is true then query must match exactly.

    returns matched element or a table of all matched elements or nil if no matches.
]]--
function gui.get(element, query, exact)
    -- Do nothing if it isn't even valid.
    if not element.valid then
        return nil
    end

    local matches = gui._get(element, query, exact)

    if #matches == 0 then
        return nil
    end

    if #matches == 1 then
        return matches[1]
    end

    return matches
end

function gui._get(element, query, exact)
    -- Do nothing if it isn't even valid.
    if not element.valid then
        return nil
    end

    --Workaround for Factorio throwing errors when accessing non-existent properties on Factorio Objects.
    function contains(tbl, query)
        if tbl[query] ~= nil then
            return true
        end
        return nil
    end

    -- Is this a LuaGui or LuaGuiElement?
    if not pcall(function() contains(element, "children") end) then
        --Were we given a LuaPlayer directly?
        if not pcall(function() contains(element, "gui") end) then
            --Abort, abort, abort! What is this thing!?
            return nil
        end
        --Use the player's root gui element
        element = element.gui
    end

    exact = not not exact
    local matches = {}

    for _, child in pairs(element.children) do
        if exact then
            if child.name == query then
                table.insert(matches, child)
            end
        else
            if string.starts_with(query, "*") or string.ends_with(query, "*") then
                if string.starts_with(query, "*") then
                    query = string.sub(query, 2, query.length) 
                    if string.starts_with(child.name, query) then
                        table.insert(matches, child)
                    end
                end
                if string.starts_with(query, "*") and string.ends_with(query, "*") then
                    query = string.sub(query, 2, query.length - 1)
                    if string.contains(child.name, query) then
                        table.insert(matches, child)
                    end
                end
                if string.ends_with(query, "*") then
                    query = string.sub(query, 1, query.length - 1)
                    if string.ends_with(child.name, query) then
                        table.insert(matches, child)
                    end
                end
            else
                if string.match(child.name, query) then
                    table.insert(matches, child)
                end
            end
        end
        if child.children then
            local tmp = gui._get(child, query, exact)
            matches = table.merge(matches, tmp, true)
        end
    end

    return matches
end

function gui.show(element)
    element.style.visibility = true
end

function gui.hide(element)
    element.style.visibility = false
end

function gui.style.padding(element, padding)
    element.style.top_padding = 0
    element.style.bottom_padding = 0
    element.style.left_padding = 0
    element.style.right_padding = 0
end