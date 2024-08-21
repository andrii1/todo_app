class TaskUsersController < ApplicationController
  def new
    @users = User.all
    @task_users = TaskUser.all
    @task = Task.find(params[:task_id])
    @task_user = TaskUser.new
  end

  def create
    @task_user = TaskUser.new
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @already_assigned = TaskUser.where(task: @task, user: @user).exists?
    unless @already_assigned
      @task_user.task = @task
      @task_user.user = @user
      @task_user.save
    end
    redirect_to tasks_path
  end

  def destroy
    @task_user = TaskUser.find(params[:id])
    @task_user.destroy!
    redirect_to tasks_path
  end
end
