class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
  task_params = params.require(:task).permit(:title, :details)
  task = Task.new(task_params)
  task.save
  redirect_to task_path(task.id)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task_params = params.require(:task).permit(:title, :details, :completed)
    task.update(task_params)
    redirect_to task_path(task.id)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_path
  end
end
