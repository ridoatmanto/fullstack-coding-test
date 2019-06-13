class TodoController < ApplicationController
	before_action :set_todo, only: [:show, :update, :destroy]

  def index
    @todo = Todo.all
    render json: json_output(@todo), status: :ok
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
    	render json: json_output(@todo), status: :created
  	else
    	render json: {error: @todo.errors.full_messages.first}, status: :unprocessable_entity
  	end
  end

  def show
    render json: json_output(@todo), status: :ok
  end

  def update
    if @todo.update(done_flag: params[:done_flag])
	    set_todo
	    render json: json_output(@todo), status: :ok
	  else
    	render json: {error: @todo.errors.full_messages.first}, status: :unprocessable_entity
	  end
  end

  def destroy
  	@todo.destroy(params[:id])
  	head :no_content
  end

  private

  def json_output(todo)
  	todo.as_json(:only => [:id, :title, :done_flag, :deadline])
  end

  def todo_params
    params.permit(:title, :deadline)
  end

  def set_todo
    @todo = Todo.where(id: params[:id])
    unless @todo.exists?
      render json: {error: "ID not found"}, status: :not_found
      return false
    end
  end
end
