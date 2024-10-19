class TasksController < ApplicationController
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @tasks = @category.tasks
    @task = @category.tasks.new
  end

  def create
    @task = @category.tasks.new(task_params)
    if @task.save
      redirect_to category_tasks_path(@category), notice: 'Task was successfully created.'
    else
      @tasks = @category.tasks
      render :index
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to category_tasks_path(@category), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to category_tasks_path(@category), notice: 'Task was successfully deleted.'
  end

  def complete
    @task.update(status: 'complete')
    redirect_to category_tasks_path(@category), notice: 'Task marked as complete.'
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :status)
  end
end