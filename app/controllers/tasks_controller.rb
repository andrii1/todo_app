class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @users = User.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
    @comment = Comment.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      @task.users << current_user
      redirect_to tasks_path(@task)
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task, notice: "Task was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy!
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end
end
