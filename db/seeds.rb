EventVersionNumber.create!(version: 0)

EventLogger.add_event(CreateTodoCommand.new(title: "Learn PHP", guid: SecureRandom.uuid))
EventLogger.add_event(CreateTodoCommand.new(title: "Learn Rails", guid: SecureRandom.uuid))
EventLogger.add_event(CreateTodoCommand.new(title: "Learn Angular", guid: SecureRandom.uuid))
EventLogger.add_event(CreateTodoCommand.new(title: "Learn Event Sourcing", guid: SecureRandom.uuid))

guid = SecureRandom.uuid
EventLogger.add_event(CreateTodoCommand.new(title: "Go to farmer's market", guid: guid))
EventLogger.add_event(DestroyTodoCommand.new(guid: guid))
