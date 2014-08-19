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
    params[:guid] ||= SecureRandom.uuid
    c = CreateTodoCommand.new({title: params[:title], guid: params[:guid]})
    if (EventLogger.add_event(c))
      render json: c.todo
    else
      render json: {errors: c.errors}
    end
  end
  def update
  end
  def destroy
    todo = Todo.find(params[:id])
    guid = todo.guid
    #c = DestroyTodoCommand.new({guid: params[:guid]})
    c = DestroyTodoCommand.new({guid: guid})
    if (EventLogger.add_event(c))
      head :no_content
    else
      render json: {errors: c.errors}
    end
  end
end
