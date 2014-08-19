class DestroyTodoCommand < Command
  attr_reader :todo
  attr_reader :options

  # options:
  #   guid: Of item to destroy
  def initialize(options)
    @options = options
  end

  def setup
    @todo = Todo.find_by_guid(@options[:guid])
  end

  def name
    return "DestroyTodoCommand"
  end

  def is_valid?
    setup
    return @todo.present? # all deletes are allowed
  end

  def run_command
    setup
    return @todo.destroy
  end

  def errors
    if @todo.nil?
      return {base: "Todo not found"}
    end
    binding.pry # don't know how else we would get here
  end
end
