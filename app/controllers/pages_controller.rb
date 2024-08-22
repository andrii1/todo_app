class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def new
    @users = User.all
    @task = Task.find(params[:task_id])
  end

  def create
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @task.users << @user
    redirect_to tasks_path(@task)

    # @task_user = TaskUser.new
    # @task = Task.find(params[:task_id])
    # @user = User.find(params[:user_id])
    # @already_assigned = TaskUser.where(task: @task, user: @user).exists?
    # unless @already_assigned
    #   @task_user.task = @task
    #   @task_user.user = @user
    #   @task_user.save
    # end
    # redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @task.users.delete(@user)
    redirect_to tasks_path
  end
end
