EventVersionNumber.create!(version: 0)

EventLogger.add_event(CreateTodoCommand.new(title: "Learn PHP", guid: SecureRandom.uuid), false)
EventLogger.add_event(CreateTodoCommand.new(title: "Learn Rails", guid: SecureRandom.uuid), false)
EventLogger.add_event(CreateTodoCommand.new(title: "Learn Angular", guid: SecureRandom.uuid), false)
EventLogger.add_event(CreateTodoCommand.new(title: "Learn Event Sourcing", guid: SecureRandom.uuid), false)
EventLogger.add_event(CreateTodoCommand.new(title: "Go to farmer's market", guid: SecureRandom.uuid), false)
