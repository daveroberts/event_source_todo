class TodosController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos
  end
  def show
    @todo = Todo.find params[:id]
    render json: @todo
  end
  def create
    c = CreateTodoCommand.new({title: params[:title], guid: 'abc123'})
    if (EventLogger.add_event(c))
      return json: c.todo
    else
      return json: {errors: c.errors}
    end
  end
  def update
  end
  def destroy
  end
end
