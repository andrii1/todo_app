class UsersController < ApplicationController
  def users_to_task
    @users = User.all
    @task = Task.find(params[:task_id])
  end

  def add_users_to_task
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @task.users << @user
    redirect_to tasks_path(@task)
  end

  def delete_users_from_task
    @task = Task.find(params[:task_id])
    @user = User.find(params[:user_id])
    @task.users.delete(@user)
    redirect_to tasks_path
  end
end
