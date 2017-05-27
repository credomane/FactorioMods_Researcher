function migration_handler(event)
    for modName,modTable in pairs(event.mod_changes) do
        if modName == "researcher" and modTable.old_version ~= nil then
            migrate_version(modTable.old_version, modTable.new_version)
        end
    end

    researcher.init_all()
end

function migrate_version(oldVersionTmp, newVersionTmp)
    local oldVersionTmp = oldVersionString.split(".")
    local newVersionTmp = newVersionString.split(".")

    --Gives a buffer of 1000 for each section of Factorio's "simver" (Major.Minor.Build)
    local oldVersion = oldVersionTmp[1] * 1000000 + oldVersionTmp[2] * 1000 + oldVersionTmp[3]
    local newVersion = newVersionTmp[1] * 1000000 + newVersionTmp[2] * 1000 + newVersionTmp[3]
end
