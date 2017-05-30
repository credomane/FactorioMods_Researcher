
script.on_init(researcher.init_all)
script.on_event(defines.events.on_tick, researcher.tick)
script.on_configuration_changed(migration_handler)

script.on_event(defines.events.on_player_created, function(event)
    researcher.init_player(game.players[event.player_index])
end)

script.on_event(defines.events.on_player_changed_force, function(event)
    researcher.init_player(game.players[event.player_index])
end)
