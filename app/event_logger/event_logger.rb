class EventLogger
  def self.add_event(c)
    return false unless c.is_valid?
    current_version = 0
    if EventLog.count == 0
      current_version = 0
    else
      current_version = EventLog.maximum("event_number")
    end
    next_version = current_version + 1
    e = EventLog.new
    e.event_name = c.name
    e.event_time = DateTime.now
    e.event_params = YAML::dump(c.options)
    e.event_number = next_version
    e.save!
    return play
  end
  def self.play_command(c)
    return c.run_command if c.is_valid?
  end
  def self.play
    event_version = EventVersionNumber.first
    current_version = event_version.version
    loop do
      # get next event
      e = EventLog.find_by_event_number(current_version + 1)
      break unless e
      command_klass = e.event_name.constantize
      options = YAML::load(e.event_params)
      command = command_klass.new(options)
      result = play_command(command)
      binding.pry unless result
      current_version = current_version + 1
      event_version.update_column(:version, current_version)
    end
    return true
  end
end
