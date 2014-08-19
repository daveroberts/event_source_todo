class CreateTodoCommand < Command
  attr_reader :todo
  attr_reader :options

  # CreateTodoCommand({title: 'Learn Priorities', guid: 'abc123'})
  def initialize(options)
    @options = options
  end

  def setup
    @todo = Todo.new(@options)
  end

  def name
    return "CreateTodoCommand"
  end

  def is_valid?
    setup
    return @todo.valid?
  end

  def run_command
    setup
    return @todo.save
  end

  def errors
    return @todo.errors
  end
end
