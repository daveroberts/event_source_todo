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
      return json: c.todo
    else
      return json: {errors: c.errors}
    end
  end
  def update
  end
  def destroy
    c = DestroyTodoCommand.new({guid: params[:guid]})
    if (EventLogger.add_event(c))
      head :no_content
    else
      return json: {errors: c.errors}
    end
  end
end
