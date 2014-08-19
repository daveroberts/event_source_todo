class CreateTodoCommand < Command
  attr_reader :todo
  attr_reader :options

  # CreateTodoCommand({title: 'Learn Priorities', guid: 'abc123'})
  def initialize(options)
    @options = options
    @todo = Todo.new(@options)
  end
  def name
    return "CreateTodoCommand"
  end
  def is_valid?
    return @todo.valid?
  end
  def run_command
    return @todo.save
  end
  def errors
    return @todo.errors
  end
end
